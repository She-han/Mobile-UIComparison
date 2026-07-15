package com.enactor.web.stepDefinitions;

import java.util.Arrays;
import java.util.List;

import org.testng.Assert;

import com.enactor.core.automation.cucumber.conetxt.ScenarioContext;
import com.enactor.core.utilities.StringUtils;
import com.enactor.maintenance.ApplicationStepsHelper;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

/**
 * Application Specific Steps for Estate Manager
 * @author Gayan Kavirathne
 */
public class CoreApplicationSteps extends ApplicationStepsHelper {
	
	public CoreApplicationSteps(ScenarioContext scenarioContext) {
		super(scenarioContext);
	}

	protected static final String HOME_PAGE = "Home Page";
	protected static final String LOGIN_PAGE = "Login";
	protected static final String LAUNCH_BAR = "Launch Bar";
	protected static final String MENU_SPAN_CLASS = "name";
	protected static final String GROUP_SPAN_CLASS = "tileHeader";
	protected static final String FORM_TITLE_SPAN_CLASS = "formTitle";
	
 	/**
	 * Add device id Cookie
	 *
	 * @param register
	 * @throws Throwable
	 */
	@Given("the Web Maintenance is launched from the \"(.*)\" device$")
	public void launchWebMaintenance(String register) throws Throwable {
		if ((register.toLowerCase()).equals("registered")) {
			addCookies();
			setCurrentPage("Login");
		}
	}
	
	/**
	 * User navigate to a specific app.
	 * eg: to navigate to Customer Order Maintenance
	 * menuPath = "Operations,CRM,Customer Orders"
	 * 
	 * Note: This method will not validate the loaded maintenance view and user should be
	 * in the home page in order to this step to work.
	 * 
	 * @param menuPath
	 */
	@And("^user navigates to the \"(.*)\" app$")
	public void navigateToMaintenanceApp(String menuPath) throws Throwable {
		List<String> apps = Arrays.asList(StringUtils.splitString(menuPath, ","));

		// Navigate to app
		for (int menuItem = 0; menuItem < apps.size(); menuItem++) {
			String app = apps.get(menuItem);
			clickOnMenuButtonByClassAndLabel(getCurrentPage(), MENU_LABEL, app, MENU_SPAN_CLASS);
		}
	}
	
	/**
	 * Login to web maintenance as a Valid User and navigate to a specific app
	 * eg: to navigate to Locations Maintenance
	 * menuPath = "Configuration,Organisation,Locations"
	 *
	 * @param menuPath
	 * @throws Throwable
	 */
	@When("^user logs in and navigates to the \"(.*)\" app$")
	public void loadApp(String menuPath) throws Throwable {
		loadAppAsGivenUser("Valid", menuPath);
	}
	
	/**
	 * Login to web maintenance as a GIVEN USER and navigate to a specific app
	 * eg: to navigate to Customer Order Maintenance
	 * menuPath = "Operations,CRM,Customer Orders"
	 * @param user
	 * @param menuPath
	 * @throws Throwable
	 */
	@When("^user logs in as \"(.*)\" and navigates to the \"(.*)\" app$")
	public void loadAppAsGivenUser(String user, String menuPath) throws Throwable {
		List<String> apps = Arrays.asList(StringUtils.splitString(menuPath, ","));

		// Login to Web Maintenance
		logInToApplicationByGivenUser(user);

		// Navigate to app
		for (int menuItem = 0; menuItem < apps.size() - 1; menuItem++) {
			String app = apps.get(menuItem);
			// clickOnMenuButton(currentPage, MENU_LABEL, app, null);
			clickOnLabelButtonByClassAndVerify(getCurrentPage(), MENU_LABEL, app, MENU_SPAN_CLASS, app, GROUP_SPAN_CLASS);
		}
		String loadingApp = apps.get(apps.size() - 1);
		// Since the app name and the maintenance page title are different some times we
		// will only validate visibility of a title span
		clickOnLabelButtonByClassAndVerify(getCurrentPage(), MENU_LABEL, loadingApp, MENU_SPAN_CLASS, "",
				FORM_TITLE_SPAN_CLASS);
	}
	
	/**
	 * Login to web maintenance as a GIVEN USER
	 * @param user
	 * @throws Throwable
	 */
	@When("^user logs in as \"(.*)\"$")
	public void logInToApplicationByGivenUser(String user) throws Throwable {

		// Login to Web Maintenance
		enterText(getCurrentPage(), FIELD_LABEL, "User ID", ID, resolveData("${" + user + " Username}"));
		enterText(getCurrentPage(), FIELD_LABEL, "Password", ID, resolveData("${" + user + " Password}"));
		enterText(getCurrentPage(), FIELD_LABEL, "Device ID", ID, "${Valid Device ID}");
		clickOnLinkButton(getCurrentPage(), BUTTON_LABEL, "Register", CLASS);
		waitForComponent(LAUNCH_BAR, BUTTON_LABEL, "Sign Off", CLASS);
		setCurrentPage(HOME_PAGE);
	}

	/**
	 * Login to web maintenance as a GIVEN USER multiple times
	 * @param user
	 * @throws Throwable
	 */
	@When("^the user logs in as \"(.*)\" \"(.*)\" times$")
	public void logInToApplicationByGivenUserMultipleTimes(String user, String times) throws Throwable {

		// Login to Web Maintenance
		for (int i = Integer.parseInt(resolveData(times)); i > 0; i--) {
			// Login to Web Maintenance
			enterText(getCurrentPage(), FIELD_LABEL, "User ID", ID, resolveData("${" + user + " Username}"));
			enterText(getCurrentPage(), FIELD_LABEL, "Password", ID, resolveData("${" + user + " Password}"));
			clickOnLinkButton(getCurrentPage(), BUTTON_LABEL, "Sign On", CLASS);
			waitForComponent(LAUNCH_BAR, BUTTON_LABEL, "Sign Off", CLASS);
			setCurrentPage(HOME_PAGE);
			clickOnLinkButton(LAUNCH_BAR, BUTTON_LABEL, "Sign Off", CLASS);
			setCurrentPage(LOGIN_PAGE);
		}
	}

	/**
	 * Sign off the Enactor App
	 * 
	 * @throws Throwable
	 */
	@When("^user signs off the enactor app$")
	public void signOff() throws Throwable {
		clickOnLinkButton(LAUNCH_BAR, BUTTON_LABEL, "Sign Off", CLASS); // Click sign off button
		Assert.assertEquals(getTextByComponentLocator(LOGIN_PAGE, BUTTON_LABEL, "Sign On", ID), "Sign On"); // wait 'Sign On' button to display
	}
	
	/**
	 * write xml to queue
	 * 
	 * @param xmlMessage
	 * @param queueName
	 * @param serviceUrl
	 * @param clientId
	 * @throws Throwable
	 */
	@And("^send xml in filepath \"(.*?)\" to queue \"(.*?)\" with client Id \"(.*?)\"$")
	public void setXMLToQueue(String xmlMessage, String queueName, String clientId) throws Throwable {
		writeXmlToQueue(xmlMessage, queueName, clientId);
	}
	
	/**
	 * Click launch bar icons/buttons
	 * launch bar button element must have 'class' attribute defined
	 *
	 * @param label
	 * @throws Throwable
	 */
	@Given("^the user presses launch bar \"(.*)\" button$")
	public void userPressesLaunchBarButton(String label) throws Throwable {
		clickOnLinkButton(LAUNCH_BAR, BUTTON_LABEL, label, CLASS);
	}

	/**
	 * Click on Menu button
	 * Menu Button Class should be {@linkplain MENU_SPAN_CLASS}
	 * @param menuLabel
	 * @throws Throwable
	 */
	@And("^user presses on \"(.*)\" menu button$")
	public void clickMenuButton(String menuLabel) throws Throwable {
		clickOnMenuButtonByClassAndLabel(getCurrentPage(), MENU_LABEL, menuLabel, MENU_SPAN_CLASS);
	}
}
