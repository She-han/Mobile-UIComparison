Feature: Cash Management Expenses on Czech Fiscal POS 

  @PT-2227 @AUTOMATED @CzechRepublic @Fiscalisation @ManualVerification
  Scenario: Verify the Fiscal Receipt for Cash Management Expenses on Czech Fiscal POS 
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
		When user presses "Management" button
		When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
		And user presses "Cash Management Screen Expense Button" icon button
		Then "Cash Management Select Expense Reason" page is shown	
		And user selects "Store Expense" from "Selection List" list
		And user presses "OK" button
		Then "Terminal Cash Management Select Tender" page is shown	
    And user selects "Cash CZ" from "Selection List" list
		And user enters "100.00" into "Input Box" field
		When user presses "OK" button
		And user presses "Complete" button and "Cash Management Enter Notes" page shown
		And user presses "OK" button
		Then "Await Drawer Closed" page is shown
		And user presses "Close" button on external "Cash Drawer" window
		And "Terminal Cash Management" page is shown
		And user presses "Terminal Cash Management Screen Back Button" icon button
		Then "Transaction Basket" page is shown
		When user presses "SignOff" button
		And "Enter User" page is shown
	
	
