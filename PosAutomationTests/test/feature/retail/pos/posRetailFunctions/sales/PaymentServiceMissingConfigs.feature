Feature: Payment Service Missing Configs
  To check whether a proper error message is displayed when the Payment Service configuration is missing/incomplete and Release Payment Device button is clicked.

  @PT-17417
  Scenario: Verifying whether a proper error message is displayed when the Payment Service configuration is missing/incomplete and Release Payment Device button is clicked.
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Select Payment Device" button
    And user presses "Release Payment Device" button and "Payment Service Missing Configs" page shown
    And user presses "OK" button and "Empty Basket" page shown

