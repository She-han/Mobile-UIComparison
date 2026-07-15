Feature: Item Sale with Discounts

  @PT-10778 @TurkeyFiscalItemDiscountPercentage @AUTOMATED @Turkey @Fiscalisation @ManualVerification
  Scenario: Verify Item discount by percentage receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal TR 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "10% Item Discount (%)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "10% Item Discount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10612 @Fiscalisation @Turkey @TurkeyFiscalItemDiscountByAmount @AUTOMATED @ManualVerification
  Scenario: Verify Item discount by amount receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal TR 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown