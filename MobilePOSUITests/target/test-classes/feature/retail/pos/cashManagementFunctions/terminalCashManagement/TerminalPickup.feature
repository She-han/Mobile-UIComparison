Feature: Terminal Pickup

  @PT-142 @PreSales @TerminalCashManagement @Dune @Harrods @MVP @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest @POSSet1
  Scenario: Terminal Cash Management - Pickup
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen Pickup Button" icon button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Notes" button
    And "Cash Management Enter Notes" page is shown
    And user enters "Terminal Pickup Note" into "Cash Management Text Area" field
    When user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown 
    And receipt display with following details
      | text | Terminal Pickup             |
      | item | Terminal,${Terminal Number} |
      | text | Cash UK                     |
      | item | Pence,£10.00                |
      | text | Terminal Pickup Note        |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10310 @Regression @AUTOMATED @POS
  Scenario: Perform a Pickup with denominations - Enter By Quantity
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen Pickup Button" icon button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user presses "Enter By Quantity" button and "Edit Denominations By Quantity" page shown
    And user selects "Pence" from "Selection List" list
    And user enters "1000" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Cash Management Confirm Tender" page shown
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Terminal Pickup             |
      | text | Cash UK                     |
      | item | Pence,£10.00                |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown 