Feature: Terminal Expense

  @PT-145 @TerminalCashManagement @Dune @Harrods @MVP @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest @POSSet1
  Scenario: Terminal Cash Management - Expense
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen Expense Button" icon button
    Then "Cash Management Select Expense Reason" page is shown
    When user selects "Store Expence" from "Selection List" list
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    When user presses "Notes" button
    And "Cash Management Enter Notes" page is shown
    And user enters "Terminal Expense Note" into "Cash Management Text Area" field
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    #Minimum Captured Documents set to zero. Hence Attach Documents screen not displayed.
		And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown    
    And receipt display with following details
      | text | Terminal Expense              |
      | item | Terminal,${Terminal Number}   |
      | text | Reason: Store Expence Cash UK |
      | item | Pence,£10.00                  |
      | text | Terminal Expense Note         |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
