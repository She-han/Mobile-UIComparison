Feature: Request Simple Fiscal Invoice

  @PT-958 @RomaniaRequestFiscalInvoice @No_Printer @Romania @Fiscalisation @FiscalRomania @AUTOMATED
  Scenario: Verify Add Item to the Basket and Request Fiscal Invoice
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 1}" into "Input Box" field
    When user presses "ENT" button
    When user presses "Sales" button
    When user presses "Receipts" button
    And user presses "Fiscal Receipt" button
    When user presses "Request Simple Fiscal Invoice" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Romania Prompt State" page shown
    And user selects "Retail" from "Selection List" list
    And user presses "OK" button and "Romania Enter Customer Number" page shown
    And user enters "${Customer 1 ID}" into "Input Box" field
    And user presses "Search" button and "Romania Confirm Customer Details" page shown
    And user enters "RO22" into "Romania Customer TAx ID" field
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
