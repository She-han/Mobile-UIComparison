Feature: Terminal Cash Management - Day Start Test

  @PT-594 @AUTOMATED @POS @ManualVerification @MVP_DE @Support @Harrods_Sanity @Regression @TerminalCashManagement @POSValidatedTest @POSSet1
  Scenario: Terminal Cash Management - Day Start
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    When user presses "Day Start" icon button
    And "Confirm Run Screen" page is shown
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user presses "Complete" button and "Cash Management Add Notes" page shown
    And user enters "Day Start Note" into "Cash Management Note Text" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Day Start Acknowledge Prompt" page is shown
    Then receipt display with following details
      | text | Terminal Opening Float      |
      | item | Terminal,${Terminal Number} |
      | text | Cash UK                     |
      | text | ${Manager 2 Username}       |
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
