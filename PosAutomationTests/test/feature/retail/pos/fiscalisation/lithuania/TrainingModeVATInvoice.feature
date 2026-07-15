Feature: Print VAT Invoice in Training Mode - Lithuania
    
  @PT-15080 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @TrainingMode @VatInvoice @ManualVerification
  Scenario: Lithuania - Verify training mode - VAT Invoice is printing with the Training Mode label
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Lithuania Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Lithuania Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    And user waits "5" seconds
    Then "Transaction Basket" page is shown
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    And user presses "Request Simple Fiscal Invoice" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Name Contact" page shown
    When user enters "${Customer 3 Name}" into "Forename" field
    And user enters "${Customer 3 Surname}" into "Surname" field
    And user presses "OK" button and "Capture Customer Address" page shown
    And user presses "OK" button and "Lithuania Confirm Customer Details" page shown
    And user presses "Confirm" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button