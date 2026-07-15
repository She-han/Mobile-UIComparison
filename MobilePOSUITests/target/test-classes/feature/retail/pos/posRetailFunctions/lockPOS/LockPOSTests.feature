Feature: Lock Pos

  @PT-1116 @JYSK @AUTOMATED
  Scenario: Non-manager user attempts to sign on to a different users session
    Given user signs on as "Pos Operator 5"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Opening Float Button" button
    And "Terminal Cash Management Opening Float" page is shown
    And user presses "Loose" button and ""Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Back" button and "Terminal Cash Management Opening Float" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | Terminal Opening Float |
      | item | Cash UK,£10.00         |
      | text | ${Pos Operator 5}      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    Given user signs on as "Sales Assistant"
    And "Pos Lock Unsuccessful Log In" page is shown
    And user presses "Cancel" button
    And "Enter User" page is shown

  @PT-1118 @JYSK @AUTOMATED
  Scenario: New user signs on after session closed
    Given user signs on as "Pos Operator 5"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Opening Float Button" button
    And "Terminal Cash Management Opening Float" page is shown
    And user presses "Loose" button and ""Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Back" button and "Terminal Cash Management Opening Float" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | Terminal Opening Float |
      | item | Cash UK,£10.00         |
      | text | ${Pos Operator 5}      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    Given user signs on as "Pos Operator 4"
    And "Pos Lock Unsuccessful Log In" page is shown
    And user presses "Continue" button and "Pos Lock Non Sale" page shown
    And user presses "Unlock POS" button and "Pos Lock Loging Access" page shown
    And user presses "Continue" button and "Pos Unlock" page shown
    And user presses "OK" button and "Enter User" page shown

  @PT-1115 @JYSK @ManualVerification @AUTOMATED
  Scenario: Safe POS - Single user completes session
    Given user signs on as "Pos Operator 5"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And "Cash Management Terminal Cash Up Empty Select Tender" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    When user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Cash Management Terminal Cash Up Empty Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | item | Total,£10.00                  |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Opening Float Button" icon button
    And "Terminal Cash Management Opening Float" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Opening Float" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Opening Float      |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,£10.00              |
      | text | ${Pos Operator 5}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    Given user signs on as "Pos Operator 5"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Cashup And Closing Float Button" icon button
    And "Terminal Cash Management Cashup Closing Float" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    When user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Cashup Closing Float" page shown
    And user presses "Complete" button
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK                       |
      | item | Expected                      |
      | item | Discrepancy                   |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1121 @JYSK @ManualVerification @AUTOMATED
  Scenario: Safe POS - Single user completes session with banking
    Given user signs on as "Pos Operator 5"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And "Cash Management Terminal Cash Up Empty Select Tender" page is shown
    When user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Cash Management Terminal Cash Up Empty Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | item | Total,£10.00                  |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Opening Float Button" icon button
    And "Terminal Cash Management Opening Float" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Opening Float" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Opening Float        |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    Given user signs on as "Pos Operator 5"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Cashup And Closing Float Button" icon button
    And "Terminal Cash Management Cashup Closing Float" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    When user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Cashup Closing Float" page shown
    And user presses "Complete" button
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | text | Cash UK                       |
      | text | Expected                      |
      | text | Discrepancy                   |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Management" button
    When user presses "Safe Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Safe Cash Management Screen Banking Button" icon button
    And "Safe Cash Management Enter Banking Slip" page is shown
    And user enters "123" into "Input Box" field
    And user presses "OK" button and "Safe Cash Management Enter Bag Reference" page shown
    And user enters "123" into "Input Box" field
    And user presses "OK" button and "Safe Cash Management Banking Tender Option" page shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Back" button and "Safe Cash Management Banking Tender Option" page shown
    And user presses "Complete" button
    Then receipt display with following details
      | text | Safe Banking                  |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | text | ${Pos Operator 5}             |
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1290 @JYSK @Regression @AUTOMATED
  Scenario: Safe POS - Unlocking the POS returns the User to the Sign on Screen
    Given user signs on as "Pos Operator 5"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And "Cash Management Terminal Cash Up Empty Select Tender" page is shown
    When user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Cash Management Terminal Cash Up Empty Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | item | Total,£10.00                  |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Opening Float Button" icon button
    And "Terminal Cash Management Opening Float" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Opening Float" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Opening Float        |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    Given user signs on as "Pos Operator 5"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Cashup And Closing Float Button" icon button
    And "Terminal Cash Management Cashup Closing Float" page is shown
    When user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Cashup Closing Float" page shown
    And user presses "Complete" button
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK                       |
      | item | Expected                      |
      | item | Discrepancy                   |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Unlock POS" button and "Pos Unlock" page shown
    And user presses "OK" button
    And "Enter User" page is shown

  @PT-1309 @JYSK @Regression @AUTOMATED
  Scenario: Safe POS - UNLOCK POS button only visible when basket is empty
    Given user signs on as "Pos Operator 5"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And button with label "Unlock POS" is not displayed
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Unlock POS" button and "Pos Unlock" page shown
    And user presses "OK" button
    And "Enter User" page is shown

  @PT-1289 @AUTOMATED
  Scenario: User is automatically signed out, till continues to be locked to User
    Given user signs on as "Pos Operator 5"
    And user waits "30" seconds
    And "Enter User" page is shown
    Given user signs on as "Manager 2"
    And "Pos Lock Unsuccessful Log In" page is shown
    And user presses "Cancel" button and "Enter User" page shown
    Given user signs on as "Pos Operator 5"
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1117 @JYSK @AUTOMATED
  Scenario: Manager signs on to a different users session
    Given user signs on as "Pos Operator 5"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And "Cash Management Terminal Cash Up Empty Select Tender" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    When user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Cash Management Terminal Cash Up Empty Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | item | Total,£10.00                  |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Opening Float Button" icon button
    And "Terminal Cash Management Opening Float" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Opening Float" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Opening Float      |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,£10.00              |
      | text | ${Pos Operator 5}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    #Login as PO3 to unlock the POS
    Given user signs on as "Pos Operator 3"
    And "Pos Lock Unsuccessful Log In" page is shown
    And user presses "Continue" button and "Pos Lock Non Sale" page shown
    And user presses "Unlock POS" button and "Pos Lock Log In Access" page shown
    And user presses "Continue" button and "Pos Unlock" page shown
    And user presses "OK" button and "Enter User" page shown
    Given user signs on as "Manager 2"
    And user presses "SignOff" button
    And "Enter User" page is shown
    Given user signs on as "Pos Operator 5"
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1119 @JYSK @AUTOMATED
  Scenario: Manager signs onto a different users session and performs transactions
    Given user signs on as "Pos Operator 5"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And "Cash Management Terminal Cash Up Empty Select Tender" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    When user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Cash Management Terminal Cash Up Empty Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | item | Total,£10.00                  |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Opening Float Button" icon button
    And "Terminal Cash Management Opening Float" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Opening Float" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Opening Float      |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,£10.00              |
      | text | ${Pos Operator 5}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    #Login as PO3 to unlock the POS
    Given user signs on as "Pos Operator 3"
    And "Pos Lock Unsuccessful Log In" page is shown
    And user presses "Continue" button and "Pos Lock Non Sale" page shown
    And user presses "Unlock POS" button and "Pos Lock Log In Access" page shown
    And user presses "Continue" button and "Pos Unlock" page shown
    And user presses "OK" button and "Enter User" page shown
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    Given user signs on as "Pos Operator 5"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Cashup And Closing Float Button" icon button
    And "Terminal Cash Management Cashup Closing Float" page is shown
    When user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Cashup Closing Float" page shown
    And user presses "Complete" button
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK                       |
      | item | Expected                      |
      | item | Discrepancy                   |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Unlock POS" button and "Pos Unlock" page shown
    And user presses "OK" button
    And "Enter User" page is shown

  @PT-1120 @JYSK @AUTOMATED
  Scenario: Manager signs onto a different users session and completes a cash pickup
    Given user signs on as "Pos Operator 5"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Cash Management Cash Up And Empty Button" icon button
    And "Cash Management Terminal Cash Up Empty Select Tender" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    When user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Cash Management Terminal Cash Up Empty Select Tender" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | item | Total,£10.00                  |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Opening Float Button" icon button
    And "Terminal Cash Management Opening Float" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Opening Float" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Opening Float      |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,£10.00              |
      | text | ${Pos Operator 5}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    #Login as PO3 to unlock the POS
    Given user signs on as "Pos Operator 3"
    And "Pos Lock Unsuccessful Log In" page is shown
    And user presses "Continue" button and "Pos Lock Non Sale" page shown
    And user presses "Unlock POS" button and "Pos Lock Log In Access" page shown
    And user presses "Continue" button and "Pos Unlock" page shown
    And user presses "OK" button and "Enter User" page shown
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" button
    And user presses "Terminal Cash Management Button" button
    And user presses "Terminal Cash Management Screen Pickup Button" button
    And "Terminal Cash Management Select Tender Option" page is shown
    And user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cask UK" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Back" button and "Cash Management Confirm Tender" page shown
    And user presses "Confirm" button and "Terminal Cash Management Select Tender Option" page shown
    And user presses "Complete" button and "Await Drawer Closed" page shown
      | text | Terminal Pickup               |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK,£10.00                |
      | text | ${Manager 2}                  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Home Button" button and "Transaction Basket" page shown
    Given user signs on as "Pos Operator 5"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Cashup And Closing Float Button" icon button
    And "Terminal Cash Management Cashup Closing Float" page is shown
    When user presses "Loose" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Back" button and "Terminal Cash Management Cashup Closing Float" page shown
    And user presses "Complete" button
    And user presses "Complete" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Terminal Cashup and Empty     |
      | item | Terminal,${Terminal Number 1} |
      | item | Cash UK                       |
      | item | Expected                      |
      | item | Discrepancy                   |
      | text | ${Pos Operator 5}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1390 @JYSK @Regression @AUTOMATED
  Scenario: LOCK POS - Can unlock own user
    Given user signs on as "Pos Operator 5"
    And user presses "SignOff" button
    And "Enter User" page is shown
    And "Locked By User PO5" is displayed in "Log In" panel
    Given user signs on as "Pos Operator 5"
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Unlock POS" button
    And "Pos Unlock Success" page is shown
    And user presses "OK" button and "Enter User" page shown

  @PT-1389 @JYSK @2.6Regression @AUTOMATED
  Scenario: LOCK POS - With the relevant privileges assigned the POS User is locked
    Given user signs on as "Pos Operator 5"
    And user presses "SignOff" button
    And "Enter User" page is shown
    And "Locked By User PO5" is displayed in "Log In" panel

  @PT-1392 @JYSK @Regression @AUTOMATED
  Scenario: LOCK POS - POS remains logged on without Auto sign out privilege set
    Given user signs on as "Pos Operator 6"
    And user presses "SignOff" button
    And "Enter User" page is shown
    And "Locked By User PO6" is displayed in "Log In" panel
    Given user signs on as "Pos Operator 6"
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Unlock POS" button
    And "Pos Unlock Success" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1668 @JYSK @Regression @AUTOMATED
  Scenario: Verify POS unlocks when the Unlock privileges have been set on the other user
    Given user signs on as "Pos Operator 5"
    And user presses "SignOff" button
    And "Enter User" page is shown
    And "Locked By User PO5" is displayed in "Log In" panel
    And user enters "${Assistant Manager 2 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Assistant Manager 2 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Locked By Other User" page is shown
    And user waits "Message Prompt OK Button" to display
    And user presses "Continue" button and "Pos Lock Non Sale" page shown
    And user waits "Non Sale Menu Unlock Pos Button" to display
    And user waits "Non Sale Menu Sign Off Button" to display
    And user presses "Unlock POS" button and "Pos Unlock Popup" page shown
    And user presses "Continue" button and "Pos Unlock Success" page shown
    And user presses "OK" button and "Enter User" page shown

  @PT-1669 @JYSK @Regression @AUTOMATED
  Scenario: Verify Cancel Unlock POS Operation by Other user
    Given user signs on as "Pos Operator 5"
    And user presses "SignOff" button
    And "Enter User" page is shown
    And "Locked By User PO5" is displayed in "Log In" panel
    And user enters "${Assistant Manager 2 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Assistant Manager 2 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Locked By Other User" page is shown
    And user waits "Message Prompt OK Button" to display
    And user presses "Continue" button and "Pos Lock Non Sale" page shown
    And user waits "Non Sale Menu Unlock Pos Button" to display
    And user waits "Non Sale Menu Sign Off Button" to display
    And user presses "Unlock POS" button and "Pos Unlock Popup" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And "Pos Lock Non Sale" page is shown
    And user presses "Sign Off" button
    And "Enter User" page is shown

  @PT-1670 @JYSK @Regression @AUTOMATED
  Scenario: Verify Cancel the Unlock POS Operation for user after log on to a lock POS
    Given user signs on as "Pos Operator 5"
    And user presses "SignOff" button
    And "Enter User" page is shown
    And "Locked By User PO5" is displayed in "Log In" panel
    And user enters "${Assistant Manager 2 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Assistant Manager 2 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Locked By Other User" page is shown
    And user waits "Message Prompt OK Button" to display
    And user presses "Cancel" button and "Enter User" page shown

  @PT-1671 @JYSK @Regression @AUTOMATED
  Scenario: Verify POS does not unlock when the unlock privileges have been set on the user
    Given user signs on as "Pos Operator 5"
    And user presses "SignOff" button
    And "Enter User" page is shown
    And "Locked By User PO5" is displayed in "Log In" panel
    And user enters "${Manager 4 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Manager 4 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Locked By Other User" page is shown
    And user waits "Message Prompt OK Button" to display
    And user presses "Continue" button and "Pos Lock Non Sale" page shown
    And user waits "Non Sale Menu Unlock Pos Button" to display
    And user waits "Non Sale Menu Sign Off Button" to display
    And user presses "Unlock POS" button and "This Function Not Allowed" page shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And "Pos Lock Non Sale" page is shown
    And user presses "Sign Off" button
    And "Enter User" page is shown

  @PT-18740 @AUTOMATED
  Scenario: Trying to unlock the pos by a person who does not have the privileges
    Given user signs on as "Pos Operator 5"
    And user presses "SignOff" button
    And "Enter User" page is shown
    And "Locked By User PO5" is displayed in "Log In" panel
    And user enters "${Manager 4 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Manager 4 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Pos Locked And Not Authorized" page is shown
    And user presses "Cancel" button
    And "Enter User" page is shown
    Given user signs on as "Pos Operator 5"
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Unlock POS" button
    And "Pos Unlock Success" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
