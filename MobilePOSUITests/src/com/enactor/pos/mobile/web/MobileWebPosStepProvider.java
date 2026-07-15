package com.enactor.pos.mobile.web;

import java.util.Arrays;
import java.util.List;

import org.openqa.selenium.By;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.component.IComponentAccessor;
import com.enactor.core.automation.component.IWindowAccessor;
import com.enactor.pos.PosUtility;
import com.enactor.pos.automation.peripherals.PrimaryPrinter;
import com.enactor.pos.web.BaseWebPosStepsProvider;

/**
 * Step provider for use on both iOS and Android devices. This class is
 * responsible for interacting with web elements on iOS and Android devices.
 * 
 * @author Preminda.Bandara
 */
public abstract class MobileWebPosStepProvider extends BaseWebPosStepsProvider {

	protected static ILogicalDeviceStepProvider logicalDeviceStepProvider = null;

	private static final String BASKET_GRID_ROW_CLASS_NAME = "//*[contains(@class, 'basket-grid-row')]"
			+ "|//*[contains(concat(' ', normalize-space(@class), ' '), ' native-selection-row ')]";
	private static final String SIMPLE_SELECTION_ROW_CLASS_NAME = "//*[contains(@class, 'selection-row')]";
	private static final String WINDOW_ID_XPATH = "//*[@id='%s']";

	public void beforeTest() throws AutomationException {
		checkWindow(ENTER_USER_WINDOW_NAME, 40);
	}

	@Override
	protected void checkWindow(String windowName, long timeout) throws AutomationException {

		if (isPeripheralWindow(windowName)) {
			logicalDeviceStepProvider.checkDevice(windowName, timeout);
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
			logicalDeviceStepProvider.enterTextOnDevice(text, windowName);
		} else {
			super.enterText(text, field, windowName);
		}
	}

	@Override
	public void pressButtonByComponent(String componentName, String windowName)
			throws AutomationException {

		if (isPeripheralWindow(windowName)) {
			logicalDeviceStepProvider.pressButtonOnDevice(getComponentId(componentName),
					windowName);;
		} else {
			super.pressButtonByComponent(componentName, windowName);;
		}
	}

	@Override
	public void pressButton(String buttonLabel, String windowName) throws AutomationException {
		if (isPeripheralWindow(windowName)) {
			logicalDeviceStepProvider.pressButtonOnDevice(buttonLabel, windowName);;

		} else {
			super.pressButton(buttonLabel, windowName);
		}
	}
	
	@Override
	public void selectComboboxItem(String item, String field, String windowName) throws AutomationException {
		if (isPeripheralWindow(windowName)) {
			logicalDeviceStepProvider.selectComboboxItem(getTestData(item), getComponentId(field),
					getWindowId(windowName));
		} else {
			super.selectComboboxItem(item, field, windowName);
		}
	}
	
	

	@Override
	public void pressButtonOnTestPeripheral(String buttonLabel, String peripheralName)
			throws AutomationException {
		logicalDeviceStepProvider.pressButtonOnDevice(buttonLabel, peripheralName);
	}

	@Override
	public void storeTransactionID() throws AutomationException {
		String receiptText = logicalDeviceStepProvider.getReceiptText();
		try {
			String tx = PrimaryPrinter.getTransactionId(receiptText.toString());
			TRANSACTION_IDS.put(TRANSACTION_IDS.size() + 1, tx);
			System.out.println("Transaction ID " + tx + " stored");
		} catch (AutomationException e) {
			// receipt with no tx id
			// do nothing
		}
	}

	@Override
	public void afterTestCheckEnterUserScreenShown(String testName, boolean clearTestPrinter,
			boolean testFailed)
			throws Exception {
		try {
			
			TRANSACTION_IDS.clear();
			
			if (clearTestPrinter) {
				logicalDeviceStepProvider.clearPrinter();
			}
			if (testFailed) {
				failTest(testName);
			}
			checkWindow(ENTER_USER_WINDOW_NAME);
		} catch (Exception e) {
			((IAUTMobileWebController<?>) getWebController()).restartApplication();
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
	protected List<String> getReceiptLinesOnPrinter(String windowName) throws AutomationException {
		return getPrinterReceiptLines(); 
	}
	
	@Override
	protected List<String> getPrinterReceiptLines() throws AutomationException {
		String receiptText = logicalDeviceStepProvider.getReceiptText();
		if (receiptText == null) {
			throw new AutomationException("Failed to get the content of the printed receipt");
		}

		// remove unicode values
		String html = PosUtility.replaceSpecialCharacters(receiptText);

		String htmlBody = html.substring(html.indexOf("<html>") + 6, html.indexOf("</html>"));
		List<String> receipt = Arrays.asList(htmlBody.split("</font>")); // remove end </font> tags

		// Get Body content from the given index
		for (int i = 0; i < receipt.size(); i++) {
			String item = receipt.get(i).replace("--------------------------------------------",
					""); // remove line
			// separators
			receipt.set(i, item.substring(item.indexOf(">") + 1)); // remove start <font> tags
		}

		return receipt; // return only <body> of the html
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
	public void enterPress() {
		getWebController().enterPress();
	}
}
