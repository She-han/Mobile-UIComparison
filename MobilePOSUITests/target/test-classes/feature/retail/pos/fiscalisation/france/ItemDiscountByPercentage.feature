Feature: Normal multiple item sale with an Item Discount

  @PT-17363 @Fiscalisation @France @FiscalFranceMultipleItemSaleWithPercentageDiscount @No_Printer @AUTOMATED
  Scenario: Normal multiple item sale with an Item Discount
    Given user signs on as "France Fiscal Sales Assistant"
    When user enters "${Product Fiscal Fr 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Fr 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% Item Discount (%)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "10% Item Discount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown
