package com.enactor.pos.mobile.visual;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;

/**
 * Stand-alone entry point that drives the visual-regression comparison. It is deliberately decoupled
 * from the test run: after a suite has produced actual screenshots, invoke {@code main} to compare
 * every captured state against its approved baseline via the DINOv2 {@code /compare} server and emit
 * an HTML report plus rendered diff images.
 *
 * <p>Layout it reads (both roots share the {@link StepScreenshotCapturer} convention):</p>
 * <pre>
 *   &lt;baselineDir&gt;/&lt;scenario&gt;/NNN_step.png   (+ NNN_step.meta)
 *   &lt;outputDir&gt;/&lt;scenario&gt;/NNN_step.png     (+ NNN_step.meta)
 * </pre>
 *
 * <p>Layout it writes:</p>
 * <pre>
 *   &lt;reportDir&gt;/Visual-Report.html
 *   &lt;reportDir&gt;/diffs/&lt;scenario&gt;/NNN_step_diff.png
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
	private final DinoServerClient client;

	public VisualComparisonRunner(VisualRegressionConfig config) {
		this.config = config;
		this.client = new DinoServerClient(config.getDinoServerUrl());
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
		File baselineRoot = new File(config.getBaselineDir());
		File actualRoot = new File(config.getOutputDir());
		File reportDir = new File(config.getReportDir());
		File diffRoot = new File(reportDir, "diffs");

		System.out.println("[VISUAL COMPARE] Dino server : " + config.getDinoServerUrl());
		System.out.println("[VISUAL COMPARE] Baseline dir : " + baselineRoot.getAbsolutePath());
		System.out.println("[VISUAL COMPARE] Actual dir   : " + actualRoot.getAbsolutePath());
		System.out.println("[VISUAL COMPARE] Threshold    : " + config.getSimilarityThreshold());

		if (!baselineRoot.isDirectory()) {
			throw new IOException("Baseline directory not found: " + baselineRoot.getAbsolutePath()
					+ " — establish baselines first (see run-visual-compare.ps1 / README).");
		}
		reportDir.mkdirs();

		List<StateComparison> results = new ArrayList<>();
		for (String scenario : sortedScenarioNames(baselineRoot, actualRoot)) {
			File baselineScenario = new File(baselineRoot, scenario);
			File actualScenario = new File(actualRoot, scenario);
			for (String stateFile : sortedStateFiles(baselineScenario, actualScenario)) {
				results.add(compareState(scenario, stateFile, baselineScenario, actualScenario, diffRoot));
			}
		}

		File report = new File(reportDir, "Visual-Report.html");
		writeHtmlReport(report, results);

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

	private StateComparison compareState(String scenario, String stateFile, File baselineScenario,
			File actualScenario, File diffRoot) {
		File baselinePng = new File(baselineScenario, stateFile);
		File actualPng = new File(actualScenario, stateFile);

		if (!baselinePng.isFile()) {
			return StateComparison.missing(scenario, stateFile, "No baseline image for this state.");
		}
		if (!actualPng.isFile()) {
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

	// ------------------------------------------------------------------------
	// Directory / metadata helpers
	// ------------------------------------------------------------------------

	private Set<String> sortedScenarioNames(File baselineRoot, File actualRoot) {
		Set<String> names = new TreeSet<>();
		addSubdirNames(baselineRoot, names);
		addSubdirNames(actualRoot, names);
		return names;
	}

	private void addSubdirNames(File root, Set<String> into) {
		File[] dirs = root.listFiles(File::isDirectory);
		if (dirs != null) {
			for (File dir : dirs) {
				into.add(dir.getName());
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
		File[] pngs = scenarioDir.listFiles((d, name) -> name.toLowerCase(Locale.ROOT).endsWith(".png"));
		if (pngs != null) {
			for (File png : pngs) {
				into.add(png.getName());
			}
		}
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

	// ------------------------------------------------------------------------
	// HTML report
	// ------------------------------------------------------------------------

	private void writeHtmlReport(File report, List<StateComparison> results) throws IOException {
		int total = results.size();
		int passed = 0;
		for (StateComparison r : results) {
			if (r.passed) {
				passed++;
			}
		}
		int failed = total - passed;

		StringBuilder html = new StringBuilder(64 * 1024);
		html.append("<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"utf-8\">");
		html.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
		html.append("<title>Visual Regression Report</title>");
		html.append("<style>")
				.append("body{font-family:Segoe UI,Arial,sans-serif;margin:0;background:#f4f5f7;color:#172b4d}")
				.append("header{background:#0747a6;color:#fff;padding:20px 28px}")
				.append("header h1{margin:0;font-size:20px}")
				.append(".summary{display:flex;gap:16px;padding:20px 28px;flex-wrap:wrap}")
				.append(".card{background:#fff;border-radius:8px;padding:14px 20px;min-width:120px;box-shadow:0 1px 3px rgba(9,30,66,.15)}")
				.append(".card .n{font-size:26px;font-weight:700}")
				.append(".pass{color:#006644}.fail{color:#bf2600}")
				.append("section{padding:0 28px 28px}")
				.append("h2{font-size:16px;border-bottom:2px solid #dfe1e6;padding-bottom:6px}")
				.append("table{width:100%;border-collapse:collapse;background:#fff;border-radius:8px;overflow:hidden;box-shadow:0 1px 3px rgba(9,30,66,.15)}")
				.append("th,td{padding:10px;border-bottom:1px solid #ebecf0;vertical-align:top;text-align:left;font-size:13px}")
				.append("th{background:#fafbfc}")
				.append("img{max-width:220px;max-height:340px;border:1px solid #dfe1e6;border-radius:4px;display:block}")
				.append(".badge{display:inline-block;padding:2px 10px;border-radius:12px;font-weight:700;font-size:12px}")
				.append(".badge.pass{background:#e3fcef;color:#006644}.badge.fail{background:#ffebe6;color:#bf2600}")
				.append(".score{font-size:18px;font-weight:700}.note{color:#6b778c}")
				.append("</style></head><body>");

		html.append("<header><h1>Visual Regression Report</h1>")
				.append("<div class=\"note\" style=\"color:#b3d4ff\">Threshold: ")
				.append(config.getSimilarityThreshold()).append(" &middot; Dino server: ")
				.append(escapeHtml(config.getDinoServerUrl())).append("</div></header>");

		html.append("<div class=\"summary\">")
				.append("<div class=\"card\"><div class=\"n\">").append(total).append("</div>States compared</div>")
				.append("<div class=\"card\"><div class=\"n pass\">").append(passed).append("</div>Passed</div>")
				.append("<div class=\"card\"><div class=\"n fail\">").append(failed).append("</div>Failed</div>")
				.append("</div>");

		String currentScenario = null;
		for (StateComparison r : results) {
			if (!r.scenario.equals(currentScenario)) {
				if (currentScenario != null) {
					html.append("</table></section>");
				}
				currentScenario = r.scenario;
				html.append("<section><h2>").append(escapeHtml(currentScenario)).append("</h2><table>")
						.append("<tr><th>Step</th><th>Status</th><th>Similarity</th>")
						.append("<th>Baseline</th><th>Actual</th><th>Diff</th></tr>");
			}
			appendRow(html, r, report.getParentFile());
		}
		if (currentScenario != null) {
			html.append("</table></section>");
		}

		html.append("</body></html>");
		Files.write(report.toPath(), html.toString().getBytes(StandardCharsets.UTF_8));
	}

	private void appendRow(StringBuilder html, StateComparison r, File reportDir) {
		html.append("<tr><td>").append(escapeHtml(prettyStep(r.stateFile))).append("</td>");
		if (r.status == Status.COMPARED) {
			html.append("<td><span class=\"badge ").append(r.passed ? "pass" : "fail").append("\">")
					.append(r.passed ? "PASS" : "FAIL").append("</span>");
			for (Map.Entry<String, Double> field : r.result.getFieldSimilarities().entrySet()) {
				html.append("<div class=\"note\">").append(escapeHtml(field.getKey())).append(": ")
						.append(fmt(field.getValue())).append("</div>");
			}
			html.append("</td>");
			html.append("<td><span class=\"score ").append(r.passed ? "pass" : "fail").append("\">")
					.append(fmt(r.result.getGlobalSimilarity())).append("</span></td>");
			html.append("<td>").append(imgTag(r.baselinePng, reportDir)).append("</td>");
			html.append("<td>").append(imgTag(r.actualPng, reportDir)).append("</td>");
			html.append("<td>").append(r.diffRelative == null ? "&mdash;"
					: "<img src=\"" + escapeHtml(r.diffRelative) + "\">").append("</td>");
		} else {
			String cls = r.status == Status.MISSING ? "fail" : "fail";
			html.append("<td><span class=\"badge ").append(cls).append("\">")
					.append(r.status == Status.MISSING ? "MISSING" : "ERROR").append("</span></td>");
			html.append("<td class=\"note\" colspan=\"4\">").append(escapeHtml(r.message)).append("</td>");
		}
		html.append("</tr>");
	}

	private String imgTag(File image, File reportDir) {
		if (image == null || !image.isFile()) {
			return "&mdash;";
		}
		String src = relativeOrUri(reportDir, image);
		return "<img src=\"" + escapeHtml(src) + "\" loading=\"lazy\">";
	}

	/** Prefers a report-relative path (portable) and falls back to a file: URI across roots/drives. */
	private String relativeOrUri(File reportDir, File target) {
		try {
			Path rel = reportDir.getAbsoluteFile().toPath().relativize(target.getAbsoluteFile().toPath());
			return rel.toString().replace('\\', '/');
		} catch (IllegalArgumentException differentRoot) {
			return target.toURI().toString();
		}
	}

	private String prettyStep(String stateFile) {
		return stateFile.replace(".png", "").replace('_', ' ');
	}

	private String fmt(double value) {
		return String.format(Locale.ROOT, "%.3f", value);
	}

	private String escapeHtml(String raw) {
		if (raw == null) {
			return "";
		}
		return raw.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
	}

	// ------------------------------------------------------------------------
	// Row model
	// ------------------------------------------------------------------------

	private enum Status {
		COMPARED, MISSING, ERROR
	}

	private static final class StateComparison {
		final String scenario;
		final String stateFile;
		final Status status;
		final boolean passed;
		final DinoComparisonResult result;
		final File baselinePng;
		final File actualPng;
		final String diffRelative;
		final String message;

		private StateComparison(String scenario, String stateFile, Status status, boolean passed,
				DinoComparisonResult result, File baselinePng, File actualPng, String diffRelative, String message) {
			this.scenario = scenario;
			this.stateFile = stateFile;
			this.status = status;
			this.passed = passed;
			this.result = result;
			this.baselinePng = baselinePng;
			this.actualPng = actualPng;
			this.diffRelative = diffRelative;
			this.message = message;
		}

		static StateComparison compared(String scenario, String stateFile, File baselinePng, File actualPng,
				DinoComparisonResult result, boolean passed, String diffRelative) {
			return new StateComparison(scenario, stateFile, Status.COMPARED, passed, result,
					baselinePng, actualPng, diffRelative, null);
		}

		static StateComparison missing(String scenario, String stateFile, String message) {
			return new StateComparison(scenario, stateFile, Status.MISSING, false, null, null, null, null, message);
		}

		static StateComparison error(String scenario, String stateFile, String message) {
			return new StateComparison(scenario, stateFile, Status.ERROR, false, null, null, null, null, message);
		}
	}
}
