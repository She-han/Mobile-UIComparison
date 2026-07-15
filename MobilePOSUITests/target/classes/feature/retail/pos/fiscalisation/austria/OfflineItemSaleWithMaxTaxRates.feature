Feature: Item Sale with Maximum number of Tax rates include in Offline Mode

  @PT-644 @Offline_Item_Sale_Max_Tax_Rates @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Sale with Maximum tax rates in Offline Mode
    Given user signs on as "Austria Fiscal Sales Assistant"
    When the pos blocks connections to "${FISCAL_SIGNATURE_API_URI}"
    Given user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${PRODUCT_FISCAL_AUS_2}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${PRODUCT_FISCAL_AUS_3}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${PRODUCT_FISCAL_AUS_4}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${PRODUCT_FISCAL_AUS_5}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And the pos unblocks connections to "${FISCAL_SIGNATURE_API_URI}"
    When user presses "SignOff" button
    Then "Enter User" page is shown
