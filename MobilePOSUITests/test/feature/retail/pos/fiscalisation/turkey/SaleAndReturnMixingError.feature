Feature: Sale & Return Mixing Error on Turkey Fiscal POS

  @PT-10686 @Fiscalisation @Turkey @FiscalTurkeySaleAndReturnMixingError @AUTOMATED @ManualVerification
  Scenario: Verify that a sale and a return is not allowed in the same transaction
    Given user signs on as "Turkey Fiscal Sales Assistant"
    When user enters "${Product Fiscal TR 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button and "Turkey Mixing Sale And Returns Not Allowed Prompt" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "Voids" button
    And user presses "Void Transaction" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown