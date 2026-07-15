Feature: Training Mode Transaction on German Fiscal POS

  @PT-2188 @Fiscalisation @Germany @FiscalGermanyTrainingMode @AUTOMATED @ManualVerification
  Scenario: Training Mode Transaction on German Fiscal POS
  	Given user signs on as "Germany Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Germany Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Germany Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user enters "${Product Fiscal DE 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Germany Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Germany Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
