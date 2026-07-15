package com.enactor.pos.mobile;

import java.util.List;

import com.enactor.core.automation.AUT.AutomationException;

import io.appium.java_client.MobileElement;

/**
 * UI Automation controller interface for the mobile.
 * 
 * @author Thushara.Ramasinghe
 *
 */
public interface IMobileAUTController {

	/**
	 * Returns the element associated with the given element id.
	 * 
	 * @param elementId
	 * @return
	 * @throws AutomationException
	 */
	public MobileElement findElement(String elementId) throws AutomationException;
	
	/**
	 * Returns the first element whose content contains the given elementId suffix.
	 * 
	 * @param elementId
	 * @return
	 * @throws AutomationException
	 */
	public MobileElement findElementByXpathSuffix(String elementId) throws AutomationException;

	/**
	 * Returns the element havinf the given label text.
	 * 
	 * @param label
	 * @return
	 * @throws AutomationException
	 */
	public MobileElement findElementByLabelText(String label) throws AutomationException;
	
	/**
	 * Returns the list of mobile elements in the list box with the given id.
	 * 
	 * @param elementId
	 * @return
	 * @throws AutomationException
	 */
	public List<String> getTextInListItems(String elementId) throws AutomationException;

	/**
	 * Returns the element of label in the panel with the given id.
	 * 
	 * @param elementId
	 * @return
	 * @throws AutomationException
	 */
	public String getTextInLabelField(String elementId) throws AutomationException;
	
	/**
	 * Returns the element with the given text value in the list box.
	 * 
	 * @param listElementId
	 * @param text
	 * @return
	 * @throws AutomationException
	 */
	public MobileElement findTextElementInList(String listElementId, String text) throws AutomationException;

	/**
	 * Starts the test controller.
	 * 
	 * @throws AutomationException
	 */
	public void start() throws AutomationException;

	/**
	 * Shutdown the test controller.
	 * 
	 * @throws AutomationException
	 */
	public void shutdown() throws AutomationException;
	
	/**
	 * Return whether the controller is running.
	 * 
	 * @return
	 */
	public boolean isRunning();
	
	/**
	 * Capture the screen shot and returns the result byte array
	 * 
	 * @return
	 * @throws AutomationException
	 */
	public byte[] captureScreenShot() throws AutomationException;
	
	/**
	 * Press on the given button element
	 * 
	 * @param buttonElement
	 */
	public void pressButton(MobileElement buttonElement);
	
	/**
	 *  Returns the string of component inner content.
	 *
	 * @param mobileElement
	 * @return
	 * @throws AutomationException
	 */
	public String getComponentInnerContent(MobileElement mobileElement) throws AutomationException;
	
	/**
	 *  Select the combobox item related to the elementId.
	 *
	 * @param mobileElement
	 * @return
	 * @throws AutomationException
	 */
	public void selectComboboxItem(String testData, String elementId) throws AutomationException;
	
	
	/**
	 * Enters the specified value into the given input element.
	 *
	 * @param mobileElement
	 * @param value the string value to input into the element
	 */
	public void enterValueForInput(MobileElement element, String value);
	
	/**
	 * Get Page Source and returns the result String
	 * 
	 * @return
	 * @throws AutomationException
	 */
	public String getPageSource();
	
	/**
	 * Extracts the current URL from the active WebView using Chrome DevTools
	 * 
	 * @return
	 * @throws AutomationException
	 */
	public String getWebViewURL();
	
	/**
	 * Hides the on-screen (soft) keyboard if it is currently displayed.
	 * 
	 * @return
	 * @throws AutomationException
	 */
	public void hideSoftKeyboard();
	
	/**
	 * Trigger the Enter key event
	 * 
	 * @return
	 */
	public void enterPress();
}
