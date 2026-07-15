Feature: Logging in/out from the France Fiscal POS

  @PT-17400 @PT-17401 @Fiscalisation @France @No_Printer @AUTOMATED
  Scenario: Logging in/out from the France Fiscal POS
    Given user signs on as "France Fiscal Sales Assistant"
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown