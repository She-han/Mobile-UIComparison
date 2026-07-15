package com.enactor.core.automation.controller;

import java.io.File;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.ElementNotVisibleException;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.openqa.selenium.interactions.internal.TouchAction;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Reporter;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.AUT.IAUTWebController;
import com.enactor.core.automation.AUT.RetryableAutomationException;
import com.enactor.core.automation.selenium.SeleniumWebController;
import com.enactor.core.os.command.OSUtils;
import com.enactor.core.os.command.OSUtils.OperatingSystem;
import com.enactor.coreUI.selenium.SeleniumConfig;
import com.enactor.coreUI.selenium.WebDriverPool;
import com.google.common.base.Function;
import com.google.common.collect.ImmutableMap;

/**
 * Base Generic Web Controller(Appium and Selenium) AUT Web Controller
 *
 * @author Preminda.Bandara
 */
public abstract class BaseWebController<T extends WebDriver> implements IAUTWebController {
	
	protected T driver;

	/*
	 * Will Add the ability of a fluent wait. I.e A wait time that grows or shrinks
	 * depending on the speed of what is been tested, and is not dependant on
	 * anything outside of the function been called.
	 */
	protected FluentWait<T> wait;
	
	public static final String CSS_CLASS = "class";
	
	public static final String CSS_SELECTED = "selected";
	
	public T getWebDriver() {
		return driver;
	}

	public void setWebDriver(T webDriver) {
		this.driver = webDriver;
	}

	@Override
	public void addCookie(String name, String value) throws AutomationException {
		Cookie cookie = new Cookie(name, "\"" + value + "\"");
		driver.manage().addCookie(cookie);
	}

	@Override
	public File captureScreenshot() throws Exception {
		File source = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
		return source;
	}

	@Override
	public void reloadPage(String url) throws AutomationException {
		driver.get(url);
	}

	@Override
	public void waitPageRefresh() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		WebDriverWait wait = new WebDriverWait(driver, WAIT_TIMEOUT);
		wait.until(new ExpectedCondition<Boolean>() {
			@Override
			public Boolean apply(WebDriver wdriver) {
				return ((JavascriptExecutor) driver).executeScript("return document.readyState").equals("complete");
			}
		});
	}

	@Override
	public void quit() {
		if (null != driver) {
			WebDriverPool.getInstance().returnDriver(driver);
		}
	}

	@Override
	public void enterText(By locator, String text) throws AutomationException {
		WebElement element = findElementFluently(locator);
		enterText(element, text);
	}

	@Override
	public void enterTextWithBlurEffect(By locator, String text) throws AutomationException {
		enterTextFluently(locator, text, true, true);
	}

	@Override
	public void enterText(WebElement element, String text) throws AutomationException {
		element.clear();
		element.sendKeys(text);
	}

	@Override
	public boolean isElementEnabled(By locator) throws AutomationException {
		WebElement element = null;;
		try {
			element = findElementFluently(locator);
		} catch (Exception e) {
			debug("Exception: " + e);
		}
		return isElementEnabled(element);
	}

	@Override
	public boolean isElementEnabled(WebElement element) throws AutomationException {
		if (null == element) {
			return false;
		}
		return element.isEnabled();
	}

	@Override
	public boolean isElementVisible(By locator) throws AutomationException {
		WebElement element = null;
		try {
			element = findElementFluently(locator);
		} catch (Exception e) {
			debug("Exception: " + e);
		}
		return isElementVisible(element);
	}

	@Override
	public boolean atLeastSingleElementAvailable(By locator) {
		return !driver.findElements(locator).isEmpty();
	}

	@Override
	public boolean isElementVisible(WebElement element) throws AutomationException {
		if (null == element) {
			return false;
		}
		return element.isDisplayed();
	}
	
	@Override
	public boolean isElementFocused(By locator) throws AutomationException {
		WebElement element = findElementFluently(locator);
		WebElement activeElement = driver.switchTo().activeElement();
		return element.equals(activeElement);
	}

	@Override
	public WebElement waitForElement(By locator) throws AutomationException {
		return waitForElement(locator, ELEMENT_WAIT_TIMEOUT, SLEEP_TIMER);
	}

	@Override
	public WebElement waitForElement(By locator, long timeout) throws AutomationException {
		return waitForElement(locator, timeout, SLEEP_TIMER);
	}
	
	@Override
	public WebElement waitForIFrameElement(By locator, long timeout, String frameId) throws AutomationException {
		WebElement element=null;
		try {
			driver.switchTo().frame(frameId);
			element = waitForElement(locator, timeout, SLEEP_TIMER);
			driver.switchTo().defaultContent();
		} catch (AutomationException e) {
			driver.switchTo().defaultContent();
			throw new AutomationException("Could not get text from the element within the IFrame of id : '" + frameId + "'", e);
		}
		return element;
	}

	@Override
	public WebElement waitForElement(By locator, long timeout, long sleep) throws AutomationException {
		// return waitForElement(locator,
		// ExpectedConditions.visibilityOfElementLocated(locator));
		return findElementFluently(locator);
	}

	@Override
	public void clickElement(final By locator) throws AutomationException {

		attemptExecute(new AutomationExecutable() {
			@Override
			public void execute() throws AutomationException {
				try {
					WebElement element = findElementFluently(locator);
					WebDriverWait wait = new WebDriverWait(driver, WAIT_TIMEOUT);
					wait.until(ExpectedConditions.elementToBeClickable(locator));
					element.click();
				} catch (ElementNotVisibleException e) {
					((JavascriptExecutor) driver).executeScript("window.scrollTo(document.body.scrollHeight, 0)");
					throw new RetryableAutomationException("Failed to click, element not visible", e);
				} catch (StaleElementReferenceException se) {
					throw new RetryableAutomationException("Failed to click, Stale Element Exception : ", se);
				}
			}
		});
	}

	@Override
	public void clickElement(final WebElement element) throws AutomationException {
		attemptExecute(new AutomationExecutable() {
			@Override
			public void execute() throws AutomationException {
				try {
					element.click();
				} catch (ElementNotVisibleException e) {
					((JavascriptExecutor) driver).executeScript("window.scrollTo(document.body.scrollHeight, 0)");
					throw new RetryableAutomationException("Failed to click, element not visible");
				}
			}
		});
	}

	/**
	 * Attempts to click on an element using javascript
	 *
	 * reference:
	 * https://stackoverflow.com/questions/11908249/debugging-element-is-not-clickable-at-point-error
	 *
	 * @param locator
	 * @throws AutomationException
	 */
	@Override
	public void clickElementWithJavascript(By locator) throws AutomationException {
		WebElement element = findElementFluently(locator);
		executeJSClick(element);
	}

	@Override
	public void clickElementIfPresent(By locator) throws AutomationException {
		WebElement element = findElementFluently(locator);
		executeJSClick(element);
	}

	protected void executeJSClick(WebElement element) {
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("var evt = document.createEvent('MouseEvents');"
				+ "evt.initMouseEvent('click',true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0,null);"
				+ "arguments[0].dispatchEvent(evt);", element);
	}

	/**
	 * Waits for the element identified by locator according till expected condition
	 * is true
	 * 
	 * @param locator
	 * @param expectedCondition
	 * @return
	 * @throws AutomationException
	 */
	private WebElement waitForElement(By locator, ExpectedCondition<WebElement> expectedCondition)
			throws AutomationException {
		try {
			WebDriverWait wait = new WebDriverWait(driver, WAIT_TIMEOUT);
			wait.until(expectedCondition);
		} catch (TimeoutException t) {
			throw new AutomationException(t.getMessage());
		}
		return findElementFluently(locator);
	}

	protected WebElement findElementFluently(By locatorIn) throws AutomationException {
		try {
			final By locator = locatorIn;
			return wait.until(new Function<WebDriver, WebElement>() {
				public WebElement apply(WebDriver driver) {
					return driver.findElement(locator);
				}
			});
		} catch (TimeoutException t) {
			throw new AutomationException(t.getMessage(),t);
		}
	}

	@Override
	public boolean isElementSelected(final String componentId, final String type) throws AutomationException {
		WebElement element = null;
		if (".xpath".equals(type)) {
			element = findElementFluently(By.xpath("." + componentId));
			return element.isSelected();
		}
		element = findElementFluently(By.id(componentId));
		return element.isSelected();
	}

	@Override
	public void clickElements(WebElement element, String label) throws AutomationException {
		Actions action = new Actions(getWebDriver());
		action.moveToElement(element).perform();
		action.moveToElement(waitForElement(By.linkText(label))).click().build().perform();
	}

	/*******************************************************************************************************************
	 * Deprecated
	 ******************************************************************************************************************/
	// Some methods/fields might be useful and are to be moved up when needed.

	/** Value to use for not found. */
	public static final int TABLE_SEARCH_NOT_FOUND = 0;

	/** Span tag. */
	protected static final String TAG_NAME_SPAN = "span";
	protected static final String TAG_NAME_BUTTON = "button";

	/** Anchor tag. */
	protected static final String TAG_NAME_ANCHOR = "a";

	/** Filter types names. */
	protected static final String FILTER_EQUALS = "Equals";
	protected static final String FILTER_STARTS_WITH = "Starts With";
	protected static final String FILTER_CONTAINS = "Contains";

	/** Element names. */
	protected static final String TABLE_CLASS = "listTable";
	protected static final String TAB_TABLE_CLASS = "tabListTable";
	protected static final String VIEW_LINK_CLASS = "viewLink";
	protected static final String EDIT_LINK_CLASS = "editLink";
	protected static final String COPY_LINK_CLASS = "copyLink";
	protected static final String REMOVE_LINK_CLASS = "removeLink";
	protected static final String SELECT_LINK_CLASS = "selectLink";
	protected static final String NEXT_LINK_CLASS = "nextLink";
	protected static final String VIEW_HISTORY_LINK_CLASS = "viewHistoryLink";

	/** Tag names ***/
	protected static final String SELECT_TAG = "select";
	protected static final String ANCHOR_TAG = "a";

	/** Attributes **/
	protected static final String ID = "id";

	/** Page elements. */
	private final By pageSizeLocator = By.id("Application:selectForm:listFooter:PageSize");
	private final By btnFirstLocator = By.id("Application:selectForm:listFooter:pageControl_First");
	private final By btnPreviousLocator = By.id("Application:selectForm:listFooter:pageControl_Previous");
	private final By btnNextLocator = By.id("Application:selectForm:listFooter:pageControl_Next");
	private final By btnLastLocator = By.id("Application:selectForm:listFooter:pageControl_Last");
	private final By btnApplyFiltersLocator = By.id("Application:selectForm:filters:ApplyFilter");
	private final By btnResetFiltersLocator = By.id("Application:selectForm:filters:ResetFilter");
	private final By btnRefreshLocator = By.className("refreshLink");
	private final By pageLabelLocator = By.className("pageLabel");

	/** Number of retries in "safe" methods. */
	protected static final int RETRIES = 3;
	private static final int LONG_RETRIES = 12;
	
	private static String DIRTY_VALUE = "enactor-dirty";


	@Override
	public void enterText(String componentId, String text) throws AutomationException {
		boolean success = enterOptionalText(componentId, text);
		if (!success) {
			throw new AutomationException("Could not enter text into element : '" + componentId + "'");
		}
	}

	private boolean enterTextFluently(String componentId, final String text, final boolean sendTab) throws AutomationException {
		By locator = By.id(componentId);
		return enterTextFluently(locator, text, sendTab, false);
	}

	protected boolean enterTextFluently(final By locator, final String text, final boolean sendTab, final boolean skipValidation)
			throws AutomationException {
		try {
			return wait.until(new Function<WebDriver, Boolean>() {
				public Boolean apply(WebDriver driver) {
					try {
						// bring the element into view
						debug("Entering text '" + text + "' into element '" + locator.toString());

						/* It is very important keep the point of finding the element very close to using it.
						 * This is becuase in the case we may be entering text into a text field that has and on keypress
						 * event that submits the page and refreshes the DOM.
						 */
						WebElement element = findElementFluently(locator);

						Point point = element.getRect().getPoint();
						debug("Attempting to resolve timeout by scrolling into view (" + point.getX() + ", " + point.getY()
								+ ");");

						if (!skipValidation) {
							((JavascriptExecutor) driver).executeScript("scrollTo(0, " + (point.getY() - 120) + ");");
						}

						String elementValue = element.getAttribute("value");
						if(elementValue == null) {
							elementValue = element.getText();
						}
						
						if (elementValue.equalsIgnoreCase(text)) {
							debug("Entered text '" + element.getAttribute("value") + "' into element '"
									+ element.toString());
							return new Boolean(true);
						}
  
						if (!isElementFocused(locator)) {
							element.click();
						}
						
						
						clearBySendKeys(text, elementValue, element, sendTab);

						elementValue = element.getAttribute("value");
						if(elementValue == null) {
							elementValue = element.getText();
						}
						// I know the block repeats, but if we are in luck and things happen very fast
						// this will exit faster
						if (skipValidation || elementValue.equalsIgnoreCase(text)) {
							debug("Entered text '" + element.getAttribute("value") + "' into element '"
									+ element.toString());
							return new Boolean(true);
						}
						throw new TimeoutException("Value was not set correctly. Throwing an exception to retry");
					} catch (AutomationException e) {
						throw new TimeoutException(e);
					}

				}
			});
		} catch (TimeoutException t) {
			/* It is very important keep the point of finding the element very close to using it.
			 * This is becuase in the case we may be entering text into a text field that has and on keypress
			 * event that submits the page and refreshes the DOM.
			 */
			WebElement element = findElementFluently(locator);
			throw new AutomationException(t.getMessage() + "---" + "Attempting to set "
					+ text + ", currently " + element.getAttribute("value") + " into " + element.toString(), t);
		}

	}
	
	protected void clearBySendKeys(String text, String currentvalue, WebElement element,
			boolean sendTab) {
		if (sendTab) {
			element.sendKeys(
					Keys.chord(
							OSUtils.getOperatingSystem() == OperatingSystem.MAC_OS_X ? Keys.COMMAND
									: Keys.CONTROL,
							"a"),
					Keys.BACK_SPACE);
		} else {
			element.clear();
		}
		element.sendKeys(text);
		if (sendTab) {
			element.sendKeys(Keys.TAB);
		}
	}

	@Override
	public boolean enterOptionalText(String componentId, String text) throws AutomationException {
		return enterTextFluently(componentId, text, false);
	}

	@Override
	public boolean isElementVisible(String componentId) throws AutomationException {
		return isElementVisible(findElement(By.id(componentId)));
	}

	/**
	 * Returns whether or not a locator is visible on the page.
	 *
	 * @param locator
	 * @return
	 */
	/*
	 * public boolean isElementVisible(By locator) throws AutomationException {
	 * return isElementVisible(findElementImmediately(locator)); }
	 */

	/**
	 * Returns whether or not an element is visible on the page.
	 *
	 * @param element
	 * @return
	 */
	/*
	 * public boolean isElementVisible(WebElement element) throws
	 * AutomationException { try { if (null == element) { return false; } return
	 * element.isDisplayed(); } catch (NoSuchElementException ex) { return false; }
	 * }
	 */

	@Override
	public void clickOnLinkButton(String className) throws AutomationException {
		try {
			clickElement(By.className(className));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not click on element with class name : '" + className + "'", e);
		}
	}

	@Override
	public void clickOnLinkButton(String className, String SubForm) throws AutomationException {
		try {
			WebElement subForm = findElementFluently(By.id(SubForm));
			WebElement element = subForm.findElement(By.className(className));
			clickOptionalElement(element);
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not click on element with class name : '" + className + "'", e);
		}
	}

	@Override
	public void clickOnButton(String componentId) throws AutomationException {
		try {
			clickElement(By.id(componentId));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not click on element with id : '" + componentId + "'", e);
		}
	}

	@Override
	public void clickOnButtonWithText(String buttonText) throws AutomationException {
		try {
			clickElement(getButtonLocator(buttonText));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not find button element with text : '" + buttonText + "'", e);
		}
	}

	@Override
	public void clickOnLinkByLabel(String label) throws AutomationException {
		try {
			clickOptionalElement(getElementByLabel(label, ANCHOR_TAG));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not click on element with name : '" + label + "'", e);
		}
	}
	
	@Override
	public void isTileButtonVisible(String label) throws AutomationException {
		try {
			getElementByLabel(label, TAG_NAME_SPAN);
		} catch (Exception e) {
			throw new AutomationException("Could not find the button : '" + label + "'");
		}
	}

	private WebElement getElementByLabel(String label, String tagName) throws AutomationException {
		try {
			return findElementFluently(By.xpath("//" + tagName + "[contains(.,'" + label + "')]"));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not click on tag element with name : '" + label + "'", e);
		}
	}

	@Override
	public void clickOnMenuButton(String label) throws AutomationException {
		try {
			clickElement(getSpanLocator(label));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not click on menu with name : '" + label + "'", e);
		}
	}

	@Override
	public void clickOnMenuButtonWithClass(String label, String className) throws AutomationException {
		try {
			clickElementWithJavascript(getTextLocatorByClassAndText(TAG_NAME_SPAN, className, label));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not click on menu with name : '" + label + "'", e);
		}
	}
	
	@Override
	public void clickOnLabelWithClassAndVerify(final String label, final String className, final String expectedText,
			final String expectedClass) throws AutomationException {

		attemptExecute(new AutomationExecutable() {

			@Override
			public void execute() throws AutomationException {
				try {
					clickElementWithJavascript(getTextLocatorByClassAndText(TAG_NAME_SPAN, className, label));
					// Click respond slower, so label in current screen can be considered as the verification label
					attemptExecute(new AutomationExecutable() {
						
						@Override
						public void execute() throws AutomationException {
							String verificationText = getTextByLocator(By.className(expectedClass));
							if (verificationText == null || !verificationText.contains(expectedText)) {
								throw new RetryableAutomationException(
										String.format("Click & verify Label button: %s, Label class: %s, Expected text: %s, Expected Class: %s", label, className, expectedText, expectedClass));
							}
							
						}
					});
					
				} catch (IllegalArgumentException e) {
                    throw new RetryableAutomationException("Could not click on label with name : '" + label + "'", e);
				} catch (AutomationException e) {
					throw new RetryableAutomationException("Could not click on label with name : '" + label + "'", e);
				}
				

			}
		});

	}

	/**
	 * Returns a locator to find text within span tags.
	 *
	 * @param spanText
	 * @return
	 */
	@Override
	public By getSpanLocator(String spanText) throws AutomationException {
		return getTextLocator(TAG_NAME_SPAN, spanText);
	}

	@Override
	public boolean isSpanWithTextAvailable(String text) throws AutomationException {
		WebElement span = findElementFluently(getSpanLocator(text));
		return isElementVisible(span);
	}

	/**
	 * Returns a locator to find text within button tag.
	 *
	 * @param spanText
	 * @return
	 */
	@Override
	public By getButtonLocator(String buttonText) throws AutomationException {
		return getTextLocator(TAG_NAME_BUTTON, buttonText);
	}

	/**
	 * Returns true if the button with given text is available
	 *
	 * @param text
	 * @return
	 * @throws AutomationException
	 */
	@Override
	public boolean isButtonWithTextAvailable(String text) throws AutomationException {
		WebElement button = findElementFluently(getButtonLocator(text));
		return isElementVisible(button);
	}

	@Override
	public boolean filteredListContainsItem(String itemText, String columnText) throws AutomationException {
		try {
			// Get search column
			By headerLocater = By.className(TABLE_CLASS);
			int searchColumn = getHeaderColumn(headerLocater, columnText);

			// First try current page
			boolean found = filteredListPageContainsItem(itemText, searchColumn);
			return found;

		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not find the text : '" + itemText + "'", e);
		}
	}

	@Override
	public boolean filteredListContainsItems(String itemText1, String columnText1, String itemText2, String columnText2)
			throws AutomationException {
		try {
			// Get search column
			By headerLocater = By.className(TABLE_CLASS);

			int searchColumn1 = getHeaderColumn(headerLocater, columnText1);
			int searchColumn2 = getHeaderColumn(headerLocater, columnText2);

			return filteredListPageContainsTwoItem(itemText1, searchColumn1, itemText2, searchColumn2);

		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not find the text : '" + itemText1 + "'" + "'" + itemText2 + "'", e);
		}
	}

	@Override
	public boolean filteredListContainsItem(By tableLocater, Map<String, String> dataMap) throws AutomationException {
		try {
			Map<Integer, String> dataMapWithColumnIndexKeyed = new HashMap<>(dataMap.size());
			for (String columnText : dataMap.keySet()) {
				// Get search column
				int searchColumn;
				try {
					searchColumn = getHeaderColumn(tableLocater, columnText);
				}
				catch (StaleElementReferenceException e){
					searchColumn = getHeaderColumn(tableLocater, columnText);
				}

				dataMapWithColumnIndexKeyed.put(searchColumn, dataMap.get(columnText));
			}
			
			// after applying filter, data is loaded without a page reloading,
			// some times results are unavailable when searching, so retry
			boolean found = false;
			int attempt = 0;
			while (!found && attempt < RETRIES) {
				// First try current page
				found = filteredListPageContainsItem(tableLocater, dataMapWithColumnIndexKeyed);
				attempt++;
				if (!found) {
					System.out.println(String.format("Search Table Items not found attempt %d", attempt));
					try {
						Thread.sleep(SLEEP);
					} catch (InterruptedException e) {
						Thread.currentThread().interrupt();
					}
				}

			}

			return found;
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not find the item", e);
		}
	}

	@Override
	public void executeItemWithTextOnCurrentPage(String itemText, String buttonClass) throws AutomationException {
		try {
			boolean clicked = false;
			WebElement baseTable = findElementFluently(By.className(TABLE_CLASS));
			List<WebElement> tableRows = findElements(baseTable, By.tagName("tr"));
			if (null != tableRows) {
				for (WebElement row : tableRows) {
					List<WebElement> tableCells = findElements(row, By.tagName("td"));
					if (null != tableCells) {
						for (WebElement cell : tableCells) {
							if (match(cell.getText(), itemText, MatchType.EQUALS_IGNORE_CASE)) {

								// Click the button on this row
								WebElement element = findElement(row, By.className(buttonClass));
								clicked = clickOptionalElement(element);
								;
								// Return the current page object as this action doesn't navigate to a page
								// represented
								// by
								// another PageObject
								return;
							}
						}
					}
				}
			}

			if (!isLastPage()) {
				clickFilterLast();
			} else {
				if (!isFirstPage()) {
					clickFilterPrevious();
				}
			}

			while (!isFirstPage()) {
				if (!clicked) {
					executeItemWithTextOnCurrentPage(itemText, buttonClass);

				} else {
					clickFilterPrevious();
				}
			}

			// Return null
			debug("Could not find an element with item text '" + itemText + "' and class '" + buttonClass + "'");
		} catch (IllegalArgumentException e) {
			throw new AutomationException(
					"Could not find an element with item text '" + itemText + "' and class '" + buttonClass + "'", e);
		}

	}

	/**
	 * Clicks on a link in a result row with the specified class when a row with two
	 * cell text matching itemTexts is discovered.
	 *
	 * Only the first match will be clicked.
	 *
	 * @param itemText1
	 * @param itemText2
	 * @param buttonClass
	 * @return
	 */
	public void executeItemWithTextOnCurrentPage(String itemText1, String itemText2, String buttonClass)
			throws AutomationException {
		try {
			boolean clicked = false;
			WebElement baseTable = findElementFluently(By.className(TABLE_CLASS));
			List<WebElement> tableRows = findElements(baseTable, By.tagName("tr"));
			if (null != tableRows) {
				for (WebElement row : tableRows) {
					List<WebElement> tableCells = findElements(row, By.tagName("td"));
					boolean found1 = false;
					boolean found2 = false;
					if (null != tableCells) {
						for (WebElement cell : tableCells) {
							if (!found1) {
								found1 = match(cell.getText(), itemText1, MatchType.EQUALS_IGNORE_CASE);
							}
							if (found1) {
								found2 = match(cell.getText(), itemText2, MatchType.EQUALS_IGNORE_CASE);
							}

							if (found1 && found2) {
								break;
							}
						}

						if (found1 && found2) {
							// Click the button on this row
							WebElement element = findElement(row, By.className(buttonClass));
							clicked = clickOptionalElement(element);
							// Return the current page object as this action doesn't navigate to a page
							// represented by
							// another PageObjectexecuteItemWithTextOnCurrentPage
							return;
						}
					}
				}
			}

			clickFilterLast();

			while (!isFirstPage()) {
				if (!clicked) {
					executeItemWithTextOnCurrentPage(itemText1, itemText2, buttonClass);
				} else {
					clickFilterPrevious();
				}
			}

			// Return null
			debug("Could not find an element with item texts '" + itemText1 + "', '" + itemText2 + "' and class '"
					+ buttonClass + "'");
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not find an element with item texts '" + itemText1 + "', '" + itemText2
					+ "' and class '" + buttonClass + "'", e);
		}
	}

	/**
	 * Clicks on a element in a result row with the specified id when a row with
	 * cell text matching itemText is discovered.
	 *
	 * Only the first match will be clicked.
	 *
	 * @param tableClass
	 * @param itemText
	 * @param elementId
	 * @return
	 */
	public void executeItemWithIdForGivenTextOnCurrentPage(String tableClass, String itemText, String elementId)
			throws AutomationException {
		try {
			WebElement baseTable = findElementFluently(By.className(tableClass));
			List<WebElement> tableRows = findElements(baseTable, By.tagName("tr"));
			if (null != tableRows) {
				for (WebElement row : tableRows) {
					List<WebElement> tableCells = findElements(row, By.tagName("td"));
					if (null != tableCells) {
						for (WebElement cell : tableCells) {
							if (match(cell.getText(), itemText, MatchType.EQUALS_IGNORE_CASE)) {

								// Click the element on this row
								WebElement element = findElement(row, By.id(elementId));
								clickOptionalElement(element);

								// Return the current page object as this action doesn't navigate to a page
								// represented
								// by
								// another PageObject
								return;
							}
						}
					}
				}
			}

			// Return null
			debug("Could not find an element with item text '" + itemText + "' and id '" + elementId + "'");
		} catch (IllegalArgumentException e) {
			throw new AutomationException(
					"Could not find an element with item text '" + itemText + "' and id '" + elementId + "'", e);
		}
	}

	/**
	 * Finds whether the element in a result row with the specified id when a row
	 * with cell text matching itemText is selected.
	 *
	 * Only the first match will be considered.
	 *
	 * @param tableClass
	 * @param itemText
	 * @param elementId
	 * @return element is selected or not
	 */
	public boolean isItemWithIdForGivenTextSelectedOnCurrentPage(String tableClass, String itemText, String elementId)
			throws AutomationException {
		try {
			WebElement baseTable = findElementFluently(By.className(tableClass));
			List<WebElement> tableRows = findElements(baseTable, By.tagName("tr"));
			if (null != tableRows) {
				for (WebElement row : tableRows) {
					List<WebElement> tableCells = findElements(row, By.tagName("td"));
					if (null != tableCells) {
						for (WebElement cell : tableCells) {
							if (match(cell.getText(), itemText, MatchType.EQUALS_IGNORE_CASE)) {

								// Click the element on this row
								WebElement element = findElement(row, By.id(elementId));
								debug("checking whether the element is selected '" + element.toString() + "'");
								return element.isSelected();
							}
						}
					}
				}
			}

			debug("Could not find an element with item text '" + itemText + "' and id '" + elementId + "'");
			return false;
		} catch (IllegalArgumentException e) {
			throw new AutomationException(
					"Could not find an element with item text '" + itemText + "' and id '" + elementId + "'", e);
		}
	}

	/**
	 * Clicks on a link in a result row with the specified class when a row with
	 * cell texts matching given texts is discovered.
	 *
	 * Only the first match will be clicked.
	 *
	 * @param cellTexts
	 * @param buttonClass
	 * @return
	 */
	@Override
	public void executeItemWithTextOnCurrentPage(List<String> cellTexts, String buttonClass)
			throws AutomationException {
		try {
			WebElement baseTable = findElementFluently(By.className(TABLE_CLASS));
			List<WebElement> tableRows = findElements(baseTable, By.tagName("tr"));
			if (null != tableRows) {
				for (WebElement row : tableRows) {
					List<WebElement> tableCells = findElements(row, By.tagName("td"));
					if (null != tableCells) {

						boolean allTextMatched = true;

						for (String itemText : cellTexts) {

							boolean matched = false;

							for (WebElement cell : tableCells) {
								if (match(cell.getText(), itemText, MatchType.EQUALS_IGNORE_CASE)) {
									matched = true;
									break;
								}
							}

							if (!matched) {
								allTextMatched = false;
								break;
							}
						}

						if (allTextMatched) {
							// Click the button on this row
							WebElement element = findElement(row, By.className(buttonClass));
							clickOptionalElement(element);

							// Return the current page object as this action doesn't navigate to a page
							// represented by
							// another PageObject
							return;
						}

					}
				}
			}

			// Return null
			debug("Could not find a record with given item texts " + cellTexts + " in the search result table");
		} catch (IllegalArgumentException e) {
			throw new AutomationException(
					"Could not find a record with given item texts " + cellTexts + " in the search result table", e);
		}
	}

	/**
	 * Clicks on a link in a result row with the specified class when a row with
	 * cell text matching itemText is discovered.
	 *
	 * Only the first match will be clicked.
	 *
	 * @param itemText
	 * @param buttonClass
	 * @return
	 */
	public void executeItemWithTextOnCurrentPageTab(String itemText, String buttonClass) throws AutomationException {
		try {
			WebElement baseTable = findElementFluently(By.className(TAB_TABLE_CLASS));
			List<WebElement> tableRows = findElements(baseTable, By.tagName("tr"));
			if (null != tableRows) {
				for (WebElement row : tableRows) {
					List<WebElement> tableCells = findElements(row, By.tagName("td"));
					if (null != tableCells) {
						for (WebElement cell : tableCells) {
							// debug("Checking cell text '" + cell.getText() + "' against '" + itemText +
							// "'");
							if (match(cell.getText(), itemText, MatchType.EQUALS_IGNORE_CASE)) {

								// Click the button on this row
								WebElement element = findElement(row, By.className(buttonClass));
								clickOptionalElement(element);

								// Return the current page object as this action doesn't navigate to a page
								// represented
								// by
								// another PageObject
								return;
							}
						}
					}
				}
			}

			// Return null
			debug("Could not find an element with item text '" + itemText + "' and class '" + buttonClass + "'");
		} catch (IllegalArgumentException e) {
			throw new AutomationException(
					"Could not find an element with item text '" + itemText + "' and class '" + buttonClass + "'", e);
		}
	}

	@Override
	public void selectValue(final String value, final String componentId) throws AutomationException {
		attemptExecute(new AutomationExecutable() {
			@Override
			public void execute() throws AutomationException {
				try {
					WebElement webElement = waitForElement(By.id(componentId));
					final Select select = new Select(webElement);
					List<WebElement> options = select.getOptions();
					validateNoDuplicateOptions(value, options);
					if (value != null) {
						for (WebElement option : options) {
							String optionText = option.getText().trim();
							String text = value.trim();
							if (optionText.equals(text)) {
								select.selectByVisibleText(option.getText());
								/*
								 * In some cases the drop-down value selected in UI sets back to its default
								 * option. Below if loop is to make sure the selected value is displayed in
								 * drop-down
								 */
								if (!select.getFirstSelectedOption().getText().equalsIgnoreCase(option.getText())) {
									while (!select.getFirstSelectedOption().getText()
											.equalsIgnoreCase(option.getText())) {
										select.selectByVisibleText(option.getText());
									}
								}
								return;
							}
						}
					} else {
						select.selectByIndex(0);
					}
				} catch (IllegalArgumentException e) {
					throw new RetryableAutomationException("Could not select the given value on element : '" + componentId + "'",
							e);
				} catch (StaleElementReferenceException e) {
					throw new RetryableAutomationException("Page has refreshed while selecting value on element: "+componentId +", Exception :" + e.getMessage());
				}
				throw new RetryableAutomationException(
						"Could not find value :'" + value + "' on element : '" + componentId + "'");
			}
		});

	}

	/*
	 * Check the option text user trying to select appears multiple occurrences in
	 * the dropdown options
	 */
	private void validateNoDuplicateOptions(String text, List<WebElement> options) throws AutomationException {
		Set<String> appeared = new HashSet<>();
		for (WebElement option : options) {
			String optionText = option.getText().trim();
			if (!appeared.add(optionText) && optionText.equals(text.trim())) {
				throw new AutomationException(
						"Could not select given value : '" + text + "'. Value appears multiple occurrences.");
			}
		}
	}

	@Override
	public void selectValue(String value, String componentId, boolean wait) throws AutomationException {
		try {
			WebElement webElement = null;
			if (wait) {
				webElement = findElement(By.id(componentId));
			} else {
				webElement = findElementFluently(By.id(componentId));
			}

			final Select select = new Select(webElement);
			if (value != null) {
				select.selectByVisibleText(value);
			} else {
				select.selectByIndex(0);
			}
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not select the given value on element : '" + componentId + "'", e);
		}
	}

	/**
	 * {@inheritDoc}
	 *
	 */
	@Override
	public void editItemWithText(String itemText) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText, EDIT_LINK_CLASS);
	}

	/**
	 * Select option button of the value.
	 *
	 * @param option
	 * @param itemText
	 * @throws AutomationException
	 */
	@Override
	public void clickOptionOnItemWithText(String option, String itemText) throws AutomationException {
		String btnClass;
		switch (option) {
		case "Next":
			btnClass = NEXT_LINK_CLASS;
			break;
		case "Edit":
			btnClass = EDIT_LINK_CLASS;
			break;
		case "View":
			btnClass = VIEW_LINK_CLASS;
			break;
		case "Remove":
			btnClass = REMOVE_LINK_CLASS;
			break;
		case "Copy":
			btnClass = COPY_LINK_CLASS;
			break;
		default:
			throw new AutomationException("Incorrect option link button [" + option
					+ "] expected 'View', 'Edit', 'Copy', 'Remove', 'Broadcast'");
		}
		executeItemWithTextOnCurrentPage(itemText, btnClass);
	}

	@Override
	public void editItemWithText(String itemText1, String itemText2) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText1, itemText2, EDIT_LINK_CLASS);
	}

	@Override
	public void clickElementWithIdForGivenText(String tableClass, String itemText, String id)
			throws AutomationException {
		executeItemWithIdForGivenTextOnCurrentPage(tableClass, itemText, id);
	}

	@Override
	public boolean isElementWithIdForGivenTextSelected(String tableClass, String itemText, String id)
			throws AutomationException {
		return isItemWithIdForGivenTextSelectedOnCurrentPage(tableClass, itemText, id);
	}

	@Override
	public void editItemWithTextInTab(String itemText) throws AutomationException {
		executeItemWithTextOnCurrentPageTab(itemText, EDIT_LINK_CLASS);
	}

	@Override
	public void viewItemWithText(String itemText) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText, VIEW_LINK_CLASS);
	}

	@Override
	public void viewItemWithText(String itemText1, String itemText2) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText1, itemText2, VIEW_LINK_CLASS);
	}

	@Override
	public void viewItemAccountHistoryWithText(String itemText) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText, VIEW_HISTORY_LINK_CLASS);
	}

	@Override
	public void copyItemWithText(String itemText) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText, COPY_LINK_CLASS);
	}

	@Override
	public void copyItemWithText(String itemText1, String itemText2) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText1, itemText2, COPY_LINK_CLASS);
	}

	@Override
	public void removeItemWithText(String itemText) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText, REMOVE_LINK_CLASS);
	}

	@Override
	public void removeItemWithText(String itemText1, String itemText2) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText1, itemText2, REMOVE_LINK_CLASS);
	}

	@Override
	public void removeItemWithText(List<String> cellTexts) throws AutomationException {
		executeItemWithTextOnCurrentPage(cellTexts, REMOVE_LINK_CLASS);
	}

	@Override
	public void removeItemWithTextInTab(String itemText) throws AutomationException {
		executeItemWithTextOnCurrentPageTab(itemText, REMOVE_LINK_CLASS);
	}

	@Override
	public void selectItemWithText(String itemText) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText, SELECT_LINK_CLASS);
	}

	@Override
	public void selectItemWithText(String itemText1, String itemText2) throws AutomationException {
		executeItemWithTextOnCurrentPage(itemText1, itemText2, SELECT_LINK_CLASS);
	}

	@Override
	public void typeDate(Date date, String dateId, String monthId, String yearId) throws AutomationException {
		try {
			// Find the field and type the text into it
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(date.getTime());
			enterText(dateId, String.valueOf(calendar.get(Calendar.DATE)));
			// Month starts with 0 in java.util.Calendar. (JANUARY = 0)
			setSelectValue(findElementFluently(By.id(monthId)), String.valueOf(calendar.get(Calendar.MONTH) + 1));

			enterText(yearId, String.valueOf(calendar.get(Calendar.YEAR)));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not set the given date", e);
		}
	}

	@Override
	public String getSelectValue(final String componentId) throws AutomationException {
		try {
			WebElement element = findElementFluently(By.id(componentId));

			if (null != element) {
				final Select selectBox = new Select(element);
				return selectBox.getFirstSelectedOption().getText();
			}
			return null;
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not get the first option text of the element : '" + componentId + "'",
					e);
		}
	}

	/**
	 * {@inheritDoc}
	 *
	 */
	@Override
	public void clickConfirm() throws AutomationException {
		try {
			WebDriverWait wait = new WebDriverWait(driver, WAIT_TIMEOUT);
			wait.until(ExpectedConditions.alertIsPresent());

			Alert alert = driver.switchTo().alert();
			alert.accept();
		} catch (Exception e) {
			throw new AutomationException("Could not click confirm ", e);
		}
	}

	@Override
	public boolean isElementEnabled(String componentId) throws AutomationException {
		try {
			return isElementEnabled(findElementFluently(By.id(componentId)));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not check the status of the element : '" + componentId + "'", e);
		}
	}

	@Override
	public void clickOnTab(String label) throws AutomationException {
		clickOnAnchor(label);
	}

	@Override
	public void clickOnTabById(final String componentId) throws AutomationException {

		attemptExecute(new AutomationExecutable() {

			@Override
			public void execute() throws AutomationException {
				try {
					clickElement(By.id(componentId));
					if (!isTabSelected(componentId)) {
						throw new RetryableAutomationException("Tab by component Id : " + componentId + " is still not selected");
					}
				} catch (IllegalArgumentException e) {
					throw new RetryableAutomationException("Could not click on element with id : '" + componentId + "'", e);
				} catch (AutomationException e) {
					throw new RetryableAutomationException(e.getMessage());
				}

			}
		});
	}

	@Override
	public boolean isTabSelected(String componentId) throws AutomationException {

		WebDriverWait wait = new WebDriverWait(driver, WAIT_TIMEOUT);
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(componentId)));
		WebElement tab = findElementFluently(By.id(componentId));
		WebElement span = null;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				span = tab.findElement(getTextLocator(TAG_NAME_SPAN, "Selected"));
				if (span != null) {
					return true;
				}
			} catch (StaleElementReferenceException s) {
				try {
					Thread.sleep(SLEEP_TIMER);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			}
			attempts++;
		}
		return span != null;

	}

	@Override
	public void clickOnAnchor(String anchorText) throws AutomationException {
		try {
			clickElement(getAnchorLocator(anchorText));
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not click on the element : '" + anchorText + "'", e);
		}
	}

	@Override
	public int searchTable(String tableClass, String itemText, int searchColumn, int searchRow, MatchType matchType)
			throws AutomationException {
		try {
			WebElement baseTable = findElementFluently(By.className(tableClass));
			if (null != baseTable) {
				List<WebElement> tableRows = baseTable.findElements(By.tagName("tr"));
				if (null != tableRows) {

					if (searchRow == TABLE_SEARCH_NOT_FOUND) {
						// If search row is 0 it means the row to search was not
						// defined, so we search all rows
						int rowNum = 0;
						for (WebElement row : tableRows) {
							int result = searchRow(row, itemText, searchColumn, rowNum, matchType);
							if (result != TABLE_SEARCH_NOT_FOUND) {
								return result;
							}
							rowNum++;
						}
					} else {
						// Search row defined so just look at the specified row
						if (tableRows.size() >= searchRow) {
							WebElement row = tableRows.get(searchRow - 1);
							return searchRow(row, itemText, searchColumn, searchRow, matchType);
						}
					}
				}
			}

			debug("Item not found in table with text '" + itemText + "', class " + tableClass);
			return TABLE_SEARCH_NOT_FOUND;
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not search the table with class : '" + tableClass + "'", e);
		}
	}

	/**
	 * Searches a table for the specified texts. Allows users to define a specific
	 * columns and/or row to search.
	 *
	 * Rows and columns start at 1, but if the table has a header row then the row
	 * will effectively start at 2.
	 *
	 * @param tableClass    The class name of the table element.
	 * @param itemText1     The first item text to search for.
	 * @param searchColumn1 The first column to search, if not 0.
	 * @param itemText2     The second item text to search for.
	 * @param searchColumn2 second The column to search, if not 0.
	 * @param searchRow     The row to search, if not 0.
	 * @param matchType     The match type to use to define a match.
	 * @return The row number if the text was found, else 0.
	 */
	public int searchTableForTwoColomns(String tableClass, String itemText1, int searchColumn1, String itemText2,
			int searchColumn2, int searchRow, MatchType matchType) throws AutomationException {
		try {
			WebElement baseTable = findElementFluently(By.className(tableClass));
			if (null != baseTable) {
				List<WebElement> tableRows = baseTable.findElements(By.tagName("tr"));
				if (null != tableRows) {

					if (searchRow == TABLE_SEARCH_NOT_FOUND) {
						// If search row is 0 it means the row to search was not
						// defined, so we search all rows
						int rowNum = 0;
						for (WebElement row : tableRows) {
							int result = searchRow(row, itemText1, searchColumn1, rowNum, matchType);
							if (result != TABLE_SEARCH_NOT_FOUND) {

								result = searchRow(row, itemText2, searchColumn2, rowNum, matchType);
								if (result != TABLE_SEARCH_NOT_FOUND) {
									return result;
								}
							}
							rowNum++;
						}
					} else {
						// Search row defined so just look at the specified row
						if (tableRows.size() >= searchRow) {
							WebElement row = tableRows.get(searchRow - 1);
							int result = searchRow(row, itemText1, searchColumn1, searchRow, matchType);

							if (result != TABLE_SEARCH_NOT_FOUND) {
								return searchRow(row, itemText2, searchColumn2, searchRow, matchType);
							} else {
								return result;
							}
						}
					}
				}
			}

			debug("Item not found in table with text '" + itemText1 + "' and '" + itemText2 + "', class " + tableClass);
			return TABLE_SEARCH_NOT_FOUND;
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not search the table with class : '" + tableClass + "'", e);
		}
	}

	/**
	 * Searches a table for rows with the specified column values.
	 *
	 * Rows and columns start at 1, but if the table has a header row then the row
	 * will effectively start at 2.
	 *
	 * @param tableLocater By Locater of the table element.
	 * @param dataMap    column data to be searched.
	 * @param searchRow  The row to search, if not 0.
	 * @param matchType  The match type to use to define a match.
	 * @return The row number if the text was found, else 0.
	 */
	public int searchTable(By tableLocater, Map<Integer, String> dataMap, int searchRow, MatchType matchType)
			throws AutomationException {
		try {
			WebElement baseTable = findElementFluently(tableLocater);
			if (null != baseTable) {
				List<WebElement> tableRows = baseTable.findElements(By.tagName("tr"));
				if (null != tableRows) {

					if (searchRow == TABLE_SEARCH_NOT_FOUND) {
						// If search row is 0 it means the row to search was not
						// defined, so we search all rows
						int rowNum = 0;
						for (WebElement row : tableRows) {

							int result = TABLE_SEARCH_NOT_FOUND;

							for (Integer searchColumn : dataMap.keySet()) {
								result = searchRow(row, dataMap.get(searchColumn), searchColumn, rowNum, matchType);

								if (result == TABLE_SEARCH_NOT_FOUND) {
									break;
								}
							}

							if (result != TABLE_SEARCH_NOT_FOUND) {
								return result;
							}
							rowNum++;
						}
					} else {
						// Search row defined so just look at the specified row
						if (tableRows.size() >= searchRow) {
							WebElement row = tableRows.get(searchRow - 1);

							int result = TABLE_SEARCH_NOT_FOUND;

							for (Integer searchColumn : dataMap.keySet()) {
								result = searchRow(row, dataMap.get(searchColumn), searchColumn, searchRow, matchType);

								if (result == TABLE_SEARCH_NOT_FOUND) {
									return result;
								}
							}

							return result;
						}
					}
				}
			}

			debug("Item not found  with given values in table, locater " + tableLocater.toString());
			return TABLE_SEARCH_NOT_FOUND;
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not search the table with locater : '" + tableLocater.toString() + "'", e);
		}
	}
	
	/**
	 * Insert a dirty row to the search Table to mark it as dirty the table is
	 * expected to be clear after applying the filter
	 * 
	 * @throws AutomationException
	 */
	public void markFilterTableDirty(String tableClass) throws AutomationException {

		String insertScript = String.format(
						  "var table = document.getElementsByClassName('%s')[0];"
						+ "table.setAttribute('%s', 'true');"
						, tableClass, DIRTY_VALUE);
		debug("Insert Table Row executing script : " + insertScript);
		Object executionResult = ((JavascriptExecutor) driver).executeScript(insertScript);
		if (executionResult != null) {
			debug("Insert Table Row Execution Output : " + executionResult);
			throw new AutomationException("Error while inserting data to table");
		}
	}
	
	/*
	 * Checks if the filter table has refreshed
	 */
	public void waitTableToRefresh(By locator) throws AutomationException {
		attemptExecute(new AutomationExecutable() {

			private int RETRIES = LONG_RETRIES;

			@Override
			public void execute() throws AutomationException {
				try {
					if (isTableDirty(locator)) {
						throw new RetryableAutomationException("Filter Table has not updated yet");
					}
				} catch (StaleElementReferenceException e) {
					throw new RetryableAutomationException("Stale Element Error", e);
				}

			}
		});

	}
	
	/**
	 * Check if the table found by class has the {@linkplain SeleniumWebController#DIRTY_VALUE}
	 * 
	 * @param tableClass class of the filter table
	 * @return
	 * @throws AutomationException
	 */
	private boolean isTableDirty(By locator) throws AutomationException {

		WebElement table = driver.findElement(locator);
		return "true".equals(table.getAttribute(DIRTY_VALUE));
	}

	/**
	 * Attempts to retrieve text from an element. First tries the "text" of the
	 * element, if this is blank returns the "value" attribute.
	 *
	 * @param locator
	 * @return
	 */
	protected String getText(By locator) {
		String text = null;

		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				debug("Finding text of element '" + locator.toString() + "' attempt " + (attempts + 1));
				text = driver.findElement(locator).getText();
				if (text != null && text.contains("\n")) {
					List<WebElement> inputElements = driver.findElements(By.tagName("input"));
					for (WebElement element : inputElements) {
						text += "\n" + element.getAttribute("value");
					}
				}
				if (StringUtils.isBlank(text)) {
					text = driver.findElement(locator).getAttribute("value");
				}
				debug("Text of element '" + locator.toString() + "' is '" + text + "'");
				break;
			} catch (StaleElementReferenceException e) {
				debug("Inside searchRow getText's catch-> StaleElementReferenceException: " + e);
			} catch (NoSuchElementException e) {
				debug("Inside searchRow getText's catch-> NoSuchElementException: " + e);
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException e1) {
					Thread.currentThread().interrupt();
				}
			}
			attempts++;
		}

		return text;
	}

	/**
	 * Utility method to find an element, with a timeout to allow time for the
	 * element to appear on the page. Retries 3 times.
	 *
	 * @param locator
	 * @return The element or null if it couldn't be found.
	 */
	protected WebElement findElement(By locator) throws AutomationException {
		/*
		 * This is hack for the StaleElementReferenceException: Element not found in the
		 * cache. We wait here until element become available. Wait for 10 seconds
		 *
		 */
		WebDriverWait wait = new WebDriverWait(driver, WAIT_TIMEOUT);
		wait.until(ExpectedConditions.presenceOfElementLocated(locator));
		/* End */

		WebElement result = null;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				result = driver.findElement(locator);
				break;
			} catch (StaleElementReferenceException e) {
				debug("Inside searchRow findElement's catch-> StaleElementReferenceException: " + e);
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			} catch (NoSuchElementException e) {
				debug("Inside searchRow findElement's catch-> NoSuchElementException: " + e);
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			}
			attempts++;
		}

		return result;
	}

	/**
	 * Utility method to find an element, without a timeout. Retries 3 times.
	 *
	 * @param locator
	 * @return The element or null if it couldn't be found.
	 */
	protected WebElement findElementImmediately(By locator) throws AutomationException {
		WebElement result = null;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				result = findElement(locator);
				break;
			} catch (StaleElementReferenceException e) {
				debug("Inside findElementImmediately method's catch-> StaleElementReferenceException: " + e);
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			} catch (NoSuchElementException e) {
				debug("Inside findElementImmediately method's catch-> NoSuchElementException: " + e);
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			}
			attempts++;
		}

		return result;
	}

	protected void debug(String debugText) {
		if (SeleniumConfig.getInstance().getDebug()) {
			System.out.println(debugText);
		}
		Reporter.log(debugText + "<br/>", false);
	}

	/**
	 * Attempts to click on an element, retrying 3 times.
	 *
	 * @param locator
	 * @return Whether the action was successful.
	 */
	protected boolean clickOptionalElement(WebElement element) throws AutomationException {
		boolean result = false;
		int attempts = 1;
		do {
			try {
				debug("Clicking on element '" + element.toString() + "' attempt " + (attempts) + " / " + RETRIES
						+ " With Tag name : " + element.getTagName() + "  With text : " + element.getText());
				element.click();
				result = true;
				break;
			} catch (StaleElementReferenceException e) {
				debug("Inside findElementImmediately clickOptionalElement's catch-> StaleElementReferenceException: "
						+ e);
			} catch (NoSuchElementException e) {
				debug("Inside findElementImmediately clickOptionalElement's catch-> NoSuchElementException: " + e);
			} catch (WebDriverException e) {
				// If not clickable let it try again otherwise throw the error
				if (e.getMessage() != null && e.getMessage().startsWith("Element is not clickable at point")
						&& (attempts + 1) < RETRIES) {
					// Do nothing
				} else if (e.getMessage() != null && e.getMessage().startsWith("Element is not clickable at point")) {
					// The fixed header could be blocking the view of the button, final attempt to
					// get the button into view.
					debug("Attempting to scroll into view, exectuting: scrollBy(0, -120);");
					((JavascriptExecutor) driver).executeScript("scrollBy(0, -120);");
				} else {
					throw e;
				}
			}
			attempts++;
		} while (attempts <= RETRIES);
		return result;
	}

	/**
	 * Attempts to click on an element, retrying 3 times.
	 *
	 * @param locator
	 * @return Whether the action was successful.
	 */
	protected boolean clickOptionalElement(By locator) throws AutomationException {
		WebElement element = findElementFluently(locator);
		return clickOptionalElement(element);
	}

	/**
	 * Utility method to return whether the two strings match based on the specified
	 * match type.
	 *
	 * @param firstString
	 * @param secondString
	 * @param matchType
	 * @return
	 */
	private boolean match(String firstString, String secondString, MatchType matchType) throws AutomationException {
		switch (matchType) {
		case CONTAINS:
			return StringUtils.contains(firstString, secondString);
		case CONTAINS_IGNORE_CASE:
			return StringUtils.containsIgnoreCase(firstString, secondString);
		case ENDS_WITH:
			return StringUtils.endsWith(firstString, secondString);
		case ENDS_WITH_IGNORE_CASE:
			return StringUtils.endsWithIgnoreCase(firstString, secondString);
		case EQUALS:
			return StringUtils.equals(firstString, secondString);
		case STARTS_WITH:
			return StringUtils.startsWith(firstString, secondString);
		case STARTS_WITH_IGNORE_CASE:
			return StringUtils.startsWithIgnoreCase(firstString, secondString);
		default:
			// Includes EQUALS_IGNORE_CASE
			return StringUtils.equalsIgnoreCase(firstString, secondString);
		}
	}

	/**
	 * Searches a table row.
	 *
	 * @param row       The row number.
	 * @param itemText  The item text to search for.
	 * @param searchRow The row to search, if not 0.
	 * @param matchType The match type to use to define a match.
	 * @return
	 */
	private int searchRow(WebElement row, String itemText, int searchColumn, int rowNum, MatchType matchType)
			throws AutomationException {
		List<WebElement> tableCells = null;

		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				tableCells = row.findElements(By.tagName("td"));

				if (null != tableCells) {
					if (searchColumn == TABLE_SEARCH_NOT_FOUND) {
						// If search column is 0 it means the column to search was not
						// defined, so we search all columns
						for (WebElement cell : tableCells) {
							// Look if cell contains an anchor. Some cells contains event panels
							WebElement anchor = null;
							try {
								anchor = cell.findElement(By.xpath(".//" + ANCHOR_TAG));
							} catch (Exception e) {
								debug("Exception: " + e);
							}
							/*
							 * Since EM method resolveData is replacing the 0's from the input data
							 * .replaceFirst("^0*", "") is added to the values read from the UI before
							 * comparing both values
							 */
							if (anchor != null
									&& match(anchor.getText().replaceFirst("^0*", ""), itemText, matchType)) {
								debug("Found match for text '" + itemText + "' in row " + rowNum + " of table.");
								return rowNum;
							}

							else if (match(cell.getText().replaceFirst("^0*", ""), itemText, matchType)) {
								debug("Found match for text '" + itemText + "' in row " + rowNum + " of table.");
								return rowNum;
							}
						}
					} else {
						// Column defined so just look at the specified column
						if (tableCells.size() >= searchColumn) {
							WebElement cell = tableCells.get(searchColumn - 1);
							// Look if cell contains an anchor. Some cells contains event panels
							WebElement anchor = null;
							try {
								anchor = cell.findElement(By.xpath(".//" + ANCHOR_TAG));
							} catch (Exception e) {
								debug("Exception: " + e);
							}

							if (anchor != null
									&& match(anchor.getText().replaceFirst("^0*", ""), itemText, matchType)) {
								debug("Found match for text '" + itemText + "' in row " + rowNum + " of table.");
								return rowNum;
							} else if (match(cell.getText().replaceFirst("^0*", ""), itemText, matchType)) {
								debug("Found match for text '" + itemText + "' in row " + rowNum + " of table.");
								return rowNum;
							}
						}
					}
				}
				break;
			} catch (StaleElementReferenceException st) {
				debug("Inside searchRow searchRow's catch-> StaleElementReferenceException: " + st);
				try {
					Thread.sleep(3000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			attempts++;
		}
		return TABLE_SEARCH_NOT_FOUND;
	}

	/**
	 * Returns true if we're on the first page.
	 *
	 * @return
	 */
	private boolean isFirstPage() throws AutomationException {
		return !isElementVisible(btnPreviousLocator);
	}

	/**
	 * Clicks on the Next button.
	 *
	 */
	private void clickFilterNext() throws AutomationException {
		// Find the element and click it
		clickElement(btnNextLocator);

	}

	/**
	 * Clicks on the Previous button.
	 *
	 */
	private void clickFilterPrevious() throws AutomationException {
		// Find the element and click it
		clickElement(btnPreviousLocator);

	}

	/**
	 * Utility method to find an element, with a timeout to allow time for the
	 * element to appear on the page. Retries 3 times.
	 *
	 * @param locator
	 * @return The element or null if it couldn't be found.
	 */
	private WebElement findElement(WebElement element, By locator) throws AutomationException {
		WebElement result = null;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				result = element.findElement(locator);
				break;
			} catch (StaleElementReferenceException e) {
				debug("Inside findElement's method -> StaleElementReferenceException: " + e);
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			} catch (NoSuchElementException e) {
				debug("Inside findElement's method -> NoSuchElementException: " + e);
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			}
			attempts++;
		}

		return result;
	}

	/**
	 * Utility method to find an element, with a timeout to allow time for the
	 * element to appear on the page. Retries 3 times.
	 *
	 * @param element
	 * @param locator
	 * @return The elements or an empty list if they couldn't be found.
	 */
	private List<WebElement> findElements(WebElement element, By locator) throws AutomationException {
		List<WebElement> result = new ArrayList<>();
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				result = element.findElements(locator);
				break;
			} catch (StaleElementReferenceException e) {
				debug("Inside findElements's method -> StaleElementReferenceException: " + e);
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			} catch (NoSuchElementException e) {
				debug("Inside findElements's method -> NoSuchElementException: " + e);
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			}
			attempts++;
		}

		return result;
	}

	/**
	 * Sets a HTML select element to the selected value.
	 *
	 * @param element
	 * @param value
	 */
	private void setSelectValue(WebElement element, String value) throws AutomationException {
		if (null != element) {
			Select selectBox = new Select(element);
			selectBox.selectByValue(value);
		}
	}

	/**
	 * Select the (visible text) value of select box field. If value is null, then
	 * select the first option.
	 *
	 * @param value
	 * @return
	 */
	@Override
	public void selectValueWithLable(String value, String label) throws AutomationException {
		WebElement webElement = getElementByLabel(label, SELECT_TAG);
		Select select = new Select(webElement);
		if (value != null) {
			select.selectByVisibleText(value);
		} else {
			select.selectByIndex(0);
		}

	}

	/**
	 * Returns whether or not an element is enabled on the page.
	 *
	 * @param element
	 * @return
	 */
	/*
	 * private boolean isElementEnabled(WebElement element) throws
	 * AutomationException { try { if (null == element) { return false; } return
	 * element.isEnabled(); } catch (NoSuchElementException ex) { return false; } }
	 */

	/**
	 * Returns true if the current page of the filtered table contains a cell with
	 * the specified item text.
	 *
	 * @param itemText     The text to search for.
	 * @param searchColumn The column to search.
	 * @return
	 */
	private boolean filteredListPageContainsTwoItem(String itemText1, int searchColumn1, String itemText2,
			int searchColumn2) throws AutomationException {
		int result = searchTableForTwoColomns(TABLE_CLASS, itemText1, searchColumn1, itemText2, searchColumn2,
				TABLE_SEARCH_NOT_FOUND, MatchType.EQUALS_IGNORE_CASE);
		return result != TABLE_SEARCH_NOT_FOUND;
	}

	/**
	 * Returns true if the current page of the filtered table contains a cell with
	 * the specified item text.
	 *
	 * @param itemText     The text to search for.
	 * @param searchColumn The column to search.
	 * @return
	 */
	private boolean filteredListPageContainsItem(String itemText, int searchColumn) throws AutomationException {
		int result = searchTable(TABLE_CLASS, itemText, searchColumn, TABLE_SEARCH_NOT_FOUND,
				MatchType.EQUALS_IGNORE_CASE);
		return result != TABLE_SEARCH_NOT_FOUND;
	}

	/**
	 * Returns true if the current page of the filtered table contains a row with
	 * cells with the specified column values.
	 *
	 * @param dataMap column data for searching.
	 * @return
	 */
	private boolean filteredListPageContainsItem(By tableLocater, Map<Integer, String> dataMap) throws AutomationException {
		int result = searchTable(tableLocater, dataMap, TABLE_SEARCH_NOT_FOUND, MatchType.EQUALS_IGNORE_CASE);
		return result != TABLE_SEARCH_NOT_FOUND;
	}

	/**
	 * Returns the column index of the table column with the specified text.
	 *
	 * @param tableClass The class name of the table element.
	 * @param columnText The column to search for.
	 * @return The index, or 0 if the column could not be found.
	 */
	private int getHeaderColumn(final By tableLocater, String columnText) throws AutomationException {
		if (null == columnText) {
			return TABLE_SEARCH_NOT_FOUND;
		}
		WebElement baseTable = findElementFluently(tableLocater);
		if (null != baseTable) {
			if (null != columnText) {
				List<WebElement> tableHeaders = baseTable.findElements(By.tagName("th"));
				if (null != tableHeaders) {
					int col = 1;
					for (WebElement header : tableHeaders) {
						if (match(header.getText(), columnText, MatchType.EQUALS_IGNORE_CASE)) {
							debug("Column " + col + " in table matches text '" + columnText + "'");
							return col;
						}
						col++;
					}
				}
			}
		}

		debug("Column not found for header text '" + columnText + "'");
		return TABLE_SEARCH_NOT_FOUND;
	}

	/**
	 * Clicks on the Last button.
	 *
	 * @return
	 */
	private void clickFilterLast() throws AutomationException {

		int attempts = 0;
		while (attempts < 3) {
			// Find the element and click it
			clickElement(btnLastLocator);
			if (isLastPage()) {
				// Return the current page object as this action doesn't navigate to a page
				// represented by another
				// PageObject
				return;
			}

			attempts++;
		}

		throw new IllegalStateException("Clicking the last button did not navigate to the last page after 3 attempts.");
	}

	/**
	 * Clicks on the First page button.
	 *
	 * @return
	 */
	private void clickFilterFirst() throws AutomationException {

		int attempts = 0;
		while (attempts < 3) {
			// Find the element and click it
			clickElement(btnFirstLocator);
			if (isFirstPage()) {
				// Return the current page object as this action doesn't navigate to a page
				// represented by another
				// PageObject
				return;
			}

			attempts++;
		}

		throw new IllegalStateException(
				"Clicking the first page button did not navigate to the first page after 3 attempts.");
	}

	/**
	 * Returns true if we're on the last page.
	 *
	 * @return
	 */
	private boolean isLastPage() throws AutomationException {
		return !isElementVisible(btnNextLocator);
	}

	/**
	 * Quits the browser if it is running.
	 */
	private void quitBrowser() {
		if (null != driver) {
			driver.quit();
		}
	}

	/**
	 * Returns a locator to find an element with text within the specified tag.
	 *
	 * @param tagName The tag to search.
	 * @param text    The text to search for.
	 * @return
	 */
	private By getTextLocator(String tagName, String text) throws AutomationException {
		return By.xpath(String.format("//%s [text() = %s]", tagName, escapeQuotes(text)));
	}

	/**
	 * Returns a locator to find an element with class of specified tag.
	 *
	 * @param tagName   - The tag to search.
	 * @param className - The class of tag.
	 * @param text      - The text of tag.
	 * @return
	 */
	private By getTextLocatorByClassAndText(String tagName, String className, String text) throws AutomationException {
		return By.xpath(String.format("//%s[contains(@class, '%s') and text() = %s]",
			    tagName, className, escapeQuotes(text)));
	}

	private By getAnchorLocator(String anchorText) throws AutomationException {
		return getTextLocator(TAG_NAME_ANCHOR, anchorText);
	}

	@Override
	public String getTextByLocator(By locator) throws AutomationException {
		return getText(locator);
	}
	
	@Override
	public String getTextByLocatorWithinIFrame(String frameId, By locator) throws AutomationException {
		try {	
			driver.switchTo().frame(frameId);
			String text= getTextByLocator(locator);
			driver.switchTo().defaultContent();
			return text;
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not get text from the element with locator : '" + locator.toString() + "'", e);
		}
	}
	
	private String escapeQuotes(String text) {

		// If we don't have any Quote then enquote string in Quote
		if (!text.contains("\"")) {
			return String.format("\"%s\"", text);
		}

		// If we have some Quote but no Apostrophe then enquote in Apostrophe
		if (!text.contains("'")) {
			return String.format("'%s'", text);
		}

		// If input is like Administr"ati'on then we have both " and ' in the string, so we must use Concat
		// we will be building the xPath like below and let the browser xPath evaluation to handle the concatenation
		// output : concat(\"Administr\",'\"',"\ati'on\")
		StringBuilder sb = new StringBuilder("concat(");

		// Looking for " as they are LESS likely than '
		int lastPos = 0;
		int nextPos = text.indexOf("\"");
		while (nextPos != -1) {
			// If this is not the first time through the loop then seperate arguments with ,
			if (lastPos != 0) {
				sb.append(",");
			}

			sb.append(String.format("\"%s\",'\"'", text.substring(lastPos, nextPos - lastPos)));
			lastPos = ++nextPos;

			// Find next occurrence
			nextPos = text.indexOf("\"", lastPos);
		}

		sb.append(String.format(",\"%s\")", text.substring(lastPos)));
		return sb.toString();
	}

	/**
	 * Returns a locator to find an element with an ID that contains the specified
	 * partial ID.
	 *
	 * @param tagName   The tag to search.
	 * @param partialId The partial ID to search for
	 * @return
	 */
	private WebElement getPartialIDElement(String tagName, String partialId, int index) throws AutomationException {

		List<WebElement> elements = driver
				.findElements(By.xpath("//" + tagName + "[contains(@id, '" + partialId + "')]"));
		return elements.get(index);

	}

	@Override
	public boolean enterOptionalText(String componentId, String text, int index, String tagName)
			throws AutomationException {

		boolean result = false;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				WebElement element = getPartialIDElement(tagName, componentId, index);
				debug("Entering text '" + text + "' into element '" + element.toString() + "' attempt "
						+ (attempts + 1));
				element.clear();
				element.sendKeys(text);
				result = true;
				break;
			} catch (StaleElementReferenceException e) {
				debug("Inside enterOptionalText's method -> StaleElementReferenceException: " + e);
			} catch (NoSuchElementException e) {
				debug("Inside enterOptionalText's method -> NoSuchElementException: " + e);
			}
			attempts++;
		}

		return result;
	}

	/**
	 * Select the (visible text) value of select box field. If value is null, then
	 * select the first option.
	 *
	 * @param value
	 * @param componentId
	 * @param index
	 * @param tagName
	 * @return
	 */
	@Override
	public void selectValue(String value, String componentId, int index, String tagName) throws AutomationException {
		try {
			WebElement webElement = getPartialIDElement(tagName, componentId, index);
			final Select select = new Select(webElement);
			if (value != null) {
				select.selectByVisibleText(value);
			} else {
				select.selectByIndex(0);
			}
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not select the given option in element : '" + componentId + "'", e);
		}
	}

	/**
	 * Select the (visible text) value of select box field. If value is null, then
	 * select the first option.
	 *
	 * @param value
	 * @param componentId
	 * @param index
	 * @param tagName
	 * @return
	 */
	@Override
	public void selectValue(String value, String componentId, int index, String tagName, boolean wait)
			throws AutomationException {
		try {
			WebElement webElement = getPartialIDElement(tagName, componentId, index);
			final Select select = new Select(webElement);
			if (value != null) {
				select.selectByVisibleText(value);
			} else {
				select.selectByIndex(0);
			}
		} catch (IllegalArgumentException e) {
			throw new AutomationException("Could not select the given option in element : '" + componentId + "'", e);
		}
	}

	@Override
	public void resizeWindow(int width, int height) {
		Dimension dimension = new Dimension(width, height);
		driver.manage().window().setSize(dimension);
	}
	
	/**
	 * Zoom the browser window
	 * Example: setting zoom value 0.9 would zoom out the browser to 90%
	 * 			setting zoom value 1.1 would zoom in the browser to 110%
	 *
	 * @return
	 */
	@Override
	public void setZoom(String zoom) throws AutomationException {
		((JavascriptExecutor) driver).executeScript("document.body.style.zoom='"+zoom+"'");
	}

	/**
	 * Scrolls up the browser window
	 *
	 * @return
	 */
	@Override
	public void scrollup() throws AutomationException {
		((JavascriptExecutor) driver).executeScript("window.scrollTo(0, 1)");

	}
	
	/**
	 * Scrolls down the browser window
	 *
	 * @return
	 */
	@Override
	public void scrolldown() throws AutomationException {
		((JavascriptExecutor) driver).executeScript("window.scrollTo(0, -1)");

	}

	@Override
	public String getAttributeInElement(By locator, String attributeName) throws AutomationException {
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				return driver.findElement(locator).getAttribute(attributeName);
			} catch (StaleElementReferenceException e) {
				debug(String.format("StaleElementReferenceException occurred while reading '%s' attribute in %s", attributeName, locator.toString()));
			}
			attempts++;
		}
		throw new AutomationException(String.format("Reading the '%s' attribute failed in %s", attributeName, locator.toString()));
	}
	
	@Override
	public String getTextInElement(By locator) throws AutomationException {
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				return driver.findElement(locator).getText();
			} catch (StaleElementReferenceException e) {
				debug(String.format("StaleElementReferenceException occurred while reading text in %s", locator.toString()));
			}
			attempts++;
		}
		throw new AutomationException(String.format("Reading the text failed in %s", locator.toString()));
	}

	@Override
	public List<String> getTextInList(By rootSelector, By itemSelector) throws AutomationException {
		int attempts = 0;
		boolean isReadingListCompleted = false;
		List<String> textElements = new ArrayList<>();

		while (attempts < RETRIES) {
			textElements.clear();
			try {
				WebElement rootElement = findElement(rootSelector);

				List<WebElement> items = rootElement.findElements(itemSelector);
				if (items != null) {
					for (WebElement element : items) {
						String lineText = element.getText();
						if (StringUtils.isNotEmpty(lineText)) {
							textElements.add(lineText);
						}
					}
				}
				isReadingListCompleted = true;
				break;
			} catch (StaleElementReferenceException e) {
				debug(String.format("StaleElementReferenceException occurred while reading child '%s' in list %s", itemSelector.toString(), rootSelector.toString()));
			}
			attempts++;
		}
		if (!isReadingListCompleted) {
			throw new AutomationException("Reading the text in list failed for : " + rootSelector);
		}
		return textElements;
	}

	@Override
	public int getItemsCount(By rootSelector, By itemSelector) throws AutomationException {
		WebElement rootElement = findElement(rootSelector);
		return rootElement.findElements(itemSelector).size();
	}


	/**
	 * Method to iterates the table and return the row number of the label passed
	 *
	 * @param label
	 * @param tableXpath
	 * @return integer
	 */
	@Override
	public int getTableRowNumber(String label, String tableXpath) throws AutomationException {
		WebElement TogetRows = driver.findElement(By.xpath(tableXpath));
		List<WebElement> TotalRowsList = TogetRows.findElements(By.tagName("tr"));
		int rowNum = 0;

		for (int index = 0; index <= TotalRowsList.size(); index++) {
			if (TotalRowsList.get(index).getText().contains(label)) {
				rowNum = index + 1;
				break;
			}
		}

		return rowNum;
	}
	
	/**
	 * Common method to retry web driver related executions
	 * @param executable AutomationExecutable which has execute method
	 * @param retries No of retry attempts
	 * 
	 * @return
	 */
	public void attemptExecute(AutomationExecutable executable, int retries) throws AutomationException {
		int attempt = 1;
		while (attempt <= retries) {
			try {
				executable.execute();
				
				// if no Exception is thrown execution is considered successful
				return;
			} catch (RetryableAutomationException e) {
				debug(String.format("Failed retry attempt %d, Exception : %s", attempt, e.getMessage()));
				if (attempt == retries) {
					throw new AutomationException(
							String.format("Attempt Execute Retries exceeded,  %s", e.getMessage()));
				}
				try {
					Thread.sleep(SLEEP);
				} catch (InterruptedException i) {
					Thread.currentThread().interrupt();
				}
			}
			attempt++;
		}
	}
	
	/**
	 * Common method to retry web driver related executions
	 * @param executable AutomationExecutable which has execute method
	 * 
	 * @return
	 */
	public void attemptExecute(AutomationExecutable executable) throws AutomationException {
		attemptExecute(executable, RETRIES);
	}

	public interface AutomationExecutable {
		public abstract void execute() throws AutomationException;
	}

	@Override
	public String getCurrentUrl() {
		return driver.getCurrentUrl();
	}

	@Override
	public void shutdown() {
		driver.quit();
	}

	@Override
	public void switchToPageWithGivenURL(String currentURL) {
		for (String windowHandleName : driver.getWindowHandles()) {
			if (!StringUtils.equals(windowHandleName, driver.getWindowHandle())) {
				driver.switchTo().window(windowHandleName);
			}
			if (StringUtils.equals(currentURL, driver.getCurrentUrl())) {
				break;
			}
		}
	}
	
	@Override
	public void navigateToPageBackPress() {
		driver.navigate().back();
	}
	
	@Override
	public void navigateToPageForwardPress() {
		driver.navigate().forward();
	}

	@Override
	public boolean isItemSelectedInList(By locator) throws AutomationException {
		WebElement element = findElementFluently(locator);
		String classes = element.getAttribute(CSS_CLASS);
		if (classes == null || classes.isEmpty()) {
			return false;
		}
		for (String cls : classes.split("\\s+")) {
			if (cls.equals(CSS_SELECTED)) {
				return true;
			}
		}
		return false;
	}	
	
	@Override
	public void enterPress() {
		Actions actions = new Actions(driver);
	    actions.sendKeys(Keys.ENTER).perform();
	}
}
