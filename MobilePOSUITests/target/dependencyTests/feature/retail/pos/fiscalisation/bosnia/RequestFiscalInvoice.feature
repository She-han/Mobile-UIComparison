Feature: Request Simple Fiscal Invoice

  @PT-982 @No_Printer @Bosnia @Fiscalisation @FiscalBosnia @AUTOMATED
  Scenario: Verify Add Item to the Basket and Request Fiscal Invoice using Cash Tender on Bosnia POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user enters "${Product Fiscal BA 2}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal BA 4}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    Then user presses "Request Simple Fiscal Invoice" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Name" page shown
    And user enters "Daris" into "Customer Forename Text" field
    And user enters "Kulenović" into "Customer Surname Text" field
    And user presses "OK" button and "Capture Customer Address" page shown
    And user enters "Maple Ave" into "Customer Address Line1 Text" field
    And user enters "North Road" into "Customer Address Line2 Text" field
    And user enters "70000" into "Customer Postcode" field
    And user presses "OK" button and "Capture Customer Phone Email" page shown
    And user presses "Skip" button 
    And "Bosnia Confirm Customer Details" page is shown
    And user enters "1234563214567" into "Tax Id" field
    When user presses "Confirm" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

