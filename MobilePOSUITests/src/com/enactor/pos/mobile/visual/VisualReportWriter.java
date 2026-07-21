package com.enactor.pos.mobile.visual;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
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
 * <p>The page is fully <strong>self-contained</strong>: every image is embedded inline as a
 * {@code data:} URI rather than linked to a file on disk, so the single {@code Visual-Report.html} can
 * be moved or shared anywhere and still render. A "Download report" button saves a copy from the
 * browser. Encoded images are cached per writer instance so repeated inline flushes stay cheap.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class VisualReportWriter {

	private final VisualRegressionConfig config;

	/** Caches base64 data URIs by path+size+mtime so re-flushes don't re-encode unchanged images. */
	private final Map<String, String> dataUriCache = new HashMap<>();

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

		// Group states by scenario key (the nested feature-path key), preserving discovery order.
		Map<String, List<StateComparison>> byScenario = new LinkedHashMap<>();
		for (StateComparison r : results) {
			byScenario.computeIfAbsent(r.scenario, k -> new ArrayList<>()).add(r);
		}

		// Build a folder tree from the nested keys, then collapse single-child chains so common prefixes
		// stay compact and real branch points (e.g. pos vs em) are visible.
		Node root = new Node("");
		for (Map.Entry<String, List<StateComparison>> entry : byScenario.entrySet()) {
			String[] segments = entry.getKey().split("/");
			Node node = root;
			for (int i = 0; i < segments.length - 1; i++) {
				node = node.child(segments[i]);
			}
			String scenarioName = segments.length > 0 ? segments[segments.length - 1] : entry.getKey();
			node.scenarios.add(new ScenarioGroup(scenarioName, entry.getKey(), entry.getValue()));
		}
		Map<String, Node> topLevel = new LinkedHashMap<>();
		for (Node child : root.children.values()) {
			Node compressed = compress(child);
			topLevel.put(compressed.name, compressed);
		}

		int scenarioCount = byScenario.size();
		int failedScenarios = 0;
		for (Node node : topLevel.values()) {
			failedScenarios += rollup(node)[3];
		}

		StringBuilder html = new StringBuilder(64 * 1024);
		html.append("<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"utf-8\">");
		html.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
		html.append("<title>Visual Regression Report</title>");
		html.append("<style>").append(reportCss()).append("</style></head><body>");

		html.append("<header class=\"top\"><div class=\"wrap head-row\"><div>")
				.append("<h1>Visual Regression Report</h1>")
				.append("<div class=\"meta\">Threshold ").append(percent(config.getSimilarityThreshold()))
				.append(" &nbsp;&middot;&nbsp; ").append(escapeHtml(config.getDinoServerUrl()))
				.append("</div></div>")
				.append("<button type=\"button\" class=\"dl-btn\" onclick=\"downloadReport()\">")
				.append("<span class=\"dl-ic\">&#8595;</span> Download report</button>")
				.append("</div></header>");

		html.append("<div class=\"wrap summary\">")
				.append(summaryStat(scenarioCount, "Scenarios", ""))
				.append(summaryStat(total, "Steps", ""))
				.append(summaryStat(passed, "Matched", "ok"))
				.append(summaryStat(failed, "Unmatched", failed > 0 ? "bad" : ""))
				.append(summaryStat(failedScenarios, "Failed", failedScenarios > 0 ? "bad" : ""))
				.append("</div>");

		html.append("<main class=\"wrap tree\">");
		for (Node node : topLevel.values()) {
			renderNode(html, node, report.getParentFile());
		}
		html.append("</main>");

		// Self-download: the page is already self-contained (images are inline data URIs), so serialising
		// the current DOM yields a complete, portable copy that works from any location.
		html.append("<script>function downloadReport(){")
				.append("var html='<!DOCTYPE html>\\n'+document.documentElement.outerHTML;")
				.append("var blob=new Blob([html],{type:'text/html;charset=utf-8'});")
				.append("var a=document.createElement('a');a.href=URL.createObjectURL(blob);")
				.append("a.download='Visual-Report.html';document.body.appendChild(a);a.click();a.remove();")
				.append("setTimeout(function(){URL.revokeObjectURL(a.href);},1500);}")
				.append("</script>");

		html.append("</body></html>");
		Files.write(report.toPath(), html.toString().getBytes(StandardCharsets.UTF_8));
	}

	private String summaryStat(int number, String label, String tone) {
		return "<div class=\"stat " + tone + "\"><div class=\"n\">" + number + "</div><div class=\"l\">"
				+ label + "</div></div>";
	}

	/** A folder in the report tree: named subfolders plus any scenarios that live directly inside it. */
	private static final class Node {
		private final String name;
		private final Map<String, Node> children = new LinkedHashMap<>();
		private final List<ScenarioGroup> scenarios = new ArrayList<>();

		Node(String name) {
			this.name = name;
		}

		Node child(String segment) {
			return children.computeIfAbsent(segment, Node::new);
		}
	}

	/** One scenario leaf: its display name, its full (nested) key, and its step comparison rows. */
	private static final class ScenarioGroup {
		private final String name;
		private final String key;
		private final List<StateComparison> states;

		ScenarioGroup(String name, String key, List<StateComparison> states) {
			this.name = name;
			this.key = key;
			this.states = states;
		}
	}

	/**
	 * Collapses single-child folder chains so a long common prefix renders as one node (e.g.
	 * {@code feature/retail/pos/.../GiftCard.feature}) while genuine branch points (pos vs em) stay as
	 * separate children. Children are compressed first (bottom-up), then this node is merged with its sole
	 * child while it has exactly one subfolder and no scenarios of its own.
	 */
	private Node compress(Node node) {
		List<Node> compressedChildren = new ArrayList<>();
		for (Node child : node.children.values()) {
			compressedChildren.add(compress(child));
		}
		node.children.clear();
		for (Node child : compressedChildren) {
			node.children.put(child.name, child);
		}
		Node current = node;
		while (current.children.size() == 1 && current.scenarios.isEmpty()) {
			Node only = current.children.values().iterator().next();
			Node merged = new Node(current.name.isEmpty() ? only.name : current.name + "/" + only.name);
			merged.children.putAll(only.children);
			merged.scenarios.addAll(only.scenarios);
			current = merged;
		}
		return current;
	}

	/**
	 * Aggregates counts over a folder subtree.
	 *
	 * @return {@code {steps, matched, unmatched, failedScenarios, scenarios}}
	 */
	private int[] rollup(Node node) {
		int steps = 0, matched = 0, unmatched = 0, failedScenarios = 0, scenarios = 0;
		for (ScenarioGroup scenario : node.scenarios) {
			scenarios++;
			int mismatched = 0;
			for (StateComparison r : scenario.states) {
				steps++;
				if (r.passed) {
					matched++;
				} else if (r.isVisualMismatch()) {
					unmatched++;
					mismatched++;
				}
			}
			if (scenarioFailed(scenario.key, mismatched)) {
				failedScenarios++;
			}
		}
		for (Node child : node.children.values()) {
			int[] childRoll = rollup(child);
			steps += childRoll[0];
			matched += childRoll[1];
			unmatched += childRoll[2];
			failedScenarios += childRoll[3];
			scenarios += childRoll[4];
		}
		return new int[] { steps, matched, unmatched, failedScenarios, scenarios };
	}

	/**
	 * Renders one folder node as a collapsible {@code <details>} with a folder/feature icon, its path
	 * label, and a rolled-up scenario/failure count, then recurses into child folders and scenarios.
	 */
	private void renderNode(StringBuilder html, Node node, File reportDir) {
		int[] roll = rollup(node);
		boolean isFeature = node.name.toLowerCase(Locale.ROOT).endsWith(".feature");
		html.append("<details class=\"folder\" open><summary><span class=\"chev\"></span>")
				.append("<span class=\"node-icon\">").append(isFeature ? "&#128196;" : "&#128193;").append("</span>")
				.append("<span class=\"node-name\">").append(escapeHtml(node.name)).append("</span>")
				.append("<span class=\"sc-stats\">");
		if (roll[3] > 0) {
			html.append("<span class=\"pill bad\">").append(roll[3]).append(" failed</span>");
		}
		html.append("<span class=\"pill soft\">").append(roll[4])
				.append(roll[4] == 1 ? " scenario" : " scenarios").append("</span>")
				.append("</span></summary><div class=\"folder-body\">");
		for (Node child : node.children.values()) {
			renderNode(html, child, reportDir);
		}
		for (ScenarioGroup scenario : node.scenarios) {
			renderScenario(html, scenario, reportDir);
		}
		html.append("</div></details>");
	}

	/**
	 * Renders one scenario as a native collapsible {@code <details>} block. Clicking the scenario name
	 * (the {@code <summary>}) expands/collapses its steps — no JavaScript required. Scenarios that
	 * contain an unmatched step are expanded by default so regressions are visible at a glance.
	 */
	private void renderScenario(StringBuilder html, ScenarioGroup scenario, File reportDir) {
		int matched = 0;
		int mismatched = 0;
		for (StateComparison r : scenario.states) {
			if (r.passed) {
				matched++;
			} else if (r.isVisualMismatch()) {
				mismatched++;
			}
		}
		boolean failed = scenarioFailed(scenario.key, mismatched);

		html.append("<details class=\"scenario\"").append(failed ? " open" : "").append(">");
		html.append("<summary><span class=\"chev\"></span>")
				.append("<span class=\"sc-title\"><span class=\"sc-name\">").append(escapeHtml(scenario.name))
				.append("</span><span class=\"badge ").append(failed ? "bad" : "ok").append(" sc-verdict\">")
				.append(failed ? "Failed" : "Passed").append("</span></span>")
				.append("<span class=\"sc-stats\">");
		if (mismatched > 0) {
			html.append("<span class=\"pill bad\">").append(mismatched).append(" unmatched</span>");
		}
		html.append("<span class=\"pill ok\">").append(matched).append(" matched</span>")
				.append("</span></summary>");

		html.append("<div class=\"table-wrap\"><table><thead><tr>")
				.append("<th class=\"c-step\">Step</th><th>Baseline</th><th>Actual</th><th>Diff</th>")
				.append("</tr></thead><tbody>");
		for (StateComparison r : scenario.states) {
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
			html.append("<span class=\"sim\">").append(percent(r.result.getGlobalSimilarity())).append("</span>");
			for (Map.Entry<String, Double> field : r.result.getFieldSimilarities().entrySet()) {
				html.append("<span class=\"field\">").append(escapeHtml(field.getKey())).append(' ')
						.append(percent(field.getValue())).append("</span>");
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
			String diffUri = dataUri(new File(reportDir, r.diffRelative));
			if (diffUri != null) {
				html.append("<img class=\"shot\" src=\"").append(diffUri).append("\" loading=\"lazy\">");
			} else {
				html.append("<span class=\"none\">&mdash;</span>");
			}
		} else if (r.status == ComparisonStatus.COMPARED && r.passed) {
			html.append("<span class=\"none\">No differences</span>");
		} else {
			html.append("<span class=\"none\">&mdash;</span>");
		}
		html.append("</td></tr>");
	}

	private String imgTag(File image, File reportDir) {
		String uri = dataUri(image);
		if (uri == null) {
			return "<span class=\"none\">&mdash;</span>";
		}
		return "<img class=\"shot\" src=\"" + uri + "\" loading=\"lazy\">";
	}

	/**
	 * Encodes an image file as an inline {@code data:} URI so the report is fully self-contained. Results
	 * are cached by absolute path + size + last-modified, so repeated inline flushes only re-encode images
	 * that actually changed. Base64 needs no HTML escaping (its alphabet has no HTML-special characters).
	 *
	 * @return the {@code data:image/...;base64,...} URI, or {@code null} if the file is absent/unreadable
	 */
	private String dataUri(File image) {
		if (image == null || !image.isFile()) {
			return null;
		}
		String key = image.getAbsolutePath() + '|' + image.length() + '|' + image.lastModified();
		String cached = dataUriCache.get(key);
		if (cached != null) {
			return cached;
		}
		try {
			byte[] bytes = Files.readAllBytes(image.toPath());
			String uri = "data:" + mimeFor(image.getName()) + ";base64," + Base64.getEncoder().encodeToString(bytes);
			dataUriCache.put(key, uri);
			return uri;
		} catch (IOException e) {
			return null;
		}
	}

	private String mimeFor(String fileName) {
		String lower = fileName.toLowerCase(Locale.ROOT);
		if (lower.endsWith(".jpg") || lower.endsWith(".jpeg")) {
			return "image/jpeg";
		}
		if (lower.endsWith(".gif")) {
			return "image/gif";
		}
		if (lower.endsWith(".webp")) {
			return "image/webp";
		}
		return "image/png";
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
				+ ".head-row{display:flex;align-items:center;justify-content:space-between;gap:16px}"
				+ ".top h1{margin:0;font-size:18px;font-weight:600;letter-spacing:-.01em}"
				+ ".top .meta{margin-top:4px;color:var(--muted);font-size:12.5px}"
				+ ".dl-btn{flex:none;cursor:pointer;font:inherit;font-size:13px;font-weight:600;color:#fff;"
				+ "background:var(--ink);border:none;border-radius:8px;padding:9px 16px;display:inline-flex;"
				+ "align-items:center;gap:7px;transition:opacity .15s ease}"
				+ ".dl-btn:hover{opacity:.88}.dl-btn:active{opacity:.76}"
				+ ".dl-ic{font-size:15px;line-height:1}"
				+ ".summary{display:flex;gap:12px;margin-top:20px;margin-bottom:4px}"
				+ ".stat{background:var(--card);border:1px solid var(--line);border-radius:10px;padding:14px 18px;min-width:112px}"
				+ ".stat .n{font-size:24px;font-weight:650;font-variant-numeric:tabular-nums}"
				+ ".stat .l{font-size:11px;color:var(--muted);text-transform:uppercase;letter-spacing:.05em;margin-top:2px}"
				+ ".stat.ok .n{color:var(--ok)}.stat.bad .n{color:var(--bad)}"
				+ "main{padding-top:12px;padding-bottom:44px}"
				+ ".folder{background:var(--card);border:1px solid var(--line);border-radius:10px;margin:10px 0;overflow:hidden}"
				+ ".folder>summary{list-style:none;cursor:pointer;display:flex;align-items:center;gap:9px;"
				+ "padding:12px 16px;user-select:none}"
				+ ".folder>summary::-webkit-details-marker{display:none}"
				+ ".folder[open]>summary .chev{transform:rotate(45deg)}"
				+ ".node-icon{flex:none;font-size:15px;line-height:1}"
				+ ".node-name{flex:1;min-width:0;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;"
				+ "font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:13px;font-weight:600}"
				+ ".folder-body{padding:2px 12px 10px 30px;border-top:1px solid var(--line)}"
				+ ".folder .folder{background:transparent;border-color:var(--line)}"
				+ ".pill.soft{background:#eef1f4;color:var(--muted)}"
				+ ".scenario{background:var(--card);border:1px solid var(--line);border-radius:10px;margin:10px 0;overflow:hidden}"
				+ ".scenario summary{list-style:none;cursor:pointer;display:flex;align-items:center;gap:10px;padding:14px 18px;user-select:none}"
				+ ".scenario summary::-webkit-details-marker{display:none}"
				+ ".chev{width:7px;height:7px;border-right:2px solid var(--muted);border-bottom:2px solid var(--muted);"
				+ "transform:rotate(-45deg);transition:transform .15s ease;flex:none;margin:0 2px}"
				+ ".scenario[open] .chev{transform:rotate(45deg)}"
				+ ".sc-title{display:flex;align-items:center;gap:8px;flex:1;min-width:0}"
				+ ".sc-name{font-weight:600;letter-spacing:-.01em;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}"
				+ ".sc-verdict{flex:none;font-size:11px}"
				+ ".sc-stats{display:flex;gap:6px;flex:none}"
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

	private String prettyStep(String stateFile) {
		return stateFile.replace(".png", "").replace('_', ' ');
	}

	/** Formats a 0..1 similarity as a percentage, e.g. 0.9524 -> "95.2%", 1.0 -> "100.0%". */
	private String percent(double value) {
		return String.format(Locale.ROOT, "%.1f%%", value * 100.0);
	}

	/**
	 * Whether the scenario carries a "Failed" verdict. Prefers the real functional result recorded by
	 * the capture plugin ({@code status_passed.txt}/{@code status_failed.txt} in the scenario's output
	 * folder); if neither marker is present it falls back to the visual outcome (any genuine mismatch).
	 */
	private boolean scenarioFailed(String scenario, int mismatched) {
		File scenarioDir = new File(config.getOutputDir(), scenario);
		if (new File(scenarioDir, "status_failed.txt").isFile()) {
			return true;
		}
		if (new File(scenarioDir, "status_passed.txt").isFile()) {
			return false;
		}
		return mismatched > 0;
	}

	private String escapeHtml(String raw) {
		if (raw == null) {
			return "";
		}
		return raw.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
	}
}
