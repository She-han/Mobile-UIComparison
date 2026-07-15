package com.enactor.pos.mobile.web;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.controller.BaseWebController;
import com.enactor.pos.mobile.MobileControllerUtils;
import com.enactor.pos.mobile.capabilities.ThickMobileCapabilityType;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;

import io.appium.java_client.AppiumDriver;

/**
 * MobileThickReactController is an abstract class that handles interactions with a mobile
 * application using Appium.
 * It is designed to work with mobile web contexts and provides methods to initialize drivers.
 * 
 * @author Preminda.Bandara
 */
public abstract class MobileThickReactController<T extends AppiumDriver<WebElement>>
		extends BaseWebController<T>
		implements IAUTMobileWebController<T> {

	// Wait and timeout constants
	private static final long FLUENT_WAIT_POLLING_INTERVAL_SECONDS = 1L;
	private static final int CONTEXT_AVAILABILITY_CHECK_INTERVAL_MS = 1000;
	private static final int SCROLL_INTO_VIEW_STABILIZATION_DELAY_MS = 200;
	private static final int RETRY_DELAY_MS = 500;
	private static final int MILLISECONDS_PER_SECOND = 1000;
	
	// Retry constants
	private static final int MAX_JS_CLICK_RETRIES = 3;

	protected boolean started;
	protected static final int SHORT_WAIT_MS = 1000;
	protected static final int MEDIUM_WAIT_MS = 2000;
	protected static final int LONG_WAIT_MS = 3000;
	

	/**
	 * Initializes the controller by setting up the driver and adding necessary capabilities.
	 * Also initializes the wait functionality to interact with the mobile application.
	 */
	@Override
	public void init() {
		try {
			initialise();
			addDriverCapabilities();
			started = true;
			wait = new FluentWait<T>(driver)
					.withTimeout(MobilePosTestUtils.getWaitingTimeOut(), TimeUnit.SECONDS)
					.pollingEvery(FLUENT_WAIT_POLLING_INTERVAL_SECONDS, TimeUnit.SECONDS)
					.ignoring(Exception.class);
		} catch (MalformedURLException e) {
			throw new AutomationException("Failed to initialised the appium driver.", e);
		}
	}
	
	@Override
	public void clickElementWithJavascript(By locator) throws AutomationException {

		WebDriverWait wait = new WebDriverWait(driver, WAIT_TIMEOUT);
		WebElement element = null;
		try {
			element = wait.until(ExpectedConditions.elementToBeClickable(locator));
		} catch (TimeoutException e) {
			if (element == null) {
				element = findElementFluently(locator);
			}
		}
		executeJSClick(element);

	}
	
	/**
	 * Retrieves the inner text of an element identified by the specified locator.
	 * This method attempts to fetch the attribute multiple times to avoid issues like stale
	 * elements.
	 *
	 * @param locator The locator of the element whose inner text is to be retrieved.
	 * @return The inner text of the element.
	 * @throws AutomationException If reading the inner text fails after multiple attempts.
	 */
	public String getAttributeInElementWithInnerText(By locator) throws AutomationException {
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				JavascriptExecutor js = (JavascriptExecutor) driver;
				String text = (String) js.executeScript("return arguments[0].textContent;",
						driver.findElement(locator));
				return text.trim();
			} catch (StaleElementReferenceException e) {
				debug(String.format(
						"StaleElementReferenceException occurred while reading '%s' attribute in %s",
						"InnerText", locator.toString()));
			}
			attempts++;
		}
		throw new AutomationException(
				String.format("Reading the '%s' attribute failed in %s", "InnerText",
						locator.toString()));
	}
	
	/**
	 * Retrieves the inner HTML of an element identified by the specified locator.
	 * Similar to getAttributeInElementWithInnerText but returns the full HTML content.
	 *
	 * @param locator The locator of the element whose inner HTML is to be retrieved.
	 * @return The inner HTML of the element.
	 * @throws AutomationException If reading the inner HTML fails after multiple attempts.
	 */
	@Override
	public String getAttributeInElementWithInnerHTML(By locator) throws AutomationException {
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				JavascriptExecutor js = (JavascriptExecutor) driver;
				String html = (String) js.executeScript("return arguments[0].innerHTML;",
						driver.findElement(locator));
				return html;
			} catch (StaleElementReferenceException e) {
				debug(String.format(
						"StaleElementReferenceException occurred while reading '%s' attribute in %s",
						"InnerHTML", locator.toString()));
			}
			attempts++;
		}
		throw new AutomationException(
				String.format("Reading the '%s' attribute failed in %s", "InnerHTML",
						locator.toString()));
	}

	/**
	 * Initializes the controller by setting up the Appium driver with the desired capabilities.
	 * 
	 * @throws MalformedURLException If the URL for the Appium server is invalid.
	 */
	protected void initialise() throws MalformedURLException {
		DesiredCapabilities capabilities = new DesiredCapabilities();
		MobileControllerUtils.addCapabilities(capabilities);
		addAdditionalCapabilities(capabilities);
		URL url = new URL(MobilePosTestUtils.getMobileAppiumServerBaseURL());

		driver = createDriver(url, capabilities);
	}

	/**
	 * Adds additional capabilities specific to the mobile application being tested.
	 * 
	 * @param capabilities The existing capabilities to which additional capabilities should be
	 *            added.
	 */
	protected void addAdditionalCapabilities(DesiredCapabilities capabilities) {
		capabilities.setCapability(ThickMobileCapabilityType.AUTOMATION_NAME, MobilePosTestUtils.getUIFramworkName());
		capabilities.setCapability(ThickMobileCapabilityType.NO_RESET, MobilePosTestUtils.getNoRest());
		capabilities.setCapability(ThickMobileCapabilityType.FULL_RESET, MobilePosTestUtils.getFullReset());
		capabilities.setCapability(ThickMobileCapabilityType.NATIVE_WEB_TAP, MobilePosTestUtils.getNativeWebTap());
		capabilities.setCapability(ThickMobileCapabilityType.AUTO_LAUNCH, MobilePosTestUtils.getAutoLaunch());
	}

	/**
	 * Waits for the specified WebView context to appear in the list of available contexts.
	 * Polls every second until the target context is found or the timeout is reached.
	 *
	 * @param targetContext The context string to wait for (e.g., "WEBVIEW_com.enactor.pos").
	 * @param timeout The maximum time to wait in seconds.
	 * @throws RuntimeException If the target context is not found within the specified timeout.
	 */
	protected void waitForUntilContextAvailable(String targetContext, int timeout) {
	    Set<String> contexts = driver.getContextHandles();
	    debug("Current contexts: " + contexts + " and waiting for target context: " + targetContext);
	    
	    long endTime = System.currentTimeMillis() + timeout * MILLISECONDS_PER_SECOND;
	    
	    // Wait for context to appear
	    while (System.currentTimeMillis() < endTime) {
	        contexts = driver.getContextHandles();
	        if (contexts.contains(targetContext)) {
	            debug("Target context found: " + targetContext);
	            safeWait(MobilePosTestUtils.webViewReadyTimeOut());
	            return;
	        }
	        safeWait(CONTEXT_AVAILABILITY_CHECK_INTERVAL_MS);
	    }
	    
	    throw new RuntimeException("Context '" + targetContext + "' not found within " + timeout + " seconds.");
	}

	@Override
	protected void executeJSClick(WebElement element) {
		for (int attempt = 1; attempt <= MAX_JS_CLICK_RETRIES; attempt++) {
			try {
				prepareElementForClick(element);
				performJavaScriptClick(element);
				return; // Success - exit retry loop
			} catch (Exception e) {
				handleClickFailure(element, attempt, e);
			}
		}
	}
	
	
	protected void waitForWebViewLoad() {
		String webView = getWebViewName();
		int timeOut = MobilePosTestUtils.getWebViewLoadTimeOut();
		waitForUntilContextAvailable(webView, timeOut);
		driver.context(webView);
	}

	protected void waitForNativeAppLoad() {
      String nativeApp = MobilePosTestUtils.getNativeAppName();
      int timeOut = MobilePosTestUtils.getWebViewLoadTimeOut();
		waitForUntilContextAvailable(nativeApp, timeOut);
		driver.context(nativeApp);
	}
	
	/**
	 * Prepares the element for clicking by scrolling it into view and focusing it.
	 *
	 * @param element The element to prepare for clicking.
	 */
	private void prepareElementForClick(WebElement element) {
		JavascriptExecutor js = (JavascriptExecutor) driver;
		
		js.executeScript(
				"var element = arguments[0];" +
				"if (element && element.offsetParent !== null) {" +
				"    element.scrollIntoView({behavior: 'instant', block: 'center'});" +
				"    element.focus();" +
				"}",
				element);
		
		safeWait(SCROLL_INTO_VIEW_STABILIZATION_DELAY_MS);
	}

	/**
	 * Performs a JavaScript click on the element, with fallback to event dispatch if needed.
	 *
	 * @param element The element to click.
	 */
	private void performJavaScriptClick(WebElement element) {
		JavascriptExecutor js = (JavascriptExecutor) driver;
		
		try {
			// Try native click first (most reliable)
			js.executeScript("arguments[0].click();", element);
		} catch (Exception e) {
			// Fallback to event dispatch if native click fails
			dispatchClickEvents(element);
		}
	}

	/**
	 * Dispatches mouse events (mousedown, mouseup, click) to simulate a click.
	 *
	 * @param element The element to dispatch events on.
	 */
	private void dispatchClickEvents(WebElement element) {
		JavascriptExecutor js = (JavascriptExecutor) driver;
		
		js.executeScript(
				"var element = arguments[0];" +
				"var events = ['mousedown', 'mouseup', 'click'];" +
				"events.forEach(function(eventType) {" +
				"    var evt = new MouseEvent(eventType, {" +
				"        bubbles: true," +
				"        cancelable: true," +
				"        view: window," +
				"        buttons: 1" +
				"    });" +
				"    element.dispatchEvent(evt);" +
				"});",
				element);
	}

	/**
	 * Handles click failure by either retrying or falling back to native Selenium click.
	 *
	 * @param element The element that failed to click.
	 * @param attempt The current attempt number.
	 * @param exception The exception that occurred.
	 */
	private void handleClickFailure(WebElement element, int attempt, Exception exception) {
		if (attempt == MAX_JS_CLICK_RETRIES) {
			// Last attempt - fall back to native Selenium click
			element.click();
		} else {
			// Wait before retrying
			safeWait(RETRY_DELAY_MS);
		}
	}

	protected void safeWait(int millSec) {
		try {
			Thread.sleep(millSec);
		} catch (InterruptedException e) {
			throw new RuntimeException("Thread interrupted while waiting for context", e);
		}
	}
	
	protected abstract String getWebViewName();

	/**
	 * Creates a new Appium driver instance with the given URL and desired capabilities.
	 *
	 * @param url The URL of the Appium server.
	 * @param cap The desired capabilities for the driver.
	 * @return A new instance of AppiumDriver.
	 */
	protected abstract T createDriver(URL url, DesiredCapabilities cap);

	/**
	 * Adds the general capabilities required for the Appium.
	 */
	protected abstract void addDriverCapabilities();
}