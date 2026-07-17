package com.enactor.pos.mobile.visual;

import java.util.List;

import io.cucumber.java.AfterStep;

/**
 * Cucumber {@code @AfterStep} hook that turns a visual mismatch into an <em>immediate</em> scenario
 * failure — but only when explicitly opted in via {@code VisualRegression.FailScenarioOnUnmatch=true}.
 *
 * <p>Rationale: the per-step {@link VisualRegressionScreenshotPlugin} is a read-only
 * {@code ConcurrentEventListener} and cannot change a scenario's outcome. A hook can. This hook runs
 * after <em>every</em> step; the plugin has already captured and compared that step (its
 * {@code TestStepFinished} event fires before this hook executes), so {@link VisualStepOutcomeTracker}
 * already reflects the just-finished step. If any step has been visually unmatched, the hook throws —
 * which fails the current step and makes Cucumber <strong>skip all remaining steps</strong> in the
 * scenario, i.e. the test stops immediately. Cucumber still runs the suite's {@code @After} teardown
 * hooks (e.g. driver quit), because those are separate from step execution.</p>
 *
 * <p><strong>Activation:</strong> this class must be on Cucumber's glue path. The visual package is
 * added to {@code gluePaths} for that purpose; without the flag it is inert (it returns immediately),
 * so it is safe to leave on the glue path at all times.</p>
 *
 * @author Visual Regression Subsystem
 */
public class VisualRegressionScenarioHook {

	/**
	 * After each step: if visual gating is on and any step so far was visually unmatched, throw so the
	 * scenario fails now and its remaining steps are skipped. Because the plugin records a mismatch on
	 * the same step this hook immediately follows, the throw happens on the very first unmatched step.
	 */
	@AfterStep
	public void failFastOnVisualMismatch() {
		VisualRegressionConfig config = VisualRegressionConfig.getInstance();
		if (!config.isEnabled() || !config.isCompareEachStep() || !config.isFailScenarioOnUnmatch()) {
			return;
		}

		List<String> unmatched = VisualStepOutcomeTracker.getUnmatchedSteps();
		if (unmatched.isEmpty()) {
			return;
		}

		throw new AssertionError("Visual regression: step did not match the baseline -> "
				+ String.join("; ", unmatched)
				+ ". Remaining steps skipped. (Disable with VisualRegression.FailScenarioOnUnmatch=false.)");
	}
}
