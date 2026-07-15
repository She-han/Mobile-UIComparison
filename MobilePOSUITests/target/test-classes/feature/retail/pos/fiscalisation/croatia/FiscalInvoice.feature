Feature: Fiscal Invoice on Croatia Fiscal POS

  @PT-2256 @Fiscalisation @Croatia @FiscalCroatiaFiscalInvoice @ManualVerification @AUTOMATED
  Scenario: Verify Fiscal Invoice on Croatia Fiscal POS
    Given user signs on as "Croatia Fiscal Sales Assistant"
    And user enters "${Product Fiscal HR 1}" into "Input Box" field
    When user presses "ENT" button
    When user presses "Sales" button
    When user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    When user presses "Request Simple Fiscal Invoice" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Name Contact" page shown  
    When user enters "Cust_Forename" into "Customer Loyalty Details Forname" field
    And user enters "Cust_Surname" into "Customer Loyalty Details Surname" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user enters "Cambridge House" into "Customer Address Line1 Text" field
    And user enters "Bluecoats Avenue" into "Customer Address Line2 Text" field
    And user enters "Oak Grove" into "Customer Address Line3 Text" field
    And user enters "Hertford" into "Customer Town Text" field
    And user enters "Herts" into "Customer County Text" field
    And user enters "SG13 8AT" into "Customer Postcode" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
