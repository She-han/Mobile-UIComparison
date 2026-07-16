package com.enactor.pos.mobile.visual;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Thread-scoped record of which steps in the <em>current scenario</em> were visually unmatched.
 *
 * <p>It is the bridge between two collaborators that Cucumber keeps separate: the
 * {@link VisualRegressionScreenshotPlugin} (a read-only {@code ConcurrentEventListener}, which can
 * observe comparisons but cannot fail a scenario) and {@link VisualRegressionScenarioHook} (an
 * {@code @After} hook, which <em>can</em> fail a scenario by throwing). The plugin records mismatches
 * here as they happen; the hook reads them at scenario end.</p>
 *
 * <p>State is held per thread because Cucumber runs a scenario's steps and its hooks on the same
 * thread, and this keeps the design correct under parallel scenario execution.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class VisualStepOutcomeTracker {

	private static final ThreadLocal<List<String>> UNMATCHED_STEPS =
			ThreadLocal.withInitial(ArrayList::new);

	private VisualStepOutcomeTracker() {
		// Utility holder - not instantiable.
	}

	/** Clears the record at the start of a scenario. */
	public static void reset() {
		UNMATCHED_STEPS.get().clear();
	}

	/**
	 * Records that a step was visually unmatched.
	 *
	 * @param stepLabel human-readable step identifier (for the failure message)
	 */
	public static void recordUnmatched(String stepLabel) {
		UNMATCHED_STEPS.get().add(stepLabel);
	}

	/** @return an immutable snapshot of the unmatched-step labels for the current scenario. */
	public static List<String> getUnmatchedSteps() {
		return Collections.unmodifiableList(new ArrayList<>(UNMATCHED_STEPS.get()));
	}

	/** @return {@code true} if the current scenario has at least one visually unmatched step. */
	public static boolean hasUnmatched() {
		return !UNMATCHED_STEPS.get().isEmpty();
	}

	/** Detaches the record from the current thread once the scenario is fully done. */
	public static void clear() {
		UNMATCHED_STEPS.remove();
	}
}
