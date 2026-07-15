Feature: Normal single item sale with an Item Discount

  @PT-17362 @Fiscalisation @France @FiscalFranceSaleWithItemDiscount @No_Printer @AUTOMATED
  @PT-17365 @FiscalFranceSaleWithAmountDiscount 
  Scenario: Normal single item sale with an Item Discount
    Given user signs on as "France Fiscal Sales Assistant"
    And user enters "${Product Fiscal Fr 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Item Discount (Amount)" is displayed in "Receipt" list
    And "Amount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown