Feature: Cash Management Cash up on Czech Fiscal Pos

  @PT-2226 @Fiscalisation @CzechRepublic @CashUp @AUTOMATED @ManualVerification
  Scenario: Verify the Fiscal Receipt for Cash Management Cash up on Czech Fiscal Pos
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
		When user presses "Management" button
		When user presses "Admin" button and "Administration Screen" page shown
		And user presses "Daily Operation" icon button
		And user presses "Day End" icon button
		And "Confirm Day End" page is shown
		When user presses "OK" button and "Cash Management Select Tender Reason" page shown
		And user selects "Cash CZ" from "Selection List" list
		And user enters "100.00" into "Input Box" field
		When user presses "OK" button
		And user presses "Complete" button and "Cash Management Enter Notes" page shown
		When user presses "OK" button and "Cash Management Select Tender Reason" page shown
		And user selects "Cash CZ" from "Selection List" list
		And user enters "1000.00" into "Input Box" field
		When user presses "OK" button
		And user presses "Complete" button and "Cash Management Enter Notes" page shown
		When user presses "OK" button
		Then "Await Drawer Closed" page is shown
		And user presses "Close" button on external "Cash Drawer" window
		And "Confirm Day End Message" page is shown
		When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown	
