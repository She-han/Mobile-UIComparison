package com.enactor.pos.mobile.visual;

import java.util.Collections;
import java.util.Map;

/**
 * Parsed view of one {@code /compare} response from the DINOv2 server.
 *
 * <p>Only the members the report needs are surfaced: the overall {@code global_similarity}, the
 * per-field similarity map, and the Base64-encoded diff heat-map image the server renders. Structural
 * and colour sub-scores are available on the wire but are intentionally not modelled here to keep the
 * consumer surface small; add them if the report ever needs the breakdown.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class DinoComparisonResult {

	private final double globalSimilarity;
	private final Map<String, Double> fieldSimilarities;
	private final String diffImageBase64;

	public DinoComparisonResult(double globalSimilarity, Map<String, Double> fieldSimilarities,
			String diffImageBase64) {
		this.globalSimilarity = globalSimilarity;
		this.fieldSimilarities = fieldSimilarities == null
				? Collections.<String, Double>emptyMap()
				: Collections.unmodifiableMap(fieldSimilarities);
		this.diffImageBase64 = diffImageBase64;
	}

	/**
	 * Builds a result from a raw JSON response body using {@link JsonUtil}'s targeted extractors.
	 *
	 * @param json the response body from {@code /compare}
	 * @return the parsed result
	 */
	public static DinoComparisonResult fromJson(String json) {
		return new DinoComparisonResult(
				JsonUtil.extractNumber(json, "global_similarity", 0.0d),
				JsonUtil.extractNumberObject(json, "field_similarities"),
				JsonUtil.extractString(json, "diff_b64"));
	}

	/**
	 * @return the overall structural similarity in {@code [0, 1]} (excludes tracked-field patches)
	 */
	public double getGlobalSimilarity() {
		return globalSimilarity;
	}

	/**
	 * @return an unmodifiable map of tracked field name to its similarity in {@code [0, 1]}
	 */
	public Map<String, Double> getFieldSimilarities() {
		return fieldSimilarities;
	}

	/**
	 * @return the Base64 PNG of the rendered diff overlay, or {@code null} if the server sent none
	 */
	public String getDiffImageBase64() {
		return diffImageBase64;
	}
}
