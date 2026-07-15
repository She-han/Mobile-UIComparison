package com.enactor.web.stepDefinitions;


import com.enactor.core.automation.cucumber.conetxt.ScenarioContext;
import com.enactor.maintenance.BaseWebSteps;

import io.cucumber.java.After;
import io.cucumber.java.Scenario;

/**
 * Cucumber-JVM API provides following Hooks
 * Before, After, BeforeStep, AfterStep, BeforeAll, AfterAll, AfterConfiguration
 * For more info see: https://cucumber.io/docs/cucumber/api/#hooks
 * 
 * @author Gayan Kavirathne
 *
 */
public class CucumberHookSteps extends BaseWebSteps{


	public CucumberHookSteps(ScenarioContext scenarioContext) {
		super(scenarioContext);
	}

	/**
	 * Make sure to logout from web maintenance after every scenario
	 *
	 * @throws Throwable
	 */
	@After()
	public void cleanUp(Scenario scenario) throws Throwable {
		try {
			if (scenario.getStatus().equals("failed")) {
				String screenshotName = scenario.getName();
				captureScreenshot(screenshotName);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			getController().quit();
		}
	}
}
