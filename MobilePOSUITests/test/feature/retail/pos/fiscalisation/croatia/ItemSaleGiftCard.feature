Feature: Item Sale with Gift Card Tender on Croatia Fiscal POS

  @PT-2262 @AUTOMATED @Croatia @Fiscalisation @ManualVerification
  Scenario: Verify Item Sale with Gift Card Tender on Croatia Fiscal POS
    Given user signs on as "Croatia Fiscal Sales Assistant"
    And user enters "${Product Fiscal HR 1}" into "Input Box" field
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
		