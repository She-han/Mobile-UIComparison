Feature: Print Fiscal Sale Receipt in Training Mode - Lithuania
    
  @PT-15077 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @TrainingMode @SaleReceipt @ManualVerification
  Scenario: Lithuania - Verify training mode - sale receipt is printing with the Training Mode label
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
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button