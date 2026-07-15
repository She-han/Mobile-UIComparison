Feature: Airport Sale

  @PT-1792 @Airport @Dune @ReactPos @AUTOMATED @SignOn
  Scenario: Flight code accepted when typed in
    Given "Enter User" page is shown
    And user enters "${Airport Operator 1 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Airport Operator 1 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Capture Flight Code" page is shown
    And "Airport Transaction" is displayed in "Receipt" list
    When user enters "${Flight Code 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Capture Flight Code" page shown
    And user presses "Sign Off" button
    And "Enter User" page is shown

  @PT-1809 @Airport @Dune @ManualVerification @ReactPos @AUTOMATED @SignOn
  Scenario: Flight code typed in is added to email receipt
    Given "Enter User" page is shown
    And user enters "${Airport Operator 1 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Airport Operator 1 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Capture Flight Code" page is shown
    And "Airport Transaction" is displayed in "Receipt" list
    When user enters "${Flight Code 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    And user presses "Email Only" button and "Capture Email" page shown
    Then user enters "${Customer Receipt Email 1}" into "Capture Email Text" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Capture Flight Code" page is shown
    And user presses "Sign Off" button
    And "Enter User" page is shown

  @PT-1808 @Airport @Dune @ReactPos @AUTOMATED @SignOn
  Scenario: Flight code typed in is added to receipt
    Given "Enter User" page is shown
    And user enters "${Airport Operator 1 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Airport Operator 1 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Capture Flight Code" page is shown
    And "Airport Transaction" is displayed in "Receipt" list
    When user enters "${Flight Code 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    And user presses "Print Only" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Airport Sale                                          |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Flight Code 1}                                      |
      | item      | Cash UK,-£6.00                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Capture Flight Code" page is shown
    And user presses "Sign Off" button
    And "Enter User" page is shown

  @PT-1807 @Airport @Dune @ManualVerification @ReactPos @AUTOMATED @SignOn
  Scenario: Flight code typed in is added to email and printed receipt
    Given "Enter User" page is shown
    And user enters "${Airport Operator 1 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Airport Operator 1 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Capture Flight Code" page is shown
    And "Airport Transaction" is displayed in "Receipt" list
    When user enters "${Flight Code 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    And user presses "Email and Print" button and "Capture Email" page shown
    And user enters "${Customer Receipt Email 1}" into "Capture Email Text" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Airport Sale                                          |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Flight Code 1}                                      |
      | item      | Cash UK,-£6.00                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Capture Flight Code" page is shown
    And user presses "Sign Off" button
    And "Enter User" page is shown

  @PT-1803 @Airport @Dune @ReactPos @AUTOMATED @SignOn
  Scenario: Skip flight code process
    Given "Enter User" page is shown
    And user enters "${Airport Operator 1 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Airport Operator 1 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Capture Flight Code" page is shown
    And "Airport Transaction" is displayed in "Receipt" list
    # Skip flight details
    When user presses "Skip Flight Details" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    And user presses "Print Only" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Airport Sale                                          |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | Cash UK,-£6.00                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Capture Flight Code" page is shown
    And user presses "Sign Off" button
    And "Enter User" page is shown

  @PT-1802 @Airport @Dune @ReactPos @AUTOMATED @SignOn
  Scenario: Invalid flight code not accepted when keyed in
    Given "Enter User" page is shown
    And user enters "${Airport Operator 1 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Airport Operator 1 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Capture Flight Code" page is shown
    And "Airport Transaction" is displayed in "Receipt" list
    # Invalid flight code
    When user enters "FD85" into "Input Box" field
    And user presses "ENT" button and "Capture Airport Code" page shown
    And user enters "A95" into "Input Box" field
    And user presses "ENT" button and "Airport Not Found" page shown
    And user presses "OK" button and "Capture Airport Code" page shown
    And user enters "${Airport Code 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    And user presses "Print Only" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Airport Sale                                          |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | FD85                                                  |
      | item      | Cash UK,-£6.00                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Capture Flight Code" page is shown
    And user presses "Sign Off" button
    And "Enter User" page is shown
