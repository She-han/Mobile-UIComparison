package com.enactor.pos.mobile;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.remote.DesiredCapabilities;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.utilities.StringUtils;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.HasOnScreenKeyboard;
import io.appium.java_client.MobileElement;
import io.appium.java_client.remote.MobileCapabilityType;

/**
 * Common mobile test automation controller.
 * 
 * @author Thushara.Ramasinghe
 *
 * @param <T>
 */
public abstract class MobileTestController<T extends AppiumDriver<MobileElement>> implements IMobileAUTController {

	public T driver;

	private boolean started;
	
	@Override
	public boolean isRunning() {
		return started;
	}
	
	@Override
	public MobileElement findElement(String elementId) throws AutomationException {
		if (getDriver() != null) {
			List<MobileElement> elements = getDriver().findElementsByAccessibilityId(elementId);
			if (elements != null && !elements.isEmpty()) {
				return elements.get(0);
			}
		} else {
			throw new AutomationException("Appium driver not initialised properly");
		}
		return null;
	}
	
	@Override
	public MobileElement findElementByXpathSuffix(String elementId) throws AutomationException {
	    if (getDriver() != null) {
	    	// Find element where content-desc contains the elementId
	        String xpath = "//*[contains(@content-desc, '" + elementId + "')]";
	        List<MobileElement> elements = getDriver().findElementsByXPath(xpath);
	        if (elements != null && !elements.isEmpty()) {
	            return elements.get(0);
	        }
	    } else {
	        throw new AutomationException("Appium driver not initialised properly");
	    }
	    return null;
	}

	@Override
	public MobileElement findElementByLabelText(String label) throws AutomationException {
		if (getDriver() != null) {
			List<MobileElement> elements = getDriver().findElementsByAccessibilityId(label);
			if (elements != null && !elements.isEmpty()) {
				return elements.get(0);
			}
		} else {
			throw new AutomationException("Appium driver not initialised properly");
		}
		return null;
	}

	@Override
	public void start() throws AutomationException {
		try {
			initialise();
			started = true;
		} catch (MalformedURLException e) {
			throw new AutomationException("Failed to initialised the appium driver.", e);
		}
	}

	@Override
	public void shutdown() {
		started = false;
		getDriver().quit();
	}

	@Override
	public byte[] captureScreenShot() throws AutomationException {
		byte[] screenshot = getDriver().getScreenshotAs(OutputType.BYTES);
		if(screenshot == null || screenshot.length == 0) {
			throw new AutomationException("Failed to capture screen shot");
		}
		return screenshot;
	}
	
	@Override
	public String getPageSource() {
		return this.driver.getPageSource();
	}
	
	@Override
	public String getWebViewURL() {
        // Get URL directly
		try {
	        String deviceSerial = MobilePosTestUtils.getMobileDeviceUUID();
	        
	        // Get process ID
	        String processId = new BufferedReader(new InputStreamReader(
	            Runtime.getRuntime().exec("adb -s " + deviceSerial + " shell pidof com.enactor.mobile.android.pos")
	                .getInputStream())).readLine().trim();
	        
	        // Forward port
	        Runtime.getRuntime().exec("adb -s " + deviceSerial + " forward tcp:9222 localabstract:webview_devtools_remote_" + processId).waitFor();
	        Thread.sleep(1000);
	        
	        // Get JSON
	        String json = new BufferedReader(new InputStreamReader(
	            new URL("http://localhost:9222/json/list").openConnection().getInputStream()))
	            .lines().collect(Collectors.joining());
	        
	        // Simply look for WebReports URL anywhere in the JSON
	        if (json.contains("WebReports")) {
	            Pattern pattern = Pattern.compile("(http://[^\"]*WebReports[^\"]*)");
	            Matcher matcher = pattern.matcher(json);
	            
	            if (matcher.find()) {
	                return matcher.group(1);
	            }
	        }
	        
	        return null;
	        
	    } catch (Exception e) {
	        return null;
	    }
	}
	
	@Override
	public void hideSoftKeyboard() {
		if (driver instanceof HasOnScreenKeyboard
		        && ((HasOnScreenKeyboard) driver).isKeyboardShown()) {
			this.driver.hideKeyboard();
		}
	}

	/**
	 * Initialise the controller
	 * 
	 * @throws MalformedURLException
	 */
	protected void initialise() throws MalformedURLException {
		DesiredCapabilities capabilities = new DesiredCapabilities();

		capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, MobilePosTestUtils.getMobilePlatformName());
		capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION,
				MobilePosTestUtils.getMobilePlatformVersion());
		capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, MobilePosTestUtils.getMobileDeviceName());
		if (StringUtils.notEmpty(MobilePosTestUtils.getMobileDeviceUUID())) {
			capabilities.setCapability(MobileCapabilityType.UDID, MobilePosTestUtils.getMobileDeviceUUID());
		}

		capabilities.setCapability(MobileCapabilityType.NEW_COMMAND_TIMEOUT,
				MobilePosTestUtils.getMobileCommandTimeoutSeconds());
		capabilities.setCapability(MobileCapabilityType.APP, MobilePosTestUtils.getMobileApplicationInstallerURL());
		addAdditionalCapabilities(capabilities);

		URL url = new URL(MobilePosTestUtils.getMobileAppiumServerBaseURL() + "/wd/hub");

		driver = createDriver(url, capabilities);

		// Visual-regression instrumentation (additive, behaviour-neutral): publish the live driver so
		// the per-step screenshot plugin can capture the current screen. See com.enactor.pos.mobile.visual.
		com.enactor.pos.mobile.visual.VisualRegressionDriverRegistry.register(driver);

		driver.manage().timeouts().implicitlyWait(MobilePosTestUtils.getMobileFindElementWaitTime(), TimeUnit.SECONDS);
	}

	protected void addAdditionalCapabilities(DesiredCapabilities capabilities) {
		// Do nothing by default
	}

	protected T getDriver() {
		return driver;
	}

	/**
	 * Created driver with the given capabilities.
	 * 
	 * @param url
	 * @param cap
	 * @return
	 */
	protected abstract T createDriver(URL url, DesiredCapabilities cap);
}
