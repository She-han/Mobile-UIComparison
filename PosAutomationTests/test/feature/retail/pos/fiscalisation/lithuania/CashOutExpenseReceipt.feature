Feature: Print Fiscal Expense Receipt - Lithuania
    
  @PT-15084 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @CashDrawer @CashOut @ExpenseReceipt @ManualVerification
  Scenario: Lithuania - Verify cash drawer is opening when doing cash out - expense and print the expense receipt
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen Expense Button" icon button
    Then "Select Terminal Prompt" page is shown
    When user selects "POS 1 @ Enactor (Lithuania)" from "Selection List" list
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash LT" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Enter Tender Amount" page is shown
    And user enters "${Lithuania Cash Management Tender Amount}" into "Input Box" field
    And user presses "OK" button
    Then "Terminal Cash Management Select Tender" page is shown
    And user presses "Complete" button
    And "Lithuania Cash Management Terminal Ok" page is shown
    And user presses "OK" button 
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Enter User" page is shown