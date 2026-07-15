Feature: Service Status
  Verify that a service status can be change

  @PT-5466 @AUTOMATED
  Scenario: Verifying that a service can be Pause and Resume.
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status Button" icon button
    When user presses "Service Status Button" icon button
    Then "Service Status Information Screen" page is shown
    And user selects "Pos Update Service" from "Services List" list
    When user presses "Pause" button
    Then "Paused" is displayed in "Services List" list
    And user presses "Resume" button
    When user presses "Back" button
    Then "Administration Screen" page is shown
    And user presses "Back" button
    And "Administration Screen" page is shown
    And user presses "Back" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5467 @AUTOMATED @Regression
  Scenario: Verify the ability to stop and start a service
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status Button" icon button
    When user presses "Service Status Button" icon button
    Then "Service Status Information Screen" page is shown
    And user selects "Pos Update Service" from "Services List" list
    And user presses "Stop" button
    And "Stopped" is displayed in "Services List" list
    And user presses "Start" button
    And user presses "Back" button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5465 @AUTOMATED @Regression
  Scenario: Verify that the Background Services are Displayed
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status Button" icon button
    When user presses "Service Status Button" icon button
    Then "Service Status Information Screen" page is shown
    And button with label "Up" is not displayed
    And user presses "Down" button       
    And user waits "2" seconds
    And user presses "Up" button       
    When user presses "Back" button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown