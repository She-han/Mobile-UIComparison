package com.enactor.pos.mobile.visual;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Minimal, dependency-free JSON helpers scoped to exactly what the DINOv2 {@code /compare} exchange
 * needs. The project targets Java 8 and the test module has no Gson/Jackson on its class-path, so
 * rather than pull in a library we hand-build the small request and extract the handful of response
 * values we care about.
 *
 * <p>This is deliberately <em>not</em> a general JSON parser. It is safe here because the server's
 * response fields we read are either plain numbers ({@code global_similarity}, per-field scores) or
 * Base64 strings ({@code diff_b64}) — Base64's alphabet ({@code A-Za-z0-9+/=}) contains no quote or
 * backslash, so a non-greedy quoted-string match cannot be fooled by escaped characters.</p>
 *
 * @author Visual Regression Subsystem
 */
final class JsonUtil {

	private JsonUtil() {
	}

	/**
	 * Escapes the characters that must not appear raw inside a JSON string literal.
	 *
	 * @param raw the value to escape (may be {@code null})
	 * @return a JSON-safe representation (empty string for {@code null})
	 */
	static String escape(String raw) {
		if (raw == null) {
			return "";
		}
		StringBuilder sb = new StringBuilder(raw.length() + 8);
		for (int i = 0; i < raw.length(); i++) {
			char c = raw.charAt(i);
			switch (c) {
				case '"':
					sb.append("\\\"");
					break;
				case '\\':
					sb.append("\\\\");
					break;
				case '\n':
					sb.append("\\n");
					break;
				case '\r':
					sb.append("\\r");
					break;
				case '\t':
					sb.append("\\t");
					break;
				default:
					sb.append(c);
			}
		}
		return sb.toString();
	}

	/**
	 * Extracts a top-level numeric field, e.g. {@code "global_similarity": 0.97}.
	 *
	 * @param json     the response body
	 * @param key      the field name (without quotes)
	 * @param fallback value returned when the field is absent or unparceable
	 * @return the parsed double, or {@code fallback}
	 */
	static double extractNumber(String json, String key, double fallback) {
		Matcher m = Pattern.compile("\"" + Pattern.quote(key) + "\"\\s*:\\s*(-?[0-9]+(?:\\.[0-9]+)?(?:[eE][-+]?[0-9]+)?)")
				.matcher(json);
		return m.find() ? Double.parseDouble(m.group(1)) : fallback;
	}

	/**
	 * Extracts a top-level string field, e.g. {@code "diff_b64": "iVBOR..."}. Safe for Base64 values.
	 *
	 * @param json the response body
	 * @param key  the field name (without quotes)
	 * @return the raw string value, or {@code null} when the field is absent
	 */
	static String extractString(String json, String key) {
		Matcher m = Pattern.compile("\"" + Pattern.quote(key) + "\"\\s*:\\s*\"([^\"]*)\"").matcher(json);
		return m.find() ? m.group(1) : null;
	}

	/**
	 * Extracts a flat object of {@code "name": number} pairs, e.g. {@code field_similarities}.
	 *
	 * @param json the response body
	 * @param key  the object field name (without quotes)
	 * @return an ordered map of member name to numeric value (empty when absent)
	 */
	static Map<String, Double> extractNumberObject(String json, String key) {
		Map<String, Double> result = new LinkedHashMap<>();
		Matcher obj = Pattern.compile("\"" + Pattern.quote(key) + "\"\\s*:\\s*\\{([^}]*)\\}").matcher(json);
		if (obj.find()) {
			Matcher pair = Pattern.compile("\"([^\"]+)\"\\s*:\\s*(-?[0-9]+(?:\\.[0-9]+)?(?:[eE][-+]?[0-9]+)?)")
					.matcher(obj.group(1));
			while (pair.find()) {
				result.put(pair.group(1), Double.parseDouble(pair.group(2)));
			}
		}
		return result;
	}
}
