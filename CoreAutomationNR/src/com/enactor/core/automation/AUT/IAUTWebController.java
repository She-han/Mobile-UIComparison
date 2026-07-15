package com.enactor.core.automation.AUT;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

/**
 * Interface for an AUT Controller.
 *
 * @author Hirantha Bandara
 *
 */
public interface IAUTWebController {

	/** The default timeout of 5 seconds to wait for an element*/
	public static final long ELEMENT_WAIT_TIMEOUT = 5*1000;
	/** The default sleep timer of 100ms */
	public static final long SLEEP_TIMER = 100;
	
	public static final long SLEEP = 2000;

	public static final long WAIT_TIMEOUT = 30;

	/** Match type enumeration. */
	public enum MatchType {
		EQUALS, EQUALS_IGNORE_CASE, STARTS_WITH, STARTS_WITH_IGNORE_CASE, ENDS_WITH, ENDS_WITH_IGNORE_CASE, CONTAINS, CONTAINS_IGNORE_CASE
	};

	/**
	 * Initialise the controller
	 */
	public void init();

	/**
	 * Add given cookie to the browser
	 *
	 * @param 	name
	 * @param 	value
	 * @throws 	AutomationException
	 */
	public void addCookie(String name, String value) throws AutomationException;

	/**
	 * Capture and return a screenshot
	 *
	 * @return 	The captured screenshot
	 * @throws 	Exception
	 */
	public File captureScreenshot() throws Exception;

	/**
	 * Reload the given page url
	 *
	 * @param 	url
	 * @throws 	AutomationException
	 */
	public void reloadPage(String url) throws AutomationException;

	/**
	 * Stops the controller
	 */
	public void quit();

	/**
	 * Enter the given text to the element
	 *
	 * @param 	locator
	 * 		  	The By locator of the element
	 * @param 	text
	 *		  	The text to be entered on the element
	 * @throws 	AutomationException
	 */
	public void enterText(By locator, String text) throws AutomationException;
	
	/**
	 * Enter the given text to the element and then force to focus out/ blur from
	 * the element
	 * 
	 * @param locator
	 * @param text
	 * @throws AutomationException
	 */
	public void enterTextWithBlurEffect(By locator, String text) throws AutomationException;

	/**
	 * Enter the given text to the element
	 *
	 * @param 	element
	 * @param 	text
	 * 		  	The text to be entered on the element
	 * @throws 	AutomationException
	 */
	public void enterText(WebElement element, String text) throws AutomationException;

	/**
	 * Returns true if the element is enabled on the page.
	 *
	 * @param 	locator
	 * 		  	The By locator of the element
	 * @throws 	AutomationException
	 */
	public boolean isElementEnabled(By locator) throws AutomationException;

	/**
	 * Returns true if the element is enabled on the page.
	 *
	 * @param 	element
	 * @throws 	AutomationException
	 */
	public boolean isElementEnabled(WebElement element) throws AutomationException;

	/**
	 * Returns true if the element is visible
	 *
	 * @param 	locator
	 * 		  	The By locator of the element
	 * @throws 	AutomationException
	 */
	public boolean isElementVisible(By locator) throws AutomationException;


	/**
	 * Returns true if at least single element available in the DOM for the given locator
	 * This method does not check the visibility of the element.
	 * Return true even if hidden elements are present for the given locator in DOM
	 *
	 * @param locator
	 * @return
	 * @throws AutomationException
	 */
	public boolean atLeastSingleElementAvailable(By locator) throws AutomationException;

	/**
	 * Returns true if the given element is visible
	 *
	 * @param 	element
	 * @throws 	AutomationException
	 */
	public boolean isElementVisible(WebElement element) throws AutomationException;

	/**
	 * Wait for an element to become visible and returns that element.
	 * There is a default timeout of {@value #ELEMENT_WAIT_TIMEOUT} ms.
	 * Execution suspends by default for {@value #SLEEP_TIMER} ms before retrying.
	 *
	 * @param 	locator
	 * 		  	The By locator of the element
	 *
	 * @return 	The web element
	 *
	 * @throws 	AutomationException
	 * 			if after {@value #ELEMENT_WAIT_TIMEOUT} then an AutomationException is thrown.
	 */
	public WebElement waitForElement(By locator) throws AutomationException;

	/**
	 * Wait for an element to become visible and returns that element.
	 * Execution suspends by default for {@value #SLEEP_TIMER} ms before retrying.
	 *
	 * @param 	locator
	 * 		  	The By locator of the element
	 *
	 * @param 	timeout
	 * 			The number of ms to wait for the element
	 *
	 * @return 	The web element
	 *
	 * @throws 	AutomationException
	 * 			if after {@code timeout} then an AutomationException is thrown.
	 */
	public WebElement waitForElement(By locator, long timeout) throws AutomationException;

	/**
	 * Wait for an element to become visible and returns that element.
	 *
	 * @param 	locator
	 * 		  	The By locator of the element
	 *
	 * @param 	timeout
	 * 		  	The number of ms to wait for the element
	 *
	 * @param 	sleep
	 * 		  	The sleep time(ms) between trying to find the element
	 *
	 * @return 	The web element
	 *
	 * @throws 	AutomationException
	 * 			if after {@code timeout} then an AutomationException is thrown.
	 */
	public WebElement waitForElement(By locator, long timeout, long sleep) throws AutomationException;
	
	/**
	 * Wait for an IFrame element to become visible and returns that element.
	 * Execution suspends by default for {@value #SLEEP_TIMER} ms before retrying.
	 *
	 * @param locator By locator of the element
	 * @param timeout number of ms to wait for the element
	 * @param frameId id of the IFrame Element
	 * @return The web element
	 * @throws AutomationException
	 */
	public WebElement waitForIFrameElement(By locator, long timeout, String frameId) throws AutomationException;
	
	/**
	 * Attempts to click on an element
	 * @param 	locator
	 * 		  	The By locator of the element
	 * @throws 	AutomationException
	 */
	public void clickElement(final By locator) throws AutomationException;
	
	/**
	 * Attempts to click on an element if it is present in DOM
	 * 
	 * @param 	locator
	 * 		  	The By locator of the element
	 * @throws 	AutomationException
	 */
	public void clickElementIfPresent(By locator) throws AutomationException;

	/**
	 * Attempts to click on an element using javascript
	 *
	 * @param locator
	 * @throws AutomationException
	 */
	public void clickElementWithJavascript(By locator) throws AutomationException;

	/**
	 * Attempts to click on an element
	 * @param 	element
	 * 		  	The By locator of the element
	 * @throws 	AutomationException
	 */
	@Deprecated
	public void clickElement(WebElement element) throws AutomationException;
	
	/**
	 * Attempts to click a button and click the label inside the pop up when it is visible.
	 * @param 	element
	 * 		  	The By locator of the element
	 * @param   label
	 * 			By the locator of the span text
	 * @throws 	AutomationException
	 */
	@Deprecated
	public void clickElements(WebElement element, String label) throws AutomationException;


	/*******************************************************************************************************************
	 * Deprecated
	 ******************************************************************************************************************/

	/**
	 * Enter the given text to the component
	 *
	 * @param componentId
	 * @param text
	 * @throws AutomationException
	 */
	@Deprecated
	public void enterText(String componentId, String text) throws AutomationException;

	/**
	 * Enter the given text to the component
	 *
	 * @param componentId
	 * @param text
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean enterOptionalText(String componentId, String text) throws AutomationException;

	/**
	 * Returns true if the given component is visible
	 *
	 * @param componentId
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean isElementVisible(String componentId) throws AutomationException;

	/**
	 * Returns true if the span with given text is available
	 *
	 * @param text
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean isSpanWithTextAvailable(String text) throws AutomationException;
	
	/**
	 * Returns true if the button with given text is available
	 *
	 * @param text
	 * @return
	 * @throws AutomationException
	 */
	boolean isButtonWithTextAvailable(String text) throws AutomationException;

	/**
	 * Click on the button referred by the style class
	 *
	 * @param className
	 * @throws AutomationException
	 */
	@Deprecated
	public void clickOnLinkButton(String className) throws AutomationException;

	/**
	 * Click on the button referred by the style class inside a given element
	 *
	 * @param className
	 * @throws AutomationException
	 */
	@Deprecated
	public void clickOnLinkButton(String className, String targetComponentId) throws AutomationException;

	/**
	 * Click on the button referred by the component id
	 *
	 * @param componentId
	 * @throws AutomationException
	 */
	@Deprecated
	public void clickOnButton(String componentId) throws AutomationException;
	
	/**
	 * Click on the button with label
	 *
	 * @param text
	 * @throws AutomationException
	 */
	public void clickOnButtonWithText(String text) throws AutomationException;

	/**
	 * Click on the menu button referred by the given label
	 *
	 * @param label
	 * @throws AutomationException
	 */
	@Deprecated
	public void clickOnMenuButton(String label) throws AutomationException;

	/**
	 * Click on the menu button referred by the given label and given class
	 *
	 * @param label
	 * @param className
	 * @throws AutomationException
	 */
	@Deprecated
	public void clickOnMenuButtonWithClass(String label, String className) throws AutomationException;

	/**
	 * Click on the a label button referred by the given label and given class
	 * Then verify if the given text has appeared
	 *
	 * @param label Label to click
	 * @param className Class of the Label
	 * @param expectedText Expected text to appear 
	 * @param expectedClass Class of expected text
	 * @throws AutomationException
	 */
	public void clickOnLabelWithClassAndVerify(String label, String className, String expectedText, String expectedClass) throws AutomationException;
	
	/**
	 * Returns the text held by the component matched by the item locator
	 * @param locator
	 * @throws AutomationException
	 */
	public String getTextByLocator(By locator) throws AutomationException;
	
	/**
	 * Returns text held by the component referred by the locator inside the IFrame
	 *
	 * @param frameId id of the frame element
	 * @param locator Locator of the element that is inside the IFrame
	 * @return The text held by the element
	 * @throws AutomationException
	 */
	public String getTextByLocatorWithinIFrame(String frameId, By locator) throws AutomationException;

	/**
	 * Returns a locator to find text within span tags.
	 *
	 * @param spanText
	 * @return
	 */
	public By getSpanLocator(String spanText) throws AutomationException;

	/**
	 * Returns a locator to find text within button tags.
	 *
	 * @param spanText
	 * @return
	 */
	public By getButtonLocator(String buttonText) throws AutomationException;

	/**
	 * Clicks on a link in a result row with the specified class when a row with cell text matching itemText is
	 * discovered.
	 *
	 * Only the first match will be clicked.
	 *
	 * @param itemText
	 * @param buttonClass
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public void executeItemWithTextOnCurrentPage(String itemText, String buttonClass) throws AutomationException;

	/**
	 * Clicks on a link in a result row with the specified class when a row with cell texts matching
	 * given texts is
	 * discovered.
	 * Only the first match will be clicked.
	 *
	 * @param cellTexts
	 * @param buttonClass
	 * @return
	 */
	public void executeItemWithTextOnCurrentPage(List<String> cellTexts, String buttonClass)
			throws AutomationException;
	
	public void executeItemWithTextOnCurrentPageTab(String cellTexts, String buttonClass)
			throws AutomationException;
	/**
	 * Returns true if the filtered table contains a cell with the specified item text.
	 *
	 * @param itemText The text to search for.
	 * @param columnText The column to search.
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean filteredListContainsItem(String itemText, String columnText) throws AutomationException;

	/**
	 * Returns true if the filtered table contains results with column values matching with the specified values.
	 *
	 * @param tableLocater
	 * @param dataMap data values for searching the table
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean filteredListContainsItem(By tableLocater, Map<String, String> dataMap) throws AutomationException;

	/**
	 * Select the (visible text) value of Region select. If value is null, then select the first option.
	 *
	 * @param value
	 * @param componentId
	 * @throws AutomationException
	 */
	@Deprecated
	public void selectValue(String value, String componentId) throws AutomationException;

	/**
	 * Select the (visible text) value of Region select. If value is null, then select the first option.
	 *
	 * @param value
	 * @param componentId
	 * @throws AutomationException
	 */
	@Deprecated
	public void selectValue(String value, String componentId, boolean wait) throws AutomationException;

	/**
	 * Select the edit button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void editItemWithText(String itemText) throws AutomationException;

	/**
	 * Select option button of the value .
	 *
	 * @param option
	 * @param itemText
	 * @throws AutomationException
	 */
	public void clickOptionOnItemWithText(String option, String itemText) throws AutomationException;

	/**
	 * Click the element with id in the row matching with given text.
	 *
	 * @param tableClass
	 * @param itemText
	 * @param id
	 * @throws AutomationException
	 */
	@Deprecated
	public void clickElementWithIdForGivenText(String tableClass, String itemText, String id) throws AutomationException;

	/**
	 * Finds whether the element with id in the row matching with given text is selected.
	 *
	 * @param tableClass
	 * @param value
	 * @param id
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean isElementWithIdForGivenTextSelected(String tableClass, String itemText, String id) throws AutomationException;

	/**
	 * Select the edit button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void viewItemWithText(String itemText) throws AutomationException;

	/**
	 * Select the view account history button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void viewItemAccountHistoryWithText(String itemText) throws AutomationException;

	/**
	 * Select the copy button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void copyItemWithText(String itemText) throws AutomationException;

	/**
	 * Select the remove button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void removeItemWithText(String itemText) throws AutomationException;

	/**
	 * Select the remove button of row with the given cell text values .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void removeItemWithText(List<String> cellTexts) throws AutomationException;

	/**
	 * Enter the date.
	 *
	 * @param Date
	 * @param dateId
	 * @param monthId
	 * @param yearId
	 * @throws AutomationException
	 */
	@Deprecated
	public void typeDate(Date date, String dateId, String monthId, String yearId) throws AutomationException;

	/**
	 * Select the select button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void selectItemWithText(String itemText) throws AutomationException;

	/**
	 * Gets the selected value of the provided HTML select element.
	 *
	 * @param element
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public String getSelectValue(String componentId) throws AutomationException;

	/**
	 * Returns whether or not an element is enabled on the page.
	 *
	 * @param componentId
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean isElementEnabled(String componentId) throws AutomationException;

	/**
	 * Click ok of the alert.
	 * @throws AutomationException
	 *
	 */
	@Deprecated
	public void clickConfirm() throws AutomationException;

	/**
	 * Click on anchor of an element.
	 *
	 * @param anchorText
	 * @throws AutomationException
	 *
	 */
	@Deprecated
	public void clickOnAnchor(String anchorText) throws AutomationException;

	/**
	 * Click on tab
	 *
	 * @param label
	 * @throws AutomationException
	 */
	@Deprecated
	public void clickOnTab(String label) throws AutomationException;

	/**
	 * Click on tab by Id
	 *
	 * @param componentId
	 * @throws AutomationException
	 */
	@Deprecated
	public void clickOnTabById(String componentId) throws AutomationException;

	/**
	 * Searches a table for the specified text. Allows users to define a specific column and/or row to search.
	 *
	 * Rows and columns start at 1, but if the table has a header row then the row will effectively start at 2.
	 *
	 * @param tableClass The class name of the table element.
	 * @param itemText The item text to search for.
	 * @param searchColumn The column to search, if not 0.
	 * @param searchRow The row to search, if not 0.
	 * @param matchType The match type to use to define a match.
	 * @return The row number if the text was found, else 0.
	 * @throws AutomationException
	 * @throws InterruptedException 
	 */
	@Deprecated
	public int searchTable(String tableClass, String itemText, int searchColumn, int searchRow, MatchType matchType) throws AutomationException;

	/**
	 * Select the remove button of the (visible text) value in a tab page.
	 *
	 * @param itemText
	 * @throws AutomationException
	 */
	@Deprecated
	void removeItemWithTextInTab(String itemText) throws AutomationException;

	/**
	 * Check if tab is selected
	 *
	 * @param componentId
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean isTabSelected(String componentId) throws AutomationException;

	/**
	 * Select the edit button of the (visible text) value in a tab page.
	 *
	 * @param itemText
	 * @throws AutomationException
	 */
	@Deprecated
	void editItemWithTextInTab(String itemText) throws AutomationException;

	/**
	 * Select a value with partial ID
	 *
	 * @param value
	 * @param label
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public void selectValueWithLable(String value, String label) throws AutomationException;

	/**
	 * click on a link with partial ID
	 *
	 * @param label
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public void clickOnLinkByLabel(String label) throws AutomationException;

	/**
	 * Returns true if the filtered table contains a cell with the specified item texts.
	 *
	 * @param itemText The text to search for.
	 * @param columnText The column to search.
	 * @param itemText The text to search for.
	 * @param columnText The column to search.
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean filteredListContainsItems(String itemText1, String columnText1, String itemText2, String columnText2) throws AutomationException;

	/**
	 * Select the remove button of the (visible text) value .
	 *
	 * @param value1
	 * @param value2
	 * @throws AutomationException
	 */
	@Deprecated
	public void removeItemWithText(String itemText1, String itemText2) throws AutomationException;

	/**
	 * Select the copy button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void copyItemWithText(String itemText1, String itemText2) throws AutomationException;

	/**
	 * Select the view button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void viewItemWithText(String itemText1, String itemText2) throws AutomationException;

	/**
	 * Select the edit button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void editItemWithText(String itemText1, String itemText2) throws AutomationException;

	/**
	 * Select the select button of the (visible text) value .
	 *
	 * @param value
	 * @throws AutomationException
	 */
	@Deprecated
	public void selectItemWithText(String itemText1, String itemText2) throws AutomationException;

	/**
	 * Enter the given text to the component
	 *
	 * @param partialId
	 * @param text
	 * @param index
	 * @param tagName
	 * @throws AutomationException
	 */
	@Deprecated
	public boolean enterOptionalText(String componentId, String text, int index, String tagName) throws AutomationException;

	/**
	 * Select the (visible text) value of select. If value is null, then select the first option.
	 *
	 * @param value
	 * @param componentId
	 * @param index
	 * @param tagName
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public void selectValue(String value, String componentId, int index, String tagName) throws AutomationException;

	/**
	 * Select the (visible text) value of select. If value is null, then select the first option.
	 *
	 * @param value
	 * @param componentId
	 * @param index
	 * @param tagName
	 * @return
	 * @throws AutomationException
	 */
	@Deprecated
	public void selectValue(String value, String componentId, int index, String tagName, boolean wait) throws AutomationException;

	/**
	 * Resize the browser window
	 * @param width
	 * @param height
	 */
	void resizeWindow(int width, int height);

	/**
	 * Return true whether the element given by its componentId is selected
	 *
	 * @param componentId
	 * @return
	 * @throws AutomationException
	 */
	public boolean isElementSelected(final String componentId, final String type) throws AutomationException;

	/**
	 * Wait page to refresh
	 */
	public void waitPageRefresh();
	
	/**
	 * Wait Table to Refresh
	 * 
	 * @param locator By Locator for table
	 */
	public void waitTableToRefresh(By locator) throws AutomationException;
	
	/**
	 * Mark Filter Table as dirty
	 * 
	 * @param tableClass class attribute of table
	 */
	public void markFilterTableDirty(String tableClass) throws AutomationException;
	
	/**
	 * Zoom the browser window
	 *
	 * @throws AutomationException
	 */
	public void setZoom(String zoom) throws AutomationException;

	/**
	 * Scrolls up the browser window
	 *
	 * @throws AutomationException
	 */
	public void scrollup() throws AutomationException;
	
	/**
	 * Scrolls down the browser window
	 *
	 * @throws AutomationException
	 */
	public void scrolldown() throws AutomationException;

    /**
     * Return the value for the given attributeName
     *
     * @param locator
     * @param attributeName
     * @return
     * @throws AutomationException
     */
    String getAttributeInElement(By locator, String attributeName) throws AutomationException;
    
    /**
     * Return the visible (i.e. not hidden by CSS) innerText of this element, including sub-elements,
     * without any leading or trailing whitespace.
     *
     * @param locator the locator of the element
     * @return the visible text of this element or an empty {@link String} if not found
     * @throws AutomationException when the element is not found
     */
    String getTextInElement(By locator) throws AutomationException;

    /**
     * Return the list of texts in each @itemSelector inside the given @rootSelector
     *
     * @param rootSelector
     * @param itemSelector
     * @return
     * @throws AutomationException
     */
    List<String> getTextInList(By rootSelector, By itemSelector) throws AutomationException;

	/**
	 * Returns the number of items matching the "itemSelector" inside the given @rootSelector
	 * @param rootSelector
	 * @param itemSelector
	 * @return
	 * @throws AutomationException
	 */
	int getItemsCount(By rootSelector, By itemSelector) throws AutomationException;
	
	/**
	 * Returns the row number of the text passed as "label" from the table
	 * @param rootSelector
	 * @param itemSelector
	 * @return
	 * @throws AutomationException
	 */	
	public int getTableRowNumber(String label, String tableXpath) throws AutomationException;
	
	/**
	 * Returns the current URL
	 * 
	 * @return
	 */
	String getCurrentUrl();
	
	/**
	 * Method to close the browser
	 * @param 
	 * @return
	 */
	void shutdown();

    /**
     * If multiple browser pages are active, switch the focus of the web controller to page with given URL
     *
     * @param currentURL
     */
    void switchToPageWithGivenURL(String currentURL);
    
	/**
	 * Method to navigate to the previous page in the browser
	 * @param 
	 * @return
	 */
    public void navigateToPageBackPress();
	
	/**
	 * Method to navigate to the previous page in the browser
	 * @param 
	 * @return
	 */
	public void navigateToPageForwardPress();

	/**
	 * Method to check if the button is available in the tiles.
	 * @param label
	 * @throws AutomationException
	 */
	public void isTileButtonVisible(String label) throws AutomationException;
	
	/**
	 * Checks whether text is selected in a list
	 * 
	 * @param locator
	 * @return boolean
	 * @throws AutomationException
	 */
	boolean isItemSelectedInList(By locator) throws AutomationException;
	
	/**
	  * Trigger the enter press key event
	  * 
	  * @throws AutomationException
	  */
	 void enterPress() throws AutomationException;
	 
	/**
	  * Checks whether Element is Focused
	  * 
	  * @throws AutomationException
	  */
	 boolean isElementFocused(By locator) throws AutomationException;
		
}