package com.enactor.pos.mobile.visual;

import java.io.File;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.openqa.selenium.WebDriver;

import io.cucumber.plugin.ConcurrentEventListener;
import io.cucumber.plugin.event.EventPublisher;
import io.cucumber.plugin.event.PickleStepTestStep;
import io.cucumber.plugin.event.Status;
import io.cucumber.plugin.event.TestCaseFinished;
import io.cucumber.plugin.event.TestCaseStarted;
import io.cucumber.plugin.event.TestRunFinished;
import io.cucumber.plugin.event.TestStep;
import io.cucumber.plugin.event.TestStepFinished;

/**
 * Cucumber plugin that captures a screenshot of the application under test after <em>every</em>
 * Gherkin step and, when enabled, immediately compares that screenshot against its baseline via the
 * DINOv2 server — so both capture <em>and</em> comparison happen inline, during the run.
 *
 * <p>The plugin follows the same integration model as the framework's existing
 * {@code CucumberScreenshotEmitter}: it is a {@link ConcurrentEventListener} that subscribes to the
 * Cucumber event bus and therefore requires no changes to step definitions or the test runner. It is
 * activated purely through configuration (see the {@code plugin} option).</p>
 *
 * <p>Per step it: (1) captures the screenshot via {@link StepScreenshotCapturer}; (2) if
 * {@link VisualRegressionConfig#isCompareEachStep()} is on and a baseline directory exists, compares
 * the fresh image against the matching baseline through the shared {@link VisualComparisonService},
 * accumulating one {@link StateComparison} per step. The running report is (re)written after every
 * scenario and once more at the end of the run, using the shared {@link VisualReportWriter}.</p>
 *
 * <p>Only real Gherkin steps ({@link PickleStepTestStep}) are captured; Cucumber's own before/after
 * hook steps are ignored. All work is fully guarded — a capture or comparison problem is logged but
 * never affects the functional test outcome.</p>
 *
 * @author Visual Regression Subsystem
 */
public class VisualRegressionScreenshotPlugin implements ConcurrentEventListener {

	private final VisualRegressionConfig config;
	private final StepScreenshotCapturer capturer;

	/** Sanitises the feature-path + scenario key once so every downstream folder/lookup agrees. */
	private final VisualStateNamingStrategy namingStrategy = new VisualStateNamingStrategy();

	/** Lazily created only when inline comparison is enabled and a baseline exists. */
	private final VisualComparisonService comparisonService;
	private final VisualReportWriter reportWriter;
	private final boolean inlineComparisonActive;

	/** Accumulated comparison rows for the whole run (thread-safe for parallel scenarios). */
	private final List<StateComparison> results = Collections.synchronizedList(new ArrayList<>());

	/** Current scenario name, per executing thread. */
	private final ThreadLocal<String> currentScenario = new ThreadLocal<>();

	/** 1-based step counter for the current scenario, per executing thread. */
	private final ThreadLocal<Integer> stepCounter = ThreadLocal.withInitial(() -> 0);

	/** No-arg constructor required for Cucumber plugin instantiation. */
	public VisualRegressionScreenshotPlugin() {
		this(VisualRegressionConfig.getInstance(), new StepScreenshotCapturer());
	}

	/** Constructor for explicit dependency injection (used by tests). */
	public VisualRegressionScreenshotPlugin(VisualRegressionConfig config, StepScreenshotCapturer capturer) {
		this.config = config;
		this.capturer = capturer;

		// Inline comparison is active only when requested AND a baseline set is available. For a local
		// BaselineDir that means the folder exists (so the very first, baseline-establishing run simply
		// captures); for a remote source (HTTP/Artifactory/SVN) we always attempt and report per-state.
		boolean baselineAvailable = BaselineProviders.isRemote(config.getBaselineDir())
				|| new File(config.getBaselineDir()).isDirectory();
		this.inlineComparisonActive = config.isEnabled() && config.isCompareEachStep() && baselineAvailable;
		this.comparisonService = inlineComparisonActive ? new VisualComparisonService(config) : null;
		this.reportWriter = inlineComparisonActive ? new VisualReportWriter(config) : null;
	}

	@Override
	public void setEventPublisher(EventPublisher publisher) {
		publisher.registerHandlerFor(TestCaseStarted.class, this::onTestCaseStarted);
		publisher.registerHandlerFor(TestStepFinished.class, this::onTestStepFinished);
		publisher.registerHandlerFor(TestCaseFinished.class, this::onTestCaseFinished);
		publisher.registerHandlerFor(TestRunFinished.class, this::onTestRunFinished);
	}

	private void onTestCaseStarted(TestCaseStarted event) {
		// The capture folder mirrors the feature file's own path (derived from the running test case) with
		// the scenario name as the leaf, e.g. feature/retail/pos/.../GiftCard.feature/View_Gift_Card_history.
		// Nesting under the feature path keeps captures traceable to their source and keeps scenarios that
		// share a feature file in separate folders.
		String featurePath = featureRelativePath(event.getTestCase().getUri());
		String scenarioName = event.getTestCase().getName();
		// Sanitise the full nested key up front so the capture folder, baseline lookup, diff folder and
		// status markers all resolve to the exact same path.
		String scenarioKey = namingStrategy.scenarioFolderPath(featurePath + "/" + scenarioName);
		currentScenario.set(scenarioKey);
		stepCounter.set(0);
		// Wipe this scenario's previously captured images/metadata so the run starts clean and the folder
		// only ever holds the current run's screenshots (re-captured step by step below).
		if (config.isEnabled()) {
			capturer.resetScenario(scenarioKey);
		}
		// Start each scenario with a clean visual-outcome record for the scenario-gating hook.
		VisualStepOutcomeTracker.reset();
	}

	private void onTestStepFinished(TestStepFinished event) {
		if (!config.isEnabled()) {
			return;
		}
		TestStep testStep = event.getTestStep();
		if (!(testStep instanceof PickleStepTestStep)) {
			// Skip Cucumber before/after hook steps - only capture true Gherkin steps.
			return;
		}
		if (Status.SKIPPED.equals(event.getResult().getStatus())) {
			// Steps skipped because an earlier step failed (e.g. fail-fast gating) never ran - there is
			// nothing new on screen to capture, and capturing would add misleading rows to the report.
			return;
		}

		WebDriver driver = VisualRegressionDriverRegistry.getActiveDriver();
		if (driver == null) {
			// The application may not have been launched yet on the very first steps.
			return;
		}

		int index = stepCounter.get() + 1;
		stepCounter.set(index);

		PickleStepTestStep pickleStep = (PickleStepTestStep) testStep;
		String label = buildStepLabel(pickleStep);

		// 1) Capture the screenshot for this step.
		File actualPng = capturer.capture(driver, currentScenario.get(), index, label);

		// 2) Inline comparison against the baseline (guarded, best-effort).
		if (actualPng != null && inlineComparisonActive) {
			StateComparison comparison = compareStepAgainstBaseline(currentScenario.get(), actualPng);
			// 3) Record genuine mismatches so the @After hook can fail the scenario if configured.
			if (comparison != null && comparison.isVisualMismatch()) {
				VisualStepOutcomeTracker.recordUnmatched(label);
			}
		}
	}

	private void onTestCaseFinished(TestCaseFinished event) {
		try {
			if (!config.isEnabled()) {
				return;
			}
			boolean passed = Status.PASSED.equals(event.getResult().getStatus());
			capturer.writeScenarioStatus(currentScenario.get(), passed);
			// Refresh the report after each scenario so partial results survive an interrupted run.
			flushReport();
		} finally {
			currentScenario.remove();
			stepCounter.remove();
			// The @After gating hook has already run (and read the tracker) by this point.
			VisualStepOutcomeTracker.clear();
		}
	}

	private void onTestRunFinished(TestRunFinished event) {
		flushReport();
	}

	/**
	 * Compares one freshly-captured step image against its baseline and records the result. The baseline
	 * lives at the same scenario-key/state path under the configured baseline directory, so the (possibly
	 * nested) key must be passed through rather than re-derived from the file's immediate parent folder.
	 *
	 * @param scenarioKey the nested scenario folder key (feature path + scenario name)
	 * @param actualPng   the freshly captured step image
	 * @return the comparison row that was recorded, or {@code null} if comparison could not run
	 */
	private StateComparison compareStepAgainstBaseline(String scenarioKey, File actualPng) {
		try {
			String stateFile = actualPng.getName();
			File diffRoot = new File(config.getReportDir(), "diffs");

			// The baseline is resolved inside the service via the configured BaselineProvider (local,
			// network share, HTTP/Artifactory, or SVN).
			StateComparison comparison =
					comparisonService.compareState(scenarioKey, stateFile, actualPng, diffRoot);
			results.add(comparison);
			return comparison;
		} catch (Exception e) {
			// Never let inline comparison disrupt the functional test.
			System.err.println("[VISUAL COMPARE] Inline comparison failed for '" + actualPng.getName()
					+ "': " + e.getMessage());
			return null;
		}
	}

	/**
	 * Derives a clean, portable relative feature path from a Cucumber test case URI so captures can be
	 * organised to mirror the feature file's own location. Handles {@code file:} URIs (absolute paths on
	 * disk, e.g. the unpacked {@code target/dependencyTests/...}) and {@code classpath:} URIs. Falls back
	 * to the bare file name if no {@code feature/} segment is present.
	 *
	 * <p>Example: {@code file:///D:/.../target/dependencyTests/feature/retail/pos/.../GiftCard.feature}
	 * &rarr; {@code feature/retail/pos/.../GiftCard.feature}.</p>
	 */
	private String featureRelativePath(URI uri) {
		if (uri == null) {
			return "feature";
		}
		String raw = uri.getPath();
		if (raw == null || raw.isEmpty()) {
			raw = uri.getSchemeSpecificPart();
		}
		if (raw == null || raw.isEmpty()) {
			raw = uri.toString();
		}
		raw = raw.replace('\\', '/');
		int idx = raw.indexOf("/feature/");
		if (idx >= 0) {
			return raw.substring(idx + 1);
		}
		if (raw.startsWith("feature/")) {
			return raw;
		}
		int slash = raw.lastIndexOf('/');
		String name = slash >= 0 ? raw.substring(slash + 1) : raw;
		return name.isEmpty() ? "feature" : name;
	}

	/** (Re)writes the HTML report from everything accumulated so far. Best-effort. */
	private void flushReport() {
		if (!inlineComparisonActive) {
			return;
		}
		try {
			List<StateComparison> snapshot;
			synchronized (results) {
				if (results.isEmpty()) {
					return;
				}
				snapshot = new ArrayList<>(results);
			}
			File reportDir = new File(config.getReportDir());
			reportDir.mkdirs();
			reportWriter.write(new File(reportDir, "Visual-Report.html"), snapshot);
		} catch (Exception e) {
			System.err.println("[VISUAL COMPARE] Failed to write inline report: " + e.getMessage());
		}
	}

	private String buildStepLabel(PickleStepTestStep pickleStep) {
		String keyword = safeTrim(pickleStep.getStep().getKeyword());
		String text = safeTrim(pickleStep.getStep().getText());
		String label = (keyword + " " + text).trim();
		return label.isEmpty() ? "step" : label;
	}

	private String safeTrim(String value) {
		return value == null ? "" : value.trim();
	}
}
