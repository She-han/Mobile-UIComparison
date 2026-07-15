package com.enactor.pos.mobile;

import com.enactor.core.automation.AUT.AutomationException;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;

/**
 * Test controller for mobile thin clients.
 * 
 * @author Thushara.Ramasinghe
 *
 * @param <T>
 */
public abstract class MobileThinClinetTestController<T extends AppiumDriver<MobileElement>> extends MobileTestController<T> {

	@Override
	public void start() throws AutomationException {
		super.start();
		configure();
	}

	/**
	 * Run the configurations.
	 * 
	 */
	protected abstract void configure();

}
