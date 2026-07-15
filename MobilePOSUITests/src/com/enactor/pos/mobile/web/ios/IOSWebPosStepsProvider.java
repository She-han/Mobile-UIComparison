package com.enactor.pos.mobile.web.ios;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.pos.mobile.web.IAUTMobileWebController;
import com.enactor.pos.mobile.web.MobileWebPosStepProvider;

import io.appium.java_client.ios.IOSDriver;

public class IOSWebPosStepsProvider extends MobileWebPosStepProvider{

	/**
	 * Static block that initializes the AndroidThickReactController and the
	 * AndroidLogicalDeviceStepProvider.
	 */
	static {
		// Initialize the Android web controller
		WEB_CONTROLLER = new IOSThickReactController();
		WEB_CONTROLLER.init();

		// Initialize the logical device step provider for Android
		logicalDeviceStepProvider = new IOSLogicalDeviceStepProvider(
				((IAUTMobileWebController<IOSDriver<WebElement>>) WEB_CONTROLLER).getDriver());
	}
	
	
	@Override
	public void selectComboboxItem(String item, String field, String windowName) throws AutomationException {
		if (isPeripheralWindow(windowName)) {
			logicalDeviceStepProvider.selectComboboxItem(getTestData(item), getComponentId(field),
					getWindowId(windowName));
		} else {
			selectComboboxItem(item, field);
			
		}
	}
	
	
	private void selectComboboxItem(String item, String field) {
		((IAUTIosWebController) getWebController()).clickComboboxElement(By.xpath(getXpathForComboBox(field)));
		((IAUTIosWebController) getWebController()).clickComboboxElement(By.xpath(getXpathForComboBoxOption(field, getTestData(item))));
	};
	
}
