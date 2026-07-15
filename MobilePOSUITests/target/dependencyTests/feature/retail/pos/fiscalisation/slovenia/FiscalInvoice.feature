Feature: Fiscal Invoice on Slovenia Fiscal POS

  @PT-2776 @Fiscalisation @Slovenia @FiscalSloveniaFiscalInvoice @AUTOMATED
  Scenario: Verify Fiscal Invoice on Slovenia Fiscal POS
    Given user signs on as "Slovenia Fiscal Sales Assistant"
    And user enters "${Product Fiscal SI 1}" into "Input Box" field
    When user presses "ENT" button
    When user presses "Sales" button
    When user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    When user presses "Request Simple Fiscal Invoice" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Prompt State" page shown
    And user selects "Retail" from "Selection List" list
    And user presses "OK" button and "Enter Customer Number" page shown
    And user enters "${Customer 1 ID}" into "Input Box" field
    And user presses "Search" button and "Confirm Customer Details" page shown
    And user enters "22" into "Slovenia Customer Tax ID" field
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
