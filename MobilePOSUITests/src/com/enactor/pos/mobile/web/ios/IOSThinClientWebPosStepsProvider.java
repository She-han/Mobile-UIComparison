package com.enactor.pos.mobile.web.ios;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.pos.mobile.web.MobileThinClientWebPosStepsProvider;

public class IOSThinClientWebPosStepsProvider extends MobileThinClientWebPosStepsProvider {

	/**
	 * Static block that initializes the IOSThinClientWebPosStepsProvider.
	 */
	static {
		// Initialize the Android web controller
		WEB_CONTROLLER = new IOSThinClientReactController();
		WEB_CONTROLLER.init();
	}
}
