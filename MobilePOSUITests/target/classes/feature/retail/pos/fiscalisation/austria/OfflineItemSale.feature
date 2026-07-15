Feature: Sale an item in offline mode without tax

  @PT-641 @Offline_Item_Sale_With_Tax @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Sale with one item in offline mode without tax
    Given user signs on as "Austria Fiscal Sales Assistant"
    When the pos blocks connections to "${FISCAL_SIGNATURE_API_URI}"
    When user enters "${PRODUCT_1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And the pos unblocks connections to "${FISCAL_SIGNATURE_API_URI}"
    When user presses "SignOff" button
    Then "Enter User" page is shown
