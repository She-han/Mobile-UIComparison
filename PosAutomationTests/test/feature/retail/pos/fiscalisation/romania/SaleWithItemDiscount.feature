Feature: Item Sale with Discounts

  @PT-952 @RomaniaFiscalItemDiscountAmount @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Complete transaction with item discounts by Amount
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 2}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal RO 3}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Discount(Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Item Discount (Amount)" is displayed in "Receipt" list
    And "-RON5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1167 @RomaniaFiscalItemDiscountPercentage @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Complete transaction with item discounts by Percentage
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 2}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal RO 3}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal RO 5}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "10% Item Discount (%)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Given "10% Item Discount (%) 10%" is displayed in "Receipt" list
    And "-RON0.50" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
