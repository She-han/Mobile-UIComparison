package com.enactor.pos.mobile.web;

public abstract class MobileLogicalDeviceStepProvider implements ILogicalDeviceStepProvider {

	protected static final int PRINTER_SLEEP_DURATION_MS = 2;

	/**
	 * Extracts the result value from a JSON string.
	 * 
	 * @param jsonString The JSON string from which to extract the result.
	 * @return The extracted result value as a String.
	 */
	protected String extractResultFromRecipt(String jsonString) {
		String result = jsonString.replaceFirst(".*\"result\":\"", "");

		result = result.substring(0, result.length() - 2);
		return result;
	}

	/**
	 * Safe sleep method that handles InterruptedException.
	 */
	protected void safeSleep(long seconds) {
		try {
			Thread.sleep(seconds * 1000);
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}
	}

	/**
	 * Converts the given device name to a logical device name by removing all
	 * whitespace.
	 * 
	 * @param deviceName The name of the device.
	 * @return The logical device name without any whitespace.
	 */
	protected String getLogicalDeviceName(String deviceName) {
		return deviceName.replaceAll("\\s", "");
	}

}
