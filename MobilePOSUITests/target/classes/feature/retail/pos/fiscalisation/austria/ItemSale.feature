Feature: Sale with one item with and without tax

  @PT-634 @Single_Item_Sale_No_Tax @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Sale with one item without tax
    Given user signs on as "Austria Fiscal Sales Assistant"
    When user enters "${PRODUCT_1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-639 @Single_Item_Sale_With_Tax @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Sale an item with tax
    Given user signs on as "Austria Fiscal Sales Assistant"
    When user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
