package com.enactor.pos.mobile.web.ios;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.ElementNotVisibleException;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoAlertPresentException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.pos.mobile.capabilities.IOSMobileCapabilityType;
import com.enactor.pos.mobile.utils.IOSPosTestUtils;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;
import com.enactor.pos.mobile.web.MobileThickReactController;
import com.google.common.collect.ImmutableMap;

import io.appium.java_client.MobileBy;
import io.appium.java_client.ios.IOSDriver;


public class IOSThickReactController extends MobileThickReactController<IOSDriver<WebElement>> implements IAUTIosWebController {

	private static final long DEFAULT_TIMEOUT_SECONDS = 60000;
	private static final int MAX_TERMINATION_ATTEMPTS = 3;
	private static final int WEBVIEW_WAIT_TIMEOUT = 80;
	private static final String MOBILE_QUERY_APP_STATE = "mobile: queryAppState";
	private static final String MOBILE_TERMINATE_APP = "mobile: terminateApp";
	private static final String MOBILE_LAUNCH_APP = "mobile: launchApp";
	private static final String BUNDLE_ID_KEY = "bundleId";
	private static final String USER_NAME_FIELD_XPATH = "//XCUIElementTypeTextField[@value='Please enter your user name.']";
	private static final String WEBVIEW_CONTEXT_PREFIX = "webview";
	
	private static final String SELECT_ALL_TEXT_SCRIPT = "var element = arguments[0];"
			+ "var length = element.value.length;" + "element.setSelectionRange(0, length);" + "return length;";

	private static final String FOCUS_END_OF_TEXT_SCRIPT = "var element = arguments[0];" + "element.focus();"
			+ "var length = element.value.length;" + "element.setSelectionRange(length, length);" + "element.blur();"
			+ "element.focus();";

	private static final String COMBOBOX_CLICK_SCRIPT = "var element = arguments[0];"
			+ "var children = element.querySelectorAll('*');" + "for (var i = 0; i < children.length; i++) {"
			+ "    var child = children[i];" + "    try {" + "        if (child.focus) child.focus();"
			+ "        child.click();" + "        break;" + "    } catch (e) {" + "        continue;" + "    }" + "}"
			+ "if (children.length === 0) {" + "    element.click();" + "}";
	
	
	@Override
	public void restartApplication() {
		debug("Starting application restart...");

		waitForNativeAppLoad();

		if (!terminateAppWithRetry()) {
			handleConnectionLossAndReconnect();
		}

		debug("App terminated successfully");
		launchAppWithVerification();
		debug("App launched successfully");
		waitForWebViewLoad();
		

	}
	
	@Override
	public IOSDriver<WebElement> getDriver() {
		return driver;
	}
	
	@Override
	public void clickComboboxElement(By locator) throws AutomationException {
	    attemptExecute(new AutomationExecutable() {
	        @Override
	        public void execute() throws AutomationException {
	            executeComboboxClick(locator);
	        }
	    });
	}

	@Override
	protected IOSDriver<WebElement> createDriver(URL url, DesiredCapabilities cap) {
		IOSDriver<WebElement> driver;
		if (MobilePosTestUtils.getUseCustomDriver()) {
			driver = new IOSWebDriver(url, cap);
		} else {
			driver = new IOSDriver<WebElement>(url, cap);
		}
		int waitingTimeOut = MobilePosTestUtils.getWaitingTimeOut()/2;
		driver.manage().timeouts().implicitlyWait(waitingTimeOut, TimeUnit.SECONDS);
	    driver.manage().timeouts().pageLoadTimeout(waitingTimeOut, TimeUnit.SECONDS);
	    driver.manage().timeouts().setScriptTimeout(waitingTimeOut, TimeUnit.SECONDS);
		return driver;
	}

	@Override
	protected void addAdditionalCapabilities(DesiredCapabilities capabilities) {
		super.addAdditionalCapabilities(capabilities);
		capabilities.setCapability(IOSMobileCapabilityType.BUNDLE_ID,
				IOSPosTestUtils.getBundleId());
		capabilities.setCapability(IOSMobileCapabilityType.CONNECT_HARDWARE_KEYBOARD,
				IOSPosTestUtils.getConnectHardwareKeyboard());
		capabilities.setCapability(IOSMobileCapabilityType.INCLUDE_SAFARI_IN_WEBVIEWS,
				IOSPosTestUtils.getIncludeSafariInWebviews());
		capabilities.setCapability(IOSMobileCapabilityType.IGNORE_HIDDEN_API_POLICY_ERROR,
				IOSPosTestUtils.getIgnoreHiddenApiPolicyError());
		capabilities.setCapability(IOSMobileCapabilityType.MAX_TYPEING_FREQUENCY,
				IOSPosTestUtils.getMaxTypeFrequency());
		capabilities.setCapability(IOSMobileCapabilityType.SEND_KEY_STRATEGY,
				IOSPosTestUtils.getSendKeyStrategy());
		capabilities.setCapability(IOSMobileCapabilityType.USE_NEW_WDA,
				IOSPosTestUtils.getUseNewWDA());
		capabilities.setCapability(IOSMobileCapabilityType.WDA_STARTUP_RETRIES,
				IOSPosTestUtils.getWdaStartupRetries());
		capabilities.setCapability(IOSMobileCapabilityType.WDA_STARTUP_RETRY_INTERVAL,
				IOSPosTestUtils.getWdaStartupRetryInterval());
		capabilities.setCapability(IOSMobileCapabilityType.WDA_LAUNCH_TIMEOUT,
				IOSPosTestUtils.getWdaLaunchTimeout());
		capabilities.setCapability(IOSMobileCapabilityType.WDA_CONNECTION_TIMEOUT,
				IOSPosTestUtils.getWdaConnectionTimeout());
		capabilities.setCapability(IOSMobileCapabilityType.WAIT_FOR_QUIESCENCE,
				IOSPosTestUtils.getWaitForQuiescence());
		capabilities.setCapability(IOSMobileCapabilityType.AUTO_DISMISS_ALERTS,
				IOSPosTestUtils.getAutoDismissAlerts());
		capabilities.setCapability(IOSMobileCapabilityType.AUTO_ACCEPT_ALERTS,
				IOSPosTestUtils.getAutoAcceptAlerts());
		capabilities.setCapability(IOSMobileCapabilityType.COMMAND_TIMEOUTS,
				IOSPosTestUtils.getCommandTimeouts());
		
	}

	@Override
	protected void addDriverCapabilities() {
		closeApplicationIfOpen();
		launchAppWithVerification();
		waitForWebViewLoad();
	}
	
	@Override
	protected void clearBySendKeys(String text, String currentvalue, WebElement element, boolean sendTab) {
	    if (sendTab) {
	        clearElementWithTabStrategy(element, currentvalue);
	    } else {
	        element.clear();
	    }
	    
	    sendTextToElement(element, text);
	}
	
	@Override
	protected String getWebViewName() {
		return getWebViewContext();
	}
	
	
	private void closeApplicationIfOpen() {
		debug("Checking if application needs to be closed...");

		try {
			// Check current app state
			Long appState = (Long) driver.executeScript(MOBILE_QUERY_APP_STATE,
					ImmutableMap.of(BUNDLE_ID_KEY, IOSPosTestUtils.getBundleId()));

			debug("Current app state: " + appState);

			// If app is running in foreground or background, terminate it
			if (appState == AppState.RUNNING_IN_FOREGROUND || appState == AppState.RUNNING_IN_BACKGROUND) {
				debug("App is open, proceeding to close it...");

				if (!terminateAppWithRetry()) {
					debug("Failed to terminate app using standard method, attempting force close");
					handleConnectionLossAndReconnect();
				}

				safeWait(SHORT_WAIT_MS);


				debug("Application closed successfully");
			} else {
				debug("App is not running (state: " + appState + "), no need to close");
			}

		} catch (Exception e) {
			debug("Error while checking/closing application: " + e.getMessage());
			// Continue with the process even if there's an error
		}
	}


	private boolean terminateAppWithRetry() {
	    if (isAppAlreadyTerminated()) {
	        return true;
	    }

	    return performTerminationWithRetry();
	}

	private boolean isAppAlreadyTerminated() {
	    try {
	        Long initialAppState = (Long) driver.executeScript(MOBILE_QUERY_APP_STATE,
	                ImmutableMap.of(BUNDLE_ID_KEY, IOSPosTestUtils.getBundleId()));

	        if (initialAppState == AppState.NOT_RUNNING || initialAppState == AppState.NOT_INSTALLED) {
	            debug("App is already terminated (state: " + initialAppState + ")");
	            return true;
	        }

	        debug("App is running (state: " + initialAppState + "), proceeding with termination");
	        return false;

	    } catch (Exception e) {
	        debug("Could not check initial app state: " + e.getMessage());
	        return false;
	    }
	}

	private boolean performTerminationWithRetry() {
	    for (int attempt = 1; attempt <= MAX_TERMINATION_ATTEMPTS; attempt++) {
	        debug("Termination attempt " + attempt);

	        if (attemptTerminateApp()) {
	            return true;
	        }

	        if (attempt < MAX_TERMINATION_ATTEMPTS) {
	            debug("App still running, retrying...");
	        }
	    }

	    return false;
	}

	private boolean attemptTerminateApp() {
	    driver.executeScript(MOBILE_TERMINATE_APP,
	            ImmutableMap.of(BUNDLE_ID_KEY, IOSPosTestUtils.getBundleId()));
	    safeWait(MEDIUM_WAIT_MS);

	    Long appState = (Long) driver.executeScript(MOBILE_QUERY_APP_STATE,
	            ImmutableMap.of(BUNDLE_ID_KEY, IOSPosTestUtils.getBundleId()));

	    if (appState == AppState.NOT_RUNNING || appState == AppState.NOT_INSTALLED) {
	        debug("App successfully terminated (state: " + appState + ")");
	        return true;
	    }

	    debug("App still running (state: " + appState + ")");
	    return false;
	}


	private void launchAppWithVerification() {
		driver.executeScript(MOBILE_LAUNCH_APP,
				ImmutableMap.of(BUNDLE_ID_KEY, IOSPosTestUtils.getBundleId()));

		// Verify launch with timeout
		safeWait(LONG_WAIT_MS);
		Long appState = (Long) driver.executeScript(MOBILE_QUERY_APP_STATE,
				ImmutableMap.of(BUNDLE_ID_KEY, IOSPosTestUtils.getBundleId()));

		if (!appState.equals(AppState.RUNNING_IN_FOREGROUND)) {
			throw new RuntimeException("App launch verification failed. State: " + appState);
		}
	}

	

	private String getWebViewContext() {
	    handleAnyAlerts();
	    waitForUserNameField();
	    return findWebViewContextWithTimeout();
	}

	private void waitForUserNameField() {
	    WebDriverWait wait = new WebDriverWait(driver, WEBVIEW_WAIT_TIMEOUT);
	    By locator = MobileBy.xpath(USER_NAME_FIELD_XPATH);
	    
	    wait.until(ExpectedConditions.presenceOfElementLocated(locator));
	    
	    List<WebElement> elements = driver.findElements(locator);
	    
	    if (elements.isEmpty()) {
	        throw new AutomationException(
	                "Enter User page is not available, or a modal appears on the Enter User page that prevents the user from entering a value in the User field.");
	    }
	}

	private String findWebViewContextWithTimeout() {
	    long startTime = System.currentTimeMillis();

	    while (System.currentTimeMillis() - startTime < DEFAULT_TIMEOUT_SECONDS) {
	        Set<String> contexts = driver.getContextHandles();
	        debug("Available contexts: " + contexts);

	        for (String context : contexts) {
	            if (context.toLowerCase().contains(WEBVIEW_CONTEXT_PREFIX)) {
	                debug("WebView context found: " + context);
	                return context;
	            }
	        }
	        safeWait(SHORT_WAIT_MS);
	    }

	    throw new AutomationException(
	            "WebView context not found within " + DEFAULT_TIMEOUT_SECONDS/1000 + " seconds");
	}

	private void handleAnyAlerts() {
		try {
			Alert alert = driver.switchTo().alert();
			String alertText = alert.getText();
			debug("Alert found: " + alertText);
			alert.accept();
			debug("Alert accepted");
		} catch (NoAlertPresentException e) {
			// No alert present - normal case
		} catch (Exception e) {
			debug("Error handling alert: " + e.getMessage());
		}
	}

	private void handleConnectionLossAndReconnect() {

		debug("Connection lost, attempting reconnection...");

		if (driver != null) {
			driver.quit();
		}

		try {
			this.initialise();
		} catch (MalformedURLException e) {
			throw new AutomationException(
					"Failed When reinitialise appium driver");
		}

		throw new AutomationException(
				"Failed due to lost connection with WebDriverAgent");

	}

	private void clearElementWithTabStrategy(WebElement element, String currentValue) {
	    if (currentValue != null && !currentValue.isEmpty()) {
	        selectAllText(element);
	        element.sendKeys(Keys.DELETE);
	        focusEndOfText(element);
	    }
	}

	private void selectAllText(WebElement element) {
	    JavascriptExecutor js = (JavascriptExecutor) driver;
	    js.executeScript(SELECT_ALL_TEXT_SCRIPT, element);
	}

	private void focusEndOfText(WebElement element) {
	    JavascriptExecutor js = (JavascriptExecutor) driver;
	    js.executeScript(FOCUS_END_OF_TEXT_SCRIPT, element);
	}

	private void sendTextToElement(WebElement element, String text) {
	    Actions textEnterAction = new Actions(driver);
	    textEnterAction.sendKeys(String.valueOf(text));
	    textEnterAction.perform();
	}

	private void executeComboboxClick(By locator) throws AutomationException {
	    try {
	        WebElement element = findAndWaitForClickableElement(locator);
	        clickComboboxWithJavaScript(element);
	    } catch (ElementNotVisibleException e) {
	        throw new AutomationException("Failed to click, element not visible", e);
	    } catch (StaleElementReferenceException se) {
	        throw new AutomationException("Failed to click, Stale Element Exception : ", se);
	    }
	}

	private WebElement findAndWaitForClickableElement(By locator) {
	    WebElement element = findElementFluently(locator);
	    WebDriverWait wait = new WebDriverWait(driver, WAIT_TIMEOUT);
	    wait.until(ExpectedConditions.elementToBeClickable(locator));
	    return element;
	}

	private void clickComboboxWithJavaScript(WebElement element) {
	    JavascriptExecutor js = (JavascriptExecutor) driver;
	    js.executeScript(COMBOBOX_CLICK_SCRIPT, element);
	}
	
	private static class AppState {
	    static final long NOT_INSTALLED = 0L;
	    static final long NOT_RUNNING = 1L;
	    static final long BACKGROUND_SUSPENDED = 2L;
	    static final long RUNNING_IN_BACKGROUND = 3L;
	    static final long RUNNING_IN_FOREGROUND = 4L;
	}

}