package com.enactor.pos.mobile.visual;

import java.io.File;

/**
 * One row of the visual report: the result of comparing a single captured state (one Cucumber step)
 * against its baseline. Produced by {@link VisualComparisonService} and consumed by
 * {@link VisualReportWriter}. Shared by both execution paths — the post-run {@link VisualComparisonRunner}
 * and the per-step {@link VisualRegressionScreenshotPlugin} inline comparison.
 *
 * <p>Fields are package-private and immutable; instances are only created through the factory methods.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class StateComparison {

	final String scenario;
	final String stateFile;
	final ComparisonStatus status;
	final boolean passed;
	final DinoComparisonResult result;
	final File baselinePng;
	final File actualPng;
	final String diffRelative;
	final String message;

	private StateComparison(String scenario, String stateFile, ComparisonStatus status, boolean passed,
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

	/** @return {@code true} if this state counts as a visual pass (Matched). */
	public boolean isPassed() {
		return passed;
	}

	/**
	 * @return {@code true} only for a genuine visual mismatch — the server compared the pair and the
	 *         similarity was below threshold. Missing baselines and comparison errors are excluded, so
	 *         they never fail a scenario on their own.
	 */
	public boolean isVisualMismatch() {
		return status == ComparisonStatus.COMPARED && !passed;
	}

	/** @return the scenario (folder) name this state belongs to. */
	public String getScenario() {
		return scenario;
	}

	static StateComparison compared(String scenario, String stateFile, File baselinePng, File actualPng,
			DinoComparisonResult result, boolean passed, String diffRelative) {
		return new StateComparison(scenario, stateFile, ComparisonStatus.COMPARED, passed, result,
				baselinePng, actualPng, diffRelative, null);
	}

	static StateComparison missing(String scenario, String stateFile, String message) {
		return new StateComparison(scenario, stateFile, ComparisonStatus.MISSING, false, null, null, null, null, message);
	}

	static StateComparison error(String scenario, String stateFile, String message) {
		return new StateComparison(scenario, stateFile, ComparisonStatus.ERROR, false, null, null, null, null, message);
	}
}
