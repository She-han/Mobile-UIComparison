package com.enactor.core.automation.cucumber.plugin;

import io.cucumber.plugin.Plugin;
import io.cucumber.plugin.event.EmbedEvent;
import io.cucumber.plugin.event.EventPublisher;
import io.cucumber.plugin.event.SnippetsSuggestedEvent;
import io.cucumber.plugin.event.StepDefinedEvent;
import io.cucumber.plugin.event.TestCase;
import io.cucumber.plugin.event.TestCaseFinished;
import io.cucumber.plugin.event.TestCaseStarted;
import io.cucumber.plugin.event.TestRunFinished;
import io.cucumber.plugin.event.TestRunStarted;
import io.cucumber.plugin.event.TestSourceParsed;
import io.cucumber.plugin.event.TestSourceRead;
import io.cucumber.plugin.event.TestStepFinished;
import io.cucumber.plugin.event.TestStepStarted;
import io.cucumber.plugin.event.WriteEvent;

public abstract class AbstractCucumberReporter implements Plugin {
	
	protected static final String REPORT_PATH_PROPERTY = "cucumber.report.dir";
	

	public void setEventPublisher(EventPublisher publisher) {

		publisher.registerHandlerFor(TestSourceRead.class, this::handleTestSourceRead);
		publisher.registerHandlerFor(TestSourceParsed.class, this::handleTestSourceParsed);
		
		publisher.registerHandlerFor(TestRunStarted.class, this::handleTestRunStarted);
		
		publisher.registerHandlerFor(TestCase.class, this::handleTestCase);
		publisher.registerHandlerFor(TestCaseStarted.class, this::handleTestCaseStarted);
		publisher.registerHandlerFor(TestStepStarted.class, this::handleTestStepStarted);
		publisher.registerHandlerFor(SnippetsSuggestedEvent.class, this::handleNoStepDefinition);
		publisher.registerHandlerFor(StepDefinedEvent.class, this::handleStepDefined);
		publisher.registerHandlerFor(TestStepFinished.class, this::handleTestStepFinished);
		publisher.registerHandlerFor(WriteEvent.class, this::handleWrite);
		publisher.registerHandlerFor(EmbedEvent.class, this::handleEmbed);
		publisher.registerHandlerFor(TestCaseFinished.class, this::handleCaseFinished);

		publisher.registerHandlerFor(TestRunFinished.class, this::handleTestRunFinished);

	}

	protected void handleTestStepStarted(TestStepStarted event) {}

	protected void handleTestRunStarted(TestRunStarted event) {}

	protected void handleCaseFinished(TestCaseFinished event) {}

	protected void handleTestSourceParsed(TestSourceParsed event) {}

	protected void handleTestCase(TestCase event) {}

	protected void handleStepDefined(StepDefinedEvent event) {}

	protected void handleTestRunFinished(TestRunFinished event) {}

	protected void handleEmbed(EmbedEvent event) {}

	protected void handleWrite(WriteEvent event) {}

	protected void handleTestStepFinished(TestStepFinished event) {}

	protected void handleTestSourceRead(TestSourceRead event) {}

	protected void handleTestCaseStarted(TestCaseStarted event) {}
	
	protected void handleNoStepDefinition(SnippetsSuggestedEvent event) {}

	protected static String getFeatureName(TestSourceRead sourceReadEvent) {
		String featureUri = sourceReadEvent.getUri().toString();
		String[] featureUriParts = featureUri.split(".*/");
		if (featureUriParts.length < 2) {
			return null;
		}
		String featureName = featureUriParts[1];

		return featureName;
	}

}
