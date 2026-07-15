Feature: Machine Status
  Check the ability to view the device status and details

  @PT-5468 @AUTOMATED
  Scenario: Verifying that the user can see the General Details, Memory usage details and the Application version details.
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status Button" icon button
    And user presses "Machine Status Button" icon button
    Then "Machine Status Information Screen" page is shown
    And "General" is displayed in "Machine Status List" panel
    And "Memory" is displayed in "Machine Status List" panel
    And "Application Version" is displayed in "Machine Status List" panel
    And user presses "Back" button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
