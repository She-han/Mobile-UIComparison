package com.enactor.pos.mobile.utils;

/**
 * Utility for Android POS test automation
 * 
 * @author Preminda.Bandara
 */
public class AndroidPosTestUtils {

	public static final String ANDROID_APPLICATION_PACKAGE_NAME = "androidAppPackageName";
	public static final String ANDROID_APPLICATION_MAIN_ACTIVITY = "androidMainActivity";
	public static final String CHROME_DRIVE_PATH = "chromedriverPath";
	public static final String CLEAR_DEVICE_LOGS_ON_START = "clearDeviceLogsOnStart";
	public static final String MOBILE_WEB_VIEW = "mobileWebView";
	public static final String NATIVE_APP_NAME = "nativeAppName";
	public static final String WEBVIEW_LOAD_TIMEOUT = "webviewLoadTimeOut";
	public static final String DEVICE_READY_TIMEOUT = "deviceReadyTimeOut";
	public static final String AUTO_GRANT_PERMISSION = "autoGrantPermission";
	public static final String WEBVIEW_CONNECT_TIMEOUT = "webviewConnectTimeout"; 
	public static final String CHROME_USE_SYSTEM_EXE = "chromeUseSystemExe"; 
	public static final String ENSURE_WEBVIEW_HAS_PAGE = "ensureWebviewHasPage";

	
	

	public static String getAndroidApplicationPackageName() {
		return System.getProperty(ANDROID_APPLICATION_PACKAGE_NAME);
	}

	public static String getAndroidApplicationMainActivity() {
		return System.getProperty(ANDROID_APPLICATION_MAIN_ACTIVITY);
	}

	public static String getChromeDrivePath() {
		return System.getProperty(CHROME_DRIVE_PATH);
	}

	public static boolean getClearDeviceLogOnStart() {
		return Boolean.parseBoolean(System.getProperty(CLEAR_DEVICE_LOGS_ON_START));
	}

	public static String getWebView() {
		return System.getProperty(MOBILE_WEB_VIEW, "WEBVIEW_com.enactor.pos");
	}

	public static String getNativeAppName() {
		return System.getProperty(NATIVE_APP_NAME);
	}
	
	public static int getWebViewLoadTimeOut() {
		return Integer.parseInt(System.getProperty(WEBVIEW_LOAD_TIMEOUT, "180"));
	}
	
	public static int getDeviceReadyTimeout() {
		return Integer.parseInt(System.getProperty(DEVICE_READY_TIMEOUT, "60"));
	}

	public static boolean getAutoGrantPermission() {
		return Boolean.parseBoolean(System.getProperty(AUTO_GRANT_PERMISSION, "true"));
	}

	public static int getWebviewConnectTimeout() {
		return Integer.parseInt(System.getProperty(WEBVIEW_CONNECT_TIMEOUT, "900000"));
	}

	public static boolean getChromeUseSystemExe() {
		return Boolean.parseBoolean(System.getProperty(CHROME_USE_SYSTEM_EXE, "false"));
	}

	public static boolean getEnsureWebviewHasPage() {
		return Boolean.parseBoolean(System.getProperty(ENSURE_WEBVIEW_HAS_PAGE, "true"));
	}

}
