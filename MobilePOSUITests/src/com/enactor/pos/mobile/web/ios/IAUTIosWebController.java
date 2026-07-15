package com.enactor.pos.mobile.web.ios;

import org.openqa.selenium.By;

import com.enactor.core.automation.AUT.AutomationException;

/**
 * Interface for controlling iOS-specific web elements in an Automated Testing Framework.
 * This interface provides methods designed to handle unique behaviors of iOS web components.
 * 
 * @author Preminda.Bandara
 */
public interface IAUTIosWebController {
	
	/**
	 * Clicks on a combobox element in the iOS web application.
	 * 
	 * This method ensures proper interaction with combobox fields in iOS,
	 * where direct clicks may not propagate correctly to child elements.
	 * 
	 */
	public void clickComboboxElement(final By locator) throws AutomationException;
}
