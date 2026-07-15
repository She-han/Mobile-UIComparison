Feature: Terminal Cash Management - Day End Test

  @PT-1624 @CashManagement @MVP @AUTOMATED
  Scenario: Perform Manual Day End followed by Automatic Terminal Cashup and Leave
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Leave     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | text | Expected                      |
      | text | Discrepancy                   |
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Terminal Cash Management button" icon button
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Cashup And Leave Button" icon button
    And "Terminal Cash Management Select Tender" page is shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Leave     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | text | Expected                      |
      | text | Discrepancy                   |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1625 @CashManagement @MVP @AUTOMATED
  Scenario: Perform Manual Day End followed by Automatic Terminal Cashup and Closing Float
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button    
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Closing Float        |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Terminal Cash Management button" icon button
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Cashup And Closing Float Button" icon button
    And "Terminal Cash Management Select Tender" page is shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shownn
    Then receipt display with following details
      | text | Terminal Closing Float        |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1627 @MVP @AUTOMATED
  Scenario: Perform Manual Day End followed by Automatic Terminal Cashup and Empty
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Terminal Cash Management button" icon button
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And "Terminal Cash Management Select Tender" page is shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1628 @CashManagement @MVP @AUTOMATED
  Scenario: Perform Manual Day End followed by Automatic Terminal Closing Float with No Cash
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Closing Float        |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Terminal Cash Management button" icon button
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Cashup And Closing Float Button" icon button
    And "Terminal Cash Management Cashup" page is shown
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
