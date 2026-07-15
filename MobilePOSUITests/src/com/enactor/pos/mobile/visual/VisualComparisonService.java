package com.enactor.pos.mobile.visual;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/**
 * Compares a single captured state against its baseline via the DINOv2 server and renders the diff
 * image. This is the shared comparison engine used by <em>both</em> execution paths:
 *
 * <ul>
 *   <li>{@link VisualComparisonRunner} — the post-run batch that walks the whole {@code actual} tree;</li>
 *   <li>{@link VisualRegressionScreenshotPlugin} — inline, immediately after each Cucumber step.</li>
 * </ul>
 *
 * <p>The class is stateless apart from its {@link DinoServerClient} and is safe to share across threads
 * (the client itself opens a fresh connection per call). Every failure is captured into an
 * {@link StateComparison} rather than thrown, so a comparison problem never disrupts the caller.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class VisualComparisonService {

	private final VisualRegressionConfig config;
	private final DinoServerClient client;

	public VisualComparisonService(VisualRegressionConfig config) {
		this.config = config;
		this.client = new DinoServerClient(config.getDinoServerUrl());
	}

	/**
	 * Compares one state and, on success, writes its diff image under {@code diffRoot}.
	 *
	 * @param scenario    the scenario (folder) name
	 * @param stateFile   the state PNG file name (e.g. {@code 001_Given_....png})
	 * @param baselinePng the approved baseline image (may not exist)
	 * @param actualPng   the freshly captured image (may not exist)
	 * @param diffRoot    directory under which {@code diffs/<scenario>/<state>_diff.png} is written
	 * @return the comparison row (never {@code null}); its {@link Status} records what happened
	 */
	public StateComparison compareState(String scenario, String stateFile, File baselinePng, File actualPng,
			File diffRoot) {
		if (baselinePng == null || !baselinePng.isFile()) {
			return StateComparison.missing(scenario, stateFile, "No baseline image for this state.");
		}
		if (actualPng == null || !actualPng.isFile()) {
			return StateComparison.missing(scenario, stateFile, "No actual image captured for this state.");
		}

		try {
			List<CropRegion> regions = buildCropRegions(baselinePng, actualPng);
			DinoComparisonResult result = client.compare(baselinePng, actualPng, regions);

			boolean passed = result.getGlobalSimilarity() >= config.getSimilarityThreshold();
			for (Map.Entry<String, Double> field : result.getFieldSimilarities().entrySet()) {
				if (field.getValue() < config.getFieldThreshold(field.getKey())) {
					passed = false;
				}
			}

			String diffRelative = saveDiffImage(result, scenario, stateFile, diffRoot);
			return StateComparison.compared(scenario, stateFile, baselinePng, actualPng, result, passed, diffRelative);
		} catch (IOException e) {
			return StateComparison.error(scenario, stateFile, e.getMessage());
		}
	}

	/**
	 * Builds the crop-region list from the two {@code .meta} side-cars. A field is only sent when both
	 * the baseline and the actual capture recorded a non-empty box for it; otherwise the server has
	 * nothing meaningful to crop.
	 */
	private List<CropRegion> buildCropRegions(File baselinePng, File actualPng) {
		Properties baseMeta = loadMeta(baselinePng);
		Properties actualMeta = loadMeta(actualPng);
		if (baseMeta.isEmpty() || actualMeta.isEmpty()) {
			return Collections.emptyList();
		}

		List<CropRegion> regions = new ArrayList<>();
		for (String field : fieldNames(baseMeta)) {
			int bw = intProp(baseMeta, field + ".width");
			int bh = intProp(baseMeta, field + ".height");
			int aw = intProp(actualMeta, field + ".width");
			int ah = intProp(actualMeta, field + ".height");
			if (bw <= 0 || bh <= 0 || aw <= 0 || ah <= 0) {
				continue;
			}
			regions.add(new CropRegion(field,
					intProp(baseMeta, field + ".x"), intProp(baseMeta, field + ".y"), bw, bh,
					intProp(actualMeta, field + ".x"), intProp(actualMeta, field + ".y"), aw, ah,
					config.getFieldThreshold(field)));
		}
		return regions;
	}

	private String saveDiffImage(DinoComparisonResult result, String scenario, String stateFile, File diffRoot)
			throws IOException {
		if (result.getDiffImageBase64() == null) {
			return null;
		}
		File scenarioDir = new File(diffRoot, scenario);
		scenarioDir.mkdirs();
		File diffFile = new File(scenarioDir, stateFile.replace(".png", "_diff.png"));
		Files.write(diffFile.toPath(), Base64.getDecoder().decode(result.getDiffImageBase64()));
		return "diffs/" + scenario + "/" + diffFile.getName();
	}

	private Properties loadMeta(File pngFile) {
		Properties props = new Properties();
		File metaFile = new File(pngFile.getParentFile(), pngFile.getName().replace(".png", ".meta"));
		if (metaFile.isFile()) {
			try (FileInputStream fis = new FileInputStream(metaFile)) {
				props.load(fis);
			} catch (IOException ignored) {
				// A missing/unreadable meta simply means no crop regions for this state.
			}
		}
		return props;
	}

	private Set<String> fieldNames(Properties meta) {
		Set<String> names = new LinkedHashSet<>();
		for (String key : meta.stringPropertyNames()) {
			int dot = key.lastIndexOf('.');
			if (dot > 0) {
				names.add(key.substring(0, dot));
			}
		}
		return names;
	}

	private int intProp(Properties props, String key) {
		try {
			return Integer.parseInt(props.getProperty(key, "0").trim());
		} catch (NumberFormatException e) {
			return 0;
		}
	}
}
