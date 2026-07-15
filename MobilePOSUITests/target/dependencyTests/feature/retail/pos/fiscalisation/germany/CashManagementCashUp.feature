Feature: Cash Management Cash up on German Fiscal POS

  @PT-2185 @Fiscalisation @Germany @CashUp @AUTOMATED @ManualVerification
  Scenario: Verify the Fiscal Receipt for Cash Management Cash up on German Fiscal POS
  	Given user signs on as "Germany Fiscal Sales Assistant"
	When user presses "Management" button
	When user presses "Admin" button and "Administration Screen" page shown
	And user presses "Daily Operation" icon button
	And user presses "Day End" icon button
	And "Confirm Day End" page is shown
	When user presses "OK" button and "Cash Management Select Tender Reason" page shown
	And user selects "Cash " from "Selection List" list
	And user enters "100.00" into "Input Box" field
	When user presses "OK" button
	And user presses "Complete" button and "Cash Management Enter Notes" page shown
	And user presses "OK" button
	Then "Await Drawer Closed" page is shown
	And user presses "Close" button on external "Cash Drawer" window
	And "Enter User" page is shown
	
	



	
