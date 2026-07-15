Feature: Terminal Cash Management - Terminal Finalise

  @PT-658 @AUTOMATED @MVP @ManualVerification
  Scenario: Auto Finalise When Force Cash Declaration Enabled with Cashup and Empty
    # Manual Verification needed to finalise all the existing cashedup sessions
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    When user presses "Terminal Cash Management Screen Finalise Button" icon button
    #And "Terminal Cash Management Finalise" page is shown
    And "Terminal Cash Multiple Sessions" page is shown
    And user presses "OK" button
    And "Terminal Cash Management Finalise Confirm" page is shown
    And user presses "Yes" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Sell Unknown Product" page is shown
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # Wait until the transaction processed and perform the day end
    And user waits "90" seconds
    When user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operations" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    And user presses "OK" button
    Then "Day End Select Tender" page is shown
    #And user selects "Terminal Cashup - UK" from "Selection List" list
    #And user presses "OK" button
    #And "Day End Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
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
    And receipt display with following details
      | text | Terminal Cashup and Empty |
      | text | Cash UK                   |
      | item | Expected                  |
      | item | Discrepancy               |
      | item | Total                     |
      | text | ${Manager 2 Username}     |
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    And user presses "OK" button and "Empty Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # Wait until the day end processed and verify any cashed up sessions are available for finalise
    And user waits "90" seconds
    When user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Finalise Button" icon button
    And "Terminal Cash Management Finalise" page is shown
    Then user presses "OK" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2819 @MVP @ManualVerification @AUTOMATED
  Scenario: Auto Finalise When Force Cash Declaration Enabled with Cashup and Closing Float
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    When user presses "Terminal Cash Management Screen Finalise Button" icon button
    And "Terminal Cash Multiple Sessions" page is shown
    And user presses "OK" button
    And "Terminal Cash Management Finalise Confirm" page is shown
    And user presses "Yes" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Sell Unknown Product" page is shown
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # Wait until the transaction processed and perform the day end
    When user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    And user presses "OK" button
    Then "Day End Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
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
    And receipt display with following details
      | text | Terminal Cashup and Closing Float |
      | text | Cash UK                           |
      | item | Expected                          |
      | item | Discrepancy                       |
      | item | Total                             |
      | text | ${Manager 2 Username}             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    And user presses "OK" button and "Empty Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # Wait until the day end processed and verify any cashed up sessions are available for finalise
    When user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Finalise Button" icon button
    And "Terminal Cash Management Cashup" page is shown
    Then user presses "OK" button and "Terminal Cash Management Finalise Confirm" page shown
    And user presses "Yes" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2820 @MVP @ManualVerification @AUTOMATED
  Scenario: Auto Finalise When Force Cash Declaration Enabled with Cashup and Leave
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    When user presses "Terminal Cash Management Screen Finalise Button" icon button
    And "Terminal Cash Management Cashup" page is shown
    And "Terminal Cash Multiple Sessions" page is shown
    And user presses "OK" button
    And "Terminal Cash Management Finalise Confirm" page is shown
    And user presses "Yes" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Sell Unknown Product" page is shown
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # Wait until the transaction processed and perform the day end
    When user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    And user presses "OK" button
    Then "Day End Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "10.00" into "Input Box" field
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
    And receipt display with following details
      | text | Terminal Cashup and Leave |
      | text | Cash UK                   |
      | item | Expected                  |
      | item | Discrepancy               |
      | item | Total                     |
      | text | ${Manager 2 Username}     |
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    And user presses "OK" button and "Empty Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # Wait until the day end processed and verify any cashed up sessions are available for finalise
    When user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Finalise Button" icon button
    And "Terminal Cash Management Cashup" page is shown
    Then user presses "OK" button and "Terminal Cash Management Finalise Confirm" page shown
    And user presses "Yes" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
