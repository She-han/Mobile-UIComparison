Feature: Terminal Opening Float

  @PT-586 @PreSales @Regression @MVP_DE @Support @AUTOMATED @ManualVerification @POS @Automation_E2E @POSValidatedTest @POSSet1
  Scenario: Terminal Cash Management - Opening Float
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    When user presses "Terminal Cash Management Screen Opening Float Button" icon button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Notes" button
    And "Cash Management Enter Notes" page is shown
    And user enters "Terminal Opening Float Note" into "Cash Management Text Area" field
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown 
    Then receipt display with following details
      | text | Terminal Opening Float      |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,£10.00              |
      | item | Pence,£10.00                |
      | text | Terminal Opening Float Note |
      | text | ${Manager 2 Username}       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
