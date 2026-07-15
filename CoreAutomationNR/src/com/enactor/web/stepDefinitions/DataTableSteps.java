package com.enactor.web.stepDefinitions;

import java.util.Map;

import org.testng.Assert;

import com.enactor.core.automation.cucumber.conetxt.ScenarioContext;
import com.enactor.maintenance.DataTableStepsHelper;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;

public class DataTableSteps extends DataTableStepsHelper {

	public DataTableSteps(ScenarioContext scenarioContext) {
		super(scenarioContext);
	}

	/**
	 * Check item not shown in the search result table
	 *
	 * @param dataMap
	 * @throws Throwable
	 */
	@Given("^the searched item is not shown in the search results table$")
	public void checkItemNotShownInFiletedTable(Map<String, String> dataMap) throws Throwable {
		Assert.assertFalse(isGivenDataAvailable(getCurrentPage(), TABLE_PREFIX, CLASS, dataMap),
                "Item display in the search result table - " + dataMap);
	}
	
	/**
	 * Check item shown in the search result table
	 *
     * Table should have the 'class' attribute defined
     * If the Filter Table Class is different from listTable set it through the config properties
     * eg: page.filter.table.class
     * 
	 * @param dataMap
	 * @throws Throwable
	 */
	@Given("^the searched item is shown in the search results table$")
	public void checkItemShownInFiletedTable(Map<String, String> dataMap) throws Throwable {
		Assert.assertTrue(isGivenDataAvailable(getCurrentPage(), TABLE_PREFIX, CLASS, dataMap),
                "Item not display in the search result table - " + dataMap);
	}
	
	/**
	 * Check whether the give table is not empty
	 * Table id should be defined
	 * 
	 * @param tableId
	 * @throws Throwable
	 */
	@Given("^search results table \"(.*)\" is not empty$")
	public void checkDataTableIsNotEmpty(String tableId) throws Throwable {
		Assert.assertFalse(isTableEmpty(getCurrentPage(), tableId, ID),
				"Data table is empty - " + tableId);
	}
	
	/**
	 * Check whether the give table is empty
	 * Table id should be defined
	 * 
	 * @param tableId
	 * @throws Throwable
	 */
	@Given("^search results table \"(.*)\" is empty$")
	public void checkDataTableIsEmpty(String tableId) throws Throwable {
		Assert.assertTrue(isTableEmpty(getCurrentPage(), tableId, ID),
				"Data table is not empty - " + tableId);
	}
	
	
	
	/**
	 * Fill check boxes and input fields in first table found by id
	 * A row in data table can be matched to multiple in table, but 0
	 * None of the Column types are compulsory
	 *
	 * @param tableID ID of the table we are trying to match
	 * @param dataTable Cucumber DataTable object 
	 * @throws Throwable
	 * 
	 * ex: dataTable
	 * First row is used as header, values of the header are,
	 *  ROW NO	- If provided, it should contain the index (first row is 1) of the row it needs to match
	 *  LABEL	- If provided, text in the column will be matched, if the cell has * any value is matched
	 *  INPUT	- If provided matched rows with ROW NO or LABEL are filled with the given value.
	 *            If no value given, input will be cleared.
	 *            If * will leave it as it is
	 *  DROPDOWN- If provided  will select the displayed value from the dropdown
	 *  		- if * will leave it as it is
	 *  CHECKBOX-
	 *  		CHECK	- this will tick the check box
	 *  		UNCHECK - this will clear the checkbox
	 *  		  *		- this will not change the value of the checkbox
	 *	LINK	- add the style class of the link that needs to be clicked, leave empty not to click 
	 *			  ( if page redirects to different page after click you can click only in one row )
	 *
	 * |	ROW NO	| 	LABEL	|	LABEL	|	 INPUT		| CHECKBOX	|	LINK			|
	 * |	  1		| field 1,1	|	 * 		|	input 1		| 	CHECK 	|	openTaskLink xi |
	 * |	  3		| field 2,1	| field 2,2	|(Clear Input)	|  UNCHECK	|					|
	 */
	@Given("^the user fills \"(.*)\" table fields$")
	public void fillTableWithAdjascentFieldsByTableId(String tableId, DataTable dataTable) throws Throwable {
		super.fillTableWithAdjascentFields(getCurrentPage(), tableId, ID, dataTable);
	}
	
	/**
	 * Check if given rows are shown in the table
	 * None of the Column types are compulsory
	 *
	 * @param tableClass
	 * @param dataTable
	 * @throws Throwable
	 * 
	 * ex: dataTable
	 * First row is used as header, values of the header are,
	 *  ROW NO	- If provided, it should contain the index (first row is 1) of the row it needs to match
	 *  LABEL	- if provided, text in the column will be matched, if the cell has * any value is matched
	 *  INPUT	- If provided matched rows with ROW NO or LABEL shoule be filled with the given value. 
	 *  		  If * is given any value will be matched, If empty input should be empty
	 *  DROPDOWN- If provided  will check if the displayed value from the dropdown is the supplied value
	 *  		- if * will leave it as it is
	 *  CHECKBOX-
	 *  		CHECK	- this will tick the check box
	 *  		UNCHECK - this will clear the checkbox
	 *  		  *		- this will not change the value of the checkbox
	 *	
	 * |	ROW NO	| 	LABEL	|	LABEL	|	 INPUT		|	CHECKBOX	|
	 * |	  1		| field 1,1	|	 * 		|	input 1		| 	CHECK		|
	 * |	  3		| field 2,1	| field 2,2	|(empty Input)	| 	UNCHECK		|
	 */
	@Given("^the rows shown in \"(.*)\" table$")
	public void checkRowsShownInTableByTableClass(String tableId, DataTable dataTable) throws Throwable {
		Assert.assertTrue(super.checkRowsShownInTable(getCurrentPage(), tableId, ID, dataTable),
				"Given rows are not shown in the table - " + dataTable);
	}
	
	/**
	 * click link button on a record display in search result table.
	 * following details must be supply to click the button
	 * - Available link button - view, edit, copy, select or remove
	 * - One or more column details of the record you want to click the link button
	 *
	 * @param String
	 * @param dataMap
	 * @throws Throwable
	 */
	@Given("^the user clicks the \"(.*)\" link button of the search result item$")
	public void clickLinkButtonOfARecord(String linkButton, DataTable dataTable)
			throws Throwable {
		clickSearchResultRecordLinkButton(dataTable.row(0), linkButton);
	}
	
	/**
	 * Check whether the give table has at least the given number of data entries on
	 * it.
	 * 
	 * Note: Logic has implemented to not to consider the column names on the table.
	 * 
	 * @param tableId     ID of the table appeared in the HTML page.
	 * @param dataEntires Number of entries that should be considered.
	 * @throws Throwable
	 */
	@Given("^search results table \"(.*)\" has less than or equal \"(.*)\" data entires$")
	public void checkDataTableHasLessThanGivenNumberOfEntires(String tableId, int numOfEntries) throws Throwable {
		Assert.assertTrue(returnTableSize(getCurrentPage(), tableId, ID) - 1 <= numOfEntries,
				"Data table has less than " + numOfEntries + " number of data entires.");
	}
	
	/**
	 * Click on filter button by 'class'
     * button element must have 'class' attribute defined
     *
     * Click on filter button will wait for table to update,
     * If the Filter Table Class is different from listTable set it through the config properties
     * eg: page.filter.table.class
     * 
	 * @param label
	 * @throws Throwable
	 */
	@Given("^the user presses \"(.*)\" filter button$")
	public void userPressesFilterButton(String label) throws Throwable {
		clickOnFilterButton(getCurrentPage(), BUTTON_LABEL, label, CLASS);		
	}
}
