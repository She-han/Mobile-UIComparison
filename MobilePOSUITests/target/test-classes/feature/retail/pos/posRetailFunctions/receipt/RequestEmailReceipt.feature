Feature: Receipt Request

  @PT-17478 @AUTOMATED @POS
  Scenario: Customer capture - Verify Customer details reflected on EDIT screen and complete the transaction
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then "Transaction Basket" page is shown
    And user presses "Receipts" button and "Transaction Basket" page shown
    And user presses "Request Email Receipt" button and "Capture Customer Name Email" page shown
    And user presses "Search By Name" button and "Enter Search Customer Name" page shown
    Then user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Customer Name Search" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list    
    And user presses "OK" button and "Confirm Customer Prompt" page shown
    And user presses "Edit" button and "Capture Customer Name Email" page shown
    And "Mr" is selected in "Edit Customer Title" combobox
    And "Edit Customer Forename" field displays the text "${Customer 1 Name}"
    And "Edit Customer Surname" field displays the text "${Customer 1 Surname}"
    And "Edit Customer Email" field displays the text "${Customer 1 Email}"	  		
    And user enters "Mark-1" into "Edit Customer Forename" field		
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Customer 1 Edited Name}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | text | Customer: Mark-1 Harrison                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown	  
