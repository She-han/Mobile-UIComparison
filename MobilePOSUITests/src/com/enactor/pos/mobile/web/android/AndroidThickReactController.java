package com.enactor.pos.mobile.web.android;

import java.net.URL;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.DesiredCapabilities;

import com.enactor.pos.mobile.capabilities.AndroidMobileCapabilityType;
import com.enactor.pos.mobile.utils.AndroidPosTestUtils;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;
import com.enactor.pos.mobile.web.MobileThickReactController;

import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.appmanagement.ApplicationState;

/**
 * AndroidThickReactController is a concrete implementation of the MobileThickReactController for Android devices.
 * This controller handles interactions with an Android mobile application using Appium and UiAutomator2.
 * 
 * @author Preminda.Bandara
 */
public class AndroidThickReactController extends MobileThickReactController<AndroidDriver<WebElement>> {
	
	// Date format validation
	private static final String DATE_FORMAT_REGEX = "^\\d{2}/\\d{2}/\\d{2}$";
	private static final Pattern DATE_FORMAT_PATTERN = Pattern.compile(DATE_FORMAT_REGEX);
	
	
	/**
     * Restarts the application on the Android device. It waits for the native app to load, runs the app in the background,
     * and then relaunches the app. After restarting, it switches back to the WebView context.
     */
	@Override
	public void restartApplication() {
		String packageName = AndroidPosTestUtils.getAndroidApplicationPackageName();
		waitForNativeAppLoad();
		driver.terminateApp(packageName);
		safeWait(LONG_WAIT_MS);
		driver.activateApp(packageName);
		safeWait(LONG_WAIT_MS);
		waitForWebViewLoad();
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

	@Override
	protected String getWebViewName() {
		return AndroidPosTestUtils.getWebView();
	}

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
        AndroidDriver<WebElement> driver;
        if (MobilePosTestUtils.getUseCustomDriver()) {
			driver = new AndroidWebDriver(url, cap);
		} else {
			driver = new AndroidDriver<WebElement>(url, cap);
		}
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
        capabilities.setCapability(AndroidMobileCapabilityType.ANDROID_APP_PACKAGE,
                AndroidPosTestUtils.getAndroidApplicationPackageName());
        capabilities.setCapability(AndroidMobileCapabilityType.ANDROID_APP_ACTIVITY,
                AndroidPosTestUtils.getAndroidApplicationMainActivity());
        capabilities.setCapability(AndroidMobileCapabilityType.CHROME_DRIVE_EXECUTABLE,
                AndroidPosTestUtils.getChromeDrivePath());
        capabilities.setCapability(AndroidMobileCapabilityType.CLEAR_DEVICE_LOGS_ON_START,
                AndroidPosTestUtils.getClearDeviceLogOnStart());
        capabilities.setCapability(AndroidMobileCapabilityType.DEVICE_READY_TIME_OUT,
                AndroidPosTestUtils.getDeviceReadyTimeout());
        capabilities.setCapability(AndroidMobileCapabilityType.AUTO_GRANT_PERMISSION,
                AndroidPosTestUtils.getAutoGrantPermission());
        capabilities.setCapability(AndroidMobileCapabilityType.WEBVIEW_CONNECT_TIMEOUT,
                AndroidPosTestUtils.getWebviewConnectTimeout());
        capabilities.setCapability(AndroidMobileCapabilityType.CHROME_USE_SYSTEM_EXE,
                AndroidPosTestUtils.getChromeUseSystemExe());
        capabilities.setCapability(AndroidMobileCapabilityType.ENSURE_WEBVIEW_HAS_PAGE,
                AndroidPosTestUtils.getEnsureWebviewHasPage());
    }

    /**
     * Adds general driver capabilities, waits for the WebView to load, and sets the context.
     */
    @Override
    protected void addDriverCapabilities() {
    	
    	restartAppIfRunning();
        waitForWebViewLoad();
    }
    
    @Override
	protected void clearBySendKeys(String text, String currentvalue, WebElement element,
			boolean sendTab) {
		if (sendTab) {
			if (currentvalue != null && !currentvalue.isEmpty()) {
				
				if(MobilePosTestUtils.getUseCustomDriver()) {
					customeDriverClear(element,currentvalue );
				}else {
					defaultDriverClear(element,currentvalue );
				}

				
			}
		} else {
			element.clear();
		}

		enterText(text);
	}
	
	private void defaultDriverClear(WebElement element, String currentvalue) {

		Matcher matcher = DATE_FORMAT_PATTERN.matcher(currentvalue);

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
	
	private void customeDriverClear(WebElement element, String currentvalue)  {

		Matcher matcher = DATE_FORMAT_PATTERN.matcher(currentvalue);

		if (matcher.matches()) {
			element.click();
			element.click();
		}

		Actions backSpaceClearAction = new Actions(driver);

		for (int i = 0; i < currentvalue.length(); i++) {
			backSpaceClearAction.sendKeys(Keys.BACK_SPACE);
		}
		backSpaceClearAction.perform();	
	}
    
    private  void restartAppIfRunning() {
        try {
        	
        	String packageName = AndroidPosTestUtils.getAndroidApplicationPackageName();
            // Check the app's state
            ApplicationState state = driver.queryAppState(packageName);

            // If the app is running or in background, terminate it
            if (state == ApplicationState.RUNNING_IN_FOREGROUND ||
                state == ApplicationState.RUNNING_IN_BACKGROUND ||
                state == ApplicationState.RUNNING_IN_BACKGROUND_SUSPENDED) {
            	debug("App is running. Terminating...");
                try {
                	driver.terminateApp(packageName);
                }catch(Exception e){
                	
                }
                
                safeWait(MEDIUM_WAIT_MS); // optional wait for clean termination
            } else {
                debug("App is not running.");
            }

            // Launch the app
            debug("Launching app...");
            driver.activateApp(packageName);
            safeWait(MEDIUM_WAIT_MS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    /**
     * Enters text into the element using Actions
     */
    private void enterText(String text) {
    	Actions textEnterAction = new Actions(driver);
		textEnterAction.sendKeys(String.valueOf(text));
		textEnterAction.perform();
    }

}

