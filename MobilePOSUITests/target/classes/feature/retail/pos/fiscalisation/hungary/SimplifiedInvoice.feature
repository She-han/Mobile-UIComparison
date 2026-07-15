Feature: Hungary - Print Simplified Invoice

  @PT-1738 @HungaryFiscalSimplifiedInvoice @No_Printer @Fiscalisation @FiscalHungary @AUTOMATED
  Scenario: Hungary - Print Simplified Invoice on Hungary Fiscal Printer
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    And user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary Vat Rates Sync in Progress" page is shown
    And "Fiscal Hungary Vat Rates Up to Date Prompt" page is shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    And user presses "Request Simple Fiscal Invoice" button 
    And "Transaction Basket" page is shown
    And user enters "${Product Fiscal HU 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown 
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Hungary Prompt State" page shown
    And user selects "Retail" from "Selection List" list
    And user presses "OK" button and "Hungary Enter Customer Number" page shown
    And user enters "${Hungary Customer 1 ID}" into "Input Box" field
    And user presses "Search" button and "Hungary Confirm Customer Details" page shown
    And user enters "1" into "Hungary Customer Tax ID" field
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown