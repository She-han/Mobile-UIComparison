Feature: Print Simplified VAT Invoice with Card Payments - Lithuania
    
  @PT-15092 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @CardPayment @VATInvoice @ManualVerification
  Scenario: Lithuania - Verify simplified VAT invoice is containing all the information related to the sale done with the card payments
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    And user presses "Request Simple Fiscal Invoice" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Card Tender Amount" page is shown
    And user presses "OK" button
    And "ICCReader" page is shown
    And user presses "E" button and "Capture Customer Name Contact" page shown  
    When user enters "${Customer 3 Name}" into "Customer Loyalty Details Forname" field
    And user enters "${Customer 3 Surname}" into "Customer Loyalty Details Surname" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user enters "${Customer 3 Address}" into "Customer Address Line1 Text" field
    And user enters "${Customer 3 Address Postcode}" into "Customer Postcode" field
    And user presses "OK" button and "Lithuania Confirm Customer Details" page shown
    And user presses "Confirm" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button