Feature: Day Start in POS

  @PT-16707 @POS @AUTOMATED
  Scenario: Verify Day Start
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day Start" icon button
    And "Confirm Run Screen" page is shown
    And user presses "OK" button and "Day Start Acknowledge Prompt" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-16706 @POS @AUTOMATED
  Scenario: Verify Store Day Start
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Store Day Start" icon button
    And "Confirm Store Day Start" page is shown
    And user presses "OK" button and "Store Day Start Acknowledge Prompt" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown       