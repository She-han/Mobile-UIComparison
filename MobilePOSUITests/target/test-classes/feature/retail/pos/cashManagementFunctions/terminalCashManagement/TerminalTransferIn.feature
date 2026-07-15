Feature: Terminal Transfer In

  @PT-154 @PreSales @TerminalCashManagement @MVP @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest @POSSet1
  Scenario: Cash Management - Terminal Transfer In
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Transfer In Button" icon button
    And "Cash Management Select Terminal Or Ledger" page is shown
    And user presses "Location" button and "Cash Management Select Location" page shown
    And user selects "estatemanager" from "Selection List" list
    And user presses "OK" button and "Cash Management Enter Docket Id" page shown
    And user enters "123" into "Input Box" field
    And user presses "OK" button and "Cash Management Select Transfer In Reason" page shown
    And user selects "Test Transfer In 1" from "Selection List" list
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    And "Cash Management Edit Denomination By Value" page is shown
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
    And user enters "Transfer In note" into "Cash Management Text Area" field
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
		And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown     
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And receipt display with following details
      | text | Terminal Transfer In        |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,£185.00             |
      | item | Pence,£25.00                |
      | item | 2 Pence,£10.00              |
      | item | 5 Pence,£15.00              |
      | item | 10 Pence,£10.00             |
      | item | 20 Pence,£20.00             |
      | item | 1 Pound,£25.00              |
      | item | 2 Pounds,£30.00             |
      | item | 5 Pounds,£50.00             |
      | text | Transfer In note            |
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
