Feature: Print Fiscal Receipt with Correct VAT Rate - Lithuania
    
  @PT-14882 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @VATRate @VATID @ManualVerification
  Scenario: Lithuania - Verify sale done with Cash tender is having the correct VAT rate (0%) with the correct VAT ID (D) printed on the receipt 
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 4}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
 
  @PT-14871 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @VATRate @VATID @ManualVerification
  Scenario: Lithuania - Verify sale done with Cash tender is having the correct VAT rate (21%) with the correct VAT ID (A) printed on the receipt 
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    
  @PT-14880 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @VATRate @VATID @Card @ManualVerification
  Scenario: Lithuania - Verify sale done with Card tender is having the correct VAT rate (9%) with the correct VAT ID (C) printed on the receipt
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Card Tender Amount" page is shown
    And user presses "OK" button
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
  
  @PT-14881 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @VATRate @VATID @GiftCard @ManualVerification
  Scenario: Lithuania - Verify sale done with Gift Card tender is having the correct VAT rate (5%) with the correct VAT ID (B) printed on the receipt
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Lithuania Test Gift Card Number}" into "Input Box" field    
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button