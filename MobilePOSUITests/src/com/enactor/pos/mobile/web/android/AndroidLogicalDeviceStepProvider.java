package com.enactor.pos.mobile.web.android;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

import org.json.JSONObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.coreUI.peripherals.DeviceNames;
import com.enactor.coreUI.peripherals.LogicalDeviceUtils;
import com.enactor.pos.mobile.web.MobileLogicalDeviceStepProvider;

import io.appium.java_client.android.AndroidDriver;

/**
 * A class responsible for interacting with logical devices using Appium in a
 * mobile automation context.
 * 
 * @author Preminda.Bandara
 */
public class AndroidLogicalDeviceStepProvider extends MobileLogicalDeviceStepProvider {

	// mobile script execution related data
	private static final String MOBILE_SHELL = "mobile: shell";
	private static final String MOBILE_COMMOND = "command";

	// Result Strings
	private static final String STATE = "state";
	private static final String RESULT = "";

	// appium statement
	private static final String APPIUM_SEND_DATA_STM = "am startservice -a com.enactor.pos.ACTION_TRIGGER -e PARAM \"%s\" com.enactor.pos/com.enactor.android.pos.peripherals.appiumServices.AppiumBackgroundService";
	private static final String APPIUM_DATA_QUESRY_STM = "content query --uri content://com.enactor.pos.provider/data";
	private static final String SUB_ACTION = "{\\\"device\\\":\\\"%s\\\",\\\"subAction\\\":\\\"%s\\\",\\\"data\\\":\\\"%s\\\"}";

	private final AndroidDriver<WebElement> driver;

	protected FluentWait<AndroidDriver<WebElement>> wait;

	/**
	 * Constructs a LogicalDeviceStepProvider and initializes the driver and device
	 * mappings.
	 * 
	 * @param webDriver The AppiumDriver instance used for interaction.
	 */
	public AndroidLogicalDeviceStepProvider(AndroidDriver<WebElement> webDriver) {
		this.driver = webDriver;
		init();
	}

	/**
	 * Initializes the FluentWait object for the driver with timeout and polling
	 * interval.
	 */
	private void init() {
		wait = new FluentWait<AndroidDriver<WebElement>>(driver).withTimeout(40, TimeUnit.SECONDS)
				.pollingEvery(1, TimeUnit.SECONDS).ignoring(Exception.class);
	}

	@Override
	public void enterTextOnDevice(String text, String deviceName) {
		String param = String.format(SUB_ACTION, getLogicalDeviceName(deviceName),
				LogicalDeviceUtils.ACTION_ENTER_TEXT,
				text);
		String commond_stm = String.format(APPIUM_SEND_DATA_STM, param);

		mobileAppiumServiceScriptRunner(commond_stm);
	}

	@Override
	public void pressButtonOnDevice(String actionButton, String deviceName) {
		String param = String.format(SUB_ACTION, getLogicalDeviceName(deviceName),
				LogicalDeviceUtils.ACTION_PRESS_BUTTON, actionButton);
		String commond_stm = String.format(APPIUM_SEND_DATA_STM, param);

		mobileAppiumServiceScriptRunner(commond_stm);
	}

	@Override
	public void checkDevice(String deviceName, long time) {

		String param = String.format(SUB_ACTION, getLogicalDeviceName(deviceName),
				LogicalDeviceUtils.ACTION_CHECK_DEVICE, "none");
		String commond_stm = String.format(APPIUM_SEND_DATA_STM, param);

		mobileAppiumServiceScriptRunner(commond_stm);

		String status = wait.until(new Function<AndroidDriver<WebElement>, String>() {
			public String apply(AndroidDriver<WebElement> driver) {
				return (String) mobileAppiumQueryScriptRunner(APPIUM_DATA_QUESRY_STM, driver);
			}
		});

		if (resultParser(status).getString(STATE).equals(LogicalDeviceUtils.STATE_ERROR)) {
			throw new AutomationException(String.format("Device is not available %s", deviceName));
		}

	}

	@Override
	public String getReceiptText() {
		String param = String.format(SUB_ACTION,
				getLogicalDeviceName(DeviceNames.PRIMARY_PRINTER_NAME),
				LogicalDeviceUtils.ACTION_GET_TEXT, "none");
		String commond_stm = String.format(APPIUM_SEND_DATA_STM, param);
		safeSleep(PRINTER_SLEEP_DURATION_MS);
		mobileAppiumServiceScriptRunner(commond_stm);
		safeSleep(PRINTER_SLEEP_DURATION_MS);
		String status = wait.until(new Function<AndroidDriver<WebElement>, String>() {
			public String apply(AndroidDriver<WebElement> driver) {
				return (String) mobileAppiumQueryScriptRunner(APPIUM_DATA_QUESRY_STM, driver);
			}
		});

		String result = extractResultFromRecipt(status);

		if (!result.startsWith("<html>")) {
			throw new AutomationException(
					String.format("Data get from logical printer is not valid"));
		}

		return result;

	}

	@Override
	public void clearPrinter() {
		String param = String.format(SUB_ACTION,
				getLogicalDeviceName(DeviceNames.PRIMARY_PRINTER_NAME),
				LogicalDeviceUtils.ACTION_PRESS_BUTTON, "Clear");
		String commond_stm = String.format(APPIUM_SEND_DATA_STM, param);

		mobileAppiumServiceScriptRunner(commond_stm);
	}
	
	@Override
	public void selectComboboxItem(String testData, String componentId, String windowId) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * Executes a mobile shell command to start an Appium service with the given
	 * command statement.
	 * 
	 * @param commond_stm The command statement to be executed on the mobile device.
	 */
	private void mobileAppiumServiceScriptRunner(String commond_stm) {
		final Map<String, String> serviceStartParams = new HashMap<>();
		serviceStartParams.put(MOBILE_COMMOND, commond_stm);

		String re = wait.until(new Function<AndroidDriver<WebElement>, String>() {
			public String apply(AndroidDriver<WebElement> driver) {
				return (String) driver.executeScript(MOBILE_SHELL, serviceStartParams);
			}
		});

		if (!re.toString().startsWith("Starting service")) {
			throw new AutomationException(
					String.format("Issue when start android appium service with commond | %s |",
							commond_stm));
		}
	}

	/**
	 * Executes a mobile shell command to query data from the Appium service with
	 * the given command statement.
	 * 
	 * @param commond_stm The command statement to be executed on the mobile device.
	 * @param driver The AndroidDriver instance used for interaction.
	 * @return The result of the query as an Object.
	 */
	private Object mobileAppiumQueryScriptRunner(String commond_stm,
			AndroidDriver<WebElement> driver) {
		final Map<String, String> serviceStartParams = new HashMap<>();
		serviceStartParams.put(MOBILE_COMMOND, commond_stm);
		return (Object) driver.executeScript(MOBILE_SHELL, serviceStartParams);
	}

	/**
	 * Parses the result string into a JSONObject.
	 * 
	 * @param resultString The result string to be parsed.
	 * @return A JSONObject containing the parsed result.
	 */
	private JSONObject resultParser(String resultString) {
		String jsonString = resultString.replaceFirst(".*result=", "");
		JSONObject jsonObject = new JSONObject(jsonString);
		return jsonObject;
	}

}
