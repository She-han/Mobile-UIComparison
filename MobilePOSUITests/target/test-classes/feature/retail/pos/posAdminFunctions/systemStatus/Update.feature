Feature: Update Processing
  Testing features related to updates

  @PT-5469 @AUTOMATED @POS @NotForWeeklyRegression
  Scenario: Check the Updates Processing list is listed in Admin functions
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "System Status" icon button
    And user presses "Update Viewer" icon button
    Then "Select Update Document" page is shown
    And "data-xml" is displayed in "List Box" list
    #Add support to verify the text "Updates Page 1" on the prompt in side panel
    And button with label "Previous Page" is not displayed
    And user presses "Next Page" button
    #Add support to verify the text "Updates Page 2" on the prompt in side panel
    And user presses "Previous Page" button
    And button with label "Up" is not displayed
    And user presses "Down" button
    And user presses "Up" button
    And user presses "Cancel" button and "Empty Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5470 @AUTOMATED @POS
  Scenario: View Document
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "System Status" icon button
    And user presses "Update Viewer" icon button
    Then "Select Update Document" page is shown
    And "data-xml" is displayed in "List Box" list
    And user presses "View Document" button and "View Update" page shown
    And "Details Update Type Field" field displays the text "data-xml"
    And user presses "Back" button and "Select Update Document" page shown
    And user presses "Cancel" button and "Empty Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5472 @AUTOMATED @POS
  Scenario: Apply filter for Updates Processing list
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "System Status" icon button
    And user presses "Update Viewer" icon button
    Then "Select Update Document" page is shown
    And "data-xml" is displayed in "List Box" list
    And user presses "Filters" button and "Enter Criteria" page shown
    And user selects "Failed" from "Criteria Status Field" combobox
    And user presses "OK" button and "Select Update Document" page shown
    And "Processed" is not displayed in "List Box" list
    And user presses "Filters" button and "Enter Criteria" page shown
    And user selects "Processed" from "Criteria Status Field" combobox
    And user presses "OK" button and "Select Update Document" page shown
    And "Processed" is displayed in "List Box" list
    And user presses "Cancel" button and "Empty Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5473 @AUTOMATED @POS @NotForWeeklyRegression
  Scenario: View Log Entry
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "System Status" icon button
    And user presses "Update Viewer" icon button
    Then "Select Update Document" page is shown
    And "data-xml" is displayed in "List Box" list
    And user selects "Failed" from "List Box" list
    And user presses "Other Options" button
    And user presses "View Log" button and "Select Application Process Log" page shown
    And user presses "View Log Entry" button and "View Application Process Log" page shown
    And user presses "Back" button and "Select Application Process Log" page shown
    And user presses "Back" button and "Select Update Document" page shown
    And user presses "Cancel" button
    And user presses "Cancel" button and "Empty Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5498 @AUTOMATED @POS
  Scenario: Remove an Update from the List
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "System Status" icon button
    And user presses "Update Viewer" icon button
    Then "Select Update Document" page is shown
    And "data-xml" is displayed in "List Box" list
    And user presses "Filters" button and "Enter Criteria" page shown
    And user selects "Processed" from "Criteria Status Field" combobox
	And user presses "OK" button and "Select Update Document" page shown	
    And user selects "Processed" from "List Box" list
    When user presses "Other Options" button
    And user presses "Remove" button
    Then "Confirm Update Remove" page is shown
    When user presses "OK" button
    Then "Select Update Document" page is shown
    And user presses "Cancel" button and "Select Update Document" page shown
    And user presses "Cancel" button
    Then "Empty Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-20494 @AUTOMATED @POS
  Scenario: System Status - Verify Cancel button in Updates Processing
  	Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "System Status" icon button
    And user presses "Update Viewer" icon button
    Then "Select Update Document" page is shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown 