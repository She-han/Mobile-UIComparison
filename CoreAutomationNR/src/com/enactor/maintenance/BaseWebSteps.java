package com.enactor.maintenance;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;

import com.enactor.core.automation.AUT.AUTWebTestManager;
import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.AUT.IAUTWebController;
import com.enactor.core.automation.cucumber.conetxt.Context;
import com.enactor.core.automation.cucumber.conetxt.ScenarioContext;
import com.enactor.core.utilities.FileUtils;
import com.enactor.core.utilities.StringUtils;
import com.enactor.coreUI.selenium.SeleniumConfig;

import io.cucumber.datatable.DataTable;




/**
 * Base class for the Web test steps.
 *
 * @author Hirantha Bandara
 *
 */
public abstract class BaseWebSteps {


	private static final String VIEW_LINK_CLASS = "viewLink";
	private static final String EDIT_LINK_CLASS = "editLink";
	private static final String COPY_LINK_CLASS = "copyLink";
	private static final String REMOVE_LINK_CLASS = "removeLink";
	private static final String REMOVE_IMPORTANT_LINK_CLASS = "removeimportantLink";
	private static final String SELECT_LINK_CLASS = "selectLink";
	private static final String NEXT_LINK_CLASS = "nextLink";
	private static final String HISTORY_LINK_CLASS = "viewHistoryLink";
	private static final String VIEW_XML_LINK_CLASS = "viewXmlLink";
	private static final String VIEW_OLD_ENTITY_LINK_CLASS = "viewOldEntityLink";
	private static final String VIEW_NEW_ENTITY_LINK_CLASS = "viewNewEntityLink";
	private static final String BACK_LINK_CLASS = "backLink";
	private static final String DOWNLOAD_LINK_CLASS = "downloadLink";


	public static final String MENU_LABEL = "label.";
	public static final String BUTTON_LABEL = "button.label.";
	public static final String TAB_LABEL = "tab.label.";
	public static final String FIELD_LABEL = "field.label.";
	public static final String CHECK_BOX_LABEL = "checkbox.label.";
	public static final String PAGE_ERROR = "page.error";
	public static final String FIELD_ERROR = "field.error";
	public static final String POPUP_ERROR = "span.error";
	public static final String COMPONENT = "component.";
	private static final String SECTION_PREFIX = "section.";	
	private static final String ITEM_PREFIX = "item.";	

	public static final String ID = ".id";
	public static final String NAME = ".name";
	public static final String CLASS = ".class";
	public static final String XPATH = ".xpath";
	private static final String SEPARATOR = ".";

	public static final long ELEMENT_20_SECONDS_WAIT_TIMEOUT = 20*1000;
	public static final long COMPONENT_WAIT_TIMEOUT = 5*1000;

	protected static Map<String, String> propertyMap = new HashMap<String, String>();
	
	private String startingPage = "Login Registration";
	
	protected ScenarioContext scenarioContext;

	/**
	 * PicoContainer will DI scenarioContext Object to the StepDefinition Class when the scenario starts.
	 * Injected scenarioContext will be the same that will be injected to other step Definition Classes,
	 * for the same scenario
	 * 
	 * @param scenarioContext Can hold objects in the Scenario Context
	 */
	public BaseWebSteps(ScenarioContext scenarioContext) {
		this.scenarioContext = scenarioContext;
		
		if(!this.scenarioContext.isContains(Context.CURRUNT_PAGE)) {
			setCurrentPage(startingPage);
		}
		if(!this.scenarioContext.isContains(Context.WEB_CONTROLLER)) {
			IAUTWebController webController = AUTWebTestManager.getInstance().getController();
			setWebController(webController);
		}
	}
	
	/**
	 * Set the the current page in ScenarioContext
	 * 
	 * @param pageName
	 */
	protected void setCurrentPage(String pageName) {
		this.scenarioContext.setContext(Context.CURRUNT_PAGE, pageName);
	}
	
	/**
	 * Get the Current Page from scenario Context
	 * @return currentPage
	 */
	protected String getCurrentPage() {
		return this.scenarioContext.getContext(Context.CURRUNT_PAGE).toString();
	}
	
	/**
	 * Returns the AUT web controller.
	 *
	 * @return
	 */
	public IAUTWebController getController() {
		return (IAUTWebController)this.scenarioContext.getContext(Context.WEB_CONTROLLER);
	}

	/**
	 * Set the AUT web Controller to the scenario context.
	 *
	 * @return
	 */
	public void setWebController(IAUTWebController webController) {
		this.scenarioContext.setContext(Context.WEB_CONTROLLER, webController);
	}
	
	/**
	 * Attempts to enter text into an element, retrying 3 times. If it fails, an exception is
	 * thrown.
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @param text
	 * @throws AutomationException
	 */
	public void enterText(String page, String prefix, String id, String type, String text) throws AutomationException {
		String resolvedText = StringUtils.resolvePlaceholdersWithMap(text, propertyMap);
		String componentId = loadConfig(page, prefix, id, type);
		waitForComponent(page, prefix, id, type);
		boolean success = getController().enterOptionalText(componentId, resolveData(resolvedText));
		if (!success) {
			throw new IllegalStateException("Could not enter text into element '" + componentId.toString() + "'");
		}
	}

	/**
	 * Click on the button referred by the style class derived from page,prefix and id
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @throws AutomationException
	 */
	public void clickOnLinkButton(String page, String prefix, String id, String type) throws AutomationException {
		String componentId = loadConfig(page, prefix, id, type);		
			if(type.equals(XPATH)) {
				WebElement webElement = getController().waitForElement(By.xpath("." + componentId),COMPONENT_WAIT_TIMEOUT);
				try {
					webElement.click();					
				} catch (IllegalArgumentException e1) {
					throw new AutomationException("Could not click on element with Xpath : '" + componentId + "'", e1);	
				}				
			} else {
				waitForComponent(page, prefix, id, type);
				getController().clickOnLinkButton(componentId);	
			}			
			getController().waitPageRefresh();
		
	}
	

	/**
	 * Hover over the button and click on the text inside the pop up
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @param label
	 * @throws AutomationException
	 */
	public void clickOnLinkButtonTextInside(String page, String prefix, String buttonId, String type, String label)
			throws AutomationException {
		String componentId = loadConfig(page, prefix, buttonId, type);
		if (type.equals(XPATH)) {
			WebElement element = getController().waitForElement(By.xpath("." + componentId), COMPONENT_WAIT_TIMEOUT);
			try {
				getController().clickElements(element, label);
			} catch (IllegalArgumentException e1) {
				throw new AutomationException(
						"Could not click on element with Xpath : '" + componentId + "' and text : '" + label + "'", e1);
			}
		} else {
			throw new AutomationException("Button element should have a xpath defined");
		}
		getController().waitPageRefresh();

	}

	/**
	 * Timeout for Web Driver. Wait number of milliseconds provided eg: waits(3000)
	 * // wait 3 seconds
	 *
	 * Usage : eg: When user waits till a privilege to be applied
	 * 
	 * @throws AutomationException
	 */
	public void timeoutForDriver(long milliseconds) throws AutomationException {
		try {
			Thread.sleep(milliseconds);
		} catch (InterruptedException e) {
			throw new AutomationException("Failed waiting " + milliseconds + ". " + e);
		}
	}
	
	/**
	 * Wait for component to display.
	 * Maximum waiting time is 5 seconds
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @throws AutomationException
	 */
	public void waitForComponent(String page, String prefix, String label, String type)
			throws AutomationException {
		waitForComponent(page, prefix, label, type, COMPONENT_WAIT_TIMEOUT);
	}
		
		/**
		 * Wait for an IFrame component to display.
		 *
		 * @param page
		 * @param prefix
		 * @param xpath
		 * @param type
		 * @param id
		 * @param type
		 * @throws AutomationException
		 */
	public void waitForIFrameComponent(String page, String prefix, String label, String componentType, String frameId, String frameType)
			throws AutomationException {
		waitForComponentWithinIFrame(page, prefix, label, componentType, frameId, frameType, COMPONENT_WAIT_TIMEOUT);
	}
	
	/**
	 * Wait for given time for component to display.
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @param wait
	 * @throws AutomationException
	 */
	public void waitForComponent(String page, String prefix, String label, String type, long wait)
			throws AutomationException {
		By locator = getLocator(type, loadConfig(page, prefix, label, type));
		getController().waitForElement(locator, wait);
	}

	/**
	 * Wait for given time for IFrame component to display.
	 *
	 * @param page
	 * @param prefix
	 * @param xpath
	 * @param type
	 * @param id
	 * @param type
	 * @param wait
	 * @throws AutomationException
	 */
	public void waitForComponentWithinIFrame(String page, String prefix, String label, String type, String frameId, String frameType, long wait)
			throws AutomationException {
		By locator = null;
		String key = loadConfig(page, prefix, label, type);
		String FrameKey=loadConfig(page, prefix, frameId, frameType);
		switch(type) {
		case ID :
			locator = By.id(key);
			break;
		case CLASS :
			locator = By.className(key);
			break;
		case NAME :
			locator = By.name(key);
			break;
		case XPATH :
			locator = By.xpath("." + key);
			break;
		default :
			throw new AutomationException("Unknown element type [" + type + "]");
		}
		getController().waitForIFrameElement(locator, wait, FrameKey);
	}
	
	/**
	 * Wait for component to display and then return it
	 *
	 * @param page Page Name
	 * @param prefix configuration property prefix
	 * @param locaterKey Key to locate the WebElement
	 * @param type Type of the Locator key
	 * @throws AutomationException
	 * @return WebElement
	 */
	public WebElement getWebComponent(String page, String prefix, String locaterKey, String type)
			throws AutomationException {
		return getWebComponent(page, prefix, locaterKey, type, COMPONENT_WAIT_TIMEOUT);
	}

	/**
	 * Wait for given time for component to display.
	 *
	 */
	public WebElement getWebComponent(String page, String prefix, String locatorKey, String type, long wait)
			throws AutomationException {
		String key = loadConfig(page, prefix, locatorKey, type);
        By locator = getLocator(type, key);
		return getController().waitForElement(locator, wait);
	}
	/**
	 * Returns true if given title and button exists
	 *
	 * @param title
	 * @param lable
	 * @param type
	 * @return
	 */
	public boolean isTitleAndButtonAvailable(String title, String lable, String type) throws AutomationException {
		String titleKey = convertToKeyString(resolveData(title), true);
		return (isElementVisible(titleKey, BUTTON_LABEL, lable, type) && isSpanWithTextAvailable(resolveData(title)));
	}

	/**
	 * Returns true if given title and field exists
	 *
	 * @param title
	 * @param lable
	 * @param type
	 * @return
	 */
	public boolean isTitleAndFieldAvailable(String title, String lable, String type)
			throws AutomationException {
		String titleKey = convertToKeyString(resolveData(title), true);
		return (isElementVisible(titleKey, FIELD_LABEL, lable, type)
				&& isSpanWithTextAvailable(resolveData(title)));
	}

	/**
	 * Returns whether the element containing the passing id is available or not
	 *
	 * @param page
	 * @param prefix
	 * @param lable
	 * @param type
	 * @return boolean
	 */
	public boolean isElementVisible(String page, String prefix, String lable, String type) {
		try {
			return getController().isElementVisible(getLocator(type,loadConfig(page, prefix, lable, type)));
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * Check whether the tiles containing the passing label is available or not
	 *
	 * @param label
	 * @throws Throwable AutomationException thrown if filling failed
	 */
	public void isTileButtonVisible(String label) throws AutomationException {
		try {
			getController().isTileButtonVisible(label);
		} catch (Exception e) {
			throw new AutomationException("The button '" + label + "' is not found ");
		}
	}

	/**
	 * Returns whether the span containing the passing text is available or not
	 *
	 * @param text
	 * @return
	 */
	public boolean isSpanWithTextAvailable(String text) throws AutomationException {
		return getController().isSpanWithTextAvailable(resolveData(text));
	}

    /**
     * Checks data needs to be collected from property file
     * Data keys in the following style will be captured and processed.
	 * eg : 
	 * 	"test $ key 1" -> "${test $ key 1}"
	 * 	this key should be available in property file as test.$.key.1
	 * Only limitation is with using a } in the key, which will terminate the matching earlier.
	 * In the same expression multiple keys are also supported.
	 * eg :
	 * 	"lorem ipsum ${test key 1} dolor sit  ${test key 2}" 
     * @param value
     * @return string
     */
	public String resolveData(String value) throws AutomationException {
		StringBuilder sb = new StringBuilder();
		if (value == null) {
			return "";
		}
		Pattern pattern = Pattern.compile("\\$\\{(.*?)?\\}");
		Matcher matcher = pattern.matcher(value);
		int lastMatcherIndex = 0;
		while (matcher.find()) {
			// append to sb until the lastMatcherIndex
			sb.append(value, lastMatcherIndex, matcher.start());
			String varName = matcher.group(1);
			String key = convertToKeyString(varName);
			String expandedPart = "";
			if (hasScenarioTestData(key)) {
				expandedPart = (String) loadTestData(key);
			} else {
				expandedPart = TestDataConfig.getInstance().getString(key);
			}

			// check in the property map
			if (expandedPart == null) {
				expandedPart = propertyMap.get(varName);
			}

			sb.append(expandedPart);
			lastMatcherIndex = matcher.end();
		}
		if (sb.toString().isEmpty()) {
			return value;
		}
		return sb.toString();
	}

	/**
	 * Checks data needs to be collected from property file
	 *
	 * @param table (Map<String, String>)
	 * @return newTable (Map<String, String>)
	 */
	public Map<String, String> resolveData(Map<String, String> table) throws AutomationException {
		Map<String, String> newTable = new HashMap<>();
		for (String key : table.keySet()) {
			String newKey = resolveData(key);
			String newValue = (resolveData(table.get(key)).replaceFirst("^0*", ""));
			newTable.put(newKey, newValue);
		}
		return newTable;
	}

	/**
	 * Checks data needs to be collected from property file
	 *
	 * @param dataTable DataTable which needs to be resolved from data properties
	 * @return newTable DataTable
	 */
	public ArrayList<ArrayList<String>> resolveData(DataTable dataTable) throws AutomationException {
		List<List<String>> tableRows = dataTable.asLists(String.class);
		ArrayList<ArrayList<String>> newTable = new ArrayList<ArrayList<String>>();
		for (List<String> row : tableRows) {
			ArrayList<String> newTableRow = new ArrayList<String>();
			for (String cell : row) {
				String value = resolveData(cell);
				System.out.println(String.format(">> Column : %s  Value %s", cell, value));
				newTableRow.add(value);
			}
			newTable.add(newTableRow);
		}
		return newTable;
	}

	/**
	 * Returns the text referred by the style class derived from page,prefix and id
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @return
	 */
	public String getTextByComponentLocator(String page, String prefix, String component, String type) throws AutomationException {
		String key = loadConfig(page, prefix, component, type);
		By locator = getLocator(type, key);
		waitForComponent(page, prefix, component, type);
		return getController().getTextByLocator(locator);
	}

	/**
	 * Returns the text referred by the component xpath derived from page,prefix, IFrame Id and xpath
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @param xpath
	 * @param type
	 * @return the text held by the element
	 */
	public String getTextByIFrameXpath(String page, String prefix, String id, String componentType, String frameId, String frameType ) throws AutomationException {
		String componentId = loadConfig(page, prefix, id, componentType);
		By locator = getLocator(componentType, componentId);
		String iFrameComponentXPath = loadConfig(page, prefix, frameId, frameType);
		waitForIFrameComponent(page, prefix, id, componentType, frameId, frameType);
		waitForComponent(page, prefix, frameId, frameType);
		return getController().getTextByLocatorWithinIFrame(iFrameComponentXPath, locator);
	}

	/**
	 * Click on the menu button referred by the style class derived from page, prefix and id
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 */
	public void clickOnMenuButton(String page, String prefix, String label, String type)
			throws AutomationException {
		String componentId = loadConfig(page, prefix, label, type);
		// using Javascript to click span element to avoid "Element is not clickable" error on Chrome browser
		By locator = getController().getSpanLocator(componentId);
		getController().clickElementWithJavascript(locator);
	}

	/**
	 * Click on the menu button referred by the style class and label derived from page,prefix and
	 * id
	 *
	 * @param page
	 * @param prefix
	 * @param label
	 * @param className
	 */
	public void clickOnMenuButtonByClassAndLabel(String page, String prefix, String label,
			String className) throws AutomationException {
		String componentId = loadConfig(page, prefix, label, null);
		getController().clickOnMenuButtonWithClass(componentId, className);
	}

	/**
	 * Fill check boxes and input fields in first table found by class
	 * A row in data table can be matched to multiple in table, but 0
	 *
	 * @param table Identifier for the table
	 * @param dataTable Cucumber DataTable
	 * @throws Throwable AutomationException thrown if filling failed
	 *
	 */
	public void fillTableWithAdjascentFields(String page, String table, String type, DataTable dataTable)
			throws AutomationException {
		String componentId = loadConfig(page, DataTableStepsHelper.TABLE_PREFIX, table, type);
		WebElement tableWebElement = getWebComponent(page, DataTableStepsHelper.TABLE_PREFIX, table, type);
		ArrayList<ArrayList<String>> resolveddataTable = resolveData(dataTable);
		DataTableStepsHelper.fillTableWithAdjascentFields(resolveddataTable, tableWebElement, componentId);
	}

	/**
	 * Check if given rows are shown in the table
	 *
	 * @param table     Identifier for the table
	 * @param dataTable Cucumber DataTable
	 * @throws Throwable AutomationException thrown if searching failed
	 *
	 */
	public boolean checkRowsShownInTable(String page, String table, String type, DataTable dataTable)
			throws AutomationException {
		String componentId = loadConfig(page, DataTableStepsHelper.TABLE_PREFIX, table, type);

		WebElement tableWebElement = getWebComponent(page, DataTableStepsHelper.TABLE_PREFIX, table, type);

		ArrayList<ArrayList<String>> resolvedDataTable = resolveData(dataTable);

		return DataTableStepsHelper.checkRowsShownInTable(resolvedDataTable, tableWebElement,
				componentId);

	}
	
	/**
	 * Check if given table is empty or not
	 * 
	 * Note: The resulting table will at least have a single row for (-) element. 
	 * But that element is not part of the original result set and it is there to just show the table is empty. 
	 * In that case we can not user isEmpty method for condition check since the list is not actually empty.
	 * Hence the logic has been implemented in order to check whether it contains at least 2 elements.
	 * 
	 * @param table     Identifier for the table
	 * @throws Throwable AutomationException thrown if searching failed
	 * 
	 */
	public boolean isTableEmpty(String page, String table, String type) throws AutomationException {
		int tableSize = returnTableSize(page, table, type);
		return tableSize < 2;
	}

	/**
	 * Return the table size as a integer value.
	 * 
	 * Note: This method will return the table size(based on the <tr> elements) including the column names. 
	 * Make sure to consider <tr> element with column names when comparing with the table size.
	 * 
	 * @param table Identifier for the table
	 * @return
	 * @throws AutomationException
	 */
	public int returnTableSize(String page, String table, String type) throws AutomationException {
		WebElement tableWebElement = getWebComponent(page, DataTableStepsHelper.TABLE_PREFIX, table, type);
		List<WebElement> tableRows = tableWebElement.findElements(By.tagName("tr"));
		return tableRows.size();
	}
	
	/**
	 * Click on the menu button referred by the style class and label derived from page,prefix and id
	 * Then verify if the given text is available
	 * 
	 * @param page Name of the maintenance app
	 * @param prefix Element prefix
	 * @param label Label of the text element
	 * @param className Class Name of the text element
	 * @param 
	 */
	public void clickOnLabelButtonByClassAndVerify(String page, String prefix, String label,
			String className, String expectedLabel, String expectedClassName) throws AutomationException {
		
		String labelText = loadConfig(page, prefix, label, null);
		String expectedText = loadConfig(page, prefix, expectedLabel, null);
		getController().clickOnLabelWithClassAndVerify(labelText, className, expectedText, expectedClassName);
	}

	/**
	 * Set the text on the element referred by the component id on specific page derived from
	 * page,prefix and id
	 *
	 * @param page
	 * @param prefix
	 * @param label
	 * @param type
	 * @param text
	 */
	public void setSelectByComponentIdOnPage(String page, String prefix, String label, String type,
			String text) throws AutomationException {
		String componentId = loadConfig(page, prefix, label, type);
		waitForComponent(page, prefix, label, type);
		getController().selectValue(resolveData(text), componentId);
	}

	/**
	 * Returns the text referred by the component id in given page, derived from page,prefix and id
	 *
	 * @param page
	 * @param prefix
	 * @param label
	 * @param type
	 * @return
	 */
	public String getSelectTextByComponentIdOnPage(String page, String prefix, String label,
			String type) throws AutomationException {
		String componentId = loadConfig(page, prefix, label, type);
		waitForComponent(page, prefix, label, type);
		return getController().getSelectValue(componentId);
	}

	/**
	 * Returns whether the element containing the passing id in given page is enabled or not
	 *
	 * @param page
	 * @param prefix
	 * @param lable
	 * @param type
	 * @return
	 */
	public boolean isElementEnabledOnPage(String page, String prefix, String label, String type)
			throws AutomationException {
		String componentId = loadConfig(page, prefix, label, type);
		waitForComponent(page, prefix, label, type);
		return getController().isElementEnabled(componentId);
	}

	/**
	 * Click on the element referred by the style class derived from page,prefix and id or xpath
	 * 
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @throws AutomationException
	 */
	public void selectElement(String page, String prefix, String id, String type) throws AutomationException {
		String componentId = loadConfig(page, prefix, id, type);
		waitForComponent(page, prefix, id, type);
		if(!getController().isElementSelected(componentId, type)) {
			if(type.equals(XPATH)) {
				WebElement webElement = getController().waitForElement(By.xpath("." + componentId),COMPONENT_WAIT_TIMEOUT);
				try {
					webElement.click();
				} catch (IllegalArgumentException e1) {
					throw new AutomationException("Could not click on element with Xpath : '" + componentId + "'", e1);	
				}				
			} else {
				getController().clickOnButton(componentId);	
			}			
		}
	}
	
	/**
	 * Click on the element referred by the style class derived from page,prefix and id or xpath
	 * 
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @throws AutomationException
	 */
	public void deSelectCheckBox(String page, String prefix, String id, String type) throws AutomationException {
		String componentId = loadConfig(page, prefix, id, type);
		waitForComponent(page, prefix, id, type);
		if(getController().isElementSelected(componentId, type)) {
			if(type.equals(XPATH)) {
				WebElement webElement = getController().waitForElement(By.xpath("." + componentId),COMPONENT_WAIT_TIMEOUT);
				try {
					webElement.click();
				} catch (IllegalArgumentException e1) {
					throw new AutomationException("Could not click on element with Xpath : '" + componentId + "'", e1);	
				}				
			} else {
				getController().clickOnButton(componentId);	
			}			
		}
	}
	
    /**
	 * Click tab component id in given page from page, prefix and id
	 * 
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @throws AutomationException,InterruptedException 
	 * 
	 */
	public void clickTabComponentOnPage(String page, String prefix, String id, String type) throws AutomationException, InterruptedException {
		String componentId = loadConfig(page, prefix, id, type);
		getController().clickOnTabById(componentId);
	}
	
//	 /**
//	  * Wait for tab component to get loaded
//	  * 
//	  * @param componentId
//	  * @param componentWaitTime
//	  * @throws AutomationException
//	  * 
//	  */
//	 private void waitTabSelected(String componentId, long componentWaitTimeMillis) throws AutomationException{
//		long startTime = System.currentTimeMillis(); 
//		while(true) {
//			if (System.currentTimeMillis() - startTime >= componentWaitTimeMillis) {
//				throw new AutomationException("Unable to select the tab Id " + componentId + " within " + componentWaitTimeMillis);
//			}
//			if (isTabSelected(componentId)) {
//				return;
//			}
//		}
//	  }
	
//	 /**
//	  * Check if the tab is selected
//	  * 
//	  * @param componentId
//	  * @return
//	  * @throws AutomationException
//	  * 
//	  */
//	 private boolean isTabSelected(String componentId) throws AutomationException {
//		return getController().isTabSelected(componentId);
//	 }
//	
	/**
	 * Check whether the check box is selected.
	 * 
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @throws AutomationException
	 */
	public boolean isCheckBoxSelected(String page, String prefix, String id, String type) throws AutomationException {
		String componentId = loadConfig(page, prefix, id, type);
		waitForComponent(page, prefix, id, type);
		return getController().isElementSelected(componentId, type);
	}

	
	/**
	 * click link button on a record display in search result table.
	 * following details must be supply to click the button
	 * - Available link button - view, edit, copy, select or remove
	 * - One or more column details of the record you want to click the link button
	 *
	 * @param cellText (List<String>)
	 * @param linkButton
	 * @throws AutomationException
	 */

	public void clickSearchResultRecordLinkButton(List<String> cellText, String linkButton)
			throws AutomationException {
		String className = null;
		switch (linkButton.toLowerCase()) {
		case "view":
			className = VIEW_LINK_CLASS;
			break;
		case "edit":
			className = EDIT_LINK_CLASS;
			break;
		case "copy":
			className = COPY_LINK_CLASS;
			break;
		case "select":
			className = SELECT_LINK_CLASS;
			break;
		case "remove":
			className = REMOVE_LINK_CLASS;
			break;
		case "remove important"  :
			className = REMOVE_IMPORTANT_LINK_CLASS;
			break;
		case "next":
			className = NEXT_LINK_CLASS;
			break;
		case "history":
			className = HISTORY_LINK_CLASS;
			break;
		case "view xml":
			className = VIEW_XML_LINK_CLASS;
			break;
		case "view raw xml":
			className = VIEW_LINK_CLASS;
			break;
		case "view new entity":
			className = VIEW_NEW_ENTITY_LINK_CLASS;
			break;
		case "view old entity":
			className = VIEW_OLD_ENTITY_LINK_CLASS;
			break;
		case "back":
			className = BACK_LINK_CLASS;
			break;
		case "export":
			className = NEXT_LINK_CLASS;
			break;
		case "broadcast":
			className = NEXT_LINK_CLASS;
			break;
		case "download":
			className = DOWNLOAD_LINK_CLASS;
			break;
		default:
			throw new AutomationException("Unknown search result link button [" + linkButton + "]");
		}
		getController().executeItemWithTextOnCurrentPage(cellText, className);
	}

	
	public void clickTableRecordLinkButton(String cellText, String linkButton)
			throws AutomationException {
		String className = null;
	    switch (linkButton.toLowerCase()) {
	  	case "view": 
		    className = VIEW_LINK_CLASS;
		    break; 
		case "edit": 
			className = EDIT_LINK_CLASS; 
			break; 
		case "remove":
			className = REMOVE_LINK_CLASS; 
			break;
	    default: 
		  throw new AutomationException("Unknown search result link button [" + linkButton + "]");
	    }
		getController().executeItemWithTextOnCurrentPage(cellText, className);
	}

	/**
	 * Click ok of the alert.
	 */
	public void clickConfirm() throws AutomationException {
		getController().clickConfirm();
	}
	
	/**
	 * Zooms out of the page
	 *
	 * @throws AutomationException, InterruptedException
	 */
	public void pageZoomout(String zoom) throws AutomationException, InterruptedException {
		getController().setZoom(zoom);
	}
	
	/**
	 * Scrolls up to the top of the page
	 *
	 * @throws AutomationException, InterruptedException
	 */
	public void pageup() throws AutomationException, InterruptedException {
		getController().scrollup();
	}
	
	/**
	 * Scrolls down to the bottom of the page
	 *
	 * @throws AutomationException, InterruptedException
	 */
	public void pagedown() throws AutomationException, InterruptedException {
		getController().scrolldown();
	}

	/**
	 * check two strings equal
	 *
	 * @param actual
	 * @param expected
	 */
	public boolean isValueMatch(String actual, String expected) throws AutomationException {
		return actual.equals(resolveData(expected));
	}

	/**
	 * Load config
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @return
	 */
	protected String loadConfig(String page, String prefix, String id, String type) {
		String key = convertToKeyString(page, true) + SEPARATOR;

		key = key + prefix + convertToKeyString(id);

		if (type != null) {
			key = key + type;
		}

		if (SeleniumConfig.getInstance().getDebug()) {
			System.out.println(">> " + key);
			System.out.println(">> " + SeleniumConfig.getInstance().get(key));
		}
		return SeleniumConfig.getInstance().get(key);
	}
	
	/**
    * Load config with default value
    *
    * @param page
    * @param prefix
    * @param id
    * @param type
    * @param defaultValue
    * @return
    */
	protected String loadConfig(String page, String prefix, String id, String type, String defaulValue) {
		String configValue = loadConfig(page, prefix, id, type);
		if ("".equals(configValue)) {
			return defaulValue;
		}
		return configValue;
	}

	/**
	 * Convert a given string to a dotted lower case word
	 * E.g. "My Configurations Page" = > "my.configurations.page"
	 *
	 * @param label
	 * @return
	 */
	private static String convertToKeyString(String label) {
		return convertToKeyString(label, false);
	}

	/**
	 * Convert a given string to a dotted lower case word
	 * E.g. "My Configurations Page" = > "my.configurations.page"
	 * if toCamalCase is true then "MyConfigurationsPage"
	 *
	 * @param label
	 * @param toCamalCase
	 * @return
	 */
	private static String convertToKeyString(String label, boolean toCamalCase) {
		String key = StringUtils.emptyString();
		if (label != null) {
			key = label.replaceAll("\\s+", " ");
			if (!toCamalCase) {
				key = key.replaceAll("\\s+", ".");
				key = key.toLowerCase();
			} else {
				key = key.replaceAll("\\s+", "");
			}
		}
		return key;
	}

	/**
	 * Click on the element referred by the component id derived from page,prefix and id
	 *
	 * @param label
	 * @return
	 */
	public void setClickOnElementByLabel(String label) throws AutomationException {
		getController().clickOnLinkByLabel(label);
	}

	/**
	 * Send keys to the element.
	 *
	 * @param page web page identifier of the element config
	 * @param prefix prefix of the element config
	 * @param label label of the element config
	 * @param type locator type of the element
	 * @param keysToSend character sequence to send to the element
	 * @throws AutomationException throws when the provided type is unknown
	 */
	public void sendKeys(String page, String prefix, String label, String type, CharSequence... keysToSend) throws AutomationException {
		WebElement element = getController().waitForElement(getLocator(type, loadConfig(page, prefix, label, type)));
		element.sendKeys(keysToSend);
	}

	/**
	 * Select a local file as a file input.
	 *
	 * @param page web page identifier of the element config
	 * @param prefix prefix of the element config
	 * @param label label of the element config
	 * @param type locator type of the element
	 * @param file filepath of the file to be set as the file input
	 * @throws AutomationException throws when provided type is unknown
	 */
	public void selectLocalFileAsFileInput(String page, String prefix, String label, String type, String file) throws AutomationException {
                String resourcePath = getClass().getClassLoader().getResource(file).getFile();
                File fileOnDisk = new File(resourcePath);
                sendKeys(page, prefix, label, type, fileOnDisk.getAbsolutePath());
	}
	/**
	 * Return the visible (i.e. not hidden by CSS) innerText of this element, including sub-elements,
	 * without any leading or trailing whitespace.
	 *
	 * @param page web page identifier of the element config
	 * @param prefix prefix of the element config
	 * @param label label of the element config
	 * @param type locator type of the element
	 * @return the visible text of this element or an empty {@link String} if not found
	 * @throws AutomationException when the element is not found
	 */
	public String getTextInElement(String page, String prefix, String label, String type) throws AutomationException {
		return getController().getTextInElement(getLocator(type, loadConfig(page, prefix, label, type)));
	}

	/**
	 * Save test data to be used in future steps in scenario context.
	 *
	 * @param key the key to save data
	 * @param value the data
	 */
	public void saveTestData(String key, Object value) {
		getKeyStore().put(convertToKeyString(key), value);
	}

	/**
	 * Loads saved test data to the scenario context.
	 *
	 * @param key the key to load saved data
	 * @return the saved test data
	 */
	public Object loadTestData(String key) {
		return getKeyStore().get(convertToKeyString(key));
	}
	
	/**
	 * Check if test data is available in the scenario context.
	 *
	 * @param key the key to check saved data
	 * @return @boolean if there is a value matching that key
	 */
	public boolean hasScenarioTestData(String key) {
		return getKeyStore().containsKey(convertToKeyString(key));
	}
	
	/**
	 * Get the Key Store from Scenario Context
	 * Key Store holds key value pairs stored during the scenario
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getKeyStore(){
		return ((Map<String, Object>)scenarioContext.getContext(Context.KEY_STORE));
	}

	/**
	 * Get element locator in the required type.
	 *
	 * @param type type of the provided key
	 * @param key key of the element in the provided type
	 * @return the locator based on the provided type and key
	 * @throws AutomationException throws when the provided type is unknown
	 */
	protected By getLocator(String type, String key) throws AutomationException {
		switch(type) {
			case ID :
				return By.id(key);
			case CLASS :
				return By.className(key);
			case NAME :
				return By.name(key);
			case XPATH :
				return By.xpath("." + key);
			default :
				throw new AutomationException("Unknown element type [" + type + "]");
		}
	}

	/**
	 * Get current browser URL
	 *
	 * @return
	 */
	public String getCurrentUrl() {
		return getController().getCurrentUrl();
	}

	/**
	 * Load provided URL in the browser
	 *
	 * @param url URL to be loaded in the browser
	 * @throws AutomationException
	 */
	public void loadUrl(String url) throws AutomationException {
		getController().reloadPage(url);
	}

	/**
	 * Returns true if given item does not exist within the given section
	 * (container)
	 *
	 * @param page
	 * @param itemLabel
	 * @param sectionName
	 * @param type
	 * @return
	 * @throws AutomationException
	 */
	public boolean isItemNotAvailableWithinSection(String page, String itemLabel, String sectionName, String type)
			throws AutomationException {
		String itemId = loadConfig(page, ITEM_PREFIX, itemLabel, type);
		String containerId = loadConfig(page, SECTION_PREFIX, sectionName, type);

		WebElement container = getController().waitForElement(By.id(containerId), COMPONENT_WAIT_TIMEOUT);
		try {
			WebElement item = container.findElement(By.id(itemId));
		} catch (NoSuchElementException e) {
			return true;
		}
		return false;
	}
	
	/**
	 * Click on the button inside the table based on the label
	 *
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @param label
	 * @throws AutomationException
	 */
	public void clickOnLinkButton(String page, String prefix, String tableName, String type, String label)
			throws AutomationException {

		String tableXpath = loadConfig(page, prefix, tableName, type);
		int rowCount = getController().getTableRowNumber(label, tableXpath);

		String Xpath_Prefix = loadConfig(page, prefix, "prefix", type);
		String Xpath_Suffix = loadConfig(page, prefix, "suffix", type);
		String componentId = Xpath_Prefix + rowCount + Xpath_Suffix;

		if (type.equals(XPATH)) {
			WebElement element = getController().waitForElement(By.xpath("." + componentId), COMPONENT_WAIT_TIMEOUT);

			try {
				element.click();
			} catch (IllegalArgumentException e1) {
				throw new AutomationException(
						"Could not click on element with Xpath : '" + componentId + "' and text : '" + label + "'", e1);
			}
		} else {

			throw new AutomationException("Button element should have a xpath defined");
		}
	}
	
	/**
	 * Method to select the item of a drop down box when only the value is given
	 * Here the value represent the option tag's value
	 * 
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @return
	 * @throws AutomationException
	 */
	public void selectDropdownBoxElementByOptionValue(String page, String prefix, String id, String type, String value)
			throws AutomationException {
		String pageName = convertToKeyString(page, true);
		String componentId = loadConfig(pageName, prefix, id, type);
		String xPath = "//select[@name='" + componentId + "']/option[@value='" + value + "']";
		By locator = By.xpath(xPath);
		getController().waitForElement(locator, ELEMENT_20_SECONDS_WAIT_TIMEOUT);
		getController().clickElement(locator);
	}
	
	/**
	 * Capture a screenshot and save
	 * 
	 * @param scenarioName the test scenario name
	 */
	public void captureScreenshot(String scenarioName) throws Exception {
		String screenshotDirectory = SeleniumConfig.getInstance().getScreenshotsDirectory();
		SimpleDateFormat timeStamp = new SimpleDateFormat("yyyyMMdd_hhmmss");
		File file = getController().captureScreenshot();
		String screenshotName = scenarioName + "_" + timeStamp.format(new Date()) + ".png";
		// Get destination directory
		File destinationDir = new File(screenshotDirectory);
		// Rename the screenshot
		File destinationFile = new File(destinationDir.getAbsolutePath() + File.separator + screenshotName);
		// Copy file
		FileUtils.copyFile(file, destinationFile);
	}
	
	public void copyElementText(String page, String prefix, String  item, String type, String dataKey) {
		String elementText = getTextByComponentLocator(page, prefix, item, type);
		saveTestData(dataKey, elementText);
	}
	
	public void pressBrowserBackButton() {
		getController().navigateToPageBackPress();
	}
	
	public void pressBrowserForwardButton() {
		getController().navigateToPageForwardPress();
	}
}
