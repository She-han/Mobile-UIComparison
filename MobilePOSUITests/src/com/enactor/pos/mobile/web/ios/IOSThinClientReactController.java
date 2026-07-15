package com.enactor.pos.mobile.web.ios;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoAlertPresentException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.pos.mobile.capabilities.IOSMobileCapabilityType;
import com.enactor.pos.mobile.utils.IOSPosTestUtils;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;
import com.enactor.pos.mobile.web.MobileThinClientReactController;
import com.google.common.collect.ImmutableMap;

import io.appium.java_client.MobileBy;
import io.appium.java_client.ios.IOSDriver;


public class IOSThinClientReactController extends MobileThinClientReactController<IOSDriver<WebElement>> {

	@Override
	protected IOSDriver<WebElement> createDriver(URL url, DesiredCapabilities cap) {
		IOSDriver<WebElement> driver = new IOSDriver<WebElement>(url, cap);
		driver.manage().timeouts().implicitlyWait(120, TimeUnit.SECONDS);
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
		waitForWebViewLoad();
	}

	@Override
	public void restartApplication() {
        try {
            driver.context("NATIVE_APP");

            int x = 40;
            int y = 40;
            
            Map<String, Object> args = new HashMap<>();
            args.put("x", x);
            args.put("y", y);
            args.put("duration", 2.0);
            
            driver.executeScript("mobile: touchAndHold", args);

            By settingsLocator = By.xpath("//XCUIElementTypeButton[@name=\"settings\"]");
            WebElement settingsBtn = wait.until(
                ExpectedConditions.elementToBeClickable(settingsLocator)
            );

            settingsBtn.click();

            By restartLocator = By.xpath("//XCUIElementTypeButton[@name=\"Restart\"]");
            WebElement restartBtn = wait.until(
                ExpectedConditions.elementToBeClickable(restartLocator)
            );

            restartBtn.click();
            
            // Try waiting briefly for the login screen
            By userIdLocator = By.xpath("//XCUIElementTypeStaticText[@name=\"User ID\"]");
            try {
                new WebDriverWait(driver, 30)
                    .until(ExpectedConditions.visibilityOfElementLocated(userIdLocator));
            } catch (TimeoutException toe) {
                // fallback: if the popup appears, tap its Restart button
            	restartInvalidSatePopup();

                // now wait for the login screen again:
                wait.until(ExpectedConditions.visibilityOfElementLocated(userIdLocator));
            }
            
            try {
    			if (driver != null) {
    				try {
    					driver.quit();
    				} catch (Exception e) {
    					System.out.println("Error quitting driver: " + e.getMessage());
    				}
    			}

    			this.init();

    		} catch (Exception e) {
    			System.out.println("Critical error during create driver: " + e.getMessage());
    			throw new RuntimeException("Reinit failed", e);
    		}
        } catch (Exception e) {
            throw new RuntimeException("Thread interrupted while waiting for context", e);
        }

        waitForWebViewLoad();
    }

	private boolean terminateAppWithRetry() {
		// Check if app is already terminated
		try {
			Long initialAppState = (Long) driver.executeScript("mobile: queryAppState",
					ImmutableMap.of("bundleId", IOSPosTestUtils.getBundleId()));

			if (initialAppState == 1L || initialAppState == 0L) {
				debug("App is already terminated (state: " + initialAppState + ")");
				return true;
			}

			debug(
					"App is running (state: " + initialAppState + "), proceeding with termination");

		} catch (Exception e) {
			debug("Could not check initial app state: " + e.getMessage());
		}

		// Terminate app with retry logic
		for (int attempt = 1; attempt <= 3; attempt++) {
			debug("Termination attempt " + attempt);

			driver.executeScript("mobile: terminateApp",
					ImmutableMap.of("bundleId", IOSPosTestUtils.getBundleId()));
			safeWait(2000);

			Long appState = (Long) driver.executeScript("mobile: queryAppState",
					ImmutableMap.of("bundleId", IOSPosTestUtils.getBundleId()));

			if (appState == 1L || appState == 0L) {
				debug("App successfully terminated (state: " + appState + ")");
				return true;
			}

			if (attempt < 3) {
				debug("App still running (state: " + appState + "), retrying...");
			}
		}

		return false;
	}

	private void launchAppWithVerification() {
		driver.executeScript("mobile: launchApp",
				ImmutableMap.of("bundleId", IOSPosTestUtils.getBundleId()));

		// Verify launch with timeout
		safeWait(3000);
		Long appState = (Long) driver.executeScript("mobile: queryAppState",
				ImmutableMap.of("bundleId", IOSPosTestUtils.getBundleId()));

		if (!appState.equals(4L)) {
			throw new RuntimeException("App launch verification failed. State: " + appState);
		}
	}

	private void waitForWebViewLoad() {
		String webView = getWebViewContext();
		waitForUntilContextAvailable(webView, 60);
		driver.context(webView);
	}

	private void waitForNativeAppLoad() {
		waitForUntilContextAvailable("NATIVE_APP", 60);
		driver.context("NATIVE_APP");
	}

	private String getWebViewContext() {
		final int TIMEOUT_SECONDS = 60;
		final int POLL_INTERVAL_MS = 1000;

		handleAnyAlerts();

		WebDriverWait wait = new WebDriverWait(driver, 20);
		List<WebElement> elements = driver.findElements(
				MobileBy.xpath(
						"//XCUIElementTypeTextField[@value='Please enter your user name.']"));

		if (elements.isEmpty()) {
			throw new AutomationException(
					"Enter User page is not available, or a modal appears on the Enter User page that prevents the user from entering a value in the User field.");
		}

		long startTime = System.currentTimeMillis();
		long timeoutMs = TIMEOUT_SECONDS * 1000L;

		while (System.currentTimeMillis() - startTime < timeoutMs) {
			Set<String> contexts = driver.getContextHandles();
			debug("Available contexts: " + contexts);

			// Java 7 compatible context finding
			for (String context : contexts) {
				if (context.toLowerCase().contains("webview")) {
					debug("WebView context found: " + context);
					return context;
				}
			}
			safeWait(POLL_INTERVAL_MS);
		}

		throw new AutomationException(
				"WebView context not found within " + TIMEOUT_SECONDS + " seconds");
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
			// TODO Auto-generated catch block
			throw new AutomationException(
					"Failed When reinitialise appium driver");
		}

		throw new AutomationException(
				"Failed due to lost connection with WebDriverAgent");

	}

	@Override
	protected boolean enterTextFluently(final By locator, final String text, final boolean sendTab,
			final boolean skipValidation) throws AutomationException {
		try {
			return wait.until(new Function<WebDriver, Boolean>() {
				public Boolean apply(WebDriver driver) {
					try {
						String platformName = MobilePosTestUtils.getMobilePlatformName();
						debug("Entering text '" + text + "' into element '" + locator.toString()
								+ "' on mobile platform: " + platformName);

						WebElement element = findElementFluently(locator);

						// Mobile-optimized scrolling
						if (!skipValidation) {
							((JavascriptExecutor) driver).executeScript(
									"arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});",
									element);
						}

						// Check if text is already present
						String currentValue = getMobileElementValue(element);
						if (currentValue != null && currentValue.equalsIgnoreCase(text)) {
							debug("Text already present: '" + currentValue + "' in element");
							return Boolean.TRUE;
						}

						element.click();
						String currentText = element.getAttribute("value");

						// Keep your working text clearing implementation
						if (currentText != null && !currentText.isEmpty()) {
							Actions actions1 = new Actions(driver);
							for (int i = 0; i < currentText.length(); i++) {
								actions1.sendKeys(Keys.BACK_SPACE);
							}
							actions1.perform();
						}

						Actions actions = new Actions(driver);
						actions.sendKeys(String.valueOf(text));
						actions.perform();

						// Validate the entered text
						String finalValue = getMobileElementValue(element);
						if (skipValidation
								|| (finalValue != null && finalValue.equalsIgnoreCase(text))) {
							debug("Successfully entered text '" + finalValue
									+ "' into mobile element");
							return Boolean.TRUE;
						}

						throw new TimeoutException(
								"Mobile text entry failed on " + platformName + ". Expected: '"
										+ text + "', Actual: '" + finalValue + "'");

					} catch (AutomationException e) {
						throw new TimeoutException("Mobile automation exception: " + e.getMessage(),
								e);
					}
				}
			});
		} catch (TimeoutException t) {
			WebElement element = findElementFluently(locator);
			String currentValue = getMobileElementValue(element);
			String platformName = MobilePosTestUtils.getMobilePlatformName();

			throw new AutomationException(
					"Mobile text entry timeout on " + platformName + ". " + t.getMessage()
							+ " --- Attempting to set '"
							+ text + "', currently '" + currentValue + "' into "
							+ element.toString(),
					t);
		}
	}

	private String getMobileElementValue(WebElement element) {
		String value = element.getAttribute("value");
		return (value == null || value.isEmpty()) ? element.getText() : value;
	}
	
	/**
	 * Click the Restart button if the invalid state popup appears.
	 */
	private void restartInvalidSatePopup() {
		By restartBtnLocator = By.id("com.enactor.mobile.android.pos:id/restartButton");
		new WebDriverWait(driver, 30)
		.until(ExpectedConditions.elementToBeClickable(restartBtnLocator))
		.click();
		System.out.println("Restart popup detected and clicked.");
	}

	@Override
	public IOSDriver<WebElement> getDriver() {
		return driver;
	}
}

