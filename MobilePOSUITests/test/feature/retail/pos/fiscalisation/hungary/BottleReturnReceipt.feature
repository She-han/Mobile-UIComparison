Feature: Bottle Return Receipt

  @PT-2101 @HungaryFiscalBottleReturn @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Verify Bottle Return Receipts on Hungary Fiscal Printer
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary VAT Rates Sync in Progress" page is shown
    And "Fiscal Hungary VAT Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Bottle Return Management" button and "Return Product" page shown
    And user presses "Bottle Return" button and "Concession Product List Screen" page shown
    And user presses "Select" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
