Feature: Item Sale paid with Cheque on Czech Fiscal POS

  @PT-2202 @Fiscalisation @CzechRepublic @AUTOMATED @ManualVerification
  Scenario: Item Sale with Cheque Tender on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user enters "${Product Fiscal CZ 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Cheque Tender Amount" page shown
		And user presses "OK" button and "Await Drawer Closed" page shown
		And user presses "Close" button on external "Cash Drawer" window
		Then "Transaction Basket" page is shown
		When user presses "SignOff" button
		Then "Enter User" page is shown