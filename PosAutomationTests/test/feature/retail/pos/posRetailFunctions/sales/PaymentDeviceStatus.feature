Feature: Payment Device Status
  To check whether the error message is getting displayed, when the PDC host is configured to connect to only one Payment Device, and when that Payment Device is offline

  @PT-16793
  Scenario: Verifying the error message is getting displayed, when that Payment Device is offline
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Select Payment Device" button
    And user presses "Until Further Notice" button
    Then "Offline Ped" page is shown
    And user presses "OK" button
    Then "Empty Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Select Payment Device" button
    And user presses "Release Payment Device" button
    Then "Empty Basket" page is shown