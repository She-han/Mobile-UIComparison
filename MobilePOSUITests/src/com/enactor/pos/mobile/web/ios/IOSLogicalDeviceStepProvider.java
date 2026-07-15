package com.enactor.pos.mobile.web.ios;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import org.json.JSONException;
import org.json.JSONObject;
import org.openqa.selenium.WebElement;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.coreUI.peripherals.DeviceNames;
import com.enactor.coreUI.peripherals.LogicalDeviceUtils;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;
import com.enactor.pos.mobile.web.MobileLogicalDeviceStepProvider;

import io.appium.java_client.ios.IOSDriver;

/**
 * iOS implementation of the LogicalDeviceStepProvider interface.
 * Handles device interactions through HTTP endpoints for iOS devices.
 */
public class IOSLogicalDeviceStepProvider extends MobileLogicalDeviceStepProvider {

	private static final String TRIGGER_ENDPOINT_URL = String.format("http://%s:55501/trigger",
			MobilePosTestUtils.getMobileDeviseIP());
	private static final String CONTENT_TYPE_JSON = "application/json";
	private static final String CLEAR_BUTTON = "Clear";
	private static final String STATE = "state";

	private final IOSDriver<WebElement> driver;

	public IOSLogicalDeviceStepProvider(IOSDriver<WebElement> driver) {
		this.driver = driver;
		System.out.println(TRIGGER_ENDPOINT_URL);
	}

	/**
	 * Makes HTTP POST request to the trigger endpoint with device action parameters.
	 * 
	 * @param device The target device name
	 * @param subAction The action to perform on the device
	 * @param data The data payload for the action
	 * @return Response string from the endpoint
	 */
	private String callTriggerEndpoint(String device, String subAction, String data) {
		try {
			JSONObject payload = createPayload(device, subAction, data != null ? data : "");

			URL url = new URL(TRIGGER_ENDPOINT_URL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", CONTENT_TYPE_JSON);
			conn.setDoOutput(true);

			try (OutputStream os = conn.getOutputStream()) {
				os.write(payload.toString().getBytes(StandardCharsets.UTF_8));
			}

			try (BufferedReader reader = new BufferedReader(
					new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
				StringBuilder response = new StringBuilder();
				String line;
				while ((line = reader.readLine()) != null) {
					response.append(line);
				}
				return response.toString();
			}

		} catch (Exception e) {
			throw new AutomationException("Logical Device HTTP call failed: " + e.getMessage());
		}
	}

	/**
	 * Creates a JSON payload for the HTTP request.
	 */
	private JSONObject createPayload(String device, String subAction, String data) {
		JSONObject payload = new JSONObject();
		payload.put("device", device);
		payload.put("subAction", subAction);
		payload.put("data", data);
		return payload;
	}

	@Override
	public void enterTextOnDevice(String text, String windowName) {
		executeDeviceAction(windowName, LogicalDeviceUtils.ACTION_ENTER_TEXT, text,
				String.format("Failed to enter text '%s' on device '%s'.", text, windowName));
	}

	@Override
	public void pressButtonOnDevice(String actionButton, String windowName) {
		executeDeviceAction(windowName, LogicalDeviceUtils.ACTION_PRESS_BUTTON, actionButton,
				String.format("Failed to press button '%s' on device %s.", actionButton,
						windowName));
	}

	@Override
	public void checkDevice(String windowName, long time) {
		executeDeviceAction(windowName, LogicalDeviceUtils.ACTION_CHECK_DEVICE, "",
				String.format("Device '%s' is not available", windowName));
	}

	@Override
	public String getReceiptText() {

		executeDeviceAction(DeviceNames.PRIMARY_PRINTER_NAME, LogicalDeviceUtils.ACTION_GET_TEXT,
				"",
				"Failed to retrieve text from primary printer");

		safeSleep(PRINTER_SLEEP_DURATION_MS);

		String dataResponse = callTriggerEndpoint(DeviceNames.PRIMARY_PRINTER_NAME,
				LogicalDeviceUtils.GET_DEVICE_DATA_ACTION, "");

		String htmlContent = extractResultFromRecipt(dataResponse);

		if (!htmlContent.startsWith("<html>")) {
			throw new AutomationException(
					String.format("Data get from logical printer is not valid"));
		}

		return htmlContent;
	}

	@Override
	public void clearPrinter() {
		String response = callTriggerEndpoint(DeviceNames.PRIMARY_PRINTER_NAME,
				LogicalDeviceUtils.ACTION_PRESS_BUTTON, CLEAR_BUTTON);
		JSONObject result = resultParser(response);
		if (result.getString(STATE).equals(LogicalDeviceUtils.STATE_ERROR)) {
			throw new AutomationException("Unable to clear printer correctly");
		}
	}
	
	@Override
	public void selectComboboxItem(String testData, String componentId, String windowId) {
		// TODO Auto-generated method stub
		
	}

	private JSONObject resultParser(String resultString) {
		try {
			return new JSONObject(resultString);
		} catch (Exception e) {
			throw new AutomationException("Unexpected error during parse device server response",
					e);
		}
	}

	// Common function to handle the device operations
	private void executeDeviceAction(String windowName, String action, String parameter,
			String errorMessage) {
		String logicalDeviceName = getLogicalDeviceName(windowName);
		String response = callTriggerEndpoint(logicalDeviceName, action, parameter);

		JSONObject result;
		try {
			result = resultParser(response);
		} catch (JSONException e) {
			throw new AutomationException("Failed to parse JSON response: " + response, e);
		}

		if (LogicalDeviceUtils.STATE_ERROR.equals(result.optString(STATE))) {
			throw new AutomationException(errorMessage);
		}
	}
}