package com.enactor.pos.mobile.capabilities;


/**
 * Capability Types for Android POS test automation
 * 
 * @author Preminda.Bandara
 */
public interface AndroidMobileCapabilityType extends ThickMobileCapabilityType {
	
	String ANDROID_APP_PACKAGE = PREFIX+"appPackage";
	String ANDROID_APP_ACTIVITY = PREFIX+"appActivity";
	String CHROME_DRIVE_EXECUTABLE = PREFIX+"chromedriverExecutable";
	String CLEAR_DEVICE_LOGS_ON_START = PREFIX+"clearDeviceLogsOnStart";
	String AUTO_GRANT_PERMISSION = PREFIX+"autoGrantPermissions";
	String DEVICE_READY_TIME_OUT = PREFIX+"androidDeviceReadyTimeout";
	String WEBVIEW_CONNECT_TIMEOUT = PREFIX+"webviewConnectTimeout";
	String CHROME_USE_SYSTEM_EXE = PREFIX+"chromedriverUseSystemExecutable";
	String ENSURE_WEBVIEW_HAS_PAGE = PREFIX+"ensureWebviewsHavePages";
}

