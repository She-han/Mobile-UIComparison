Feature: Print Fiscal Void Receipt in Training Mode - Lithuania
    
  @PT-15079 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @TrainingMode @VoidReceipt @ManualVerification
  Scenario: Lithuania - Verify training mode - void receipt is printing with the Training Mode label
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Lithuania Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Lithuania Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    And user waits "5" seconds
    Then "Transaction Basket" page is shown
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal LT 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    And "Enter User" page is shown