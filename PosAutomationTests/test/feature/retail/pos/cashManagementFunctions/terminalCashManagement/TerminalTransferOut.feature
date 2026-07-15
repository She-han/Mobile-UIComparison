Feature: Terminal Transfer Out

  @PT-155 @PreSales @TerminalCashManagement @MVP @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest @POSSet1
  Scenario: Cash Management - Terminal Transfer Out
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Transfer Out Button" icon button
    And "Cash Management Transfer Out Select Terminal Or Ledger" page is shown
    And user presses "Location" button and "Cash Management Select Location" page shown
    And user selects "estatemanager" from "Selection List" list
    And user presses "OK" button and "Cash Management Select Transfer In Reason" page shown
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    When user selects "Pence" from "Selection List" list
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button
    And user selects "2 Pence" from "Selection List" list
    And user enters "30.00" into "Input Box" field
    And user presses "OK" button
    And user selects "5 Pence" from "Selection List" list
    And user enters "15.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Notes" button
    And "Cash Management Enter Notes" page is shown
    And user enters "Transfer Out note" into "Cash Management Text Area" field
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    #This step may according according to amount of cash
    And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    #And user presses "Complete" button and "Cash Management Confirm Tender" page shown
    #And user presses "Confirm" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And receipt display with following details
      | text | Terminal Transfer Out               |
      | text | Destination Location: estatemanager |
      | item | Cash UK,£70.00                      |
      | item | Pence,£25.00                        |
      | item | 2 Pence,£30.00                      |
      | item | 5 Pence,£15.00                      |
      | text | Transfer Out note                   |
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
