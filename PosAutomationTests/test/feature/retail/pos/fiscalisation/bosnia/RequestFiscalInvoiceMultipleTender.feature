Feature: Request Simple Fiscal Invoice - Multiple Tenders

  @PT-983 @No_Printer @Bosnia @Fiscalisation @FiscalBosnia @AUTOMATED
  Scenario: Verify Add Item to the Basket and Request Fiscal Invoice using Cash and Card Tenders in Bosnia Fiscal Printer
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user enters "${Product Fiscal BA 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal BA 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal BA 4}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    When user presses "Request Simple Fiscal Invoice" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user enters "BAM10.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    Then user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    When user presses "E" button
    And "Capture Customer Name" page is shown
    And user enters "Daris" into "Customer Forename Text" field
    And user enters "Kulenović" into "Customer Surname Text" field
    And user presses "OK" button and "Capture Customer Address" page shown
    And user enters "Maple Ave" into "Customer Address Line1 Text" field
    And user enters "North Road" into "Customer Address Line2 Text" field
    And user enters "70000" into "Customer Postcode" field
    And user presses "OK" button and "Capture Customer Phone Email" page shown
    And user presses "Skip" button
    Then "Bosnia Confirm Customer Details" page is shown
    And user enters "1234563214567" into "Tax Id" field
    When user presses "Confirm" button and "Remove Card Prompt" page shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
