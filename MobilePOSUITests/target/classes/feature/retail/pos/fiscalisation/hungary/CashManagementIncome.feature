Feature: Cash Management - Income

  @PT-1729 @HungaryFiscalIncome @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Verify the Fiscal Receipt for Cash Management Income on Hungary Fiscal Printer
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary VAT Rates Sync in Progress" page is shown
    And "Fiscal Hungary VAT Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    When user presses "Management" button
    When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Income" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash HU" from "Selection List" list
    And user enters "100.00" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    When user presses "Back" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
