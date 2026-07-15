package com.enactor.pos.mobile.iOS;

import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Comparator;

import org.openqa.selenium.Keys;
import org.openqa.selenium.Point;
import org.openqa.selenium.remote.DesiredCapabilities;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.utilities.StringUtils;
import com.enactor.pos.mobile.MobileThinClinetTestController;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;

import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.remote.MobileCapabilityType;
import io.appium.java_client.touch.TapOptions;
import io.appium.java_client.touch.offset.ElementOption;

/**
 * Thin client test controller for iOS thin client
 * 
 * @author Thushara.Ramasinghe
 *
 */
public class IOSMobileThinClientTestController extends MobileThinClinetTestController<IOSDriver<MobileElement>> {

	@Override
	public List<String> getTextInListItems(String elementId) throws AutomationException {
		List<String> textLines = new ArrayList<>();
		List<MobileElement> texts = findTextElementsInList(elementId);
		Map<Integer, List<MobileElement>> groupedByTextY = new HashMap<>();
		// Group texts by their Y attribute
		for (MobileElement text : texts) {
			// Get the location of the element
			Point location = text.getLocation();
			int y = location.getY();
			// Explicit check for presence before putting into map
			if (!groupedByTextY.containsKey(y)) {
				groupedByTextY.put(y, new ArrayList<MobileElement>());
			}
			groupedByTextY.get(y).add(text);
		}
		// For each group, sort by X and combine texts
		for (List<MobileElement> group : groupedByTextY.values()) {
			Collections.sort(group, new Comparator<MobileElement>() {
				@Override
				public int compare(MobileElement e1, MobileElement e2) {
					return Integer.compare(e1.getLocation().getX(), e2.getLocation().getX());
				}
			});
			StringBuilder combinedText = new StringBuilder();
			for (MobileElement e : group) {
				combinedText.append(e.getAttribute("value"));
			}
			textLines.add(combinedText.toString().replaceAll("\n", "").trim());
		}
		return textLines;
	}

	@Override
	public MobileElement findTextElementInList(String listElementId, String text) throws AutomationException {
		// Find the list element
		MobileElement listBox = findElement(listElementId); // Assuming you have a method to find the list element
		String xpath = "//XCUIElementTypeStaticText[@value='" + text + "']";
		MobileElement element = (MobileElement) listBox.findElementByXPath(xpath);
		// Check if the element is visible
		if (!element.isDisplayed()) {
			scrollToElement(element);
			MobileElement newElement = (MobileElement) listBox.findElementByXPath(xpath);
			return newElement;
		}
		return element;
	}

	// Method to scroll to a specific element within a list
	private void scrollToElement(MobileElement element) {
		// Use the element's ID to scroll to it
		String elementId = element.getId();
		final HashMap<String, Object> args = new HashMap<>();
		args.put("element", elementId);
		args.put("direction", "down");
		getDriver().executeScript("mobile: scrollToElement", args);
	}

	@Override
	public String getComponentInnerContent(MobileElement mobileElement) throws AutomationException {
	    if (mobileElement != null) {
	        List<MobileElement> elements = mobileElement.findElementsByClassName("XCUIElementTypeStaticText");
	        StringBuilder contentBuilder = new StringBuilder();
	        for (MobileElement element : elements) {
	            contentBuilder.append(element.getText()).append(" "); // appending a space between each text
	        }
	        return contentBuilder.toString().trim(); // trim() to remove the trailing space
	    }
	    throw new AutomationException("Failed to find the report element.");
	}

	@Override
	protected void configure() {
		String serialNumber = MobilePosTestUtils.getSerialNumber();
		if(StringUtils.notEmpty(serialNumber)) {
			configureWithSerialNumber(serialNumber);
		} else {
			configureWithSettings();
		}
	}

	protected void configureWithSettings() {
		// Click on Configure using the Settings button
		getDriver().findElementByXPath("//XCUIElementTypeButton[@name=\"Configure using the Settings\"]").click();

		// Set host
		getDriver().findElementByXPath(
				"//XCUIElementTypeApplication[@name=\"Enactor Client\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeTextField")
				.click();
		getDriver().findElementByXPath(
				"//XCUIElementTypeApplication[@name=\"Enactor Client\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeTextField")
				.sendKeys(MobilePosTestUtils.getMobilePDPHostName());

		// Set port
		getDriver().findElementByXPath(
				"//XCUIElementTypeApplication[@name=\"Enactor Client\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[3]/XCUIElementTypeTextField")
				.click();
		getDriver().findElementByXPath(
				"//XCUIElementTypeApplication[@name=\"Enactor Client\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[3]/XCUIElementTypeTextField")
				.clear();
		getDriver().findElementByXPath(
				"//XCUIElementTypeApplication[@name=\"Enactor Client\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[3]/XCUIElementTypeTextField")
				.sendKeys(MobilePosTestUtils.getMobilePDPHostPort());

		// Set device ID
		getDriver().findElementByXPath(
				"//XCUIElementTypeApplication[@name=\"Enactor Client\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[6]/XCUIElementTypeTextField")
				.click();
		getDriver().findElementByXPath(
				"//XCUIElementTypeApplication[@name=\"Enactor Client\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[6]/XCUIElementTypeTextField")
				.clear();
		getDriver().findElementByXPath(
				"//XCUIElementTypeApplication[@name=\"Enactor Client\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[6]/XCUIElementTypeTextField")
				.sendKeys(MobilePosTestUtils.getMobilePosDeviceId());
		getDriver().findElementByXPath(
				"//XCUIElementTypeApplication[@name=\"Enactor Client\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[6]/XCUIElementTypeTextField")
				.sendKeys(Keys.ENTER);

		getDriver().findElementByXPath("//XCUIElementTypeButton[@name=\"< Back\"]").click();
	}
	
	protected void configureWithSerialNumber(String serialNumber) {
		// Click on Configure using a Serial Number
		getDriver().findElementByXPath("//XCUIElementTypeButton[@name=\"Configure using a Serial Number\"]").click();

		// Set Serial Number
		MobileElement field = getDriver().findElement(MobileBy.iOSClassChain(
		        "**/XCUIElementTypeTextField[1]"
		    ));
		    field.click();
		    field.sendKeys(serialNumber);
		
		getDriver().findElementByXPath("//XCUIElementTypeButton[@name=\"Continue\"]").click();

	}

	@Override
	protected IOSDriver<MobileElement> createDriver(URL url, DesiredCapabilities cap) {
		return new IOSDriver<MobileElement>(url, cap);
	}
	
	private List<MobileElement> findTextElementsInList(String listElementId) throws AutomationException {
		try {
			MobileElement listBox = findElement(listElementId);
			return listBox.findElementsByClassName("XCUIElementTypeStaticText");
		} catch (Exception e) {
			throw new AutomationException("Failed to find the element in the list box.",e);
		}
	}
	
	@Override
	protected void addAdditionalCapabilities(DesiredCapabilities capabilities) {
		capabilities.setCapability(MobileCapabilityType.AUTOMATION_NAME, "XCUITest");
	}

	@Override
	public void pressButton(MobileElement buttonElement) {
	    new TouchAction<>(driver)
	        .tap(TapOptions.tapOptions().withElement(ElementOption.element(buttonElement)))
	        .perform();
	}

	@Override
	public String getTextInLabelField(String elementId) throws AutomationException {
		try {
			MobileElement panel = findElement(elementId);
			String text = "";
			List<MobileElement> elements = panel.findElementsByClassName("XCUIElementTypeStaticText");
			for (MobileElement element : elements) {
				text += element.getAttribute("label") + "\n";
			}
			return text;
		} catch (Exception e) {
			throw new AutomationException("Failed to find the element in the list box.",e);
		}
	}
	
	@Override
	public void selectComboboxItem(String testData, String elementId) throws AutomationException {
		findTextElementInList(elementId + "OptionsTable", testData).click();
	}

	@Override
	public void enterValueForInput(MobileElement element, String value) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void enterPress() {
		// TODO Auto-generated method stub
	}
}