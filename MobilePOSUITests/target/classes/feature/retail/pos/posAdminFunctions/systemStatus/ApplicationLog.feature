Feature: Application log
  Testing the application log related features

  @PT-5463 @POS @AUTOMATED
  Scenario: Verify whether the Application logs page can be accessed
      Given user signs on as "Sales Assistant"
    	And user presses "Management" button
    	And user presses "Admin" button and "Administration Screen" page shown
    	And user presses "System Status" icon button
    	And user presses "Application Log" icon button
    	And "Select Application Log" page is shown
    	And user waits "2" seconds
    	And user presses "Back" button and "Administration Screen" page shown
    	When user presses "Administration Screen Back Button" icon button
      Then "Administration Screen" page is shown
      When user presses "Administration Screen Back Button" icon button    
      Then "Transaction Basket" page is shown
    	And user presses "Log Out Button" icon button
    	And "Enter User" page is shown
    	
  @PT-5481 @POS @AUTOMATED
  Scenario: Validate that the log Entries can be viewed
      Given user signs on as "Sales Assistant"
    	And user presses "Management" button
    	And user presses "Admin" button and "Administration Screen" page shown
    	And user presses "System Status" icon button
    	And user presses "Application Log" icon button
    	And "Select Application Log" page is shown
    	And user waits "2" seconds
    	And user presses "Filters" button and "Application Log Filter Criteria" page shown
    	And user presses "OK" button and "Select Application Log" page shown
    	And user presses "View Log Entry" button and "View Application Log Entry" page shown
    	And user presses "Back" button and "Select Application Log" page shown
    	And user presses "Back" button and "Administration Screen" page shown
    	And user presses "Log Out Button" icon button
    	And "Enter User" page is shown
    	
  @PT-5464 @POS @AUTOMATED
  Scenario: Verify the Application Log Filter button
      Given user signs on as "Sales Assistant"
    	And user presses "Management" button
    	And user presses "Admin" button and "Administration Screen" page shown
    	And user presses "System Status" icon button
    	And user presses "Application Log" icon button
    	And "Select Application Log" page is shown
    	And user waits "2" seconds
    	And user presses "Filters" button and "Application Log Filter Criteria" page shown
    	And user presses "OK" button and "Select Application Log" page shown
    	And user presses "Down" button
    	And user waits "2" seconds
    	And user presses "Up" button
    	And user waits "2" seconds
    	And user presses "Bottom of List" button
    	And button with label "Down" is not displayed
    	And user presses "Top of List" button
    	And button with label "Up" is not displayed    	  	  	    	    	   	    	    	
    	And user presses "Back" button and "Administration Screen" page shown
    	And user presses "Administration Screen Back Button" icon button and "Administration Screen" page shown    
    	And user presses "Administration Screen Back Button" icon button and "Transaction Basket" page shown    
    	And user presses "Log Out Button" icon button
    	And "Enter User" page is shown

  @PT-5495 @POS @AUTOMATED
  Scenario: Application Log - Delete Log file
      Given user signs on as "Sales Assistant"
    	And user presses "Management" button
    	And user presses "Admin" button and "Administration Screen" page shown
    	And user presses "System Status" icon button
    	And user presses "Application Log" icon button
    	And "Select Application Log" page is shown
    	And user waits "2" seconds
    	And user presses "Filters" button and "Application Log Filter Criteria" page shown
    	And user presses "OK" button and "Select Application Log" page shown
    	And user presses "Other Options" button
    	And user presses "Delete Log File" button and "Application Log Deleted Message Prompt" page shown
    	And user presses "OK" button and "Select Application Log" page shown    	   	    	   	
    	And user presses "Back" button and "Administration Screen" page shown
    	And user presses "Administration Screen Back Button" icon button and "Administration Screen" page shown    
    	And user presses "Administration Screen Back Button" icon button and "Transaction Basket" page shown    
    	And user presses "Log Out Button" icon button
    	And "Enter User" page is shown     	    	