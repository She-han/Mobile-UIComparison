Feature: Print Simplified VAT Invoice with Cash Payments - Lithuania
    
  @PT-15091 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @CashPayment @VATInvoice @ManualVerification
  Scenario: Lithuania - Verify simplified VAT invoice is containing all the information related to the sale done with the cash payments
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
    And user presses "SignOff" button