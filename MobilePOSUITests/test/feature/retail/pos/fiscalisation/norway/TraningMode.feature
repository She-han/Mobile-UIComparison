Feature: Training Mode Transaction

  @PT-858 @Fiscalisation @Norway @FiscalNorwayTrainingMode @No_Printer @AUTOMATED
  Scenario: Training Mode Transaction
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Norway Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Norway Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user enters "${Product Fiscal No 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Norway Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Norway Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
