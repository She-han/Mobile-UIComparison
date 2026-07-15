Feature: Terminal Spot Check

  @PT-140 @PreSales @TerminalCashManagement @Dune @Harrods @MVP @Mobile @Smoke @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest @POSSet1 @Regression
  Scenario: Terminal Cash Management - Spot Check
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Spot Check Button" icon button
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
    And user enters "Terminal Spot Check Note" into "Cash Management Text Area" field
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user presses "OK" button and "Cash Management Session Summary Prompt" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Terminal Spot Check         |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,£185.00             |
      | text | Expected                    |
      | text | Discrepancy                 |
      | text | Terminal Spot Check Note    |
      | text | ${Manager 2 Username}       |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10460 @AUTOMATED @POS @TerminalCashManagement
  Scenario: Terminal Cash Management - Void a Terminal Spot Check
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Spot Check Button" icon button
    And "Terminal Cash Management Select Tender" page is shown
    When user selects "Cash" from "Selection List" list
    And user enters "200.00" into "Input Box" field
    And user presses "ENT" button
    And user presses "Void" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | VOIDED                      |
      | text | Terminal Spot Check         |
      | item | Terminal,${Terminal Number} |
      | item | Cash,?200.00                |
      | text | Expected                    |
      | text | Discrepancy                 |
      | text | ${Manager 2 Username}       |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
