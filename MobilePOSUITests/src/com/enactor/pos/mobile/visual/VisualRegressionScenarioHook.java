package com.enactor.pos.mobile.visual;

import java.util.List;

import io.cucumber.java.After;
import io.cucumber.java.Scenario;

/**
 * Cucumber {@code @After} hook that turns a visual mismatch into a functional scenario failure — but
 * only when explicitly opted in via {@code VisualRegression.FailScenarioOnUnmatch=true}.
 *
 * <p>Rationale: the per-step {@link VisualRegressionScreenshotPlugin} is a read-only
 * {@code ConcurrentEventListener} and cannot change a scenario's outcome. A hook can. This hook runs
 * after all of a scenario's steps have executed (so every screenshot was still captured and compared,
 * and the report reflects the mismatch), reads the per-scenario record from
 * {@link VisualStepOutcomeTracker}, and throws when any step was visually unmatched. Cucumber then
 * marks the scenario failed while still running the suite's other {@code @After} hooks (e.g. driver
 * teardown), because it aggregates hook results rather than aborting on the first throw.</p>
 *
 * <p><strong>Activation:</strong> this class must be on Cucumber's glue path. The visual package is
 * added to {@code gluePaths} for that purpose; without the flag it is inert (it returns immediately),
 * so it is safe to leave on the glue path at all times.</p>
 *
 * @author Visual Regression Subsystem
 */
public class VisualRegressionScenarioHook {

	/**
	 * Fails the scenario if visual gating is enabled and at least one step did not match its baseline.
	 * The {@code order} is low so this runs after higher-order cleanup hooks have had their turn.
	 *
	 * @param scenario the finishing scenario (used only for a clearer log line)
	 */
	@After(order = 0)
	public void failScenarioIfVisualMismatch(Scenario scenario) {
		VisualRegressionConfig config = VisualRegressionConfig.getInstance();
		if (!config.isEnabled() || !config.isCompareEachStep() || !config.isFailScenarioOnUnmatch()) {
			return;
		}

		List<String> unmatched = VisualStepOutcomeTracker.getUnmatchedSteps();
		if (unmatched.isEmpty()) {
			return;
		}

		throw new AssertionError("Visual regression: " + unmatched.size()
				+ " step(s) did not match the baseline in scenario \"" + scenario.getName() + "\" -> "
				+ String.join("; ", unmatched)
				+ ". (Disable with VisualRegression.FailScenarioOnUnmatch=false.)");
	}
}
