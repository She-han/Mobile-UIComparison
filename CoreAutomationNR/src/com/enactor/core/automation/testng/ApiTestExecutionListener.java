package com.enactor.core.automation.testng;

import org.testng.IExecutionListener;

import com.enactor.core.automation.cucumber.plugin.CSVReporter;
import com.enactor.core.automation.cucumber.plugin.PTReporter;
import com.enactor.core.utilities.Logger;

public class ApiTestExecutionListener implements IExecutionListener {
	
	private static Logger logger = Logger.getLogger(WebTestExecutionListener.class);

    /*(non-Javadoc)
     */
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

	}

}
