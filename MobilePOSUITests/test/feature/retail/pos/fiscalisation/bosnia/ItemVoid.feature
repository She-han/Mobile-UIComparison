Feature: Void an item on the Bosnia fiscal POS

  @PT-1008 @Fiscalisation @Bosnia @FiscalBosniaItemVoid @No_Printer @AUTOMATED
  Scenario: Void an item on the Bosnia fiscal POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user enters "${Product Fiscal Ba 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Ba 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal BA 4}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product Fiscal Ba 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
