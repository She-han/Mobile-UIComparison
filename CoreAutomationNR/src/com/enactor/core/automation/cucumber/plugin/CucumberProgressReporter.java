package com.enactor.core.automation.cucumber.plugin;

import java.io.OutputStream;
import java.io.PrintStream;

import io.cucumber.plugin.ConcurrentEventListener;
import io.cucumber.plugin.event.Argument;
import io.cucumber.plugin.event.EventPublisher;
import io.cucumber.plugin.event.PickleStepTestStep;
import io.cucumber.plugin.event.Result;
import io.cucumber.plugin.event.StepDefinedEvent;
import io.cucumber.plugin.event.StepDefinition;
import io.cucumber.plugin.event.TestCaseStarted;
import io.cucumber.plugin.event.TestSourceRead;
import io.cucumber.plugin.event.TestStep;
import io.cucumber.plugin.event.TestStepFinished;
import io.cucumber.plugin.event.TestStepStarted;

/**
 * 
 * @author leesmith
 * @author gayan
 *
 */
public class CucumberProgressReporter extends AbstractCucumberReporter implements ConcurrentEventListener {
	// The place we write messages to
	private PrintStream out;

	public CucumberProgressReporter(OutputStream outputstream) {
		this.out = new PrintStream(outputstream);
	}

	@Override
	public void setEventPublisher(EventPublisher publisher) {
		publisher.registerHandlerFor(TestSourceRead.class, this::handleTestSourceRead);
		publisher.registerHandlerFor(TestCaseStarted.class, this::handleTestCaseStarted);
		publisher.registerHandlerFor(TestStepStarted.class, this::handleTestStepStarted);
		publisher.registerHandlerFor(StepDefinedEvent.class, this::handleStepDefined);
		publisher.registerHandlerFor(TestStepFinished.class, this::handleTestStepFinished);

	}

	// Output just before the feature is started
	@Override
	public void handleTestSourceRead(TestSourceRead sourceReadEvent) {

		out.println("CUCUMBER: Running Feature: " + super.getFeatureName(sourceReadEvent));
	}

	// Output just before the scenario is started
	@Override
	public void handleTestCaseStarted(TestCaseStarted testCaseStartedEvent) {
		String scenarioName = testCaseStartedEvent.getTestCase().getName();
		out.println("CUCUMBER: \tStarting Scenario: " + scenarioName);
	}

	// Output as cucumber is parsing the steps for a test (all steps are
	// parsed before any are run)
	@Override
	public void handleTestStepStarted(TestStepStarted testStepStartedEvent) {
		TestStep step = testStepStartedEvent.getTestStep();
		if (step instanceof PickleStepTestStep) {
			PickleStepTestStep testStep = (PickleStepTestStep) step;
			out.println("CUCUMBER: \t" + testStep.getStep().getKeyword() + " : " + testStep.getId());
			out.println("CUCUMBER:\t\tRunning step: " + testStep.getCodeLocation());

			if (!testStep.getDefinitionArgument().isEmpty()) {
				String argumentList = "";
				for (Argument argument : testStep.getDefinitionArgument()) {
					if (argument.getValue() != null) {
						argumentList += argument.getValue();
					}
				}
				out.println("CUCUMBER:\t\t\tArgument: " + argumentList);

			}
		}

	}

	@Override
	// Output once cucumber has identified what method to invoke, just before
	// invoking
	protected void handleStepDefined(StepDefinedEvent event) {
		StepDefinition stepDefinition = event.getStepDefinition();
		out.println("CUCUMBER:\t\tMatched step: " + stepDefinition.getLocation());
	}

	// Output after the method has been invoked
	@Override
	public void handleTestStepFinished(TestStepFinished testStepFinishedEvent) {
		Result result = testStepFinishedEvent.getResult();
		out.println("CUCUMBER:\t\t\tResult: " + result.getStatus());
	}

}
