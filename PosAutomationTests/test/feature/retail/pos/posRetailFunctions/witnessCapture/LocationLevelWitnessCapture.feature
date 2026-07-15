Feature: Location level witness capture

  @PT-2301 @DevelopmentInProgress
  Scenario: Verify location level witness when reason level witness is not configured
    #Login EM and navigate to reason maintenance app
    #Select a reason and update 'Capture witness rate' as 0%
    # Capture witness rate for location as 80%
    Given user signs on as "Sales Assistant"
    When user enters "2" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And user presses "Discount" button and "Transaction Basket" page shown
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10% Off" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | ${Product Price}                                      |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2302 @DevelopmentInProgress
  Scenario: Verify capture witness for reason when location level witness is not configured
    #Login EM and navigate to reason maintenance app
    #Select a reason and update 'Capture witness rate' as 90%
    #Capture witness rate for location as 0%
    Given user signs on as "Sales Assistant"
    When user enters "2" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And user presses "Discount" button and "Transaction Basket" page shown
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10% Off" from "Selection List" list
    And user presses "OK" button and "Witness Capture for reason" page shown
    And user presses "Sign In" button
    And user enters "Username" into "Input Box" field
    And user enters "Password" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | ${Product Price}                                      |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2303 @DevelopmentInProgress
  Scenario: Configure witness % for both reason and location level
    #Login EM and navigate to reason maintenance app
    #Select a reason and update 'Capture witness rate' as 10%
    # Capture witness rate for location as 80%
    Given user signs on as "Sales Assistant"
    When user enters "2" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And user presses "Discount" button and "Transaction Basket" page shown
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10% Off" from "Selection List" list
    And user presses "OK" button and "Witness Capture for store location" page shown
    And user presses "Sign In" button
    And user enters "Username" into "Input Box" field
    And user enters "Password" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | ${Product Price}                                      |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2304 @DevelopmentInProgress
  Scenario: Verify same user in multiple location with different authorisation level
    #Capture witness rate for location A as 80% and reason level witness capture as 20%
    #Capture witness rate for location B as 80% and reason level witness capture as 0%
    
    #Note: A POS with location A should be started up before this test.
    Given user signs on as "Sales Assistant" 
    When user enters "2" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And user presses "Discount" button and "Transaction Basket" page shown
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10% Off" from "Selection List" list
    And user presses "OK" button and "Witness Capture for store location" page shown
    And user presses "Sign In" button
    And user enters "Username" into "Input Box" field
    And user enters "Password" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | ${Product Price}                                      |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #Note: A POS with location B should be started up before this test.
    Given user signs on as "Sales Assistant" 
    When user enters "2" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And user presses "Discount" button and "Transaction Basket" page shown
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10% Off" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | ${Product Price}                                      |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
