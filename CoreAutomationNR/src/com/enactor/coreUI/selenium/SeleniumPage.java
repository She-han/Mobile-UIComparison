package com.enactor.coreUI.selenium;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoAlertPresentException;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import org.testng.Reporter;

/**
 * Base Selenium Page class.
 *
 * @author David Hall
 */
public abstract class SeleniumPage {
	
	/** Input tag. */
	protected static final String TAG_NAME_INPUT = "input";
	
	/** Span tag. */
	protected static final String TAG_NAME_SPAN = "span";
	
	/** Anchor tag. */
	protected static final String TAG_NAME_ANCHOR = "a";
	
	/** Image tag. */
	protected static final String TAG_NAME_IMG = "img";

	/** Match type enumeration. */
	public enum MatchType {
		EQUALS, EQUALS_IGNORE_CASE, STARTS_WITH, STARTS_WITH_IGNORE_CASE,
		ENDS_WITH, ENDS_WITH_IGNORE_CASE, CONTAINS, CONTAINS_IGNORE_CASE
	};
	
	/** Value to use for not found. */
	public static final int TABLE_SEARCH_NOT_FOUND = 0;
	
	/** Number of retries in "safe" methods. */
	private static final int RETRIES = 3;
	
	/** The web driver. */
	protected final WebDriver driver;	
		
	/**
	 * Default constructor.
	 *
	 * @param driver
	 */
	public SeleniumPage(WebDriver driver) {
		this.driver = driver;
		
		if (null == driver) {
			throw new IllegalStateException("Expected a non-null WebDriver.");
		}
	}

	/**
	 * @return the driver
	 */
	public WebDriver getDriver() {
		return driver;
	}

	/**
	 * Gets the selected value of the provided HTML select element.
	 *
	 * @param element
	 * @return
	 */
	public String getSelectValue(WebElement element) {
		if (null != element) {
			Select selectBox = new Select(element);
			return selectBox.getFirstSelectedOption().getText();
		}
		return null;
	}
	
	/**
	 * Sets a HTML select element to the selected value.
	 * 
	 * @param element
	 * @param value
	 */
	public void setSelectValue(WebElement element, String value) {
		if (null != element) {
			Select selectBox = new Select(element);
			selectBox.selectByValue(value);
		}
	}
	
	/**
	 * Sets a HTML select element to the selected text.
	 *
	 * @param element
	 * @param text
	 */
	public void setSelectText(WebElement element, String text) {
		if (null != element) {
			Select selectBox = new Select(element);
			selectBox.selectByVisibleText(text);
		}
	}
	
	/**
	 * Converts the String into an integer, or null if blank.
	 *
	 * @param value
	 * @return
	 */
	public Integer getIntegerValue(String value) {
		if (StringUtils.isBlank(value)) {
			return null;
		}
		return Integer.parseInt(value);
	}
	
	/**
	 * Utility method to find an element by text within span tags.
	 *
	 * @param spanText	The text to search for
	 * @return	The element, or null.
	 */
	public 	WebElement findElementBySpan(String spanText) {
		return findElement(getSpanLocator(spanText));
	}
	
	/**
	 * Returns a locator to find text within span tags.
	 *
	 * @param spanText
	 * @return
	 */
	public By getSpanLocator(String spanText) {
		return getTextLocator(TAG_NAME_SPAN, spanText);
	}
	
	/**
	 * Utility method to find an element by text within anchor (a) tags.
	 *
	 * @param anchorText	The text to search for
	 * @return	The element, or null.
	 */
	public 	WebElement findElementByAnchor(String anchorText) {
		return findElement(getAnchorLocator(anchorText));
	}
	
	/**
	 * Returns a locator to find text within anchor (a) tags.
	 *
	 * @param anchorText
	 * @return
	 */
	public By getAnchorLocator(String anchorText) {
		return getTextLocator(TAG_NAME_ANCHOR, anchorText);
	}
	
	/**
	 * Returns a locator to find an element with text within the specified tag.
	 *
	 * @param tagName	The tag to search.
	 * @param text		The text to search for.
	 * @return
	 */
	public By getTextLocator(String tagName, String text) {
		return By.xpath("//" + tagName + "[text()='" + text + "']");
	}
	
	/**
	 * Returns a locator to find an element with an ID that contains the specified partial ID.
	 *
	 * @param tagName		The tag to search.
	 * @param partialId		The partial ID to search for
	 * @return
	 */
	public By getPartialIDLocator(String tagName, String partialId) {
		return By.xpath("//" + tagName + "[contains(@id, '" + partialId + "')]");
	}
	
	/**
	 * Returns a locator to find an image with a src attribute that contains the specified text.
	 *
	 * @param src			The text to search for.
	 * @return
	 */
	public By getImageLocator(String src) {
		return By.xpath("//" + TAG_NAME_IMG + "[contains(@src,'" + src + "')]");
	}
	
	/**
	 * Returns whether or not a locator is enabled on the page.
	 *
	 * @param locator
	 * @return
	 */
	public boolean isElementEnabled(By locator) {
 		return isElementEnabled(findElement(locator));
	}
	
	/**
	 * Returns whether or not an element is enabled on the page.
	 *
	 * @param element
	 * @return
	 */
	public boolean isElementEnabled(WebElement element) {
		try {
			if (null == element) {
				return false;
			}
			return element.isEnabled();
		} catch (NoSuchElementException ex) {
			return false;
		}
	}
	
	/**
	 * Returns whether or not a locator is visible on the page.
	 *
	 * @param locator
	 * @return
	 */
	public boolean isElementVisible(By locator) {
		return isElementVisible(findElement(locator));
	}
	
	/**
	 * Returns whether or not an element is visible on the page.
	 *
	 * @param element
	 * @return
	 */
	public boolean isElementVisible(WebElement element) {
		try {
			if (null == element) {
				return false;
			}
			return element.isDisplayed();
		} catch (NoSuchElementException ex) {
			return false;
		}
	}
	
	/**
	 * Searches a table for the specified text. Allows users to define a specific column and/or row to search.
	 * 
	 * Rows and columns start at 1, but if the table has a header row then the row will effectively start at 2.
	 * 
	 * @param tableClass	The class name of the table element.
	 * @param itemText		The item text to search for.
	 * @param searchColumn	The column to search, if not 0.
	 * @param searchRow		The row to search, if not 0.
	 * @param matchType		The match type to use to define a match.
	 * @return		The row number if the text was found, else 0.
	 */
	public int searchTable(String tableClass, String itemText, int searchColumn, int searchRow, MatchType matchType) {
		WebElement baseTable = findElement(By.className(tableClass));
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

		if (searchColumn != 0 || searchRow != 0) {
			debug("Item not found in table at row " + searchRow + " column " + searchColumn
					+ " with text '" + itemText + "', class " + tableClass + ", match type " + matchType);
		} else {
			debug("Item not found in table with text '" + itemText + "', class " + tableClass + ", match type " + matchType);
		}
		return TABLE_SEARCH_NOT_FOUND;
	}
	
	/**
	 * Searches a table row.
	 *
	 * @param row			The row number.
	 * @param itemText		The item text to search for.
	 * @param searchRow		The row to search, if not 0.
	 * @param matchType		The match type to use to define a match.
	 * @return
	 */
	private int searchRow(WebElement row, String itemText, int searchColumn, int rowNum, MatchType matchType) {
		List<WebElement> tableCells = row.findElements(By.tagName("td"));
		if (null != tableCells) {
			if (searchColumn == TABLE_SEARCH_NOT_FOUND) {
				// If search column is 0 it means the column to search was not
				// defined, so we search all columns
				for (WebElement cell : tableCells) {
					if (match(cell.getText(), itemText, matchType)) {
						debug("Found match for text '" + itemText + "' in row " + rowNum + " of table, match type " + matchType);
						return rowNum;
					}
				}
			} else {
				// Column defined so just look at the specified column
				if (tableCells.size() >= searchColumn) {
					WebElement cell = tableCells.get(searchColumn - 1);
					if (match(cell.getText(), itemText, matchType)) {
						debug("Found match for text '" + itemText + "' in row " + rowNum + " of table, match type " + matchType);
						return rowNum;
					}
				}
			}
		}
		
		return TABLE_SEARCH_NOT_FOUND;
	}
	
	/**
	 * Returns the column index of the table column with the specified text.
	 *
	 * @param tableClass	The class name of the table element.
	 * @param columnText	The column to search for.
	 * @return	The index, or 0 if the column could not be found.
	 */
	public int getHeaderColumn(String tableClass, String columnText) {
		if (null == columnText) {
			return TABLE_SEARCH_NOT_FOUND;
		}
		WebElement baseTable = findElement(By.className(tableClass));
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
		
		debug("Column not found for header text '" + columnText + "', class " + tableClass);
		return TABLE_SEARCH_NOT_FOUND;
	}
	
	/**
	 * Attempts to retrieve text from an element. First tries the "text" of the element, if this is blank returns the "value" attribute.
	 *
	 * @param locator
	 * @return
	 */
	public String getText(By locator) {
		String text = null;
		
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				if (attempts == 0) {
					debug("Finding text of element '" + locator.toString() + "'");
				} else {
					debug("Finding text of element '" + locator.toString() + "' attempt " + (attempts + 1));
				}
				text = driver.findElement(locator).getText();
				if (StringUtils.isBlank(text)) {
					text = driver.findElement(locator).getAttribute("value");
				}
				debug("Text of element '" + locator.toString() + "' is '" + text + "'");
				break;
			} catch (StaleElementReferenceException e) {
				// Do nothing
			} catch (NoSuchElementException e) {
				// Do nothing
			}
			attempts++;
		}
		
		return text;
	}
	
	/**
	 * Attempts to enter text into an element, retrying 3 times. If it fails, an exception is thrown.
	 * 
	 * @param locator
	 * @param text
	 */
	public void enterText(By locator, String text) {
		boolean success = enterOptionalText(locator, text);
		if (!success) {
			throw new IllegalStateException("Could not enter text '" + text + "' into element '" + locator.toString() + "'");
		}
	}
	
	/**
	 * Attempts to enter text into an element, retrying 3 times.
	 * 
	 * @param locator
	 * @param text
	 */
	public boolean enterOptionalText(By locator, String text) {
		boolean result = false;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				if (attempts == 0) {
					debug("Entering text '" + text + "' into element '" + locator.toString() + "'");
				} else {
					debug("Entering text '" + text + "' into element '" + locator.toString() + "' attempt " + (attempts + 1));
				}
				result = enterOptionalText(driver.findElement(locator), text);
				break;
			} catch (StaleElementReferenceException e) {
				// Do nothing
			} catch (NoSuchElementException e) {
				// Do nothing
			}
			attempts++;
		}
		
		return result;
	}
	
	/**
	 * Attempts to enter text into an element.
	 * 
	 * @param element
	 * @param text
	 */
	public boolean enterOptionalText(WebElement element, String text) {
		element.clear();
		element.sendKeys(text);
		return true;
	}
	
	/**
	 * Attempts to press enter in element, retrying 3 times. If it fails, an exception is thrown.
	 *
	 * @param locator
	 */
	public void enterKeyPressed(By locator){
		boolean success = enterKeyPressedOptional(locator);
		if(!success){
			throw new IllegalStateException("Could not press enter in element '" + locator.toString() + "'");
		}
	}
	
	/**
	 * Attempts to press enter in an element, retrying 3 times.
	 * 
	 * @param locator
	 * @return Whether the action was successful.
	 */
	public boolean enterKeyPressedOptional(By locator){
		boolean result = false;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				if (attempts == 0) {
					debug("Pressing enter in element '" + locator.toString() + "'");
				} else {
					debug("Pressing enter in element '" + locator.toString() + "' attempt " + (attempts + 1));
				}
				WebElement elem = driver.findElement(locator);
				elem.sendKeys(Keys.RETURN);
				result = true;
				break;
			} catch (StaleElementReferenceException e) {
				// Do nothing
			} catch (NoSuchElementException e) {
				// Do nothing
			}
			attempts++;
		}
		
		return result;
	}
	
	/**
	 * Attempts to click on an element, retrying 3 times. If it fails, an exception is thrown.
	 *
	 * @param locator
	 */
	public void clickElement(By locator) {
		boolean success = clickOptionalElement(locator);
		if (!success) {
			throw new IllegalStateException("Could not click on element '" + locator.toString() + "'");
		}
	}

	/**
	 * Attempts to click on an element, retrying 3 times.
	 * 
	 * @param locator
	 * @return Whether the action was successful.
	 */
	public boolean clickOptionalElement(By locator) {
		boolean result = false;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				if (attempts == 0) {
					debug("Clicking on element '" + locator.toString() + "'");
				} else {
					debug("Clicking on element '" + locator.toString() + "' attempt " + (attempts + 1));
				}
				driver.findElement(locator).click();
				result = true;
				break;
			} catch (StaleElementReferenceException e) {
				// Do nothing
			} catch (NoSuchElementException e) {
				// Do nothing
			}
			attempts++;
		}
		
		return result;
	}
	
	/**
	 * Utility method to find an element, with a timeout to allow time for the element to appear on the page. Retries 3 times.
	 *
	 * @param locator
	 * @return The element or null if it couldn't be found.
	 */
	public WebElement findElement(By locator) {
		WebElement result = null;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				result = driver.findElement(locator);
				break;
			} catch (StaleElementReferenceException e) {
				// Do nothing
			} catch (NoSuchElementException e) {
				// Do nothing
			}
			attempts++;
		}
		
		return result;
	}
	
	/**
	 * Utility method to find an element, with a timeout to allow time for the element to appear on the page. Retries 3 times.
	 *
	 * @param element
	 * @param locator
	 * @return The elements or an empty list if they couldn't be found.
	 */
	public List<WebElement> findElements(By locator) {
		List<WebElement> result = new ArrayList<WebElement>();
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				result = driver.findElements(locator);
				break;
			} catch (StaleElementReferenceException e) {
				// Do nothing
			} catch (NoSuchElementException e) {
				// Do nothing
			}
			attempts++;
		}
		
		return result;
	}
	
	/**
	 * Utility method to find an element, with a timeout to allow time for the element to appear on the page. Retries 3 times.
	 *
	 * @param locator
	 * @return The element or null if it couldn't be found.
	 */
	public WebElement findElement(WebElement element, By locator) {
		WebElement result = null;
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				result = element.findElement(locator);
				break;
			} catch (StaleElementReferenceException e) {
				// Do nothing
			} catch (NoSuchElementException e) {
				// Do nothing
			}
			attempts++;
		}
		
		return result;
	}
	
	/**
	 * Utility method to find an element, with a timeout to allow time for the element to appear on the page. Retries 3 times.
	 *
	 * @param element
	 * @param locator
	 * @return The elements or an empty list if they couldn't be found.
	 */
	public List<WebElement> findElements(WebElement element, By locator) {
		List<WebElement> result = new ArrayList<WebElement>();
		int attempts = 0;
		while (attempts < RETRIES) {
			try {
				result = element.findElements(locator);
				break;
			} catch (StaleElementReferenceException e) {
				// Do nothing
			} catch (NoSuchElementException e) {
				// Do nothing
			}
			attempts++;
		}
		
		return result;
	}
	
	/**
	 * Sleeps for a period of time to allow the DOM to catch up with the page load in certain cases.
	 * 
	 * Would be better if we didn't need this.
	 * 
	 * @param millis	The number of ms to sleep.
	 */
	public void sleep(long millis) {
		try {
			debug("Sleeping for " + millis + "ms");
			Thread.sleep(millis);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Accepts an alert on the page.
	 *
	 * @param failOnNoAlert		Whether to fail if there is no alert
	 */
	public void acceptAlert(boolean failOnNoAlert) {
		try {
			debug("Accepting alert dialog");
			driver.switchTo().alert().accept();
		} catch (NoAlertPresentException ex) {
			if (failOnNoAlert) {
				error("Alert dialog not present");
				throw ex;
			} else {
				debug("Alert dialog not present");
			}
		}
	}
	
	/**
	 * Dismisses an alert on the page.
	 *
	 * @param failOnNoAlert		Whether to fail if there is no alert
	 */
	public void dismissAlert(boolean failOnNoAlert) {
		try {
			debug("Dismissing alert dialog");
			driver.switchTo().alert().dismiss();;
		} catch (NoAlertPresentException ex) {
			if (failOnNoAlert) {
				error("Alert dialog not present");
				throw ex;
			} else {
				debug("Alert dialog not present");
			}
		}
	}
	
	/**
	 * Utility method to return whether the two strings match based on the specified match type.
	 * 
	 * @param firstString
	 * @param secondString
	 * @param matchType
	 * @return
	 */
	protected boolean match(String firstString, String secondString, MatchType matchType) {
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
	 * Prints debug text.
	 *
	 * @param debugText
	 */
	protected void debug(String debugText) {
		if (SeleniumConfig.getInstance().getDebug()) {
			System.out.println(debugText);
		}
		Reporter.log(debugText + "<br/>", false);
	}
	
	/**
	 * Prints error text.
	 *
	 * @param errorText
	 */
	protected void error(String errorText) {
		if (SeleniumConfig.getInstance().getDebug()) {
			System.err.println(errorText);
		}
		Reporter.log(errorText + "<br/>", false);
	}
}
