Feature: Item Sale with Discounts on Serbia fiscal printer

  @PT-1529 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Complete transaction with item discounts by percentage on Serbia fiscal printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 2}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 4}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button and "Transaction Basket" page shown
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% Item discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "10% Item Discount 10%" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    
  @PT-1517  @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Complete transaction with item discounts by amount on Serbia fiscal printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 2}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 4}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button and "Transaction Basket" page shown
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "din 500 discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "din 500 discount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
   