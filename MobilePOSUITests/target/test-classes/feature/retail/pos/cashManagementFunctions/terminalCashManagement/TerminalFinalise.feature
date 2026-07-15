Feature: Terminal Cash Management - Terminal Finalise

  @PT-152 @AUTOMATED @POS @MVP @Support @ManualVerification @TerminalCashManagement @POSValidatedTest @POSSet1
  Scenario: Terminal Cash Management - Terminal Finalise
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    #Cashup the Closed Session from PT-149
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And "Terminal Cash Management Select Tender" page is shown
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Confirm" button and "Cash Management Select Tender Reason" page shown    
    And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown    
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Terminal Cash Management" page is shown
    #Finalise the CashedUp session
    And user presses "Terminal Cash Management Screen Finalise Button" icon button
    And "Terminal Cash Management Finalise Confirm" page is shown
    And user presses "Notes" button and "Enter Notes" page shown
    And user enters "This is a Terminal finalise" into "Cash Management Text Area" field
    And user presses "OK" button and "Terminal Cash Management Finalise Confirm" page shown
    And user presses "Notes" button and "Enter Notes" page shown
    And "Cash Management Text Area" field displays the text "This is a Terminal finalise"
    And user presses "OK" button and "Terminal Cash Management Finalise Confirm" page shown
		And user presses "Yes" button and "Cash Management Add Notes" page shown
    And user presses "OK" button and "Terminal Cash Management" page shown	
        Then receipt display with following details
      | text | Terminal Finalise                   |
      | item | Terminal,${Terminal Number} Cash UK |
      | text | Expected                            |
      | text | Discrepancy                         |
      | text | This is a Terminal finalise         |
      | text | ${Manager 2 Username}               |
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
