Feature: Generate Fiscal Invoices on Turkey Fiscal POS

  @PT-10619 @Turkey @AUTOMATED @Fiscalisation @ManualVerification @GenerateFiscalInvoice
  Scenario: Verify Simple fiscal Invoice
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    Then user presses "Request Simple Fiscal Invoice" button and "Transaction Basket" page shown
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Turkey Capture Customer Name Contact" page shown
    And user enters "Tom" into "Customer Forename Text" field
    And user enters "Sauyer" into "Customer Surname Text" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    And user enters "2321" into "Customer Postcode Field" field
    And user enters "Notingham" into "Customer Address Line1 Text" field
    And user presses "OK" button and "Turkey Capture Customer Phone And Email" page shown
    And user presses "OK" button and "Turkey Customer Confirmation Details" page shown
    And user enters "112345678123" into "Tax Id" field
    And user enters "Mr" into "Turkey Customer Title" field
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
