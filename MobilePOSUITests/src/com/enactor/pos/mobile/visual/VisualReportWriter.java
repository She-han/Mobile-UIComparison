package com.enactor.pos.mobile.visual;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Renders a list of {@link StateComparison} rows into the {@code Visual-Report.html} page. Extracted so
 * that both the batch {@link VisualComparisonRunner} and the inline
 * {@link VisualRegressionScreenshotPlugin} produce byte-for-byte identical reports.
 *
 * <p>The report is a self-styled, dependency-free HTML page: a summary bar plus one collapsible
 * ({@code <details>}) section per scenario. Each step row shows the step name with its
 * Matched/Unmatched badge and similarity score beneath it, the baseline and actual thumbnails, and a
 * diff image only when the step is unmatched.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class VisualReportWriter {

	private final VisualRegressionConfig config;

	public VisualReportWriter(VisualRegressionConfig config) {
		this.config = config;
	}

	/**
	 * Writes the report file from the given results.
	 *
	 * @param report  the target HTML file (its parent directory is used to resolve relative image paths)
	 * @param results the comparison rows, in the order they should appear
	 * @throws IOException if the file cannot be written
	 */
	public void write(File report, List<StateComparison> results) throws IOException {
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

		// Step cell — name, then status + similarity, then any messages.
		html.append("<td class=\"c-step\"><div class=\"step-name\">")
				.append(escapeHtml(prettyStep(r.stateFile))).append("</div><div class=\"step-meta\">");
		if (r.status == ComparisonStatus.COMPARED) {
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
					.append(r.status == ComparisonStatus.MISSING ? "Missing" : "Error").append("</span></div>");
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
		if (r.status == ComparisonStatus.COMPARED && !r.passed && r.diffRelative != null) {
			html.append("<img class=\"shot\" src=\"").append(escapeHtml(r.diffRelative)).append("\" loading=\"lazy\">");
		} else if (r.status == ComparisonStatus.COMPARED && r.passed) {
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
}
