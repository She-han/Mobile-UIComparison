package com.enactor.core.automation.AUT;

import com.enactor.core.automation.selenium.SeleniumWebController;
import com.enactor.coreUI.selenium.AutomationMode;
import com.enactor.coreUI.selenium.SeleniumConfig;

public class AUTWebTestManager {

	private static AUTWebTestManager instance;

	private IAUTWebController controller;

	public static AUTWebTestManager getInstance() {

		return new AUTWebTestManager();
	}

	private AUTWebTestManager() {
		init();
	}

	/**
	 * Returns the AUT controller.
	 *
	 * @return
	 */
	public IAUTWebController getController() {
		if(controller == null) {
			init();
		}
		return controller;
	}

	private void init() {
		controller = new SeleniumWebController();
		if (SeleniumConfig.getInstance().getBoolean(SeleniumConfig.PROPERTY_MIX_MODE, "false")) {
			SeleniumConfig.getInstance().setMode(AutomationMode.EM);
		}
		controller.init();
	}

	public void shutDown() {
		controller.quit();
		controller = null;
	}
}