Feature: Training Mode on Turkey Fiscal POS

  @PT-10620 @Fiscalisation @Turkey @FiscalTurkeyTrainingMode @AUTOMATED @ManualVerification
  Scenario: Verify Training receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Turkey Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Turkey Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    And user waits "5" seconds
    Then "Transaction Basket" page is shown
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
