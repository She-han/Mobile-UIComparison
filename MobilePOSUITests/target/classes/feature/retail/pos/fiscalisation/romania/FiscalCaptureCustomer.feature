Feature: Fiscal Capture Customer

  @PT-959 @RomaniaFiscalCaptureCustomer @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Capture Fiscal Customer on Romania POS
    Given user signs on as "Romania Fiscal Sales Assistant"
    When user presses "Sales" button
    When user presses "Receipts" button
    And user presses "Fiscal Receipt" button
    And user presses "Fiscal Capture Customer" button and "Romania Prompt State" page shown
    And user selects "Retail" from "Selection List" list
    And user presses "OK" button and "Romania Enter Customer Number" page shown
    And user enters "${Customer 1 ID}" into "Input Box" field
    And user presses "Search" button and "Romania Confirm Customer Details" page shown
    And user enters "RO10" into "Romania Customer Tax ID" field
    And user presses "Confirm" button and "Transaction Basket" page shown
    And "${Customer 1 Full Name}" is displayed in "Receipt" list
    And user enters "${Product Fiscal RO 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
