package com.enactor.pos.mobile.web.android;

import org.openqa.selenium.WebElement;

import com.enactor.pos.mobile.web.IAUTMobileWebController;
import com.enactor.pos.mobile.web.MobileWebPosStepProvider;

import io.appium.java_client.android.AndroidDriver;

/**
 * AndroidWebPosStepsProvider is a concrete implementation of the MobileWebPosStepProvider for
 * Android-based mobile web testing.
 * @author Preminda.Bandara
 */
@SuppressWarnings("unchecked")
public class AndroidWebPosStepsProvider extends MobileWebPosStepProvider {

	/**
	 * Static block that initializes the AndroidThickReactController and the
	 * AndroidLogicalDeviceStepProvider.
	 */
	static {
		// Initialize the Android web controller
		WEB_CONTROLLER = new AndroidThickReactController();
		WEB_CONTROLLER.init();

		// Initialize the logical device step provider for Android
		logicalDeviceStepProvider = new AndroidLogicalDeviceStepProvider(
				((IAUTMobileWebController<AndroidDriver<WebElement>>) WEB_CONTROLLER).getDriver());
	}
}
