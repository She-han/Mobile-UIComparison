Feature: Verify CRM Menu

  @PT-13774 @POS @CRM @AUTOMATED @CRMMenu @ToBeFixedAutTest
  Scenario: Verify the availability of CRM Menu buttons
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Overview" icon button
    Then "CRM Daily Overview" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Jobs" icon button
    Then "CRM Jobs" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Manager" icon button
    Then "CRM Manager Overview" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Products" icon button
    Then "Rich Product Search" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
