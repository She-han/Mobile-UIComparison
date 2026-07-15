Feature: Cash Management - Expense Slovenia

  @PT-2808 @SloveniaFiscalExpense @No_Printer @AUTOMATED @Slovenia @Fiscalisation @FiscalSlovenia
  Scenario: Verify the Fiscal Receipt for Cash Management Expenses on Slovenia Fiscal Printer
    Given user signs on as "Slovenia Fiscal Sales Assistant"
		When user presses "Management" button
		When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
		And user presses "Cash Management Screen Expense Button" icon button
		And user waits "3" seconds
		Then "Cash Management Select Tender" page is shown	
		And user selects "Cash SI" from "Selection List" list
		And user enters "100.00" into "Input Box" field
		When user presses "OK" button
		And user presses "Complete" button
		Then "Await Drawer Closed" page is shown
		And user presses "Close" button on external "Cash Drawer" window
		And "Terminal Cash Management" page is shown
		And user presses "Terminal Cash Management Screen Back Button" icon button
		Then "Transaction Basket" page is shown
		When user presses "SignOff" button
		And "Enter User" page is shown

		
		