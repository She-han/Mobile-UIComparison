package com.enactor.pos.mobile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.NotImplementedException;
import org.testng.Assert;

import com.enactor.core.application.process.IApplicationProcessDataType;
import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.utilities.StringUtils;
import com.enactor.pos.mobile.android.AndroidMobileThinClinetTestController;
import com.enactor.pos.mobile.iOS.IOSMobileThinClientTestController;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;
import com.enactor.pos.swing.ISwingAppStepsProvider;
import com.enactor.pos.swing.SwingAppStepsProvider;
import com.enactor.pos.test.BaseStepsProvider;

import io.appium.java_client.MobileElement;

/**
 * Steps provider for mobile thin clients.
 * 
 * @author Thushara.Ramasinghe
 *
 */
public class MobileThinClientPosStepsProvider extends BaseStepsProvider {

	private IMobileAUTController mobileAUTController;

    protected ISwingAppStepsProvider swingAppStepsProvider =
            new SwingAppStepsProvider(getController(), WAIT_WINDOW_DISPLAY);
    
	protected IMobileAUTController getMobileController() throws AutomationException {
		if (mobileAUTController == null) {
			if(MobilePosTestUtils.getMobilePlatformName().equals("Android")) {
				mobileAUTController = new AndroidMobileThinClinetTestController();
			} else if(MobilePosTestUtils.getMobilePlatformName().equals("iOS")) {

				mobileAUTController = new IOSMobileThinClientTestController();
			} else {
				throw new AutomationException("Unsupported platform : " + MobilePosTestUtils.getMobilePlatformName()
						+ ". Only iOS and Android is supported.");
			}
		}
		return mobileAUTController;
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
			recoverApplication(); // navigate to transaction basket page
			restartApplication();
		} finally {
			if (clearTestPrinter) {
				clearPrinter();
			}
		}
	}

	@Override
	public void checkWindow(String windowName) throws AutomationException {
		 checkWindow(windowName, WAIT_WINDOW_DISPLAY);
	}

	@Override
	public void waitsForComponent(String component, String windowName) throws AutomationException {
        if (isPeripheralWindow(windowName)) {
            swingAppStepsProvider
                    .waitsForComponent(getComponentId(component), getWindowId(windowName), WAIT_COMPONENT_DISPLAY);
		} else {
			getComponenent(component);
		}
	}

	@Override
	public void checkComponentNotDisplay(String component, String windowName) throws AutomationException {
        try {
            if (getMobileController().findElement(getComponentId(component)) == null) {
            	return;
            }
        } catch (AutomationException e) {
            return;
        }
        throw new AutomationException("Component [" + component + "] display on [" + windowName + "] page");
	}

	@Override
	public String getComponentInnerContent(String component, String windowName) throws AutomationException {
		return getMobileController().getComponentInnerContent(getComponenent("DialogPanel." + getComponentId(component)));
	}

	@Override
	public void pressButton(String buttonLabel, String windowName) throws AutomationException {
		if (isPeripheralWindow(windowName)) {
            swingAppStepsProvider.pressButtonWithLabel(
                    getTestData(buttonLabel), getWindowId(windowName), getPosButtonComponentIdList(), WAIT_BUTTON_DISPLAY);
        } 
		else if (windowName.equals("Enter User")) {
			MobileElement element = 
                	getComponenentByLabelText(getTestData(buttonLabel));
        	getMobileController().pressButton(element);
        	waits(2000);
        	
        	// Check if we're still on the same screen using page source
            String pageSource = getMobileController().getPageSource();
            boolean stillHasUserIdText = pageSource.contains("USER ID");
            
            // If still on same screen, press again
            if (stillHasUserIdText) {
                getMobileController().pressButton(element);
            }
		} else {
        	MobileElement element = 
                	getComponenentByLabelText(getTestData(buttonLabel));
        	getMobileController().pressButton(element);
		}
	}

	@Override
	public void pressButtonByComponent(String componentName, String windowName) throws AutomationException {
		if (isPeripheralWindow(windowName)) {
            swingAppStepsProvider.pressButtonByComponentId(getComponentId(componentName), getWindowId(windowName));
        } else {
			getComponenent(getComponentId(componentName)).click();
            waits();
        }
	}

	@Override
	public void checkButtonNotDisplay(String buttonLabel, String windowName) throws AutomationException {
        waits();
        Assert.assertTrue(getComponenent(buttonLabel) == null);
	}

	@Override
	public void enterText(String text, String field, String windowName) throws AutomationException {
		text = getTestData(checkCalculationText(text));
		if (isPeripheralWindow(windowName)) {
			swingAppStepsProvider.enterText(text, getComponentId(field), getWindowId(windowName));
		} else if (windowName.contains("Percentage")) {
	        text = text.replace("%", "");
	        MobileElement comp = getComponenent(getComponentId(field));
	        comp.clear();
	        getMobileController().enterValueForInput(comp, text);
	        
	        if(!comp.isSelected()) {
				comp.click();
			}
	    } else {
			MobileElement comp = getComponenent(getComponentId(field));
			comp.clear();
			
			// Check if this is a date field and needs formatting
	        if (field.toLowerCase().contains("date") && text.length() == 6 && !text.contains("/")) {
	            // Format the date input properly for 6-digit dates (DDMMYY)
	            String formattedDate = text.substring(0, 2) + "/" + 
	                                   text.substring(2, 4) + "/" + 
	                                   text.substring(4, 6);
	            
	            comp.sendKeys(formattedDate);
	        } else { 
	            comp.sendKeys(text);
	        }
	        
	        getMobileController().hideSoftKeyboard();
			
			if(!comp.isSelected()) {
				comp.click();
			}
		}
	}
	
	public void enterRichTextFieldValue(String text, String field, String windowName) throws AutomationException {
		text = getTestData(checkCalculationText(text));
		if (isPeripheralWindow(windowName)) {
			swingAppStepsProvider.enterText(text, getComponentId(field), getWindowId(windowName));
		} else {
			MobileElement comp = getMobileController().findElementByXpathSuffix(getComponentId(field));
			comp.clear();
			comp.sendKeys(text);
			
			if(!comp.isSelected()) {
				comp.click();
			}
		}
	}
	
	@Override
	public void enterDate(String text, String field, String windowName) throws AutomationException {
		enterText(text, field, windowName);
	}
	
	@Override
	public void enterTime(String text, String field, String windowName) throws AutomationException {
		enterText(text, field, windowName);
	}

	@Override
	public void enterRichText(String text, String field, String windowName) throws AutomationException {
		enterRichTextFieldValue(text,field,windowName);
	}

	@Override
	public void checkFieldIsNotEmpty(String componentName, String windowName) throws AutomationException {
        String textFieldValue = getComponenent(componentName).getText();
        Assert.assertTrue(!StringUtils.isEmpty(textFieldValue));
	}

	@Override
	public void checkTextFieldValue(String expected, String field, String windowName) throws AutomationException {
		if (getTestData(expected).matches(PASSWORD_PATTERN)) {
			// TODO
		} else {
			String textFieldValue = "";
			MobileElement element = getComponenent(getComponentId(field));
			if (element != null) {
				textFieldValue = element.getText();

				if (textFieldValue.matches(PASSWORD_PATTERN)) {
					Assert.assertTrue(textFieldValue.matches(PASSWORD_PATTERN));
				} else {
					Assert.assertEquals(replaceNewLineWithSpace(textFieldValue).toLowerCase(),
							replaceNewLineWithSpace(getTestData(expected)).toLowerCase());
				}
			}
		}
	}

	@Override
	public void checkTextFieldContainsValue(String text, String field, String windowName) throws AutomationException {
        String textFieldValue = getComponenent(getComponentId(field)).getText();
        Assert.assertTrue(textFieldValue.contains(getTestData(text)));
	}

	@Override
	public void checkLabelFieldValue(String expected, String field, String windowName)
			throws AutomationException {
		
        String labelValue = getMobileController().getTextInLabelField(getComponentId(field));
        
        String[] values = labelValue.split("\n");
        boolean exactTextMatchExists = false;
        for(String label: values) {
        	exactTextMatchExists = getTestData(expected).toLowerCase().equals(label.toLowerCase());
        	if (exactTextMatchExists) {
        		break;
        	}
        }        
        Assert.assertTrue(exactTextMatchExists);
	}

	@Override
	public void checkPanelTextDisplayed(String expected, String panel, String windowName) throws AutomationException {
		String labelValue = getMobileController().getTextInLabelField(getComponentId(panel));
		String[] values = labelValue.split("\n");
		boolean exactTextMatchExists = false;
		for (String label : values) {
			exactTextMatchExists = label.toLowerCase().contains(getTestData(expected).toLowerCase());
			if (exactTextMatchExists) {
				break;
			}
		}
		Assert.assertTrue(exactTextMatchExists,
				"Text [" + getTestData(expected) + "] not found in panel [" + panel + "]");
	}
	

	@Override
	public void checkPanelTextNotDisplayed(String expected, String panel, String windowName)
			throws AutomationException {
		String labelValue = getMobileController().getTextInLabelField(getComponentId(panel));
		String[] values = labelValue.split("\n");
		boolean exactTextMatchExists = false;
		for (String label : values) {
			exactTextMatchExists = label.toLowerCase().contains(getTestData(expected).toLowerCase());
			if (exactTextMatchExists) {
				break;
			}
			Assert.assertFalse(exactTextMatchExists,
					"Text [" + getTestData(expected) + "] found in panel [" + panel + "]");
		}
	}


	@Override
	public void selectComboboxItem(String item, String field, String windowName) throws AutomationException {
		getMobileController().findElement(getComponentId(field)).click();
		getMobileController().selectComboboxItem(getTestData(item), getComponentId(field));
	}

	@Override
	public void selectListItem(String item, String listName, String windowName) throws AutomationException {
		getMobileController().findTextElementInList(getComponentId(listName), getTestData(item)).click();
	}
	
	@Override
	public void checkSelectedComboboxItem(String item, String field, String windowName) throws AutomationException {
		// TODO: Need to implement the support for checking the selected item of a combobox
		throw new AutomationException("Not supported for checking the selected item of a combobox");
	}

	@Override
	public void restartApplication() throws AutomationException {
        shutdownMobileController();
        beforeTest();
	}

    @Override
    public void beforeTest() throws AutomationException {
        try {
        	if (!getMobileController().isRunning()) {
                getMobileController().start();
        	}
        } catch (Exception e) {
            shutdownMobileController();
            throw new AutomationException("Before test steps failed");
        }
    }

	@Override
	protected void pressButtonInCurrentWindow(String buttonLabel, long timeout) throws AutomationException {
		getComponenent(getComponentId(buttonLabel)).click();
	}

	@Override
	protected void pressButtonByComponentInCurrentWindow(String componentName, long timeout)
			throws AutomationException {
		getComponenent(getComponentId(componentName)).click();
	}

	@Override
	protected byte[] requestCaptureScreenshot() throws AutomationException {
		return getMobileController().captureScreenShot();
	}

	@Override
	protected void checkWindow(String windowName, long timeout) throws AutomationException {
        if (isPeripheralWindow(windowName)) {
            swingAppStepsProvider.waitForWindow(getWindowId(windowName), timeout);
        } else {
			MobileElement window = getMobileController().findElement(getWindowId(windowName));
			if(window == null) {
				new AutomationException("Failed to find window with id " + windowName);
			}
        }
	}

	@Override
	protected List<String> getTextInListItems(String list, String windowName) throws AutomationException {
		return getMobileController().getTextInListItems(getComponentId(list));
	}

	protected void shutdownMobileController() {
		try {
			getMobileController().shutdown();
		} catch (AutomationException e) {
			e.printStackTrace();
		}
	}
	
    @Override
    protected String getWindowId(String windowName) throws AutomationException {

        String pageName = super.getWindowId(windowName);

        if (isPeripheralWindow(windowName)) {
            return pageName;
        }

        if (StringUtils.isEmpty(pageName)) {
            throw new AutomationException("Page name cannot be empty");
        }

        Pattern pattern = Pattern.compile("([A-Z][A-Za-z]*[/][a-zA-Z/]*)+");
        Matcher matcher = pattern.matcher(pageName);

        String processId = matcher.find() ? matcher.group() : null;
        String promptUrl = matcher.find() ? matcher.group() : null;
        return promptUrl.replace("/", "_");
    }
    
    @Override
	public String getReportURL(String componentId, String windowId) throws AutomationException {
    	return getMobileController().getWebViewURL();
	}


	@Override
	public void addToViewData(IApplicationProcessDataType type, Object data) throws AutomationException {
		// Do nothing
	}
	
	private MobileElement getComponenent(String component) throws AutomationException {
		MobileElement componenent = getMobileController().findElement(component);
		if (componenent == null) {
			new AutomationException("Failed to find componenent with id " + component);
		}
		return componenent;
	}

	private MobileElement getComponenentByLabelText(String labelText) throws AutomationException {
		MobileElement componenent = getMobileController().findElementByLabelText(labelText);
		if (componenent == null) {
			new AutomationException("Failed to find componenent with id " + labelText);
		}
		return componenent;
	}
    
    private static String replaceNewLineWithSpace(String textValue) {
		if (StringUtils.notEmpty(textValue)) {
			textValue = textValue.replaceAll("\n", " ");
		}
		return textValue;

	}

	@Override
	public void checkTextFieldValueNotDisplay(String text, String field, String windowName) throws AutomationException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectElementWithXpath(String currentPage, String label) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void isElementSelectedInList(String item, String listName, String windowName) throws AutomationException {
		
		//This step need to be implemented for mobile clients
		throw new AutomationException("Check text is selected in list need to be implemented");
	}
	
	@Override
	public void enterPress() throws AutomationException {
		getMobileController().enterPress();
	}

}
