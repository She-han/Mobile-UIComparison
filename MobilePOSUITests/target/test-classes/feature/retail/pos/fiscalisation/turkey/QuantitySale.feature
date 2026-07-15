Feature: Sale with multiple quantities of an item

  @PT-10780 @TurkeyFiscalQtySale @AUTOMATED @Turkey @Fiscalisation @ManualVerification
  Scenario: Verify the Quantity Sales Receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "4" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    And user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "010" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-11536 @Fiscalisation @Turkey @FiscalTurkeyItemSaleCash @AUTOMATED @ManualVerification
  Scenario: Turkish Fiscal Receipts: Verify that an E-Invoice Information Slip is printed for B2B transactions >=4400 TLR where the customer requests an invoice. (CASH Tender)
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "100" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    And user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Turkey Invoice Enforced" page shown
    And user presses "Continue" button and "Turkey Capture Customer Name Contact" page shown
    And user enters "Tom" into "Customer Forename Text" field
    And user enters "Sauyer" into "Customer Surname Text" field
    And user presses "OK" button    
    Then "Capture Customer Address" page is shown
    And user enters "2321" into "Customer Postcode Field" field
    And user enters "Notingham" into "Customer Address Line1 Text" field
    And user presses "OK" button and "Turkey Capture Customer Phone And Email" page shown
    And user presses "OK" button and "Turkey Handle Additional Invoice Data" page shown
    And user enters "112345678123" into "Tax Id" field
    And user enters "Mr" into "Turkey Customer Title" field
    And user presses "Confirm" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-11537 @Fiscalisation @Turkey @FiscalTurkeyItemSaleCash @AUTOMATED @ManualVerification
  Scenario: Turkish Fiscal Receipts: Verify that an E-Archive Information Slip is printed for B2C transactions >=4400 TLR where the customer requests an invoice. (CASH Tender)
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "100" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    And user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Turkey Invoice Enforced" page shown
    And user presses "Continue" button and "Turkey Capture Customer Name Contact" page shown
    And user enters "Tom" into "Customer Forename Text" field
    And user enters "Sauyer" into "Customer Surname Text" field
    And user presses "OK" button    
    Then "Capture Customer Address" page is shown
    And user enters "2321" into "Customer Postcode Field" field
    And user enters "Notingham" into "Customer Address Line1 Text" field
    And user presses "OK" button and "Turkey Capture Customer Phone And Email" page shown
    And user presses "OK" button and "Turkey Handle Additional Invoice Data" page shown
    And user enters "Mr" into "Turkey Customer Title" field
    And user presses "Confirm" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    