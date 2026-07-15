Feature: Terminal Income

  @PT-144 @TerminalCashManagement @Dune @Harrods @MVP @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest @POSSet1
  Scenario: Terminal Cash Management - Income
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen Income Button" icon button
    Then "Cash Management Select Income Reason" page is shown
    When user selects "Store Income" from "Selection List" list
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button
    And user selects "2 Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user selects "5 Pence" from "Selection List" list
    And user enters "15.00" into "Input Box" field
    And user presses "OK" button
    And user selects "10 Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user selects "20 Pence" from "Selection List" list
    And user enters "20.00" into "Input Box" field
    And user presses "OK" button
    And user selects "1 Pound" from "Selection List" list
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button
    And user selects "2 Pounds" from "Selection List" list
    And user enters "30.00" into "Input Box" field
    And user presses "OK" button
    And user selects "5 Pounds" from "Selection List" list
    And user enters "50.00" into "Input Box" field
    When user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Notes" button
    And "Cash Management Enter Notes" page is shown
    And user enters "Terminal Income Note" into "Cash Management Text Area" field
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    #Minimum Captured Documents set to zero. Hence Attach Documents screen not displayed.
    And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown 
    And receipt display with following details
      | text | Terminal Income              |
      | item | Terminal,${Terminal Number}  |
      | text | Reason: Store Income Cash UK |
      | item | Cash UK,£185.00              |
      | item | Pence,£25.00                 |
      | item | 2 Pence,£10.00               |
      | item | 5 Pence,£15.00               |
      | item | 10 Pence,£10.00              |
      | item | 20 Pence,£20.00              |
      | item | 1 Pound,£25.00               |
      | item | 2 Pounds,£30.00              |
      | item | 5 Pounds,£50.00              |
      | text | Terminal Income Note         |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
