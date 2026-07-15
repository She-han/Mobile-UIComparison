Feature: Capture Serial Number
  To test capture serial number prompt

  @PT-17038 @AUTOMATED @POS
  Scenario: POS - Sale a product with a serial number validation
    Given user signs on as "Sales Assistant"
    When user enters "${Serial Number Validated Product}" into "Input Box" field
    And user presses "ENT" icon button
    And "Enter Serial Number" page is shown
    And user presses "ENT" icon button
    And "Invalid Serial Number" page is shown
    And user presses "OK" button and "Enter Serial Number" page shown
	  And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-17166 @AUTOMATED @POS @ToBeFixedAutTest
  Scenario: Verify Capture Serial Number Prompt "Enter Pressed" without entering a value.
    Given user signs on as "Sales Assistant"
    When user enters "${Serial Number Validated Product}" into "Input Box" field
    And user presses "ENT" icon button
    And "Enter Serial Number" page is shown
 	  And user enters "${Sample Invalid Serial No}" into "Input Box" field
    And user presses "ENT" icon button
    And "Invalid Serial Number" page is shown
    And user presses "OK" button and "Enter Serial Number" page shown
    And user enters "${Sample Valid Serial No}" into "Input Box" field
    And user presses "ENT" icon button
	  And "Transaction Basket" page is shown
    And "${Serial Number Validated Product Price}" is displayed in "Receipt" list
    And "${Serial Number Validated Product Description}" is displayed in "Receipt" list
    And "${Sample Valid Serial No}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

    
