Feature: Prompt Loyalty Before Transaction

  @PT-11954 @AUTOMATED @MVP @Loyalty @POS @POSValidatedTest @NotForWeeklyRegression
  Scenario: Offer Loyalty Card
    Given template "LOYALTY_AT_START_POS_TEMPLATE" is set for the current POS terminal
    When "Enter User" page is shown
    And user enters "${Sales Assistant Username}" into "User Name Text" field
    And user enters "${Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    Then "Loyalty Account Enquiry" page is shown
    And user enters "${Customer 1 Loyalty No}" into "Input Box" field
    And user presses "OK" button and "Loyalty Account details" page shown
    And user waits "2" seconds
    And user presses "OK" button and "Recovery Window" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user presses "TOTAL" button
    Then "Select Tender" page is shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Loyalty Account Enquiry" page is shown
    And user presses "Skip" button and "Recovery Window" page shown
    And user presses "SignOff" button and "Enter User" page shown
