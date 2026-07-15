Feature: Verify Cashier sign off receipt on Slovenia Fiscal POS

  @PT-2781 @SloveniaCashierSignOff @AUTOMATED @Slovenia @Fiscalisation @ManualVerification
  Scenario: Verify Cashier sign off receipt on Slovenia Fiscal POS
    Given user signs on as "Slovenia Fiscal Sales Assistant"
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown