package com.enactor.pos.mobile.web;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.interactions.Actions;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.controller.BaseWebController;
import com.enactor.pos.mobile.MobileControllerUtils;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.remote.MobileCapabilityType;

/**
 * MobileThickReactController is an abstract class that handles interactions with a mobile
 * application using Appium.
 * It is designed to work with mobile web contexts and provides methods to initialize drivers.
 * @author Preminda.Bandara
 */
public abstract class MobileThinClientReactController<T extends AppiumDriver<WebElement>>
		extends BaseWebController<T> 
		implements IAUTMobileWebController<T> {

	protected boolean started;
	private final String NATIVE_WEB_TAP = "appium:nativeWebTap";

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
			wait = new FluentWait<T>(driver).withTimeout(120, TimeUnit.SECONDS)
					.pollingEvery(1, TimeUnit.SECONDS)
					.ignoring(Exception.class);
		} catch (MalformedURLException e) {
			throw new AutomationException("Failed to initialised the appium driver.", e);
		}
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
		capabilities.setCapability(MobileCapabilityType.AUTOMATION_NAME,
				MobilePosTestUtils.getUIFramworkName());
		capabilities.setCapability(MobileCapabilityType.NO_RESET,
				MobilePosTestUtils.getNoRest());
		capabilities.setCapability(MobileCapabilityType.FULL_RESET,
				MobilePosTestUtils.getFullReset());
		capabilities.setCapability(NATIVE_WEB_TAP, MobilePosTestUtils.getNativeWebTap());
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
		debug("Current contexts: " + contexts + " and waiting for target context: "
				+ targetContext + "...");
		long endTime = System.currentTimeMillis() + timeout * 1000;
		while (System.currentTimeMillis() < endTime) {
			contexts = driver.getContextHandles(); // Get the list of context handles
			if (contexts.contains(targetContext)) {
				debug("Target context found: " + targetContext);
				return;
			}

			safeWait(1000);
		}
		throw new RuntimeException(
				"Context '" + targetContext + "' not found within " + timeout + " seconds.");
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

	@Override
	protected void clearBySendKeys(String text, String currentvalue, WebElement element,
			boolean sendTab) {
		if (sendTab) {
			if (currentvalue != null && !currentvalue.isEmpty()) {

				String regex = "^\\d{2}/\\d{2}/\\d{2}$";

				Pattern pattern = Pattern.compile(regex);
				Matcher matcher = pattern.matcher(currentvalue);

				if (matcher.matches()) {
					Actions tripleClick = new Actions(driver);
					tripleClick.click(element).click(element).click(element);
					tripleClick.perform();
				}

				Actions backSpaceClearAction = new Actions(driver);

				for (int i = 0; i < currentvalue.length(); i++) {
					backSpaceClearAction.sendKeys(Keys.BACK_SPACE);
				}
				backSpaceClearAction.perform();
			}
		} else {
			element.clear();
		}

		Actions textEnterAction = new Actions(driver);
		textEnterAction.sendKeys(String.valueOf(text));
		textEnterAction.perform();
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

	@Override
	protected void executeJSClick(WebElement element) {
		int maxRetries = 3;

		for (int attempt = 1; attempt <= maxRetries; attempt++) {
			try {
				JavascriptExecutor js = (JavascriptExecutor) driver;

				// Ensure element is ready and in viewport
				js.executeScript(
						"var element = arguments[0];" +
								"if (element && element.offsetParent !== null) {" +
								"    element.scrollIntoView({behavior: 'instant', block: 'center'});"
								+
								"    element.focus();" +
								"}",
						element);

				// Small delay for stability
				safeWait(200);

				// Try native click first (most reliable)
				try {
					js.executeScript("arguments[0].click();", element);
				} catch (Exception e) {
					// Fallback to event dispatch if native click fails
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

				// Success - exit retry loop
				return;

			} catch (Exception e) {
				if (attempt == maxRetries) {
					throw new AutomationException(
							"JS Click failed after " + maxRetries + " attempts");
				}
				// wait before retires
				safeWait(500);
			}
		}
	}

	protected void safeWait(int millSec) {
		try {
			Thread.sleep(millSec);
		} catch (InterruptedException e) {
			throw new RuntimeException("Thread interrupted while waiting for context", e);
		}
	}

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
