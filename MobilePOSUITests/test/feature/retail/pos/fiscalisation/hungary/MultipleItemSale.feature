Feature: Do a Transaction with Multiple Items

  @PT-1721 @HungaryMultipleItemSale @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Sell item with different taxes in one transaction
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary Vat Rates Sync in Progress" page is shown
    And "Fiscal Hungary Vat Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    And user enters "${Product Fiscal HU 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal HU 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal HU 3}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown