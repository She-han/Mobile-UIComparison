Feature: Verify A4 receipt for Invoices

  @PT-2013 @RomaniaInvoiceA4Receipts @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Verify A4 receipt for invoices on Romania Fiscal Printer
    Given user signs on as "Romania Fiscal Sales Assistant"
    When user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipt" button
    And user presses "Request A4 Invoice" button and "Transaction Basket" page shown
    Then user enters "${Product Fiscal RO 4}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Romania Prompt State" page shown
    And user selects "Retail" from "Selection List" list
    And user presses "OK" button and "Romania Enter Customer Number" page shown
    When user enters "${Customer 1 ID}" into "Input Box" field
    And user presses "Search" button and "Romania Confirm Customer Details" page shown
    And user enters "RO22" into "Romania Customer TAx ID" field
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2027 @RomaniaQuotesA4Receipts @No_Printer @Romania @Fiscalisation @FiscalRomania @AUTOMATED
  Scenario: Verify A4 receipt for Customer Quotes on Romania Fiscal Printer
    Given user signs on as "Romania Fiscal Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Customer Quotes" button
    And user presses "Quote" button and "Enter Quote Reference" page shown
    And user enters "${Fiscal Customer Quote Reference}" into "Input Box" field
    And user presses "OK" button and "Retail Quote Sale" page shown
    And user presses "Sell Item" button
    And user enters "${Product Fiscal RO 4}" into "Input Box" field
    And user presses "Sell Item" button
    And user presses "Complete" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2012 @RomaniaCreditA4Receipts @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Verify A4 receipt for Credit Note on Romania Fiscal Printer
    Given user signs on as "Romania Fiscal Sales Assistant"
    When user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Complete Receipt" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Credit Mems Confirmation" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "${Product Fiscal RO 1 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
