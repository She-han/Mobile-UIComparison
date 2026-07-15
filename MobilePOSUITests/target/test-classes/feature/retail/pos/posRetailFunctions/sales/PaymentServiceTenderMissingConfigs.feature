Feature: Payment Service Tender Missing Configs
  To check whether a proper error message is displayed when the Payment Service configuration is missing/incomplete and payment service tender button is pressed.

  @PT-17418
  Scenario: Verifying whether  a proper error message is displayed when the Payment Service configuration is missing/incomplete and payment service tender button is pressed.
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Recovery Window" page shown
    And user presses "Total" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Payment Service" button and "Payment Service Tender Missing Configs" page shown
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Back" button and "Empty Basket" page shown
    And user presses "Voids" button and "Empty Basket" page shown
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user presses "OK" button
    Then "Empty Basket" page is shown

