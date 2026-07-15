Feature: Terminal Cash Management - Uncounted Pickup

  @PT-138 @PreSales @AUTOMATED @POS @MVP @Support @ManualVerification @TerminalCashManagement @POSValidatedTest @POSSet1
  Scenario: Terminal Cash Management - Terminal Uncounted Pickup
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    When user presses "Terminal Cash Management Screen Uncounted Pickup Button" icon button
    And "Uncounted Pickup" page is shown
    And user enters "10" into "Input Box" field
    And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And "Cash Management Enter Notes" page is shown
    And user enters "Uncounted Pickup Note" into "Cash Management Text Area" field
    When user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal cash Management" page is shown
    Then receipt display with following details
      | text | Terminal Uncounted Pickup      |
      | item | Terminal,${Terminal Number}    |
      | text | Seal Number 10                 |
      | text | Uncounted Pickup Note          |
      | text | ${Manager 2 Username}          |
    And user presses "Safe Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
