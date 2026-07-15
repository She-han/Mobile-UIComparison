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
import java.util.LinkedHashMap;
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

		// Group states by scenario, preserving discovery order.
		Map<String, List<StateComparison>> byScenario = new LinkedHashMap<>();
		for (StateComparison r : results) {
			byScenario.computeIfAbsent(r.scenario, k -> new ArrayList<>()).add(r);
		}

		StringBuilder html = new StringBuilder(64 * 1024);
		html.append("<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"utf-8\">");
		html.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
		html.append("<title>Visual Regression Report</title>");
		html.append("<style>").append(reportCss()).append("</style></head><body>");

		html.append("<header class=\"top\"><div class=\"wrap\">")
				.append("<h1>Visual Regression Report</h1>")
				.append("<div class=\"meta\">Threshold ").append(fmt(config.getSimilarityThreshold()))
				.append(" &nbsp;&middot;&nbsp; ").append(escapeHtml(config.getDinoServerUrl()))
				.append("</div></div></header>");

		html.append("<div class=\"wrap summary\">")
				.append(summaryStat(total, "Steps", ""))
				.append(summaryStat(passed, "Matched", "ok"))
				.append(summaryStat(failed, "Unmatched", failed > 0 ? "bad" : ""))
				.append("</div>");

		html.append("<main class=\"wrap\">");
		for (Map.Entry<String, List<StateComparison>> entry : byScenario.entrySet()) {
			appendScenario(html, entry.getKey(), entry.getValue(), report.getParentFile());
		}
		html.append("</main>");

		html.append("</body></html>");
		Files.write(report.toPath(), html.toString().getBytes(StandardCharsets.UTF_8));
	}

	private String summaryStat(int number, String label, String tone) {
		return "<div class=\"stat " + tone + "\"><div class=\"n\">" + number + "</div><div class=\"l\">"
				+ label + "</div></div>";
	}

	/**
	 * Renders one scenario as a native collapsible {@code <details>} block. Clicking the scenario name
	 * (the {@code <summary>}) expands/collapses its steps — no JavaScript required. Scenarios that
	 * contain an unmatched step are expanded by default so regressions are visible at a glance.
	 */
	private void appendScenario(StringBuilder html, String scenario, List<StateComparison> states, File reportDir) {
		int matched = 0;
		for (StateComparison r : states) {
			if (r.passed) {
				matched++;
			}
		}
		int unmatched = states.size() - matched;

		html.append("<details class=\"scenario\"").append(unmatched > 0 ? " open" : "").append(">");
		html.append("<summary><span class=\"chev\"></span>")
				.append("<span class=\"sc-name\">").append(escapeHtml(scenario)).append("</span>")
				.append("<span class=\"sc-stats\">");
		if (unmatched > 0) {
			html.append("<span class=\"pill bad\">").append(unmatched).append(" unmatched</span>");
		}
		html.append("<span class=\"pill ok\">").append(matched).append(" matched</span>")
				.append("</span></summary>");

		html.append("<div class=\"table-wrap\"><table><thead><tr>")
				.append("<th class=\"c-step\">Step</th><th>Baseline</th><th>Actual</th><th>Diff</th>")
				.append("</tr></thead><tbody>");
		for (StateComparison r : states) {
			appendRow(html, r, reportDir);
		}
		html.append("</tbody></table></div></details>");
	}

	private void appendRow(StringBuilder html, StateComparison r, File reportDir) {
		html.append("<tr>");

		// Step cell — name, then status + similarity (moved out of their own columns), then messages.
		html.append("<td class=\"c-step\"><div class=\"step-name\">")
				.append(escapeHtml(prettyStep(r.stateFile))).append("</div><div class=\"step-meta\">");
		if (r.status == Status.COMPARED) {
			html.append("<span class=\"badge ").append(r.passed ? "ok" : "bad").append("\">")
					.append(r.passed ? "Matched" : "Unmatched").append("</span>");
			html.append("<span class=\"sim\">").append(fmt(r.result.getGlobalSimilarity())).append("</span>");
			for (Map.Entry<String, Double> field : r.result.getFieldSimilarities().entrySet()) {
				html.append("<span class=\"field\">").append(escapeHtml(field.getKey())).append(' ')
						.append(fmt(field.getValue())).append("</span>");
			}
			html.append("</div>");
		} else {
			html.append("<span class=\"badge warn\">")
					.append(r.status == Status.MISSING ? "Missing" : "Error").append("</span></div>");
			if (r.message != null) {
				html.append("<div class=\"msg\">").append(escapeHtml(r.message)).append("</div>");
			}
		}
		html.append("</td>");

		// Baseline + actual thumbnails.
		html.append("<td>").append(imgTag(r.baselinePng, reportDir)).append("</td>");
		html.append("<td>").append(imgTag(r.actualPng, reportDir)).append("</td>");

		// Diff — only shown when there is an actual difference (unmatched).
		html.append("<td>");
		if (r.status == Status.COMPARED && !r.passed && r.diffRelative != null) {
			html.append("<img class=\"shot\" src=\"").append(escapeHtml(r.diffRelative)).append("\" loading=\"lazy\">");
		} else if (r.status == Status.COMPARED && r.passed) {
			html.append("<span class=\"none\">No differences</span>");
		} else {
			html.append("<span class=\"none\">&mdash;</span>");
		}
		html.append("</td></tr>");
	}

	private String imgTag(File image, File reportDir) {
		if (image == null || !image.isFile()) {
			return "<span class=\"none\">&mdash;</span>";
		}
		String src = relativeOrUri(reportDir, image);
		return "<img class=\"shot\" src=\"" + escapeHtml(src) + "\" loading=\"lazy\">";
	}

	/** The report stylesheet — kept in one place for a clean, minimal, professional look. */
	private String reportCss() {
		return ":root{--bg:#f6f7f9;--card:#fff;--ink:#1f2329;--muted:#6b7280;--line:#e6e8eb;"
				+ "--ok:#0f7b57;--ok-bg:#e7f5ef;--bad:#c0362c;--bad-bg:#fbeae8;--warn:#8a6d3b;--warn-bg:#fbf3e0}"
				+ "*{box-sizing:border-box}"
				+ "body{margin:0;background:var(--bg);color:var(--ink);"
				+ "font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;"
				+ "font-size:14px;line-height:1.5}"
				+ ".wrap{max-width:1120px;margin:0 auto;padding-left:28px;padding-right:28px}"
				+ ".top{background:var(--card);border-bottom:1px solid var(--line)}"
				+ ".top .wrap{padding-top:22px;padding-bottom:22px}"
				+ ".top h1{margin:0;font-size:18px;font-weight:600;letter-spacing:-.01em}"
				+ ".top .meta{margin-top:4px;color:var(--muted);font-size:12.5px}"
				+ ".summary{display:flex;gap:12px;margin-top:20px;margin-bottom:4px}"
				+ ".stat{background:var(--card);border:1px solid var(--line);border-radius:10px;padding:14px 18px;min-width:112px}"
				+ ".stat .n{font-size:24px;font-weight:650;font-variant-numeric:tabular-nums}"
				+ ".stat .l{font-size:11px;color:var(--muted);text-transform:uppercase;letter-spacing:.05em;margin-top:2px}"
				+ ".stat.ok .n{color:var(--ok)}.stat.bad .n{color:var(--bad)}"
				+ "main{padding-top:12px;padding-bottom:44px}"
				+ ".scenario{background:var(--card);border:1px solid var(--line);border-radius:10px;margin:12px 0;overflow:hidden}"
				+ ".scenario summary{list-style:none;cursor:pointer;display:flex;align-items:center;gap:10px;padding:14px 18px;user-select:none}"
				+ ".scenario summary::-webkit-details-marker{display:none}"
				+ ".chev{width:7px;height:7px;border-right:2px solid var(--muted);border-bottom:2px solid var(--muted);"
				+ "transform:rotate(-45deg);transition:transform .15s ease;flex:none;margin:0 2px}"
				+ ".scenario[open] .chev{transform:rotate(45deg)}"
				+ ".sc-name{font-weight:600;flex:1;letter-spacing:-.01em}"
				+ ".sc-stats{display:flex;gap:6px}"
				+ ".pill{font-size:11.5px;font-weight:600;padding:3px 9px;border-radius:999px;white-space:nowrap}"
				+ ".pill.ok{background:var(--ok-bg);color:var(--ok)}.pill.bad{background:var(--bad-bg);color:var(--bad)}"
				+ ".table-wrap{border-top:1px solid var(--line);overflow-x:auto}"
				+ "table{width:100%;border-collapse:collapse}"
				+ "th{font-size:11px;text-transform:uppercase;letter-spacing:.05em;color:var(--muted);text-align:left;"
				+ "font-weight:600;padding:10px 14px;background:#fafbfc;border-bottom:1px solid var(--line)}"
				+ "td{padding:14px;border-bottom:1px solid var(--line);vertical-align:top}"
				+ "tr:last-child td{border-bottom:none}"
				+ ".c-step{width:280px}"
				+ ".step-name{font-weight:550;margin-bottom:8px}"
				+ ".step-meta{display:flex;flex-wrap:wrap;gap:6px;align-items:center}"
				+ ".badge{font-size:11px;font-weight:650;padding:3px 9px;border-radius:6px}"
				+ ".badge.ok{background:var(--ok-bg);color:var(--ok)}.badge.bad{background:var(--bad-bg);color:var(--bad)}"
				+ ".badge.warn{background:var(--warn-bg);color:var(--warn)}"
				+ ".sim{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:12px;color:var(--muted);"
				+ "font-variant-numeric:tabular-nums}"
				+ ".field{font-size:11px;color:var(--muted);background:#f3f4f6;border-radius:5px;padding:2px 7px}"
				+ ".msg{margin-top:8px;color:var(--muted);font-size:12.5px}"
				+ ".shot{max-width:200px;max-height:320px;border:1px solid var(--line);border-radius:6px;display:block}"
				+ ".none{color:#b8bcc4;font-size:12.5px}";
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
