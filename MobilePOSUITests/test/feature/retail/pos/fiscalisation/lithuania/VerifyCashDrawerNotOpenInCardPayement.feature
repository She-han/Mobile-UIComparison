Feature: Verify Cash Drawer Not Open In Card Payments - Lithuania
    
  @PT-15065 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @Card @CashDrawer @ManualVerification
  Scenario: Lithuania - Verify cash drawer is NOT opening when do the sale with the card payment
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