package com.enactor.pos.mobile.web.android;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.pos.mobile.web.MobileThinClientWebPosStepsProvider;

/**
 * AndroidWebPosStepsProvider is a concrete implementation of the MobileWebPosStepProvider for
 * Android-based mobile web testing.
 * @author Uvindu.Ishara
 */
@SuppressWarnings("unchecked")
public class AndroidThinClientWebPosStepsProvider extends MobileThinClientWebPosStepsProvider {

	/**
	 * Static block that initializes the AndroidThinClientReactController.
	 */
	static {
		// Initialize the Android web controller
		WEB_CONTROLLER = new AndroidThinClientReactController();
		WEB_CONTROLLER.init();
	}
}
