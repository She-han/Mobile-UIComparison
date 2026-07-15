Feature: Item Void from a multiple item sale

  @PT-17367 @Fiscalisation @France @FiscalFranceItemVoid @No_Printer @AUTOMATED
  Scenario: Item Void from a multiple item sale
    Given user signs on as "France Fiscal Sales Assistant"
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
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown