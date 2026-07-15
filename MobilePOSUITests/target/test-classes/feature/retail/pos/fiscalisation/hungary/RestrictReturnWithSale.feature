Feature: Restrict Return an Item with Normal Retail Sale

  @PT-1724 @HungaryRestrictReturnWithSale @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Verify return function is not possible to mix with an item sale on Hungary Fiscal Printer
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary VAT Rates Sync in Progress" page is shown
    And "Fiscal Hungary VAT Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    And user enters "${Product Fiscal HU 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal HU 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty " from "Selection List" list
    And user presses "OK" button and "Hungary Mixing Sale Not Allowed Prompt" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown