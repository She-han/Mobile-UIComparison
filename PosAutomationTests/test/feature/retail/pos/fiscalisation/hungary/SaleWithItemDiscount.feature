Feature: Item Sale with Discounts

  @PT-1715 @HungaryFiscalItemDiscountAmount @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Complete transaction with item discounts by Amount
    Given user signs on as "Hungary Fiscal Sales Assistant"
    And user enters "${Product Fiscal HU 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal HU 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Item Discount(Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Item Discount(Amount)" is displayed in "Receipt" list
    And "-HUF5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1716 @HungaryFiscalItemDiscountPercentage @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Complete transaction with item discounts by Percentage
    Given user signs on as "Hungary Fiscal Sales Assistant"
    And user enters "${Product Fiscal HU 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal HU 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal HU 4}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "10% Item Discount (%)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "10% Item Discount (%) 10%" is displayed in "Receipt" list
    And "-HUF1.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
