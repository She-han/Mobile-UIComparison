package com.enactor.pos.mobile.utils;

/**
 * Utility class for fetching iOS-specific configuration from system properties.
 * 
 * Keeps capabilities clean and decoupled from hardcoded values.
 * 
 * Example usage: capabilities.setCapability(IOSMobileCapabilityType.BUNDLE_ID,
 * IOSPosTestUtils.getBundleId());
 */
public class IOSPosTestUtils {

	public static final String IOS_BUNDLE_ID = "iosBundleId";
	public static final String IOS_AUTOMATION_NAME = "iosAutomationName";
	public static final String IOS_NO_RESET = "iosNoReset";
	public static final String IOS_CONNECT_HARDWARE_KEYBOARD = "iosConnectHardwareKeyboard";
	public static final String IOS_INCLUDE_SAFARI_IN_WEBVIEWS = "iosIncludeSafariInWebviews";
	public static final String IOS_IGNORE_HIDDEN_API_POLICY_ERROR = "iosIgnoreHiddenApiPolicyError";
	public static final String MAX_TYPEING_FREQUENCY = "maxTypingFrequency";
	public static final String SEND_KEY_STRATEGY = "sendKeyStrategy";
	public static final String USE_NEW_WDA = "useNewWDA";
	public static final String WDA_STARTUP_RETRIES = "wdaStartupRetries";
	public static final String WDA_STARTUP_RETRY_INTERVAL = "wdaStartupRetryInterval";
	public static final String WDA_LAUNCH_TIMEOUT = "wdaLaunchTimeout";
	public static final String WDA_CONNECTION_TIMEOUT = "wdaConnectionTimeout";
	public static final String WAIT_FOR_QUIESCENCE = "waitForQuiescence";
	public static final String AUTO_DISMISS_ALERTS = "autoDismissAlerts";
	public static final String AUTO_ACCEPT_ALERTS = "autoAcceptAlerts";
	public static final String COMMAND_TIMEOUTS = "commandTimeouts";

	// ... static final Strings omitted for brevity ...

	/** @return iOS app bundle identifier from system property `iosBundleId`. */
	public static String getBundleId() {
		return System.getProperty(IOS_BUNDLE_ID);
	}

	/**
	 * @return iOS automation engine name from system property `iosAutomationName`.
	 */
	public static String getAutomationName() {
		return System.getProperty(IOS_AUTOMATION_NAME);
	}

	/** @return "noReset" behavior from system property `iosNoReset`. */
	public static String getNoReset() {
		return System.getProperty(IOS_NO_RESET);
	}

	/**
	 * @return Whether to connect hardware keyboard, from
	 *         `iosConnectHardwareKeyboard`.
	 */
	public static String getConnectHardwareKeyboard() {
		return System.getProperty(IOS_CONNECT_HARDWARE_KEYBOARD);
	}

	/**
	 * @return Whether to include Safari contexts in WebView list, from
	 *         `iosIncludeSafariInWebviews`.
	 */
	public static String getIncludeSafariInWebviews() {
		return System.getProperty(IOS_INCLUDE_SAFARI_IN_WEBVIEWS);
	}

	/**
	 * @return Whether to ignore hidden API policy errors, from
	 *         `iosIgnoreHiddenApiPolicyError`.
	 */
	public static String getIgnoreHiddenApiPolicyError() {
		return System.getProperty(IOS_IGNORE_HIDDEN_API_POLICY_ERROR);
	}
	/**
	 * @return Maximum typing frequency in characters per second. Defaults to 20 if
	 *         not set.
	 */
	public static int getMaxTypeFrequency() {
		return Integer.parseInt(System.getProperty(MAX_TYPEING_FREQUENCY, "20"));
	}

	/**
	 * @return Send key strategy (e.g., "grouped", "oneByOne"). Defaults to
	 *         "grouped" if not set.
	 */
	public static String getSendKeyStrategy() {
		return System.getProperty(SEND_KEY_STRATEGY, "grouped");
	}

	/**
	 * @return Whether to use the new WebDriverAgent. Defaults to true.
	 */
	public static boolean getUseNewWDA() {
		return Boolean.parseBoolean(System.getProperty(USE_NEW_WDA, "true"));
	}

	/**
	 * @return Number of WDA startup retries. Defaults to 5.
	 */
	public static int getWdaStartupRetries() {
		return Integer.parseInt(System.getProperty(WDA_STARTUP_RETRIES, "3"));
	}

	/**
	 * @return Interval (ms) between WDA startup retries. Defaults to 2000 ms.
	 */
	public static int getWdaStartupRetryInterval() {
		return Integer.parseInt(System.getProperty(WDA_STARTUP_RETRY_INTERVAL, "2000"));
	}

	/**
	 * @return WDA launch timeout in milliseconds. Defaults to 30000 ms.
	 */
	public static int getWdaLaunchTimeout() {
		return Integer.parseInt(System.getProperty(WDA_LAUNCH_TIMEOUT, "180000"));
	}

	/**
	 * @return WDA connection timeout in milliseconds. Defaults to 30000 ms.
	 */
	public static int getWdaConnectionTimeout() {
		return Integer.parseInt(System.getProperty(WDA_CONNECTION_TIMEOUT, "180000"));
	}

	/**
	 * @return Whether to wait for quiescence (idle state). Defaults to false.
	 */
	public static boolean getWaitForQuiescence() {
		return Boolean.parseBoolean(System.getProperty(WAIT_FOR_QUIESCENCE, "false"));
	}

	/**
	 * @return Whether to automatically dismiss alerts. Defaults to true.
	 */
	public static boolean getAutoDismissAlerts() {
		return Boolean.parseBoolean(System.getProperty(AUTO_DISMISS_ALERTS, "true"));
	}

	/**
	 * @return Whether to automatically accept alerts. Defaults to false.
	 */
	public static boolean getAutoAcceptAlerts() {
		return Boolean.parseBoolean(System.getProperty(AUTO_ACCEPT_ALERTS, "false"));
	}

	/**
	 * @return JSON string representing Appium command timeouts. Defaults to
	 *         {"default": 60000, "find": 60000}.
	 */
	public static String getCommandTimeouts() {
		return System.getProperty(COMMAND_TIMEOUTS, "{\"default\": 1800000, \"find\": 1800000}");
	}

}
