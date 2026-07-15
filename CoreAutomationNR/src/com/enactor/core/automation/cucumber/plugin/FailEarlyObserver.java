package com.enactor.core.automation.cucumber.plugin;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.utilities.Logger;

import io.cucumber.plugin.ConcurrentEventListener;
import io.cucumber.plugin.event.EventPublisher;
import io.cucumber.plugin.event.Status;
import io.cucumber.plugin.event.StepDefinedEvent;
import io.cucumber.plugin.event.TestCase;
import io.cucumber.plugin.event.TestCaseFinished;
import io.cucumber.plugin.event.TestCaseStarted;
import io.cucumber.plugin.event.TestStepFinished;
import io.cucumber.plugin.event.TestStepStarted;

/**
 * 
 * @author gayan.kavirathne
 *
 */
public class FailEarlyObserver extends AbstractCucumberReporter implements ConcurrentEventListener  {
	
	private static String PRED_TAG_PREFIX = "@PRED-";
	
	private static Map<String,Status> scenarioStatuses = new LinkedHashMap<>();
	private static Logger logger = Logger.getLogger(FailEarlyObserver.class);

	@Override
	public void setEventPublisher(EventPublisher publisher) {
		publisher.registerHandlerFor(TestCaseStarted.class, this::handleTestCaseStarted);
		publisher.registerHandlerFor(TestCaseFinished.class, this::handleCaseFinished);

	}
	
	/**
	 * When starting the test case check if the predecessors have failed or not
	 */
	@Override
	protected void handleTestCaseStarted(TestCaseStarted event) throws AutomationException{
		TestCase testCase = event.getTestCase();
		List<String> predecessors = this.getPredecessors(testCase);
		predecessors.forEach(this::shouldFailEarly);
	}
	
	/**
	 * In the end of the scenario update the status of the test case
	 */
	@Override
	protected void handleCaseFinished(TestCaseFinished event) {
		
		TestCase testCase = event.getTestCase();
		testCase.getTags().forEach( tag -> {
			scenarioStatuses.put(tag, event.getResult().getStatus());
		});
	}
	
    /**
     * Get all the predecessor tags for the given scenario
     *
     * @param testCase Cucumber Scenario
     */
	private List<String> getPredecessors(TestCase testCase) {
		ArrayList<String> predecessors = new ArrayList<String>();
		testCase.getTags().forEach(tag -> {
			if (tag.startsWith(PRED_TAG_PREFIX)) {
				predecessors.add("@" + tag.substring(PRED_TAG_PREFIX.length()));
			}
		});
		return predecessors;
	}
	
    /**
     * Check if the predecessor scenarios have been failed. Current scenario will
     * fail either the predecessor has failed or hasn't executed.
     *
     * @param predecessor Predecessor Tag
     */
	public void shouldFailEarly(String predecessor) throws AutomationException {

		Status predecessorStatus = scenarioStatuses.get(predecessor);
		if (predecessorStatus == null) {
			throw new AutomationException(
					String.format("Predecessor with tag ID %s has not executed yet", predecessor));

		} else if (!predecessorStatus.isOk()) {
			logger.log(Logger.LOG_INFORMATION, String.format("Predecessor with tag ID %s has failed", predecessor));
			throw new AutomationException(String.format("Predecessor with tag ID %s has been skipped due to previous failures", predecessor));
		}
	}

}
