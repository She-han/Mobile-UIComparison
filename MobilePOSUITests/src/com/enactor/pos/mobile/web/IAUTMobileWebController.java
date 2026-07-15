package com.enactor.pos.mobile.web;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.enactor.core.automation.AUT.AutomationException;

import io.appium.java_client.AppiumDriver;

/**
 * Interface for a Mobile Web Controller in an Automated Testing Framework.
 * This interface provides methods for controlling the mobile web application.
 *
 * @param <T> The type of AppiumDriver used for interacting with web elements.
 * @param <WebElement> The type representing the web elements in the mobile application.
 * @author Preminda Bandara
 */
public interface IAUTMobileWebController<T extends AppiumDriver<WebElement>> {

	/**
	 * Restarts the mobile application.
	 */
	void restartApplication();

	/**
	 * Fetches the attribute of an element based on its inner text.
	 * 
	 * @param locator The locator to identify the web element.
	 * @return The attribute of the web element as a string.
	 * @throws AutomationException If an error occurs during fetching the attribute.
	 */
	public String getAttributeInElementWithInnerText(By locator) throws AutomationException;

	/**
	 * Fetches the attribute of an element based on its inner HTML.
	 * 
	 * @param locator The locator to identify the web element.
	 * @return The attribute of the web element as a string.
	 * @throws AutomationException If an error occurs during fetching the attribute.
	 */
	public String getAttributeInElementWithInnerHTML(By locator) throws AutomationException;

	/**
	 * Retrieves the Appium driver for interacting with web elements.
	 * 
	 * @return The AppiumDriver instance.
	 */
	T getDriver();
}
