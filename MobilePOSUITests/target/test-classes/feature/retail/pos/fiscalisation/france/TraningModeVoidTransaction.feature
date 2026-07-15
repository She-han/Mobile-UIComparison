Feature: Transaction void in training mode

  @PT-17389 @Fiscalisation @France @FiscalFranceTrainingMode @No_Printer @AUTOMATED
  Scenario: Transaction void in training mode
    Given user signs on as "France Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${France Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${France Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user enters "${Product Fiscal Fr 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal Fr 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
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