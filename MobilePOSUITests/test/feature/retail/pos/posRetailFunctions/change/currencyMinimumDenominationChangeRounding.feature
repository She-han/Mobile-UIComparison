Feature: currencyMinimumDenominationChangeRounding

	@PT-8530 @POS @AUTOMATED @POSCurrencyMinimumDenominationChangeAboveTest @ToBeFixedAutTest
	Scenario: Change value above currency minimum denomination
    Given user signs on as "Change Test Assistant"
    And user enters "${Change Test Product}" into "Input Box" field
    And user presses "ENT" button
    And "${Change Test Product Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button and "Select Tender" page shown
    And user presses "Cash DK" button and "Enter Cash Tender Amount" page shown
    And user presses "DKK60.00" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | ${Change Test Above Minimum Denomination Total} |
      | text | ${Change Test Above Minimum Denomination Change Value} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

	@PT-8531 @TobeFixedAutTest @POS @AUTOMATED @POSCurrencyMinimumDenominationChangeBelowTest
	Scenario: Change value below currency minimum denomination
    Given user signs on as "Change Test Assistant"
    And user enters "${Change Test Product}" into "Input Box" field
    And user presses "ENT" button
    And "${Change Test Product Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Cash DK" button and "Enter Cash Tender Amount" page shown
    And user presses "DKK50.00" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | ${Change Test Below Minimum Denomination Total} |
      | text | ${Change Test Overpayment Label} |
      | text | ${Change Test below Minimum Denomination Overpayment Value} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
