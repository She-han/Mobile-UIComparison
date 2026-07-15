package com.enactor.pos.mobile.android;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.DesiredCapabilities;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.utilities.StringUtils;
import com.enactor.pos.mobile.MobileThinClinetTestController;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;

import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import io.appium.java_client.remote.MobileCapabilityType;
import io.appium.java_client.touch.offset.PointOption;

/**
 * Thin client test controller for Android thin client
 * 
 * @author Thushara.Ramasinghe
 *
 */
public class AndroidMobileThinClinetTestController extends MobileThinClinetTestController<AndroidDriver<MobileElement>> {

	@Override
	public MobileElement findElementByLabelText(String label) throws AutomationException {
		if (getDriver() != null) {
			List<MobileElement> elements = getDriver()
					.findElements(MobileBy.AndroidUIAutomator("new UiSelector().text(\"" + label + "\")"));
			if (elements != null && !elements.isEmpty()) {
				if (elements.size() > 1) {
					for (int i = elements.size() - 1; i >= 0; i--) {
						MobileElement element = elements.get(i);
						if (element.isDisplayed() && element.isEnabled()) {
							return element;
						}
					}
				}
				return elements.get(0);
			} else {
				return null;
			}

		} else {
			throw new AutomationException("Appium driver not initialised properly");
		}
	}
	@Override
	public List<String> getTextInListItems(String elementId) throws AutomationException {
		if (getDriver() != null) {
			int listLength = 0;
			int listLastLength = 0;
			HashSet<String> textValues = new HashSet<>();	
			boolean scrollable = isListScrollable(elementId);
			do {
				if(!textValues.isEmpty()) {
					// Scroll down to load more elements
					try {
						MobileElement listBox = findElement(elementId);
						String listClass = listBox.getAttribute("className");
						getDriver().findElement(MobileBy.AndroidUIAutomator(
							    "new UiScrollable(" +
							        "new UiSelector()" +
							            ".className(\"" + listClass + "\")" +
							            ".scrollable(true)" +
							    ").scrollForward()"
							));
					} catch (NoSuchElementException e) {
					    // Continue without scrolling - element might not be scrollable
					} catch (Exception e) {
					    // Continue without scrolling
					}
					
					
				}
				
				listLastLength = listLength;
				List<MobileElement> elements = findTextElementsInList(elementId);
				
				Map<Integer, List<MobileElement>> groupedByTextY = new HashMap<>();
				// Group texts by their Y attribute
				for (MobileElement text : elements) {
					// Get the bounds of the element
					String bounds = text.getAttribute("bounds");

					int y = Integer.parseInt(bounds.split("\\]\\[")[0].split(",")[1].replace("[", ""));
					// Explicit check for presence before putting into map
					if (!groupedByTextY.containsKey(y)) {
						groupedByTextY.put(y, new ArrayList<MobileElement>());
					}
					groupedByTextY.get(y).add(text);
				}
				// For each group, combine texts
				for (List<MobileElement> group : groupedByTextY.values()) {
					StringBuilder combinedText = new StringBuilder();
				    for (int i = 0; i < group.size(); i++) {
				        MobileElement e = group.get(i);
				        if (i >= 1) {  // This is the second element, add a space before appending
				            combinedText.append(" ").append(e.getAttribute("text").trim());
				        } else {
				            combinedText.append(e.getAttribute("text").trim());
				        }
				    }
					textValues.add(combinedText.toString().replace("\n", "").replaceAll("\\s+", " ").trim());
				}
				
				listLength = textValues.size();
			    
			} while (scrollable && listLength != listLastLength);
			
			if(scrollable) {
				//Move to Top
				try {
					MobileElement listBox = findElement(elementId);
					String listClass = listBox.getAttribute("className");
					getDriver().findElement(MobileBy.AndroidUIAutomator(
						    "new UiScrollable(" +
						        "new UiSelector()" +
						            ".className(\"" + listClass + "\")" +
						            ".scrollable(true)" +
						    ").flingBackward()"
						));
				} catch (NoSuchElementException e) {
				    // Continue without scrolling - element might not be scrollable
				} catch (Exception e) {
				    // Continue without scrolling
				}
			}
			
			return new ArrayList<>(textValues);
		} else {
			throw new AutomationException("Appium driver not initialised properly");
		}
	}

	@Override
	public MobileElement findTextElementInList(String listElementId, String text) throws AutomationException {		
		if (getDriver() != null) {
			// The regex pattern to match any of the special characters
			String specialCharsRegex = "[\\[\\]{}()\\-=?+*|\\^$.%£]";

			// Escape all special characters in the string
			text = text.replaceAll(specialCharsRegex, "\\\\$0");

			// Replace all whitespace with the regex pattern to match any whitespace
			String regexPattern = text.replaceAll("\\s+", "\\\\s*");

	       	MobileElement element = getDriver().findElement(MobileBy.AndroidUIAutomator(
	       	        "new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().textMatches(\"" + regexPattern + "\").instance(0))"));

			return element;

		} else {
			throw new AutomationException("Appium driver not initialised properly");
		}
	}
	
	@Override
	public String getTextInLabelField(String elementId) throws AutomationException {
		try {
			MobileElement panel = findElement(elementId);
			String text = "";
			List<MobileElement> elements = panel.findElementsByClassName("android.widget.TextView");
			for (MobileElement element : elements) {
				text += element.getText() + "\n";
			}
			return text;
		} catch (Exception e) {
			throw new AutomationException("Failed to find the element in the list box.",e);
		}
	}

	@Override
	public void pressButton(MobileElement buttonElement) {
		Actions actions = new Actions(this.driver);
		if (this.driver.isKeyboardShown()) {
			this.driver.hideKeyboard();
		}
		actions.moveToElement(buttonElement).click().perform();
	}
	
	@Override
	public String getComponentInnerContent(MobileElement mobileElement) throws AutomationException {
		if (mobileElement != null) {
			return mobileElement.getText();
		}
		throw new AutomationException("Failed to find the report element.");
	}
	
	@Override
	public void selectComboboxItem(String testData, String elementId) throws AutomationException {
		findTextElementInList(elementId, testData).click();
	}
	
	@Override
	protected void addAdditionalCapabilities(DesiredCapabilities capabilities) {
		capabilities.setCapability(MobileCapabilityType.AUTOMATION_NAME, "UiAutomator2");
		capabilities.setCapability("autoGrantPermissions", "true");
	}

	@Override
	protected AndroidDriver<MobileElement> createDriver(URL url, DesiredCapabilities cap) {
		return new AndroidDriver<MobileElement>(url, cap);
	}

	@Override
	protected void configure() {
		String serialNumber = MobilePosTestUtils.getSerialNumber();
		if (StringUtils.notEmpty(serialNumber)) {
			configureWithSerialNumber(serialNumber);
		} else {
			configureWithSettings();
		}

	}

	
	protected void configureWithSettings() {
		getDriver().findElementByXPath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.Button[2]").click();

		getDriver().findElementByXPath(
				"/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ListView/android.widget.LinearLayout[1]/android.widget.RelativeLayout")
				.click();

		getDriver().findElementById("android:id/edit").sendKeys(MobilePosTestUtils.getMobilePDPHostName());
		getDriver().findElementById("android:id/button1").click();
		getDriver().findElementByXPath(
				"/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ListView/android.widget.LinearLayout[5]/android.widget.RelativeLayout")
				.click();

		getDriver().findElementById("android:id/edit").sendKeys(MobilePosTestUtils.getMobilePosDeviceId());
		getDriver().findElementById("android:id/button1").click();
		
		getDriver().getScreenshotAs(OutputType.FILE);

		getDriver().pressKey(new KeyEvent(AndroidKey.BACK));

	}
	
	protected void configureWithSerialNumber(String serialNumber) {
		getDriver().findElementById("com.enactor.mobile.android.pos:id/configureUsingSerial").click();

		getDriver().findElementByXPath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.EditText").sendKeys(serialNumber);
		getDriver().findElementById("com.enactor.mobile.android.pos:id/submit_button").click();
		
		getDriver().getScreenshotAs(OutputType.FILE);

	}
	
	private List<MobileElement> findTextElementsInList(String listElementId) throws AutomationException {
		try {
			MobileElement listBox = findElement(listElementId);
			return listBox.findElementsByClassName("android.widget.TextView");
		} catch (Exception e) {
			throw new AutomationException("Failed to find the element in the list box.",e);
		}
	}
	
	public boolean isListScrollable(String elementId) {
		try {
	        MobileElement listElement = findElement(elementId);
	        return Boolean.parseBoolean(listElement.getAttribute("scrollable"));
	    } catch (Exception e) {
	        return false;
	    }
	}
	
	@Override
	public void enterValueForInput(MobileElement element, String value) {
		Map<String, Object> args = new HashMap<>();
        args.put("text", value);
        args.put("elementId", element.getId());
        getDriver().executeScript("mobile: type", args);
	}
	
	@Override
	public void enterPress() {
		getDriver().pressKey(new KeyEvent(AndroidKey.ENTER));
	}
	
}
