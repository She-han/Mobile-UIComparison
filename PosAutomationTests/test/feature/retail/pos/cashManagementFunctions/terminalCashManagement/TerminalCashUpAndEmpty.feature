Feature: Terminal Cash Management - Cashup and Empty

  @PT-151 @ManualVerification @MVP @Support @POS @AUTOMATED @TerminalCashManagement
  Scenario: Terminal Cash Management - Cashup and Empty
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And user waits "4" seconds
    #And user presses "OK" button on "Terminal Cash Multiple Sessions" page if shown
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "20.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "30.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "40.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "50.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "60.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "70.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "80.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "90.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "100.00" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Confirm" button and "Cash Management Select Tender Reason" page shown
    And user presses "Complete" button 
    And "Cash Management Enter Notes" page is shown
    And user enters "Terminal Cashup and Empty" into "Cash Management Text Area" field   
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
    #Commented due to failing script casued by PLAT-16202
      | text | Terminal Cashup and Empty           |
      | text | Terminal ${Terminal Number}   			 |
      | text | Cash UK 														 |
      | item | Expected                            |
      | item | Discrepancy                         |
      | item | Total                               |
      | text | ${Manager 2 Username}               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    #Reset Steps: Finalise the Terminal Cashed Up session
    And user presses "Terminal Cash Management Screen Finalise Button" icon button
    And user waits "4" seconds
    And "Terminal Cash Management Finalise Confirm" page is shown
    And user presses "Yes" button and "Cash Management Add Notes" page shown
    And user presses "OK" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-19967 @POS @AUTOMATED @TerminalCashManagement
  Scenario: Terminal Cash Management - Cashup and Empty - Verifying the denominator validation popup
    Given user signs on as "Manager 2"
    When user presses "Management" button
    Then user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "20.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "30.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "40.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "0.01" into "Input Box" field
    And user presses "ENT" button
    And "Edit Denomination By Value Invalid Multiple of Unit Error" page is shown
    And user presses "Edit Denomination By Value Invalid Multiple of Unit Error OK" icon button
    And "Cash Management Edit Denomination By Value" page is shown
    And user enters "50.00" into "Input Box" field
    And user presses "ENT" button
    And user presses "Confirm" button and "Cash Management Select Tender Reason" page shown
    And user presses "Notes" button and "Cash Management Add Notes" page shown
    And user enters "Terminal Cashup and Empty" into "Cash Management Text Area" field
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Terminal Cashup and Empty           |
      | text | Terminal ${Terminal Number} Cash UK |
      | item | Expected                            |
      | item | Discrepancy                         |
      | item | Total                               |
      | text | ${Manager 2 Username}               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    #Reset Steps: Finalise the Terminal Cashed Up session
    And user presses "Terminal Cash Management Screen Finalise Button" icon button
    And "Terminal Cash Management Finalise Confirm" page is shown
    And user presses "Yes" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
