package com.enactor.pos.mobile.web.android;

import java.net.URL;
import java.time.Duration;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import static io.appium.java_client.touch.offset.PointOption.point;
import static io.appium.java_client.touch.WaitOptions.waitOptions;

import io.appium.java_client.TouchAction;

import com.enactor.pos.mobile.capabilities.AndroidMobileCapabilityType;
import com.enactor.pos.mobile.utils.AndroidPosTestUtils;
import com.enactor.pos.mobile.web.MobileThinClientReactController;

import io.appium.java_client.android.AndroidDriver;
import java.util.HashMap;
import java.util.List;

/**
 * AndroidThickReactController is a concrete implementation of the MobileThickReactController for Android devices.
 * This controller handles interactions with an Android mobile application using Appium and UiAutomator2.
 * 
 * @author Preminda.Bandara
 */
public class AndroidThinClientReactController extends MobileThinClientReactController<AndroidDriver<WebElement>> {

    /**
     * Creates a new AndroidDriver instance with the specified URL and desired capabilities.
     * Initializes implicit wait and configures driver timeouts.
     *
     * @param url The URL of the Appium server.
     * @param cap The desired capabilities for the Android driver.
     * @return A new instance of AndroidDriver with the specified capabilities.
     */
    @Override
    protected AndroidDriver<WebElement> createDriver(URL url, DesiredCapabilities cap) {
        AndroidDriver<WebElement> driver = new AndroidDriver<WebElement>(url, cap);
        driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
        return driver;
    }

    /**
     * Adds Android-specific capabilities required for the mobile application.
     * Configures app package, activity, ChromeDriver executable path, and other settings.
     *
     * @param capabilities The existing DesiredCapabilities to which Android-specific capabilities are added.
     */
    @Override
    protected void addAdditionalCapabilities(DesiredCapabilities capabilities) {
    	super.addAdditionalCapabilities(capabilities);
    	capabilities.setCapability("appium:" + AndroidMobileCapabilityType.ANDROID_APP_PACKAGE,
    	        AndroidPosTestUtils.getAndroidApplicationPackageName());
    	capabilities.setCapability("appium:" + AndroidMobileCapabilityType.ANDROID_APP_ACTIVITY,
    	        AndroidPosTestUtils.getAndroidApplicationMainActivity());
    	capabilities.setCapability("appium:" + AndroidMobileCapabilityType.CHROME_DRIVE_EXECUTABLE,
    	        AndroidPosTestUtils.getChromeDrivePath());
    	capabilities.setCapability("appium:" + AndroidMobileCapabilityType.CLEAR_DEVICE_LOGS_ON_START,
    	        AndroidPosTestUtils.getClearDeviceLogOnStart());
    	capabilities.setCapability("appium:" + AndroidMobileCapabilityType.DEVICE_READY_TIME_OUT,
    	        AndroidPosTestUtils.getDeviceReadyTimeout());
    	capabilities.setCapability("appium:" + AndroidMobileCapabilityType.AUTO_GRANT_PERMISSION,
    	        AndroidPosTestUtils.getAutoGrantPermission());
    	capabilities.setCapability("appium:" + AndroidMobileCapabilityType.WEBVIEW_CONNECT_TIMEOUT,
    	        AndroidPosTestUtils.getWebviewConnectTimeout());
    	capabilities.setCapability("appium:" + AndroidMobileCapabilityType.CHROME_USE_SYSTEM_EXE,
    	        AndroidPosTestUtils.getChromeUseSystemExe());
    	capabilities.setCapability("appium:" + AndroidMobileCapabilityType.ENSURE_WEBVIEW_HAS_PAGE,
    	        AndroidPosTestUtils.getEnsureWebviewHasPage());
    }

    /**
     * Adds general driver capabilities, waits for the WebView to load, and sets the context.
     */
    @Override
    protected void addDriverCapabilities() {
        waitForWebViewLoad();
    }
    
    /**
     * Restarts the application on the Android device. It waits for the native app to load, runs the app in the background,
     * and then relaunches the app. After restarting, it switches back to the WebView context.
     */
    @Override
	public void restartApplication() {
		try {
			driver.context(AndroidPosTestUtils.getNativeAppName());

			// Get screen size
			Dimension size = driver.manage().window().getSize();

			// 10% from top, 10% from width
			int x = (int) (size.width * 0.1);
			int y = (int) (size.height * 0.1);

			Map<String, Object> args = new HashMap<>();
			args.put("x", x);
			args.put("y", y);
			args.put("duration", 2000); // long press duration in ms

			// Trigger long click
			driver.executeScript("mobile: longClickGesture", args);

			By settingsLocator = By.xpath("//android.widget.ImageButton");
			WebElement settingsBtn = wait.until(ExpectedConditions.elementToBeClickable(settingsLocator));

			settingsBtn.click();

			By restartLocator = By.xpath("//android.widget.Button[@text='Restart']");
			WebElement restartBtn = wait.until(ExpectedConditions.elementToBeClickable(restartLocator));

			restartBtn.click();

			// Try waiting briefly for the login screen
			By userIdLocator = By.xpath("//android.widget.TextView[@text='User ID']");
			try {
				new WebDriverWait(driver, 60).until(ExpectedConditions.visibilityOfElementLocated(userIdLocator));
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

    /**
     * Waits until the WebView context is available and switches the driver context to the WebView.
     */
    private void waitForWebViewLoad() {
        String webView = AndroidPosTestUtils.getWebView();
        int timeOut = AndroidPosTestUtils.getWebViewLoadTimeOut();
        try {
	        waitForUntilContextAvailable(webView, timeOut);
	        driver.context(webView);
        } catch (Exception e) {
    		restartInvalidSatePopup();
            
            //After restart need to switch the context again
            waitForUntilContextAvailable(webView, timeOut);
	        driver.context(webView);
        }
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

    /**
     * Returns the AndroidDriver instance associated with this controller.
     * 
     * @return The AndroidDriver instance.
     */
    @Override
    public AndroidDriver<WebElement> getDriver() {
        return driver;
    }
}

