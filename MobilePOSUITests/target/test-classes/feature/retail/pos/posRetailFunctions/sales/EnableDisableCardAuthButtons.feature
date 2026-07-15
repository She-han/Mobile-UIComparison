Feature: Enable Disable Card Auth Buttons
  To check whether the Enable/Disable card auth POS buttons are working at SALE MENU

  @PT-17415
  Scenario: Verifying whether the Enable/Disable card auth POS buttons are working at SALE MENU
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Select Payment Device" button
    And user presses "Select Payment Device (Until Further Notice)" button and "Empty Basket" page shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Disable Card Auth" button and "Disable Card Auth" page shown
    And user presses "OK" button and "Card Auth Confirm" page shown
    And user presses "OK" button and "Empty Basket" page shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Enable Card Auth" button and "Enable Card Auth" page shown
    And user presses "OK" button and "Card Auth Confirm" page shown
    And user presses "OK" button and "Empty Basket" page shown

