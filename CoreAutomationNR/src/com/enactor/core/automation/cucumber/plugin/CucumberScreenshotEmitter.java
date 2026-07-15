package com.enactor.core.automation.cucumber.plugin;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;

import com.enactor.core.automation.AUT.AUTWebTestManager;
import com.enactor.core.automation.AUT.IAUTWebController;
import com.enactor.core.utilities.StringUtils;
import com.enactor.coreUI.selenium.SeleniumConfig;

import io.cucumber.plugin.ConcurrentEventListener;
import io.cucumber.plugin.event.EventPublisher;
import io.cucumber.plugin.event.Result;
import io.cucumber.plugin.event.Status;
import io.cucumber.plugin.event.TestCaseStarted;
import io.cucumber.plugin.event.TestSourceRead;
import io.cucumber.plugin.event.TestStepFinished;



public class CucumberScreenshotEmitter extends AbstractCucumberReporter  implements ConcurrentEventListener{
	/** Date formatter */
	private static final SimpleDateFormat TIMESTAMP = new SimpleDateFormat("yyyyMMdd_hhmmss");
	
	// The place we write screenshots to
	private String screenshotDirectory;
	
	private String currentFeature;
	private String currentScenario;
	
	public CucumberScreenshotEmitter() {
		screenshotDirectory = SeleniumConfig.getInstance().getScreenshotsDirectory();
	}
	
	@Override
	public void setEventPublisher(EventPublisher publisher) {
		publisher.registerHandlerFor(TestSourceRead.class, this::handleTestSourceRead);
		publisher.registerHandlerFor(TestCaseStarted.class, this::handleTestCaseStarted);
		publisher.registerHandlerFor(TestStepFinished.class, this::handleTestStepFinished);
	}
	
	// Output just before the feature is started
	@Override
	public void handleTestSourceRead(TestSourceRead sourceReadEvent) {
    	currentFeature = super.getFeatureName(sourceReadEvent);
	}

	// Output just before the scenario is started
	@Override
	public void handleTestCaseStarted(TestCaseStarted testCaseStartedEvent) {
		currentScenario = testCaseStartedEvent.getTestCase().getName();
	}
	
	// Output after the method has been invoked
	@Override
	public void handleTestStepFinished(TestStepFinished testStepFinishedEvent) {
		Result result = testStepFinishedEvent.getResult();
		
		if (!Status.PASSED.equals(result.getStatus())) {
			String message = "Test did not pass (" + result.getStatus() + "): " + currentFeature + " - " + currentScenario;
			if (StringUtils.notEmpty(screenshotDirectory) && result.getError() != null) {
				try {
					String screenshotName = currentFeature + "_" + currentScenario + "_" + TIMESTAMP.format(new Date()) + ".png";
					File file = getController().captureScreenshot();
	
					// Get destination directory
					File destinationDir = new File(screenshotDirectory);
	
					// Rename the screenshot
					File destinationFile = new File(destinationDir.getAbsolutePath() + File.separator + screenshotName);
	
					// Copy file
					FileUtils.copyFile(file, destinationFile);
	
					String screenshotLink = String.format("<a href='%s' target='_blank'>%s</a>", screenshotDirectory + "/" + screenshotName,
							screenshotName);
					message += " - " + screenshotLink;
				} catch (Exception ex) {
					// Just log exceptions caught here. Don't re-throw them otherwise
					// we'll loose the original test failure cause.
	
					ex.printStackTrace();
				}
			}
		
			System.err.println(message);
		}
	}
	
	/**
	 * Returns the AUT web controller.
	 * 
	 * @return
	 */
	private IAUTWebController getController() {
		return AUTWebTestManager.getInstance().getController();
	}
	
}
