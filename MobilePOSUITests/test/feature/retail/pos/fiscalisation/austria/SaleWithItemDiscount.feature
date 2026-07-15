Feature: Sales with Item Dicount

  @PT-646 @Item_Discount_By_Amount @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Add Item discount by Amount and complete transaction
    Given user signs on as "Austria Fiscal Sales Assistant"
    When user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${PRODUCT_FISCAL_AUS_2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${PRODUCT_FISCAL_AUS_3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${PRODUCT_FISCAL_AUS_1_DESCRIPTION}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    When user enters "€5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (Amount)" is displayed in "Receipt" list
    And "-€5.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1296 @Item_Discount_By_Percentage @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Add Item discount by Percentage and complete transaction
    Given user signs on as "Austria Fiscal Sales Assistant"
    When user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${PRODUCT_FISCAL_AUS_2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${PRODUCT_FISCAL_AUS_3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${PRODUCT_FISCAL_AUS_1_DESCRIPTION}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Discount" button and "Select Reason" page shown
    And user selects "20% Item Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item Discount 20%" is displayed in "Receipt" list
    And "-€2.00" is displayed in "Receipt" list
    When user selects "${PRODUCT_FISCAL_AUS_3_DESCRIPTION}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    When user enters "10" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 10%" is displayed in "Receipt" list
    And "-€0.89" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
