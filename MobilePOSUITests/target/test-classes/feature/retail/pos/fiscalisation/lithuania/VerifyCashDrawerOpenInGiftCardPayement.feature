Feature: Verify Cash Drawer Open In Gift Card Payments - Lithuania
    
  @PT-15064 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @GiftCard @CashDrawer @ManualVerification
  Scenario: Lithuania - Verify cash drawer is opening when do the sale with the gift card payment
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift card number" page shown
    And user enters "${Lithuania Test Gift Card Number}" into "Input Box" field    
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown