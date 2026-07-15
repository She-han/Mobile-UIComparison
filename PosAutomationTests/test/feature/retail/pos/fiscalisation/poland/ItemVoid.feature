Feature: Item Void

  @PT-608 @Fiscalisation @Poland @FiscalPolandItemVoid @No_Printer @AUTOMATED
  Scenario: Item Void
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user enters "${Product Fiscal Pl 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Pl 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Pl 3}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product Fiscal Pl 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
