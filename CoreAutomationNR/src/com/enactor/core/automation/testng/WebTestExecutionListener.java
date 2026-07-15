package com.enactor.core.automation.testng;

import org.testng.IExecutionListener;

import com.enactor.core.automation.cucumber.plugin.CSVReporter;
import com.enactor.core.automation.cucumber.plugin.PTReporter;
import com.enactor.core.utilities.Logger;
import com.enactor.coreUI.selenium.WebDriverPool;

/**
 * @author gayan.kavirathne This test execution listener is used to listen for the
 * start and end of complete test suite Bind for Browser based tests via
 * testNG.xml or use @listener testng annotation in test runner class
 * 
 */
public class WebTestExecutionListener implements IExecutionListener {

	private static Logger logger = Logger.getLogger(WebTestExecutionListener.class);

	@Override
	public void onExecutionStart() {

	}

	@Override
	public void onExecutionFinish() {
		logger.log(Logger.LOG_INFORMATION, "TestNG Execution Completed");
		// Ideally we should call this only if the Plugin is activated. But since there
		// are many ways to activate the Plugin ( System Properties, Runner Class
		// Annotation, testNG suite XML, environment variables) it's difficult to
		// handle. If there is no csv files generated in the respective directory this
		// will return doing nothing.
		if (CSVReporter.concatCsvExports() && PTReporter.concatPTCsvExports()) {
			logger.log(Logger.LOG_INFORMATION, "Merged report files");
		}
		try {
			WebDriverPool.getInstance().destroyBrowserPool();
			logger.log(Logger.LOG_INFORMATION, "Browser Pool Destroyed");
		} catch (Exception e) {
			logger.log(Logger.LOG_ERROR, e.getMessage());
			e.printStackTrace();
		}

	}

}
