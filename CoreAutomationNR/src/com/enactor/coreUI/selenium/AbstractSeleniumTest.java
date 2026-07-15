package com.enactor.coreUI.selenium;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.testng.ITestResult;
import org.testng.Reporter;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Listeners;

import com.enactor.core.utilities.StringUtils;

import junit.framework.TestCase;

/**
 * Selenium unit tests base class.
 *
 * @author David Hall
 */
@Listeners({TestNGSeleniumScreenshotListener.class})
public abstract class AbstractSeleniumTest extends TestCase {
	
	/** The web driver to use. */
	private WebDriver webDriver;
	
	/**
	 * JUnit compatibility.
	 * 
	 * {@inheritDoc}
	 */
	@Override
	public void setUp() {
		setUp(null);
	}	
	
	/**
	 * {@inheritDoc}
	 */
	@BeforeMethod(alwaysRun = true)
	public void setUp(Method met) {
		try {
			String url = SeleniumConfig.getInstance().getPageUrl();
			webDriver = WebDriverPool.getInstance().getWebDriver();

			debug(getMethodSignature(met)
					+ ": Start Selenium test on '" + url
					+ "' using driver '" + webDriver.getClass().getSimpleName() + "'");
			
			// Load URL
			webDriver.get(url);
			
			assertTrue("Page '" + url + "' has not loaded successfully.", pageHasLoaded());
			
		} catch (Exception ex) {
			ex.printStackTrace();
			fail(ex.getMessage());
		}
	}
	
	/**
	 * JUnit compatibility.
	 * 
	 * {@inheritDoc}
	 */
	@Override
	public void tearDown() {
		tearDown(null, null);
	}
	
	/**
	 * Performs tear-down actions.
	 *
	 * @param testResult	The test result.
	 */
	@AfterMethod(alwaysRun = true)
	public void tearDown(ITestResult testResult, Method met) {
		try {
			if (null != testResult && testResult.getStatus() == ITestResult.FAILURE) {
				takeScreenshot(getMethodName(met));
				error(getMethodSignature(met) + ": End Test - FAIL");
				
				if (SeleniumConfig.getInstance().getCloseBrowserOnError()) {
					quitBrowser();
				}
			} else if (null == testResult) {
				debug(getMethodSignature(met) + ": End Test");
				takeScreenshot(getMethodName(met));	// Take screenshot in all Junit tests as we can never tell if they failed or not
				quitBrowser();
			} else {
				debug(getMethodSignature(met) + ": End Test - SUCCESS");
				quitBrowser();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			fail(ex.getMessage());
		}
	}
	

	/**
	 * Reloads the page.
	 */
	public void reloadPage() {
		webDriver.get(SeleniumConfig.getInstance().getPageUrl());
	}
	
	/**
	 * Returns the web driver in use.
	 *
	 * @return	The web driver.
	 */
	public WebDriver getWebDriver() {
		return webDriver;
	}
	
	/**
	 * Checks for a missing or blank page title to check that the web application
	 * has started and is servicing requests properly.
	 * 
	 * This tests that a page has loaded correctly. Note we are not yet checking that it is
	 * the correct page, that is done in the constructor of the SeleniumPage subclass.
	 *
	 * @return
	 */
	public boolean pageHasLoaded() {
		if (!SeleniumConfig.getInstance().getPageTitleRequired()) {
			return true;
		}
		return StringUtils.notEmpty(webDriver.getTitle());
	}
		
	/**
	 * Returns whether or not an element is visible on the page.
	 *
	 * @param element
	 * @return
	 */
	public boolean isElementVisible(By element) {
		try {
			return webDriver.findElement(element).isDisplayed();
		} catch (NoSuchElementException ex) {
			return false;
		}
	}
	
	/**
	 * Reads and returns the value of the specified cookie.
	 *
	 * @param name
	 * @return
	 */
	public String getCookieValue(String name) {
		Cookie cookie = webDriver.manage().getCookieNamed(name);
		return cookie.getValue();
	}
	
	/**
	 * Adds a cookie with the specified value.
	 *
	 * @param name
	 * @param value
	 */
	public void addCookie(String name, String value) {
		Cookie cookie = new Cookie(name, value);
		webDriver.manage().addCookie(cookie);
	}
	
	/**
	 * Takes a screenshot and saves to the screenshots directory.
	 *
	 * @return The screenshot path
	 * @throws IOException 	If the screenshot could not be copied to the screenshots directory.
	 */
	public String takeScreenshot(String methodName) throws IOException {
		if (null != webDriver) {
			// Get screenshot
			File source = ((TakesScreenshot) webDriver).getScreenshotAs(OutputType.FILE);
			
			// Get destination directory
			File destination = new File(SeleniumConfig.getInstance().getScreenshotsDirectory());
			String fileName = "screenshot-" + this.getClass().getSimpleName() + "-" + methodName + ".png";
			
			// Rename the screenshot
			File destinationFile = new File(destination.getAbsolutePath() + "/" + fileName);

			// Copy file
			FileUtils.copyFile(source, destinationFile);
			return SeleniumConfig.getInstance().getScreenshotsDirectory() + "/" + fileName;
		}
		
		return null;
	}
	
	/**
	 * Utility method to return method signature for logging in null-safe manner.
	 * 
	 * @param met
	 * @return
	 */
	private String getMethodSignature(Method met) {
		return this.getClass().getSimpleName() + "." + getMethodName(met);
	}
	
	/**
	 * Utility method to return method name in null-safe manner.
	 *
	 * @param met
	 * @return
	 */
	private String getMethodName(Method met) {
		if (null != met) {
			return met.getName();
		} else if (null != getName()) {
			return getName();
		}
		return "";
	}
	
	/**
	 * Quits the browser if it is running.
	 */
	private void quitBrowser() {
		if (null != webDriver) {
			webDriver.quit();
		}
	}
	
	/**
	 * Prints debug text.
	 *
	 * @param debugText
	 */
	private void debug(String debugText) {
		Reporter.log(debugText + "<br/>", false);
	}	
	
	/**
	 * Prints error text.
	 *
	 * @param errorText
	 */
	private void error(String errorText) {
		Reporter.log(errorText + "<br/>", false);
	}
}
