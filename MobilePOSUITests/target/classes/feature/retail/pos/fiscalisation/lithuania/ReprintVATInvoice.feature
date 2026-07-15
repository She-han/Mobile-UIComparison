Feature: Reprint VAT Invoice - Lithuania
    
  @PT-15089 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @VatInvoice @ReprintReceipt @DuplicateLable @ManualVerification
  Scenario: Lithuania - Verify reprinted VAT invoice is printing with the Duplicate label
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    And user presses "Request Simple Fiscal Invoice" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown   
    And user presses "OK" button and "Capture Customer Name Contact" page shown  
    When user enters "${Customer 3 Name}" into "Customer Loyalty Details Forname" field
    And user enters "${Customer 3 Surname}" into "Customer Loyalty Details Surname" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user enters "${Customer 3 Address}" into "Customer Address Line1 Text" field
    And user enters "${Customer 3 Address Postcode}" into "Customer Postcode" field
    And user presses "OK" button and "Lithuania Confirm Customer Details" page shown
    And user presses "Confirm" button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And "Transaction Basket" page is shown
    And user presses "Receipts" button and "Transaction Basket" page shown
    And user presses "Reprint Recent" button and "Reprint Recent  Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And user presses "Print" button 
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown