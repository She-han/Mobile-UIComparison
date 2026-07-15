Feature: No-Sale transactions on German Fiscal POS 

  @PT-2187 @AUTOMATED @Germany @Fiscalisation @FiscalGermany @ManualVerification
  Scenario: Verify Receipt For no-Sale transactions on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "No Sale" button and "Select Reason" page shown
    And user selects "Add vouchers to drawer" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
	And "Enter User" page is shown
