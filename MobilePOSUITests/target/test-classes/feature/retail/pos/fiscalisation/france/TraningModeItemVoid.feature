Feature: Item void in training mode

  @PT-17388 @Fiscalisation @France @FiscalFranceTrainingMode @No_Printer @AUTOMATED
  Scenario: Item void in training mode
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
    And user presses "ENT" button
    And user enters "${Product Fiscal Fr 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Fr 3}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product Fiscal Fr 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
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