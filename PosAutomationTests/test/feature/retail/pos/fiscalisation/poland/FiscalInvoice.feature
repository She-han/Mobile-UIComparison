Feature: Fiscal Invoice

  @PT-616 @Fiscalisation @Poland @FiscalPolandInvoice @No_Printer @AUTOMATED
  Scenario: Request Simple Fiscal Invoice
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    And user presses "Request Simple Fiscal Invoice" button
    And user enters "${Product Fiscal Pl 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Pl 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Pl 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    Then "Capture Customer Name" page is shown
    When user enters "Cust_Forename" into "Customer Forename Text" field
    And user enters "Cust_Surname" into "Customer Surname Text" field
    And user enters "Enactor" into "Customer Organisation Text" field
    And user selects "Mr" from "Customer Title Dropdown" combobox
    And user enters "KC" into "Customer Initials Text" field
    And user selects "Male" from "Customer Sex Dropdown" combobox
    And user enters "250487" into "Customer Date of Birth Text" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user enters "Cambridge House" into "Customer Address Line1 Text" field
    And user enters "Bluecoats Avenue" into "Customer Address Line2 Text" field
    And user enters "Oak Grove" into "Customer Address Line3 Text" field
    And user enters "Hertford" into "Customer Town Text" field
    And user enters "Herts" into "Customer County Text" field
    And user enters "SG13 8AT" into "Customer Postcode" field
    And user presses "OK" button
    Then "Capture Customer Phone Email" page is shown
    When user presses "OK" button
    Then "Poland Confirm Customer" page is shown
    When user enters "123" into "Tax Id" field
    And user presses "Confirm" button
    Then "Invoice Number" page is shown
    And user presses "Cancel" button
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
