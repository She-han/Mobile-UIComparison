Feature: Day End in POS

  @PT-16708 @POS @AUTOMATED
  Scenario: Verify Day End
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    And user presses "OK" button and "Confirm Day End Message" page shown
    And user presses "OK" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-16705 @POS @AUTOMATED
  Scenario: Verify Stor Day End
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Store Day End" icon button
    And "Confirm Store Day End" page is shown
    And user presses "OK" button and "Store Day End Acknowledge Prompt" page shown
    And user presses "OK" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown  