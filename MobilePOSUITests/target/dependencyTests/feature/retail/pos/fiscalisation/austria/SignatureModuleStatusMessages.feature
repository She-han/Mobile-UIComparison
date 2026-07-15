Feature: Signature module offline message

  @PT-645 @Signature_Module_Status_Messages @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Verify Signature module offline message
    Given user signs on as "Austria Fiscal Sales Assistant"
    When the pos blocks connections to "${FISCAL_SIGNATURE_API_URI}"
    When user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    When user presses "ENT" button
    When user enters "${PRODUCT_1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Signature Module Online To Offline Dialog" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When the pos unblocks connections to "${FISCAL_SIGNATURE_API_URI}"
    When user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    When user presses "ENT" button
    When user enters "${PRODUCT_1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Signature Module Offline To Online Dialog" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
