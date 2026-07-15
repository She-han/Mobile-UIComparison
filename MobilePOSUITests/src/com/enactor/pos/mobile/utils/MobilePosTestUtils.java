package com.enactor.pos.mobile.utils;

/**
 * Utility for mobile POS test automation
 * 
 * @author Thushara.Ramasinghe
 *
 */
public class MobilePosTestUtils {

	public static final String MOBILE_PLATFORM_NAME = "autMobilePlatformName";
	public static final String MOBILE_PLATFORM_VERSION = "autMobilePlatformVersion";
	public static final String MOBILE_DEVICE_NAME = "autMobileDeviceName";
	public static final String MOBILE_DEVICE_UUID = "autMobileDeviceUUID";
	public static final String MOBILE_COMMAND_TIMEOUT = "autMobileCommandTimeoutSeconds";
	public static final String MOBILE_FIND_ELEMENT_WAIT_TIME = "autMobileFindElementWaitTime";
	public static final String MOBILE_APPIUM_SERVER_BASE_URL = "autMobileAppiumServerBaseURL";
	public static final String MOBILE_APPLICATION_INSTALLER_URL = "autMobileInstallerURL";
	public static final String MOBILE_PDP_HOST_NAME = "autMobilePDPHostName";
	public static final String MOBILE_PDP_HOST_PORT = "autMobilePDPHostPort";
	public static final String MOBILE_SERIAL_NUMBER = "autMobileSerialNumber";
	public static final String MOBILE_UI_FRAMWORK = "mobileUIFramwork";
	public static final String MOBILE_NO_RESET = "noRest";
	public static final String MOBILE_FULL_RESET = "fullRest";
	public static final String MOBILE_DEVICE_IP = "mobileDeviceIp";
	public static final String NATIVE_WEB_TAP = "nativeWebTap";
	public static final String WEBVIEW_READY_TIME_OUT = "webViewReadyTime";
	public static final String VENDOR_PREFIX = "vendorPrefix";
	public static final String AUTO_LAUNCH  = "autoLaunch";
	public static final String NATIVE_APP_NAME  = "nativeAppName";
	public static final String WEBVIEW_LOAD_TIMEOUT = "webviewLoadTimeOut";
	public static final String WAITING_TIME_OUT = "waitingTimeOut";
	public static final String USE_CUSTOM_DRIVER  = "useCustomDriver";
	public static final String USE_JS_CLICK  = "useJSClick";
	public static final String X_OFFSET_MULTIPLIER  = "xOffSetMultiplier";
	public static final String Y_OFFSET_MULTIPLIER  = "yOffSetMultiplier";
	
	
	public static String getMobilePlatformName() {
		return System.getProperty(MOBILE_PLATFORM_NAME);
	}
	
	public static String getMobilePlatformVersion() {
		return System.getProperty(MOBILE_PLATFORM_VERSION);
	}
	
	public static String getMobileDeviceName() {
		return System.getProperty(MOBILE_DEVICE_NAME);
	}

	public static String getMobileDeviceUUID() {
		return System.getProperty(MOBILE_DEVICE_UUID);
	}

	public static int getMobileCommandTimeoutSeconds() {
		return Integer.parseInt(System.getProperty(MOBILE_COMMAND_TIMEOUT, "120"));
	}

	public static int getMobileFindElementWaitTime() {
		return Integer.parseInt(System.getProperty(MOBILE_FIND_ELEMENT_WAIT_TIME, "30"));
	}

	public static String getMobileAppiumServerBaseURL() {
		return System.getProperty(MOBILE_APPIUM_SERVER_BASE_URL, "http://127.0.0.1:4723");
	}

	public static String getMobileApplicationInstallerURL() {
		return System.getProperty(MOBILE_APPLICATION_INSTALLER_URL);
	}
	
	public static String getMobilePDPHostName() {
		return System.getProperty(MOBILE_PDP_HOST_NAME);
	}

	public static String getMobilePDPHostPort() {
		return System.getProperty(MOBILE_PDP_HOST_PORT, "9090");
	}
	
	public static String getMobilePosDeviceId() {
		return System.getProperty("mobilePosDeviceId", "aut.MPOS1@0001.enactor");
	}

	public static String getSerialNumber() {
		return System.getProperty(MOBILE_SERIAL_NUMBER, null);
	}
	
	public static String getUIFramworkName() {
		return System.getProperty(MOBILE_UI_FRAMWORK, null);
	}
	
	public static boolean getNoRest() {
		return Boolean.parseBoolean(System.getProperty(MOBILE_NO_RESET, "true"));
	}
	
	public static boolean getFullReset() {
		return Boolean.parseBoolean(System.getProperty(MOBILE_FULL_RESET, "false"));
	}
	
	public static String getMobileDeviseIP() {
		return System.getProperty(MOBILE_DEVICE_IP, "127.0.0.1");
	}
	
	public static boolean getNativeWebTap() {
		return Boolean.parseBoolean(System.getProperty(NATIVE_WEB_TAP, "false"));
	}
	
	public static int webViewReadyTimeOut() {
		return Integer.parseInt(System.getProperty(WEBVIEW_READY_TIME_OUT, "3000"));
	}
	
	public static String getVendorPrefix() {
		return System.getProperty(VENDOR_PREFIX, "");
	}
	
	public static boolean getAutoLaunch() {
		return Boolean.parseBoolean(System.getProperty(AUTO_LAUNCH, "false"));
	}
	
	
	public static String getNativeAppName() {
		return System.getProperty(NATIVE_APP_NAME,"NATIVE_APP");
	}
	
	public static int getWebViewLoadTimeOut() {
		return Integer.parseInt(System.getProperty(WEBVIEW_LOAD_TIMEOUT, "180"));
	}
	
	public static int getWaitingTimeOut() { 
		return Integer.parseInt(System.getProperty(WAITING_TIME_OUT, "120"));
	}
	
	public static boolean getUseCustomDriver() {
		return Boolean.parseBoolean(System.getProperty(USE_CUSTOM_DRIVER, "false"));
	}
	
	public static boolean getUseJSClick() {
		return Boolean.parseBoolean(System.getProperty(USE_JS_CLICK, "false"));
	}
	
	public static double getxOffsetMutiplier() {
		return Double.parseDouble(System.getProperty(X_OFFSET_MULTIPLIER, "0.85"));
	}

	public static double getyOffsetMutiplier() {
		return Double.parseDouble(System.getProperty(Y_OFFSET_MULTIPLIER, "0.65"));
	}
}
