Feature: Item Discount

  @PT-992 @Fiscalisation @Bosnia @No_Printer @AUTOMATED
  Scenario: Complete transaction with item discounts by Percentage on Bosnia Fiscal POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user enters "${PRODUCT_FISCAL_BA_1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${PRODUCT_FISCAL_BA_2}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "10% Item Discount (%)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "10% Item Discount 10%" is displayed in "Receipt" list
    And "-BAM1.20" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1568 @Fiscalisation @Bosnia @No_Printer @AUTOMATED
  Scenario: Complete transaction with item discounts by Amount on Bosnia POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user enters "${PRODUCT_FISCAL_BA_1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${PRODUCT_FISCAL_BA_2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Item Discount (Amount)" is displayed in "Receipt" list
    And "-BAM5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
