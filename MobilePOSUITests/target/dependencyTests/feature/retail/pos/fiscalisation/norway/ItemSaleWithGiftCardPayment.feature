Feature: Sale using gift card payment

  @PT-2494 @Fiscalisation @Norway @FiscalNorwaySaleWithCardPayment @No_Printer @AUTOMATED
  Scenario: Sale of an item using gift card payment
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user enters "${Product Fiscal No 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift card number" page shown
    And user enters "00001111" into "Input Box" field    
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown