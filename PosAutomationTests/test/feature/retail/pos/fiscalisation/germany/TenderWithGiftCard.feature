Feature: Tender with Gift Card on German Fiscal POS

  @PT-2150 @AUTOMATED @Germany @Fiscalisation @FiscalGermany @ManualVerification
  Scenario: Complete transaction and tender with Gift Voucher on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    And user enters "${Product Fiscal DE 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift card number" page shown
    And user enters "9526300601201120127" into "Input Box" field    
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
	And "Enter User" page is shown
    

