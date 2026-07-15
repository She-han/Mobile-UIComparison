Feature: Item Sales with Transaction Dicount

  @PT-740 @Transaction_Discount_By_Amount @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Complete transaction with amount discount and print fiscal receipt
    Given user signs on as "Austria Fiscal Sales Assistant"
    Given user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${PRODUCT_FISCAL_AUS_2}" into "Input Box" field
    When user presses "ENT" button
    When user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "Manager Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "€5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Manager Transaction Discount (Amount))" is displayed in "Receipt" list
    And "-€5.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1314 @Transaction_Discount_By_Percentage @No_Printer @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Complete transaction with percentage discount and print fiscal receipt
    Given user signs on as "Austria Fiscal Sales Assistant"
    Given user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${PRODUCT_FISCAL_AUS_3}" into "Input Box" field
    When user presses "ENT" button
    When user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10% Transaction Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (10% Transaction Discount 10%)" is displayed in "Receipt" list
    And "-€1.89" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
