package com.enactor.pos.mobile.visual;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;

/**
 * Stand-alone entry point that drives the visual-regression comparison as a <em>post-run batch</em>:
 * after a suite has produced actual screenshots, invoke {@code main} to compare every captured state
 * against its approved baseline via the DINOv2 {@code /compare} server and emit an HTML report plus
 * rendered diff images.
 *
 * <p>The per-state comparison and the report rendering are delegated to the shared
 * {@link VisualComparisonService} and {@link VisualReportWriter}, which are also used by the inline,
 * per-step path in {@link VisualRegressionScreenshotPlugin}. This class only adds the directory walk.</p>
 *
 * <p>Layout it reads (both roots share the {@link StepScreenshotCapturer} convention):</p>
 * <pre>
 *   &lt;baselineDir&gt;/&lt;scenario&gt;/NNN_step.png   (+ NNN_step.meta)
 *   &lt;outputDir&gt;/&lt;scenario&gt;/NNN_step.png     (+ NNN_step.meta)
 * </pre>
 *
 * <p>Matching is by identical file name within the identically-named scenario folder. A state present
 * in the baseline but missing from the actual run (or vice versa) is reported rather than silently
 * dropped, so coverage gaps are visible.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class VisualComparisonRunner {

	private final VisualRegressionConfig config;
	private final VisualComparisonService service;
	private final VisualReportWriter reportWriter;

	public VisualComparisonRunner(VisualRegressionConfig config) {
		this.config = config;
		this.service = new VisualComparisonService(config);
		this.reportWriter = new VisualReportWriter(config);
	}

	public static void main(String[] args) throws IOException {
		VisualRegressionConfig config = VisualRegressionConfig.getInstance();
		int failures = new VisualComparisonRunner(config).run();
		// Non-zero exit lets CI treat visual regressions as a build failure if desired.
		System.exit(failures == 0 ? 0 : 1);
	}

	/**
	 * Executes the full comparison and writes the report.
	 *
	 * @return the number of states that failed (visual regressions + missing states)
	 * @throws IOException if the report cannot be written
	 */
	public int run() throws IOException {
		File actualRoot = new File(config.getOutputDir());
		File reportDir = new File(config.getReportDir());
		File diffRoot = new File(reportDir, "diffs");
		// null for remote sources (HTTP/Artifactory/SVN) which cannot be listed like a folder.
		File baselineLocalRoot = service.baselineLocalRoot();

		System.out.println("[VISUAL COMPARE] Dino server : " + config.getDinoServerUrl());
		System.out.println("[VISUAL COMPARE] Baseline    : " + config.getBaselineDir());
		System.out.println("[VISUAL COMPARE] Actual dir   : " + actualRoot.getAbsolutePath());
		System.out.println("[VISUAL COMPARE] Threshold    : " + config.getSimilarityThreshold());

		if (baselineLocalRoot != null && !baselineLocalRoot.isDirectory()) {
			throw new IOException("Baseline directory not found: " + baselineLocalRoot.getAbsolutePath()
					+ " — establish baselines first (see run-visual-compare.ps1 / README).");
		}
		reportDir.mkdirs();

		List<StateComparison> results = new ArrayList<>();
		for (String scenario : sortedScenarioKeys(baselineLocalRoot, actualRoot)) {
			File actualScenario = new File(actualRoot, scenario);
			File baselineScenario = baselineLocalRoot == null ? null : new File(baselineLocalRoot, scenario);
			for (String stateFile : sortedStateFiles(baselineScenario, actualScenario)) {
				File actualPng = new File(actualScenario, stateFile);
				// Baseline is resolved inside the service via the configured provider (local or remote).
				results.add(service.compareState(scenario, stateFile, actualPng.isFile() ? actualPng : null, diffRoot));
			}
		}

		File report = new File(reportDir, "Visual-Report.html");
		reportWriter.write(report, results);

		int failures = 0;
		for (StateComparison r : results) {
			if (!r.passed) {
				failures++;
			}
		}
		System.out.println("[VISUAL COMPARE] States compared: " + results.size() + ", failures: " + failures);
		System.out.println("[VISUAL COMPARE] Report: " + report.getAbsolutePath());
		return failures;
	}

	private Set<String> sortedScenarioKeys(File baselineRoot, File actualRoot) {
		Set<String> keys = new TreeSet<>();
		collectScenarioKeys(actualRoot, actualRoot, keys);
		collectScenarioKeys(baselineRoot, baselineRoot, keys);
		return keys;
	}

	/**
	 * Recursively records the path (relative to {@code base}, using {@code /} separators) of every
	 * directory that directly contains at least one PNG state. This supports the nested layout where
	 * captures mirror the feature file's path (e.g. {@code feature/retail/.../X.feature/<Scenario>}), as
	 * well as a flat single-folder layout.
	 */
	private void collectScenarioKeys(File dir, File base, Set<String> into) {
		if (dir == null || !dir.isDirectory()) {
			return;
		}
		File[] entries = dir.listFiles();
		if (entries == null) {
			return;
		}
		boolean hasPng = false;
		for (File entry : entries) {
			if (entry.isFile() && entry.getName().toLowerCase(Locale.ROOT).endsWith(".png")) {
				hasPng = true;
				break;
			}
		}
		if (hasPng && !dir.equals(base)) {
			into.add(base.toPath().relativize(dir.toPath()).toString().replace('\\', '/'));
		}
		for (File entry : entries) {
			if (entry.isDirectory()) {
				collectScenarioKeys(entry, base, into);
			}
		}
	}

	private Set<String> sortedStateFiles(File baselineScenario, File actualScenario) {
		Set<String> files = new TreeSet<>();
		addPngNames(baselineScenario, files);
		addPngNames(actualScenario, files);
		return files;
	}

	private void addPngNames(File scenarioDir, Set<String> into) {
		if (scenarioDir == null) {
			return;
		}
		File[] pngs = scenarioDir.listFiles((d, name) -> name.toLowerCase(Locale.ROOT).endsWith(".png"));
		if (pngs != null) {
			for (File png : pngs) {
				into.add(png.getName());
			}
		}
	}
}
