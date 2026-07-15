Feature: Item and Transaction Void

  @PT-1726 @HungaryFIscalItemVoid @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Verify Item Void
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary VAT Rates Sync in Progress" page is shown
    And "Fiscal Hungary VAT Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    And user enters "${Product Fiscal HU 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal HU 2}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal HU 3}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Item" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1727 @HungaryFIscalTransactionVoid @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Verify Transaction Void
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary VAT Rates Sync in Progress" page is shown
    And "Fiscal Hungary VAT Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    And user enters "${Product Fiscal HU 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal HU 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown