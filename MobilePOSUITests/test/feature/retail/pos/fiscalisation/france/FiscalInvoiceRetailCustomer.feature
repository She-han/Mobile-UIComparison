Feature: Printing Fiscal Invoice for retails customers

  @PT-17392 @Fiscalisation @France @FiscalFranceInvoice @No_Printer @AUTOMATED
  Scenario: Printing Fiscal Invoice for retails customers
    Given user signs on as "France Fiscal Sales Assistant"
    When user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    And user presses "Fiscal Invoice" button
    And user enters "${Product Fiscal Fr 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Fr 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    Then "Prompt State" page is shown
    And user selects "Retail" from "Selection List" list
    And user presses "OK" button
    Then "Capture Customer Name Contact" page is shown
    When user enters "Browne" into "Forename" field
    And user enters "Michael" into "Surname" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    And user enters "Enactor" into "Customer Address Organisation Text" field
    When user enters "Cambridge House" into "Customer Address Line1 Text" field
    And user enters "Bluecoats Avenue" into "Customer Address Line2 Text" field
    And user enters "Oak Grove" into "Customer Address Line3 Text" field
    And user enters "Hertford" into "Customer Town Text" field
    And user enters "Herts" into "Customer County Text" field
    And user selects "Alberta" from "Customer Address Province Dropdown" combobox
    And user enters "SG13 8AT" into "Customer Postcode" field
    And user presses "OK" button
    Then "France Capture Customer" page is shown
    And user enters "123" into "Customer No" field
    And user presses "Confirm" button
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown