Feature: Training Mode Transaction Log In and Log Out

  @PT-17403 @PT-17402 @Fiscalisation @France @FiscalFranceTrainingMode @No_Printer @AUTOMATED
  Scenario: Training Mode Transaction Log In and Log Out
    Given user signs on as "France Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${France Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${France Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${France Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${France Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown