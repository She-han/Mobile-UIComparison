 	package com.enactor.web.stepDefinitions;

import org.testng.Assert;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.cucumber.conetxt.ScenarioContext;
import com.enactor.core.utilities.StringUtils;
import com.enactor.coreUI.selenium.SeleniumConfig;
import com.enactor.maintenance.BaseWebSteps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

/**
 * Common Web Steps
 */
public class CommonSteps extends BaseWebSteps {


	public CommonSteps(ScenarioContext scenarioContext) {
		super(scenarioContext);
	}

	private String screenshotDirectory = SeleniumConfig.getInstance().getScreenshotsDirectory();

	/**
	 * Enter text into input field
	 * text field element must have 'id' attribute defined
	 *
	 * @param value
	 * @param field
	 * @throws Throwable
	 */
	@Given("^the user enters \"(.*)\" into the \"(.*)\" input field$")
	public void userEntersTextIntoInputField(String value, String field) throws Throwable {
		enterText(getCurrentPage(), FIELD_LABEL, field, ID, value);
	}


	/**
	 * Click button
	 * button element must have 'class' attribute defined
	 *
	 * @param label
	 * @throws Throwable
	 */
	@Given("^the user presses \"(.*)\" button$")
	public void userPressesButton(String label) throws Throwable {
		clickOnLinkButton(getCurrentPage(), BUTTON_LABEL, label, CLASS);
		timeoutForDriver(1000);
		
	}
	
	/**
	 * Click button 
	 * button element must have 'xpath' attribute defined
	 *
	 * @param label
	 * @throws Throwable
	 */
	@Given("^the user presses \"(.*)\" button inside pop-up window$")
	public void userPressesButtonInSection(String label) throws Throwable {
		clickOnLinkButton(getCurrentPage(), BUTTON_LABEL, label, XPATH);
	}	
	
	/**
	 * Click button 
	 * button element must have 'xpath' attribute defined
	 *
	 * @param label
	 * @param pop up modal (eg. Modal OK, Modal Cancel, etc.)
	 * @throws Throwable
	 */
	@Given("^the user presses \"(.*)\" button inside \"(.*)\" pop-up window$")
	public void userPressesButtonInPopUp(String label, String page) throws Throwable {
		setCurrentPage(page);
		clickOnLinkButton(getCurrentPage(), BUTTON_LABEL, label, XPATH);
	}	
	
	/**
	 * Click hidden text inside a pop up 
	 * Button text element must be a 'span' element
	 *
	 * @param label
	 * @throws Throwable
	 */
	@Given("^the user hover over to \"(.*)\"  button and click \"(.*)\" text inside pop-up window$")
	public void userPressesButtoTextInside(String buttonId,String label) throws Throwable {
		clickOnLinkButtonTextInside(getCurrentPage(), BUTTON_LABEL, buttonId, XPATH, label);
	}	
	
	@And("^the user presses \"(.*)[()]\" record from the \"(.*)\" table$")
	public void userPressesButton(String label, String tableName) throws Throwable {
		clickOnLinkButton(getCurrentPage(), BUTTON_LABEL, tableName, XPATH, label);
	}	
	
	/**
	 * Check box selection  
	 * Check box element must have 'id' attribute defined
	 *
	 * @param label
	 * @throws Throwable
	 */
	@When("^the user selects the \"(.*?)\" check box$") 
	public void  selectCheckBoxWithId(String label) throws Throwable {
		selectElement(getCurrentPage(), FIELD_LABEL, label, ID); 
	}
	
	/**
	 * Icon Button selection  
	 * Icon Button element must have 'id' attribute defined
	 *
	 * @param label
	 * @throws Throwable
	 */
	@When("^the user selects the \"(.*?)\" icon button$") 
	public void  selectIconButtonWithId(String label) throws Throwable {
		selectElement(getCurrentPage(), FIELD_LABEL, label, ID); 
	}
	
	/**
	 * Check box deselection
	 * Check box element must have 'id' attribute defined
	 *
	 * @param label
	 * @throws Throwable
	 */
	@When("^the user deselects the \"(.*?)\" check box$")
	public void  deSelectCheckBoxWithId(String label) throws Throwable {
		deSelectCheckBox(getCurrentPage(), FIELD_LABEL, label, ID);

	}

	/**
	 * Check box selection  
	 * Select check box using Xpath
	 * 
	 * Follow below format when adding XPath based variable definition in enactorSelenium.properties
	 * <variable_definition> = <xpath>
	 * eg: ReasonMaintenance.checkbox.label.capture.reference.number.xpath = //*[@id="Application:editForm:editFields:ReferenceRequired"]
	 * 
	 * @param label
	 * @throws Throwable
	 */
	@When("^the user selects the \"(.*?)\" check box inside the tab table$") 
	public void  selectCheckBoxWithXpath(String label) throws Throwable {
		selectElement(getCurrentPage(), CHECK_BOX_LABEL, label, XPATH); 
	}
	
	/**
	 * User waits given number of seconds
	 *
	 * @param seconds
	 * @throws Exception
	 */
	@When("the user waits \"(.*?)\" seconds$")
	public void userWaits(String seconds) throws AutomationException {
		timeoutForDriver(Long.parseLong(seconds) * 1000);
	}
	
	/**
	 * DeSelect a selected Check box  
	 * Select check box using Xpath
	 * 
	 * Follow below format when adding XPath based variable definition in enactorSelenium.properties
	 * <variable_definition> = <xpath>
	 * eg: ReasonMaintenance.checkbox.label.capture.reference.number.xpath = //*[@id="Application:editForm:editFields:ReferenceRequired"]
	 * 
	 * @param label
	 * @throws Throwable
	 */
	@When("^the user deselects the \"(.*?)\" check box inside the tab table$") 
	public void  deSelectCheckBoxWithXpath(String label) throws Throwable {
		deSelectCheckBox(getCurrentPage(), CHECK_BOX_LABEL, label, XPATH); 
	}
	
	/**
	 * Check field error text display
	 * text element must have 'class' attribute defined
	 *
	 * @param errorMessage
	 * @throws Throwable
	 */
	@Given("^\"(.*)\" field error is shown$")
	public void fieldErrorShown(String errorMessage) throws Throwable {
		Assert.assertEquals(getTextByComponentLocator(getCurrentPage(), FIELD_ERROR, null, CLASS),
				errorMessage);
	}

	/**
	 * Check page error text display
	 * text element must have 'class' attribute defined
	 *
	 * @param errorMessage
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" page error is shown$")
	public void pageErrorShown(String errorMessage) throws Throwable {
		Assert.assertEquals(getTextByComponentLocator(getCurrentPage(), PAGE_ERROR, null, CLASS),
				errorMessage);
	}

	/**
	 * Check text field display
	 * text element must have 'id' attribute defined
	 *
	 * @param errorMessage
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" text field is displayed$")
	public void checkTextField(String lable) throws Throwable {
		waitForComponent(getCurrentPage(), FIELD_LABEL, lable, ID);
	}
	
	/**
	 * Check text field display on a specific element Text element must have 'id'
	 * attribute defined
	 *
	 * @param text
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" text field is displayed on the \"(.*)\" label$")
	public void checkTextFieldOnAId(String value, String lable) throws Throwable {
		Assert.assertEquals(getTextByComponentLocator(getCurrentPage(), FIELD_LABEL, lable, ID).toLowerCase(),
				resolveData(value).toLowerCase(), value + " is not matched with expected");
	}

	/**
	 * Tab selection
	 *
	 * @param tabText
	 * @throws Throwable
	 */
    @Then("^the user clicks the \"(.*?)\" tab$") 
	public void isTabClicked(String tabText) throws Throwable 
	{
    	timeoutForDriver(1000);
		clickTabComponentOnPage(getCurrentPage(), TAB_LABEL, tabText, ID);
		timeoutForDriver(500);
	}
	
	/**
	 * Check page with title and button display
	 * button element must have 'id' attribute defined
	 * page title text element must be a 'span' element
	 *
	 * @param page
	 * @param label
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" page is shown with the \"(.*)\" button$")
	public void pageShowWithButton(String page, String label) throws Throwable {
		setCurrentPage(page);
		if (getCurrentPage().equals("Login")) {
			// No page title display in Home page and Login page. Only check the button
			waitForComponent(getCurrentPage(), BUTTON_LABEL, label, ID);
		} else if (getCurrentPage().equals(CoreApplicationSteps.HOME_PAGE)) {
			// Only checking for the button
			isElementVisible(getCurrentPage(), BUTTON_LABEL, label, ID);
		} else {
			if (label.equals("")) {
				// Do Nothing - isSpanWithTextAvailable(getCurrentPage());
			} else {
				Assert.assertTrue(isTitleAndButtonAvailable(getCurrentPage(), label, ID),
						"Page is not the " + getCurrentPage() + " Page, or Button " + label + " is not found");
			}
		}
	}
	
	/**
	 * Check component with button display button element must have 'id' attribute
	 * defined component must have an 'id' attribute
	 *
	 * @param component
	 * @param label
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" component is shown with the \"(.*)\" button$")
	public void componentShowWithButton(String component, String label) throws Throwable {
		setCurrentPage(component);
		if (isElementVisible(getCurrentPage(), COMPONENT, component, ID)
				&& isElementVisible(getCurrentPage(), BUTTON_LABEL, label, ID)) {
			// Do Nothing - means component and button have been found
		} else {
			throw new AutomationException(
					getCurrentPage() + " Component is not diplayed or Button " + label + " is not found");
		}
	}

	/**
	 * Check component is visible component must have an 'id' attribute
	 *
	 * @param component
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" component is shown$")
	public void componentShow(String component) throws Throwable {
		if (component.equals("Sign On")) {
			component = "Login Registration";
		}
		setCurrentPage(component);
		if (isElementVisible(getCurrentPage(), COMPONENT, component, ID)) {
			// Do Nothing - means component has been found
		} else {
			throw new AutomationException(getCurrentPage() + " Component is not diplayed");
		}
	}

	/**
	 * Check given button is not displaying inside a given titled page button
	 * element must have 'xpath' ' attribute defined page title text element must be
	 * a 'span' element
	 *
	 * @param page
	 * @param label
	 * @throws Throwable
	 */
	@Given("^\"(.*)\" page shows without \"(.*)\" button$")
	public void pageShowWithoutButton(String page, String label) throws Throwable {
		setCurrentPage(page);
		if (getCurrentPage().equals(CoreApplicationSteps.HOME_PAGE) || getCurrentPage().equals(CoreApplicationSteps.LOGIN_PAGE)) {
			// No page title display in Home page and Login page. Only check the button
			try {
				waitForComponent(getCurrentPage(), BUTTON_LABEL, label, XPATH);
				throw new AutomationException("The button exists on the page.");
			} catch(Exception e) {
				// Do nothing if there is an error
			}
		} else {
			if (label.equals("")) {
				isSpanWithTextAvailable(getCurrentPage());
			} else {
				Assert.assertTrue(!isTitleAndButtonAvailable(getCurrentPage(), label, XPATH),
						label + " button displays inside the " + getCurrentPage() + " Page");
				Assert.assertTrue(isTitleAndButtonAvailable(getCurrentPage(), label, ID),
						"Page is not the " + getCurrentPage() + " Page");
			}
		}
	}
	
	/**
	 * Check page with title and text field display
	 * text field element must have 'id' attribute defined
	 * page title text element must be a 'span' element
	 *
	 * @param page
	 * @param label
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" page is shown with the \"(.*)\" text field$")
	public void pageShowWithTextField(String page, String field) throws Throwable {
		setCurrentPage(page);
		Assert.assertTrue(isTitleAndFieldAvailable(getCurrentPage(), field, ID),
				"Page is not the " + getCurrentPage() + " Page");
	}

	/**
	 * Page open in View or Edit mode
	 *
	 * @param page
	 * @param mode
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" page is shown in the \"(.*)\" mode$")
	public void pageShowInMode(String page, String mode) throws Throwable {
		setCurrentPage(page + mode);
	}

	@Then("^the \"(.*)\" field is disabled$")
	public void isFieldDisabled(String field) throws Throwable {
		Assert.assertFalse(isElementEnabledOnPage(getCurrentPage(), FIELD_LABEL, field, ID),
				field + " is not disabled");
	}

	@When("^the user selects \"(.*)\" from the \"(.*)\" dropdown field$")
	public void selectDropdownBoxValueInTabTabale(String value, String field) throws Throwable {
		setSelectByComponentIdOnPage(getCurrentPage(), FIELD_LABEL, field, ID, value);
	}

	@Then("^the text \"(.*)\" is shown in the \"(.*)\" text field$")
	public void checkTextFieldValue(String value, String field) throws Throwable {
		Assert.assertEquals(getTextByComponentLocator(getCurrentPage(), FIELD_LABEL, field, ID).toLowerCase(),
				resolveData(value).toLowerCase(),
				value + " is not matched with expected");
	}
	
	@Then("^\"(.*)\" text is shown in the \"(.*)\" text field inside section$")
	public void checkTextFieldValueInSection(String value, String field) throws Throwable {
		Assert.assertEquals(getTextByComponentLocator(getCurrentPage(), FIELD_LABEL, field, XPATH).toLowerCase(),
				resolveData(value).toLowerCase(),
				value + " is not matched with expected");
	}
	
     /**
	 * Displays the check box is selected
	 *
	 * @param label
	 * @throws Throwable
	 */
	@Then("the checkBox \"(.*?)\" is selected$") 
	public void checkBoxWithIdIsSelected(String label) throws Throwable {
	  Assert.assertEquals(isCheckBoxSelected(getCurrentPage(), FIELD_LABEL, label, ID), true,
	  label + "is not selected."); 
	}
	

	/**
	 * Displays the check box is selected
	 *
	 * @param label
	 * @throws Throwable
	 */
	@Then("the checkBox \"(.*?)\" is not selected$") 
	public void checkBoxWithIdIsNotSelected(String label) throws Throwable {
	  Assert.assertEquals(!isCheckBoxSelected(getCurrentPage(), FIELD_LABEL, label, ID), true,
	  label + "is selected."); 
	}
	
	
	/**
	 * Displays the check box inside table is selected
	 *
	 * @param label
	 * @throws Throwable
	 */
	@Deprecated
	@Then("the checkBox \"(.*?)\" inside the tab table is selected$")
	public void checkBoxWithXpathIsSelected(String label) throws Throwable {
	  Assert.assertEquals(isCheckBoxSelected(getCurrentPage(), CHECK_BOX_LABEL, label, XPATH), true,
	  label + "is not selected."); 
	}

	/**
	 * Sets the current page for context
	 *
	 * @param page
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" page is shown$")
	public void pageShown(String page) throws Throwable {
		setCurrentPage(page);
	}

	/**
	 * Displays the check box inside table is not selected
	 *
	 * @param label
	 * @throws Throwable
	 */
	@Deprecated
	@Then("the checkBox \"(.*?)\" inside the tab table is not selected$")
	public void checkBoxWithXpathIsNotSelected(String label) throws Throwable {
	  Assert.assertEquals(!isCheckBoxSelected(getCurrentPage(), CHECK_BOX_LABEL, label, XPATH), true,
	  label + "is selected."); 
	}
	
	
	 /**
	 * Displays dropdown with a text value
	 *
	 * @param value
	 * @param label
	 * @throws Throwable
	 */
	@Then("^the text \"(.*)\" is shown in the \"(.*)\" dropdown field$")
	public void checkDropdownFieldSelectedValue(String value, String label)
			throws Throwable {
		Assert.assertTrue(isValueMatch(
				getSelectTextByComponentIdOnPage(getCurrentPage(), FIELD_LABEL, label, ID), value));
	}

	 /**
	  * Message confirmation box 
	  *
	  * @throws Throwable
	  */
	  @When("the user clicks the ok button in the confirmation window$")
	  public void clicksOkOnConfirmation() throws Throwable {
		clickConfirm();
	  }
	
	 /**
	 * Displays a message
	 *
	 * @param message
	 * @throws Throwable
	 */
	 @Then("^a confirmation message with text \"(.*?)\" is shown$") 
	 public void confirmationMessage(String message) throws Throwable {
		 Assert.assertTrue(getController().isSpanWithTextAvailable(message),
				 "Confirmation message not displayed");
	 }
	 
	 /**
	 * Selects a record from the list with xpath
	 *
	 * @param label
	 * @throws Throwable
	 */
	 @When("^the user selects the \"(.*?)\" entity in the list$") 
	 public void  selectRecordWithXpath(String label) throws Throwable {
		 selectElement(getCurrentPage(), FIELD_LABEL, label, XPATH); 
	 }
	 
	 /**
	 * Clicks a button with its xpath
	 *
	 * @param label
	 * @throws Throwable
	 */
	 @And("^the user clicks the \"(.*?)\" link button$")
	 public void  clickButtondWithXpath(String label) throws Throwable {
		 selectElement(getCurrentPage(), BUTTON_LABEL, label, XPATH); 
	 }
	 
	 /**
	 * Zoom out the browser window
	 *
	 * @throws AutomationException,InterruptedException
	 */
	@Given("^user zooms out to \"(.*)\"$")
	public void zoomOut(String zoom) throws AutomationException, InterruptedException{
		pageZoomout(zoom);
	}
		

	/**
	 * Scrolls up the browser window
	 *
	 * @throws AutomationException,InterruptedException
	 */
	@Given("^user scrolls up the page$")
	public void scrollUp() throws AutomationException, InterruptedException{
		pageup();
	}
	
	/**
	 * Scrolls down the browser window
	 *
	 * @throws AutomationException,InterruptedException
	 */
	@Given("^user scrolls down the page$")
	public void scrollDown() throws AutomationException, InterruptedException{
		pagedown();
	}
	

	/**
	 * Check the displayed element referred by the xpath within an IFrame 
	 * 
	 * @param field Id of the element inside the IFrame
	 * @param frame Xpath of the IFrame element
	 * @param expected  Checking criteria
	 * @throws Throwable
	 */
	@And("^field \"(.*)\" of the IFrame \"(.*)\" is shown \"(.*?)\"$")
	public void checkIFrameFieldValue(String field, String frame, boolean expected) throws Throwable {
		boolean elementFound = false;
		try {
			String value = getTextByIFrameXpath(getCurrentPage(), FIELD_LABEL, field, XPATH, frame, ID);
			elementFound = StringUtils.notEmpty(value);
			if (!expected) {
				elementFound = !StringUtils.isNumeric(value);
			}
		} catch (AutomationException e) {
			elementFound = false;
		}
		Assert.assertEquals(elementFound,expected);
	}

	/**
	 * Check the element displayed with the given text referred by the xpath within an IFrame 
	 * 
	 * @param value Checking text value
	 * @param field Id of the element inside the IFrame
	 * @param frame Xpath of the IFrame element
	 * @throws Throwable
	 */
	@And("\"(.*)\" text is shown in the \"(.*)\" text field inside \"(.*)\" IFrame$")
	public void checkIFrameFieldValue(String value, String field, String frame) throws Throwable {
		boolean elementFound = false;
		String resolvedText = StringUtils.resolvePlaceholdersWithMap(value, propertyMap);
		String extractedValue = "";
		try {
			extractedValue = getTextByIFrameXpath(getCurrentPage(), FIELD_LABEL, field, XPATH, frame, ID);
			elementFound = extractedValue.equals(resolveData(resolvedText));
		} catch (AutomationException e) {
			elementFound = false;
		}
		Assert.assertTrue(elementFound,"Values do not match the expected criteria. Expected: " + resolveData(resolvedText) + ", but found: " + extractedValue);
	}

	/**
	 * Click link label. 
	 * 
	 * @param label
	 * @throws Throwable
	 */
	@When("^the user clicks on \"([^\"]*)\" link label page$")
	public void clicksOnLinkLabel(String label) throws Throwable {
		setClickOnElementByLabel(label);
	}
	
	/**
	 * Check if an item is not contained within a section
	 * the item, section elements must have 'id' attributes defined
	 *
	 * @param itemLabel
	 * @param sectionName
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" is not displayed within the \"(.*)\" section$")
	public void checkItemNotAvailableWithinSection(String itemLabel, String sectionName) throws Throwable {
		Assert.assertTrue(isItemNotAvailableWithinSection(getCurrentPage(), itemLabel, sectionName, ID),
				itemLabel + " exists within the " + sectionName + " section");
	}
	
	/**
	 * Select the first item in the drop down where the selection is no longer
	 * specified and no longer need to be specified.
	 * 
	 * @param field
	 * @param page
	 * @throws Throwable
	 */
	@And("^user selects first item on \"(.*?)\" dropdown in \"(.*?)\" page$")
	public void selectFirstItemFromSelectList(String field, String page) throws Throwable {
		selectDropdownBoxElementByOptionValue(page, FIELD_LABEL, field, ID, "0");
	}
	
	/**
	 * Check whether the displayed error message is the accepted error message or
	 * not
	 * 
	 * @param errorMessage
	 * @throws Throwable
	 */
	@Given("^\"(.*)\" dialog popup error is shown$")
	public void errorMessageAppears(String value) throws Throwable {
		Assert.assertEquals(value, getTextByComponentLocator(getCurrentPage(), POPUP_ERROR, null, CLASS),
				"Message \'" + value + "\' does not appear");
	}
	
	/**
	 * Select given item by option values in the drop down where the selection is no
	 * longer specified and no longer need to be specified.
	 * 
	 * @param field
	 * @param page
	 * @throws Throwable
	 */
	@And("^the user selects \"(.*)\" option value from the \"(.*?)\" dropdown field$")
	public void selectItemByOptionValueFromSelectList(String item, String field) throws Throwable {
		selectDropdownBoxElementByOptionValue(getCurrentPage(), FIELD_LABEL, field, ID, item);
	}
	
	/**
	 * Text value inside the label will be set to key in test data, and can be
	 * resolved in test data expressions
	 * 
	 * @param label
	 * @param key
	 * @throws Throwable
	 */
	@And("^save \"(.*)\" label text into test data key \"(.*?)\"$")
	public void copyTextFromElement(String label, String key) throws Throwable {
		copyElementText(getCurrentPage(), FIELD_LABEL, label, ID, key);
	}
	
	/**
	 * Press back button in the browser window
	 *
	 * @throws Throwable
	 */
	@Given("^user presses back button in the browser$")
	public void pressBackButton() throws Throwable{
		pressBrowserBackButton();
	}
	
	/**
	 * Press forward button in the browser window
	 *
	 * @throws Throwable
	 */
	@Given("^user presses forward button in the browser$")
	public void pressForwardButton() throws Throwable{
		pressBrowserForwardButton();
	}
	
	/**
	 * Check the tiles contain the button
	 *
	 * @throws Throwable
	 */
	@Given("^the \"(.*)\" button displays in the tiles$")
	public void checkButtonInTiles(String label) throws Throwable{
		isTileButtonVisible(label);
	}

}
