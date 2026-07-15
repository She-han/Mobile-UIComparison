Feature: Print Fiscal Receipt with Transaction Void - Lithuania
    
  @PT-14898 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @VoidReceipt @VoidTransaction @ManualVerification
  Scenario: Lithuania - Verify that the void receipt prints the voided transaction in the basket and includes other details related to the void
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal LT 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button