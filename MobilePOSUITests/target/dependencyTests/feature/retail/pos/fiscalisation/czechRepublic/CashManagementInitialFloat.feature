Feature: Cash Management Initial Float on Czech Fiscal POS

  @PT-2230 @AUTOMATED @CzechRepublic @Fiscalisation @ManualVerification
  Scenario: Verify the Fiscal Receipt for Cash Management Initial Float on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
		When user presses "Management" button
		When user presses "Admin" button and "Administration Screen" page shown
		And user presses "Daily Operation" icon button
		And user presses "Day Start" icon button
		And "Confirm Run Screen" page is shown
		When user presses "OK" button and "Cash Management Select Tender Reason" page shown
		And user selects "Cash CZ" from "Selection List" list
		And user enters "100.00" into "Input Box" field
		When user presses "OK" button
		And user presses "Complete" button and "Cash Management Enter Notes" page shown
		And user presses "OK" button
		Then "Await Drawer Closed" page is shown
		And user presses "Close" button on external "Cash Drawer" window
		Then "Day Start Acknowledge Prompt" page is shown
		When user presses "OK" button
  	Then "Transaction Basket" page is shown
  	And user presses "SignOff" button
  	And "Enter User" page is shown	
	
