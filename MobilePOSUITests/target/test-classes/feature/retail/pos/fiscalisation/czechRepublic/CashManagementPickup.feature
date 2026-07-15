Feature: Cash Management Pickup on Czech Fiscal POS

  @PT-2231 @AUTOMATED @CzechRepublic @Fiscalisation @ManualVerification
  Scenario: Verify the Fiscal Receipt for Cash Management Pickup on Czech Fiscal POS   
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
		When user presses "Management" button
		When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
		And user presses "Terminal Cash Management Screen Pickup Button" icon button
		Then "Terminal Cash Management Select Tender" page is shown
		And user selects "Cash CZ" from "Selection List" list
		And user enters "20.00" into "Input Box" field
		When user presses "OK" button
		And user presses "Complete" button and "Cash Management Enter Notes" page shown
		And user presses "OK" button
		Then "Await Drawer Closed" page is shown
		And user presses "Close" button on external "Cash Drawer" window
		And "Enter User" page is shown


	
