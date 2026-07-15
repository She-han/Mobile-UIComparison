Feature: Safe Outlay
    
  @PT-16724 @SafeCashManagement @POS @Outlay
  Scenario: Balancing Outlays - Balance a safe outlay on the POS
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Safe Cash Management" button
    Then "Safe Cash Management" page is shown
    And user presses "Safe Cash Management Screen More Button" icon button
    Then "Safe Cash Management" page is shown
    And user presses "Safe Cash Management Screen More Button" icon button
    Then "Safe Cash Management" page is shown
    When user presses "Safe Cash Management Outlay Button" icon button
    Then "Cash Management Select Outlay Reason" page is shown
    And user selects "${Outlay Reason 1}" from "Selection List" list
    Then user presses "OK" button and "Safe Cash Management Select Tender" page shown
    And user presses "Notes" button and "Enter Notes" page shown
    And user enters "This is a sample safe outlay note" into "Outlay Note Text Area" field
    Then user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user selects "${Tender Cash UK}" from "Selection List" list
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    And user enters "${Outlay Price}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Confirm" button and "Safe Cash Management Select Tender" page shown
		And user presses "Complete Button" icon button and "Enter Reference User" page shown
		And user enters "${Manager 4 Username}" into "Input Box" field		
    And user presses "ENT" button and "Safe Cash Management" page shown  
    When user presses "Safe Cash Management Outlay Return Button" icon button
    Then "Cash Management Select Outlay Return" page is shown
    And user selects "${Outlay Price}" from "Selection List" list
    And user presses "Select" button and "Select Outlay Return Reason" page shown
    And user selects "${Outlay Return Reason 1}" from "Selection List" list
		Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    Then user presses "Skip" button and "Outlay Return Capture Expense" page shown			
    Then user presses "Add Expense" button and "Cash Management Select Expense Reason" page shown
    And user selects "${Expense Reason}" from "Selection List" list
    And user presses "OK" button and "Safe Cash Management Select Tender" page shown
    And user selects "${Tender Cash UK}" from "Selection List" list
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    And user enters "${Outlay Price}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Confirm" button and "Safe Cash Management Select Tender" page shown
    Then user presses "Complete" button and "Outlay Return Capture Expense" page shown
    Then user presses "Complete" button and "Outlay Balanced Prompt" page shown
    And user presses "OK" button and "Cash Management Add Notes" page shown
    And user enters "This is a balanced safe outlay" into "Outlay Note Text Area" field
    And user presses "OK" button and "Safe Cash Management" page shown  
    When user presses "Safe Cash Management Screen Back Button" icon button
    Then "Safe Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Safe Cash Management" page is shown
    When user presses "Safe Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown    