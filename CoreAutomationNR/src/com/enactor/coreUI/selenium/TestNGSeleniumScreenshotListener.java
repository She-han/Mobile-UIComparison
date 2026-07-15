package com.enactor.coreUI.selenium;

import java.io.IOException;

import org.testng.Reporter;
import org.testng.TestListenerAdapter;

/**
 * TestNG listener that allows Selenium screenshots to be saved to the TestNG
 * report.
 *
 * @author David Hall
 */
public class TestNGSeleniumScreenshotListener extends TestListenerAdapter {

	@Override
	public void onTestFailure(org.testng.ITestResult tr) {
		Object currentClass = tr.getInstance();

		if (currentClass instanceof AbstractSeleniumTest) {

			AbstractSeleniumTest testClass = (AbstractSeleniumTest) currentClass;

			if (null != testClass) {
				try {
					String screenshotPath = testClass.takeScreenshot(tr.getMethod().getMethodName());
					if (null != screenshotPath) {
						String screenShotWebPath = SeleniumConfig.getInstance().getScreenshotsWebDirectory() + "/"
								+ screenshotPath;
						Reporter.log("Screenshot of error:<br/>");
						Reporter.log("<img src=\"" + screenShotWebPath + "\" alt=\"" + tr.getMethod().getMethodName()
								+ "\"/><br/>");
						Reporter.log(
								"<a href=\"" + screenShotWebPath + "\" target=\"_blank\">" + screenshotPath + "</a>");
					} else {
						Reporter.log("Screenshot could not be generated - null screenshot path.<br/>");
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		} else {
			Reporter.log("Screenshot could not be generated - not instance of AbstractSeleniumTest.<br/>");
		}
	}

}
