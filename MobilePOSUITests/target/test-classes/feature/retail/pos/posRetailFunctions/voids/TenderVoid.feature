Feature: Tender Void

  @PT-1152 @POS @AUTOMATED @Regression
  Scenario: Void a Part Tender
    Given user signs on as "Manager 2"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "2.00" into "Input Box" field
    And user presses "OK" button
    Then "Select Tender" page is shown
    When user selects "Cash UK" from "Receipt" list
    Then "Modify Tender" page is shown
    And user presses "Void Tender" button and "Select Reason" page shown
    And user selects "Other" from "Selection List" list
    And user presses "OK" button
    Then "Select Tender" page is shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | V Cash UK VOID -£2.00                                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
