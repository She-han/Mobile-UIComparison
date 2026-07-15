Feature: POS - Card Authorization related test

  @PT-534 @AUTOMATED @POS
  Scenario: POS - Load the De-activate card Authorization button
    Given user signs on as "MANAGER 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user waits "Deactivate card authorisation" to display
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-535 @AUTOMATED @POS
  Scenario: POS - Deactivate and Activate card Authorization Service
    Given user signs on as "MANAGER 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    ###----DEACTIVATING THE CARD AUTHORISATION SERVICE-------###----------
    And user waits "Deactivate card authorisation" to display
    And user presses "Disable Card Auth" icon button
    And "Deactivate Card Authorisation Prompt" page is shown
    And user presses "OK" button and "Administration Screen" page shown
    ###----ACTIVATING THE CARD AUTHORISATION SERVICE---------###----------
    And user presses "Enable Card Auth" icon button
    And "Activate Card Authorisation Prompt" page is shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
