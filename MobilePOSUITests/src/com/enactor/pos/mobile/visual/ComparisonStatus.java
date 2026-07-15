package com.enactor.pos.mobile.visual;

/**
 * Outcome of attempting to compare one captured state against its baseline.
 *
 * <ul>
 *   <li>{@code COMPARED} - the Dino server returned a similarity score (which then decides pass/fail).</li>
 *   <li>{@code MISSING}  - one side of the pair was absent (no baseline yet, or no actual captured).</li>
 *   <li>{@code ERROR}    - the comparison itself failed (server unreachable, I/O error, ...).</li>
 * </ul>
 *
 * @author Visual Regression Subsystem
 */
public enum ComparisonStatus {
	COMPARED, MISSING, ERROR
}
