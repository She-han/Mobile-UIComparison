Feature: Schedulde Jobs

  @PT-5458 @POS @AUTOMATED
  Scenario: Schedule Jobs - Load the Schedule Jobs
	Given user signs on as "Manager 2"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    #Pre-test: Create Update Index Jobs to create records in Scheduled Jobs screen
	And user presses "Status" icon button
    And user presses "Update Indexes" icon button
	Then "Run Update POS Lucene Indexes" page is shown 
	And user presses "OK" button and "Administration Screen" page shown
    When user presses "Update Indexes" icon button
	Then "Run Update POS Lucene Indexes" page is shown 
	And user presses "OK" button and "Administration Screen" page shown	
    When user presses "Update Indexes" icon button
	Then "Run Update POS Lucene Indexes" page is shown 
	And user presses "OK" button and "Administration Screen" page shown	
	And user presses "Administration Screen Back Button" icon button
	And user waits "10" seconds
	#Scheduled Jobs test
    And user presses "System Status" icon button
    And user presses "Sheduled Jobs" icon button
    And "Shedulde Job List" page is shown
    And user presses "Down" button
    And user presses "Down" button
    And user presses "Up" button
    And user presses "View Job" button
    And "View Job Page" page is shown
    And user presses "Back" button
    And "Shedulde Job List" page is shown
    And user presses "Back" button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5459 @POS @AUTOMATED @Regression
  Scenario: Verify the ability to view the logs in schedule jobs
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status" icon button
    And user presses "Sheduled Jobs" icon button
    And "Shedulde Job List" page is shown
    And user presses "Down" button
    And user presses "View Job" button
    And "View Job Page" page is shown
    And user presses "View Log" button
    And "View Log Process" page is shown
    And user presses "View Log Entry" button
    And "View Log Entry Page" page is shown
    And user presses "Back" button
    And "View Log Process" page is shown
    And user presses "Back" button
    And "View Job Page" page is shown
    And user presses "Back" button
    And "Shedulde Job List" page is shown
    And user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5460 @POS @AUTOMATED @Regression
  Scenario: Schedule Jobs - Very that the Schedule jobs can be filtered
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status" icon button
    And user presses "Sheduled Jobs" icon button
    And "Shedulde Job List" page is shown
    And user presses "Other Options" button
    And user presses "Filters" button
    And "Job Filter Page" page is shown
    And user selects "Successful" from "Criteria Status" combobox
    And user presses "OK" button
    And "Shedulde Job List" page is shown
    And "Successful" is displayed in "List Box" list
    And user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5461 @POS @AUTOMATED
  Scenario: Schedule Jobs - Remove a job
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status" icon button
    And user presses "Sheduled Jobs" icon button
    And "Shedulde Job List" page is shown
    And user presses "Down" button
    And user presses "Up" button
    And user presses "View Job" button
    And "View Job Page" page is shown
    And user presses "Remove This Job" button
    And "Remove Job Popup" page is shown
    And user presses "OK" button
    And "Shedulde Job List" page is shown
    And user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5462 @POS @AUTOMATED @NotForWeeklyRegression
  Scenario: Schedule Jobs - Remove a job
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status" icon button
    And user presses "Sheduled Jobs" icon button
    And "Shedulde Job List" page is shown
    And user presses "Next Page" button
    And "Shedulde Job List" page is shown
    And user presses "Previous Page" button
    And "Shedulde Job List" page is shown
    And user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown