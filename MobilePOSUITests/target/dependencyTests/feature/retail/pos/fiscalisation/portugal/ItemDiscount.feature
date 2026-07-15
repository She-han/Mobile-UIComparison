@PT-50300 @ItemDiscount @Fiscalisation @Portugal @FiscalPortugalItemSale @AUTOMATED @ManualVerification
Feature: Item Discount on Portugal Fiscal POS

  @PT-5030 @Fiscalisation @Portugal @FiscalPortugalItemSale @AUTOMATED @ManualVerification
  Scenario: Item Discount (Percentage) on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    When user enters "${Product Fiscal PT 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal PT 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% Item Discount" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "10% Item Discount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5029 @Fiscalisation @Portugal @FiscalPortugalItemSale @AUTOMATED @ManualVerification
  Scenario: Complete transaction with item discounts by Amount on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    When user enters "${Product Fiscal PT 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal PT 2}" into "Input Box" field
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
