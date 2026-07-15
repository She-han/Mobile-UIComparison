package com.enactor.pos.mobile.web;

import java.util.Arrays;
import java.util.List;

import org.openqa.selenium.By;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.pos.PosUtility;
import com.enactor.pos.automation.peripherals.PrimaryPrinter;
import com.enactor.pos.swing.ISwingAppStepsProvider;
import com.enactor.pos.swing.SwingAppStepsProvider;
import com.enactor.pos.web.BaseWebPosStepsProvider;

/**
 * Step provider for use on both iOS and Android devices. This class is
 * responsible for interacting with web elements on iOS and Android devices.
 * 
 * @author Preminda.Bandara
 */
public abstract class MobileThinClientWebPosStepsProvider extends BaseWebPosStepsProvider {

	private static final String BASKET_GRID_ROW_CLASS_NAME = "//*[contains(@class, 'basket-grid-row')]";
	private static final String SIMPLE_SELECTION_ROW_CLASS_NAME = "//*[contains(@class, 'selection-row')]";
	private static final String WINDOW_ID_XPATH = "//*[@id='%s']";
	
    protected ISwingAppStepsProvider swingAppStepsProvider =
            new SwingAppStepsProvider(getController(), WAIT_WINDOW_DISPLAY);

	public void beforeTest() throws AutomationException {
		checkWindow(ENTER_USER_WINDOW_NAME, 40);
	}
	
	@Override
	protected void checkWindow(String windowName, long timeout) throws AutomationException {

		if (isPeripheralWindow(windowName)) {
			swingAppStepsProvider.waitForWindow(getWindowId(windowName), timeout);
		} else {
			String windowId = getWindowId(windowName);
			By windowWithXpath = By.xpath(String.format((WINDOW_ID_XPATH), windowId));
			getWebController().waitForElement(windowWithXpath);
		}
	}
	
	@Override
	public void enterText(String text, String field, String windowName) throws AutomationException {

		text = getTestData(checkCalculationText(text));
		if (isPeripheralWindow(windowName)) {
			swingAppStepsProvider.enterText(text, getComponentId(field), getWindowId(windowName));
		} else {
			super.enterText(text, field, windowName);
		}
	}

	@Override
	public void pressButtonByComponent(String componentName, String windowName)
			throws AutomationException {

		if (isPeripheralWindow(windowName)) {
			swingAppStepsProvider.pressButtonByComponentId(getComponentId(componentName), getWindowId(windowName));
		} else {
			super.pressButtonByComponent(componentName, windowName);;
		}
	}

	@Override
	public void pressButton(String buttonLabel, String windowName) throws AutomationException {
		if (isPeripheralWindow(windowName)) {
			swingAppStepsProvider.pressButtonWithLabel(
                    getTestData(buttonLabel), getWindowId(windowName), getPosButtonComponentIdList(), WAIT_BUTTON_DISPLAY);
		} else {
			super.pressButton(buttonLabel, windowName);
		}
	}
	
	@Override
	public void afterTestCheckEnterUserScreenShown(String testName, boolean clearTestPrinter, boolean testFailed)
			throws Exception {
		try {
			TRANSACTION_IDS.clear();
			if (testFailed) {
				failTest(testName);
			}
			checkWindow(ENTER_USER_WINDOW_NAME, WAIT_WINDOW_DISPLAY);
		} catch (Exception e) {
			restartApplication();
		} finally {
			if (clearTestPrinter) {
				clearPrinter();
			}
		}
	}

	@Override
	public void waitsForComponent(String component, String windowName) throws AutomationException {
		getWebController().waitForElement(By.xpath(getXpathForAnyElement(component)));
	}
	
	@Override
	public void restartApplication() throws AutomationException {
		((IAUTMobileWebController<?>) getWebController()).restartApplication();
	}
	
	@Override
	public String getComponentInnerContent(String component, String windowName)
			throws AutomationException {
		return ((IAUTMobileWebController<?>) getWebController())
		.getAttributeInElementWithInnerHTML(By.xpath(getXpathForAnyElement(component)));
	}
	
	@Override
	protected String getTextFieldValue(String field) throws AutomationException {
		String textFieldValue = getWebController()
				.getAttributeInElement(By.xpath(getXpathForAnyElement(field)), VALUE);
		if (textFieldValue == null) {
			textFieldValue = ((IAUTMobileWebController<?>) getWebController())
					.getAttributeInElementWithInnerText(By.xpath(getXpathForAnyElement(field)));
		}
		return textFieldValue;
	}

	@Override
	protected List<String> getGridBodyLines() throws AutomationException {
		return getWebController().getTextInList(By.xpath(XPATH_SELECTOR_FOR_GRID_BODY),
				By.xpath(BASKET_GRID_ROW_CLASS_NAME));
	}

	@Override
	protected List<String> getSimpleSelectionRowLines() throws AutomationException {
		return getWebController().getTextInList(By.xpath(XPATH_SELECTOR_FOR_SIMPLE_SELECTION),
				By.xpath(SIMPLE_SELECTION_ROW_CLASS_NAME));
	}
	
	@Override
	public void selectComboboxItem(String item, String field, String windowName) throws AutomationException {
		if (isPeripheralWindow(windowName)) {
			swingAppStepsProvider.selectComboboxItem(getTestData(item), getComponentId(field), getWindowId(windowName));
        } else {
			getWebController().clickElement(By.xpath(getXpathForComboBox(field)));
			getWebController().clickElement(By.xpath(getXpathForComboBoxOption(field, getTestData(item))));
        }
	}
	
	@Override
	public void enterPress() throws AutomationException {
		getWebController().enterPress();
	}
}
