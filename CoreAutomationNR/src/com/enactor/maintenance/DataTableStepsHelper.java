package com.enactor.maintenance;

import static org.testng.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.cucumber.conetxt.ScenarioContext;

import io.cucumber.datatable.DataTable;

public class DataTableStepsHelper extends BaseWebSteps {

	public DataTableStepsHelper(ScenarioContext scenarioContext) {
		super(scenarioContext);
	}

	private static final String CHECK_BOX_TYPE = "checkbox";

	private static final String DATATABLE_CHECK_BOX_SELECTION = "CHECK";
	private static final String DATATABLE_CHECK_BOX_DESELECTION = "UNCHECK";
	private static final String DATATABLE_CELL_CLEAR = "";
	private static final String DATA_TABLE_CELL_MATCH_ANY = "*";

	private static final String DATATABLE_INPUT_CHECKBOX_HEADER = "CHECKBOX";
	private static final String DATATABLE_DO_NOTHING_HEADER = "DO NOTHING";
	private static final String DATATABLE_INPUT_TEXT_HEADER = "INPUT";
	private static final String DATATABLE_LINK_HEADER = "LINK";
	private static final String DATATABLE_INPUT_DROPDOWN_HEADER = "DROPDOWN";
	private static final String DATATABLE_ROW_NO_HEADER = "ROW NO";
	private static final String DATATABLE_TEXT_FIELD_HEADER = "LABEL";
	private static final String FIELD_LABEL_TYPE = "span";
	private static final String INPUT_FIELD_TYPE = "input";
	private static final String DROPDOWN_FIELD_TYPE = "select";
	private static final String INPUT_TEXT_FIELD_TYPE = "text";

	public static final String TABLE_PREFIX = "table.";
	private static final String FILTER_PREFIX = "filter.";
	
	private static final String VIEW_LINK_CLASS = "viewLink";
	private static final String EDIT_LINK_CLASS = "editLink";
	private static final String COPY_LINK_CLASS = "copyLink";
	private static final String REMOVE_LINK_CLASS = "removeLink";
	private static final String RESUBMIT_LINK_CLASS = "resubmitLink";
	private static final String REMOVE_IMPORTANT_LINK_CLASS = "removeimportantLink";
	private static final String SELECT_LINK_CLASS = "selectLink";
	private static final String NEXT_LINK_CLASS = "nextLink";
	private static final String HISTORY_LINK_CLASS = "viewHistoryLink";
	private static final String VIEW_XML_LINK_CLASS = "viewXmlLink";
	private static final String VIEW_OLD_ENTITY_LINK_CLASS = "viewOldEntityLink";
	private static final String VIEW_NEW_ENTITY_LINK_CLASS = "viewNewEntityLink";
	private static final String BACK_LINK_CLASS = "backLink";
	private static final String TABLE_CLASS = "listTable";
	private static final String ALERT_LINK_CLASS = "alertLink";
	private static final String NEXT_ARROW_LINK = "nextArrowLink";
	
	/**
	 * Returns true if given data is available on filter grid
	 *
	 * @param dataMap
	 * @return
	 */
	public boolean isGivenDataAvailable(String page, String table, String type, Map<String, String> dataMap) throws AutomationException {
        String locatorKey = loadConfig(page, FILTER_PREFIX, table, type, TABLE_CLASS);
        By tableLocator = getLocator(type,locatorKey);
        return getController().filteredListContainsItem(tableLocator, resolveData(dataMap));
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
		String componentId = loadConfig(page, TABLE_PREFIX, table, type);
		WebElement tableWebElement = getWebComponent(page, TABLE_PREFIX, table, type);
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
		String componentId = loadConfig(page, TABLE_PREFIX, table, type);

		WebElement tableWebElement = getWebComponent(page, TABLE_PREFIX, table, type);

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
		WebElement tableWebElement = getWebComponent(page, TABLE_PREFIX, table, type);
		List<WebElement> tableRows = tableWebElement.findElements(By.tagName("tr"));
		return tableRows.size() < 2;
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
		case "resubmit":
			className = RESUBMIT_LINK_CLASS;
			break;
		case "remove important":
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
		case "list application process log entries":
			className = ALERT_LINK_CLASS;
			break;
		case "next arrow":
			className = NEXT_ARROW_LINK;
			break;
		default:
			throw new AutomationException("Unknown search result link button [" + linkButton + "]");
		}

		List<String> resolvedCellText = Arrays.asList(new String[cellText.size()]);
		for (int i = 0; i < cellText.size(); i++) {
			resolvedCellText.set(i, resolveData(cellText.get(i)));
		}
        
		getController().executeItemWithTextOnCurrentPage(resolvedCellText, className);
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
	 * Check if the rows shown in the given DataTable is matching the rows in
	 * pageTable
	 */
	protected static boolean checkRowsShownInTable(ArrayList<ArrayList<String>> dataTable, WebElement pageTable,
			String componentId) throws AutomationException {

		List<List<WebElement>> tableRows = getTableRows(pageTable);

		// Get the header row out and remove from data
		List<String> dataTableHeadingRow = dataTable.get(0);
		dataTable.remove(0);

		for (List<String> dataTableRow : dataTable) {

			// Start matching the dataTableRow with actual table
			boolean atLeastOneRowMatched = false;
			rowMatchingLoop: for (int rowId = 0; rowId < tableRows.size(); rowId++) {

				List<WebElement> tableCells = tableRows.get(rowId);
				// Number of columns in dataTable should match the number of columns in page Table
				assertEquals(tableCells.size(), getDataTableSize(dataTableHeadingRow),
						String.format("Data table of %d columns doesn't match Table %s of %d columns",
								dataTableRow.size(), componentId, tableCells.size()));

				// Checking if the row matched the given criteria in data table
				boolean rowMatched = isDataTableRowMatchWithPageTableRow(dataTableHeadingRow, dataTableRow, tableCells,
						rowId, false);

				if (rowMatched) {
					atLeastOneRowMatched = true;
					break rowMatchingLoop;
				}
			}
			if (!atLeastOneRowMatched) {
				throw new AutomationException(
						String.format("No row in table matched the data table data row %d with page table of size %d",
								dataTable.indexOf(dataTableRow), tableRows.size()));
			}
		}

		return true;

	}

	/**
	 * Fill check boxes and input fields in first table found by class A row in data
	 * table can be matched to multiple in table, but 0
	 */
	protected static void fillTableWithAdjascentFields(ArrayList<ArrayList<String>> dataTable, WebElement pageTable,
			String componentId) throws AutomationException {

		List<List<WebElement>> tableRows = getTableRows(pageTable);
		
		// Get the header row out and remove from data
		List<String> dataTableHeadingRow = dataTable.get(0);
		dataTable.remove(0);

		for (List<String> dataTableRow : dataTable) {
			boolean atLeastOneRowMatched = false;
			
			// Start matching the dataTableRow with actual table, next data table row will start matching from the last selected row
			int lastMatchRow = 0;
			for (int rowId = lastMatchRow; rowId < tableRows.size(); rowId++) {

				List<WebElement> tableCells = tableRows.get(rowId);
				// Number of columns in dataTable should match the number of columns in page Table
				assertEquals(tableCells.size(), getDataTableSize(dataTableHeadingRow),
						String.format("Data table of %d columns doesn't match Table %s of %d columns",
								getDataTableSize(dataTableHeadingRow), componentId, tableCells.size()));
				int columnCount = getDataTableSize(dataTableHeadingRow);

				// Checking if the row matched the given criteria in data table
				boolean rowMatched = isDataTableRowMatchWithPageTableRow(dataTableHeadingRow, dataTableRow, tableCells,
						rowId, true);

				if (rowMatched) {
					atLeastOneRowMatched = true;
					lastMatchRow = rowId;
					
					// Row is matched so, lets fill the input fields
					boolean filledSomthing = false;
					
					int rowNoColumnPadding = 0;
					if (dataTableHeadingRow.get(0).equalsIgnoreCase(DATATABLE_ROW_NO_HEADER)) {
						rowNoColumnPadding = 1;
					}
					for (int cellId = 0; cellId < columnCount; cellId++) {
						String dataCell = dataTableRow.get(rowNoColumnPadding + cellId);
						String dataTableHeader = dataTableHeadingRow.get(rowNoColumnPadding + cellId);
						WebElement tableCell = tableCells.get(cellId);

						if (dataTableHeader.equalsIgnoreCase(DATATABLE_INPUT_TEXT_HEADER)
								&& !dataCell.equalsIgnoreCase(DATA_TABLE_CELL_MATCH_ANY)) {
							WebElement tableCellInput = tableCell.findElement(By.tagName(INPUT_FIELD_TYPE));
							String inputType = tableCellInput.getAttribute("type");
							if (!inputType.equals(INPUT_TEXT_FIELD_TYPE)) {
								throw new AutomationException(String.format("Given element type is %s but found %s",
										INPUT_TEXT_FIELD_TYPE, inputType));
							}
							filledSomthing = true;
							if (!DATA_TABLE_CELL_MATCH_ANY.equals(dataCell)) {
								// Not filling the input box if ANY matcher is present
								tableCellInput.sendKeys(dataCell);
							}
						} else if (dataTableHeader.equalsIgnoreCase(DATATABLE_INPUT_CHECKBOX_HEADER)
								&& !dataCell.equalsIgnoreCase(DATA_TABLE_CELL_MATCH_ANY)) {
							WebElement tableCellInput = tableCell.findElement(By.tagName(INPUT_FIELD_TYPE));
							String inputType = tableCellInput.getAttribute("type");
							if (!inputType.equals(CHECK_BOX_TYPE)) {
								throw new AutomationException(String.format("Given element type is %s but found %s",
										CHECK_BOX_TYPE, inputType));
							}
							filledSomthing = true;
							if ((DATATABLE_CHECK_BOX_SELECTION.equalsIgnoreCase(dataCell)
									&& !tableCellInput.isSelected())
									|| (DATATABLE_CHECK_BOX_DESELECTION.equals(dataCell)
											&& tableCellInput.isSelected())) {
								// select if not selected
								// deselect if selected
								tableCellInput.click();
							}
						} else if (dataTableHeader.equalsIgnoreCase(DATATABLE_LINK_HEADER)
								&& !dataCell.equals(DATATABLE_CELL_CLEAR)) {
							// Clicking on a link by class given in data cell
							filledSomthing = true;
							String linkClass = dataCell;
							WebElement tableCellLink = tableCell.findElement(By.className(linkClass));
							tableCellLink.click();
						} else if (dataTableHeader.equalsIgnoreCase(DATATABLE_INPUT_DROPDOWN_HEADER)
								&& !dataCell.equalsIgnoreCase(DATA_TABLE_CELL_MATCH_ANY)) {
							Select dropdown = new Select(tableCell.findElement(By.tagName(DROPDOWN_FIELD_TYPE)));
							dropdown.selectByVisibleText(dataCell);
							filledSomthing = true;
						} else if (dataTableHeader.equalsIgnoreCase(DATATABLE_DO_NOTHING_HEADER)) {
							filledSomthing = true;
						}
					}
					if (!filledSomthing) {
						throw new AutomationException(String.format("Data Table row %d did not fill anything in table",
								dataTable.indexOf(dataTableRow)));
					}
				}

			}
			if (!atLeastOneRowMatched) {
				throw new AutomationException(
						String.format("Data Table row %d did not match anything in table of size %d",
								dataTable.indexOf(dataTableRow), tableRows.size()));
			}
		}
	}

	/**
	 * Returns true if given dataTableRow<String> matches with pageTableRow<WebElement>
	 * Matching will be performed strictly on the same order as in page table.
	 * 
	 * @param dataTableHeading Heading row of the data Table describes the types of columns in page Table
	 * @param dataTableRow     Data table row subjected to match with page Table row
	 * @param pageTableRow     Web page table row subjected to match with data table row
	 * @param pageTableRowId   row id of the page starting from 0
	 * @param editMode         True if filling the table, False if only matching
	 * 
	 * @return boolean
	 */
	protected static boolean isDataTableRowMatchWithPageTableRow(List<String> dataTableHeading,
			List<String> dataTableRow, List<WebElement> pageTableRow, int pageTableRowId, boolean editMode)
			throws AutomationException {
		// Checking if the row matched the given criteria in data table
		int columnCount = dataTableHeading.size();
		boolean rowMatched = true;
		int pageTableCellId = 0;
		for (int cellId = 0; cellId < columnCount; cellId++) {
			String dataCell = dataTableRow.get(cellId);
			WebElement tableCell = pageTableRow.get(pageTableCellId);
			// Increment the pageTableCell pointer after retrieving the value
			pageTableCellId += 1;
			
			// Try to match only if the cell is ROW NO or TEXT in edit more, else check for the input values as well
			if (dataTableHeading.get(cellId).equalsIgnoreCase(DATATABLE_ROW_NO_HEADER)
					&& pageTableRowId + 1 != Integer.parseInt(dataCell)) {
				rowMatched = true;
				break;
			} else if (dataTableHeading.get(cellId).equalsIgnoreCase(DATATABLE_ROW_NO_HEADER)
						&& pageTableRowId + 1 == Integer.parseInt(dataCell)) {
				// if the row no matches. Now set the page table cell pointer back to previous value as page Table does not have row numbers
				pageTableCellId -= 1;
				continue;
			} else if (dataTableHeading.get(cellId).equalsIgnoreCase(DATATABLE_TEXT_FIELD_HEADER)) {

//				WebElement tableCellField = tableCell.findElement(By.tagName(FIELD_LABEL_TYPE));

				String tableCellFieldValue = tableCell.getText();
				if (!(dataCell.equals(DATA_TABLE_CELL_MATCH_ANY) || dataCell.equalsIgnoreCase(tableCellFieldValue))) {
					// Either the data cell matcher should match anything or data cell value should be page cell value
					rowMatched = false;
					break;
				}
			}
			// In edit mode we don't match the input fields
			else if (!editMode && dataTableHeading.get(cellId).equalsIgnoreCase(DATATABLE_INPUT_TEXT_HEADER)) {
				WebElement tableCellInput = tableCell.findElement(By.tagName(INPUT_FIELD_TYPE));

				String tableCellFieldValue = tableCellInput.getText();
				if (!(dataCell.equals(DATA_TABLE_CELL_MATCH_ANY) || dataCell.equalsIgnoreCase(tableCellFieldValue))) {
					// Either the data cell matcher should match anything or data cell value should be page cell value
					rowMatched = false;
					break;
				}
			} else if (!editMode && dataTableHeading.get(cellId).equalsIgnoreCase(DATATABLE_INPUT_CHECKBOX_HEADER)) {
				WebElement tableCellInput = tableCell.findElement(By.tagName(INPUT_FIELD_TYPE));
				String inputType = tableCellInput.getAttribute("type");
				if (!inputType.equals(CHECK_BOX_TYPE)) {
					throw new AutomationException(String.format("Given element type is %s but found %s", CHECK_BOX_TYPE, inputType));
				}
				if (!(dataCell.equals(DATA_TABLE_CELL_MATCH_ANY)
						|| (DATATABLE_CHECK_BOX_SELECTION.equalsIgnoreCase(dataCell) && tableCellInput.isSelected())
						|| (DATATABLE_CHECK_BOX_DESELECTION.equals(dataCell) && !tableCellInput.isSelected()))) {
					// If the data cell is marked check box should be checked
					// if the data cell is empty check box should not be checked
					rowMatched = false;
					break;
				}
			} else if (!editMode && dataTableHeading.get(cellId).equalsIgnoreCase(DATATABLE_INPUT_DROPDOWN_HEADER)) {
				Select dropdown = new Select(tableCell.findElement(By.tagName(DROPDOWN_FIELD_TYPE)));
				String dropdownSelectionText = dropdown.getFirstSelectedOption().getText();
				if (!(dataCell.equals(DATA_TABLE_CELL_MATCH_ANY)
						|| dataCell.equalsIgnoreCase(dropdownSelectionText))) {
					// If the data cell is * match any
					// if the data cell has value check the displayed value of dropdown
					rowMatched = false;
					break;
				}
			} 
		}
		return rowMatched;
	}
	
	/**
	 * Get the size of the data Table without control data columns
	 * @param dataTableHeadingRow List<String> contains the dataTable inputs by user
	 * 
	 */
	protected static int getDataTableSize(List<String> dataTableHeadingRow) {

		if (dataTableHeadingRow.get(0).equals(DATATABLE_ROW_NO_HEADER)) {
			return dataTableHeadingRow.size() - 1;
		}
		return dataTableHeadingRow.size();

	}
	
	
	/**
	 * Extract table rows from a table
	 * @param pageTable Table WebElement that need to get the rows extracted
	 * @return List of table row WebElements
	 */
	protected static List<List<WebElement>> getTableRows(WebElement pageTable) {
		
		// Some tables have multiple tbody parts and its confusing to find the exact one
		List<WebElement> tbodies = pageTable.findElements(By.xpath("tbody"));
		
		List<List<WebElement>> tableRows = new ArrayList<List<WebElement>>();
		for (WebElement tbody : tbodies) {
			// Previously used much simpler approach tbody.findElements(By.tagName("tr"))
			// but, there are tables which have tables inside cells
			// eg: 
			//		tbody
			//		-----tr
			//		-------td
			//		---------table
			//		--------------tbody
			//		-------------------tr
			//		---------------------td
			// hence try to match expected label fields in dataTable as text values in pageTable
//			tableRows.addAll(tbody.findElements(By.tagName("tr")));
			List<WebElement> tbodyChildrenRows = tbody.findElements(By.xpath("tr"));
			
			for (WebElement tbodyChildrenRow : tbodyChildrenRows) {
				
				List<WebElement> tbbodyChildrenRowCells = tbodyChildrenRow.findElements(By.xpath("td"));
				tableRows.add(tbbodyChildrenRowCells);
			}
		}

		return tableRows;
	}

	/**
	 * Click on the filter button referred by the style class derived from page,prefix and id
	 * First mark select table as dirty before filter button click
	 * Then wait for table to be clean by refreshing
	 * 
	 * @param page
	 * @param prefix
	 * @param id
	 * @param type
	 * @throws AutomationException
	 */
	public void clickOnFilterButton(String page, String prefix, String id, String type) throws AutomationException {
		
		String tableLocatorKey = loadConfig(page, FILTER_PREFIX, TABLE_PREFIX, type, TABLE_CLASS);
        By tableLocator = getLocator(type, tableLocatorKey);

        getController().markFilterTableDirty(tableLocatorKey);
        clickOnLinkButton(page, prefix, id, type);
        getController().waitTableToRefresh(tableLocator);        
	}
}
