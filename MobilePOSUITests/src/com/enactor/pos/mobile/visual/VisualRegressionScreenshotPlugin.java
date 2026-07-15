package com.enactor.pos.mobile.visual;

import org.openqa.selenium.WebDriver;

import io.cucumber.plugin.ConcurrentEventListener;
import io.cucumber.plugin.event.EventPublisher;
import io.cucumber.plugin.event.PickleStepTestStep;
import io.cucumber.plugin.event.Status;
import io.cucumber.plugin.event.TestCaseFinished;
import io.cucumber.plugin.event.TestCaseStarted;
import io.cucumber.plugin.event.TestStep;
import io.cucumber.plugin.event.TestStepFinished;

/**
 * Cucumber plugin that captures a screenshot of the application under test after <em>every</em>
 * Gherkin step and, at the end of each scenario, records the functional pass/fail marker.
 *
 * <p>The plugin follows the same integration model as the framework's existing
 * {@code CucumberScreenshotEmitter}: it is a {@link ConcurrentEventListener} that subscribes to the
 * Cucumber event bus and therefore requires no changes to step definitions or the test runner. It is
 * activated purely through configuration (see the {@code plugin} option), keeping the existing
 * architecture untouched.</p>
 *
 * <p>Responsibilities are intentionally thin here - the plugin only translates Cucumber lifecycle
 * events into calls on {@link StepScreenshotCapturer}. It reads the live Appium session from
 * {@link VisualRegressionDriverRegistry}, so it stays fully decoupled from the controllers and step
 * providers that own the driver. All per-scenario state is held in {@link ThreadLocal}s so the plugin
 * remains correct if the suite is ever run with parallel scenarios.</p>
 *
 * <p>Only real Gherkin steps ({@link PickleStepTestStep}) are captured; Cucumber's own
 * before/after hook steps are ignored.</p>
 *
 * @author Visual Regression Subsystem
 */
public class VisualRegressionScreenshotPlugin implements ConcurrentEventListener {

	private final VisualRegressionConfig config;
	private final StepScreenshotCapturer capturer;

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
	}

	@Override
	public void setEventPublisher(EventPublisher publisher) {
		publisher.registerHandlerFor(TestCaseStarted.class, this::onTestCaseStarted);
		publisher.registerHandlerFor(TestStepFinished.class, this::onTestStepFinished);
		publisher.registerHandlerFor(TestCaseFinished.class, this::onTestCaseFinished);
	}

	private void onTestCaseStarted(TestCaseStarted event) {
		currentScenario.set(event.getTestCase().getName());
		stepCounter.set(0);
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

		WebDriver driver = VisualRegressionDriverRegistry.getActiveDriver();
		if (driver == null) {
			// The application may not have been launched yet on the very first steps.
			return;
		}

		int index = stepCounter.get() + 1;
		stepCounter.set(index);

		PickleStepTestStep pickleStep = (PickleStepTestStep) testStep;
		String label = buildStepLabel(pickleStep);
		capturer.capture(driver, currentScenario.get(), index, label);
	}

	private void onTestCaseFinished(TestCaseFinished event) {
		try {
			if (!config.isEnabled()) {
				return;
			}
			boolean passed = Status.PASSED.equals(event.getResult().getStatus());
			capturer.writeScenarioStatus(currentScenario.get(), passed);
		} finally {
			currentScenario.remove();
			stepCounter.remove();
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
