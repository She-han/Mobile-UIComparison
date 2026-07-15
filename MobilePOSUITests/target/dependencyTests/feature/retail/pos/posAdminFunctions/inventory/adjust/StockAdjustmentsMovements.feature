Feature: Stock Adjustments Page

  @PT-12491 @INVENTORY @POS @AUTOMATED
  Scenario: POS - Inventory - All data is displayed correctly on Stock Adjustments Movements screen
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory Button" icon button
    And user presses "Adjust Button" icon button
    And user presses "Adjust Stock Button" icon button
    And "Select Adjustment" page is shown
    Then user presses "Requested" button and "Select Stock Adjustment Request" page shown
    # Verify the item from the test data is displayed
    And "${Stock Adjustment 1 ID}" is displayed in "Stock Adjustments Movements List" list
    And "${Stock Adjustment 2 ID}" is displayed in "Stock Adjustments Movements List" list
    And user presses "Keyboard" icon button
    And "Keyboard Shown Stock" page is shown
    And user presses "Keyboard" icon button
    And "Keyboard Hidden Stock" page is shown
    And "${Stock Adjustment 1 ID}" is displayed in "Stock Adjustments Movements List" list
    And "${Stock Adjustment 2 ID}" is displayed in "Stock Adjustments Movements List" list
    # Cancel and signoff
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button and "Enter User" page shown

  @PT-12492 @INVENTORY @POS @AUTOMATED
  Scenario: POS - Inventory - Filters show and hide results appropriately on Stock Adjustments Movements screen
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory Button" icon button
    And user presses "Adjust Button" icon button
    And user presses "Adjust Stock Button" icon button
    And "Select Adjustment" page is shown
    Then user presses "Requested" button and "Select Stock Adjustment Request" page shown
    # Awaiting approval
    And user selects "Awaiting Approval" from "Stock Adjustment Status Filter" combobox
    And "${Stock Adjustment 2 ID}" is not displayed in "Stock Adjustments Movements List" list
    And "${Stock Adjustment 1 ID}" is displayed in "Stock Adjustments Movements List" list
    # Awaiting Picking
    And user selects "Awaiting Picking" from "Stock Adjustment Status Filter" combobox
    And "${Stock Adjustment 2 ID}" is displayed in "Stock Adjustments Movements List" list
    And "${Stock Adjustment 1 ID}" is not displayed in "Stock Adjustments Movements List" list
    # No filter
    And user selects "-" from "Stock Adjustment Status Filter" combobox
    And "${Stock Adjustment 1 ID}" is displayed in "Stock Adjustments Movements List" list
    And "${Stock Adjustment 2 ID}" is displayed in "Stock Adjustments Movements List" list
    # Internal adjustment
    And user selects "Internal Adjustment" from "Stock Adjustment Type Filter" combobox
    And "${Stock Adjustment 2 ID}" is displayed in "Stock Adjustments Movements List" list
    And "${Stock Adjustment 1 ID}" is displayed in "Stock Adjustments Movements List" list
    # Customer adjustment
    And user selects "Customer Adjustment" from "Stock Adjustment Type Filter" combobox
    And "${Stock Adjustment 2 ID}" is not displayed in "Stock Adjustments Movements List" list
    And "${Stock Adjustment 1 ID}" is not displayed in "Stock Adjustments Movements List" list
    # Cancel and signoff
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button and "Enter User" page shown

  @PT-12493 @INVENTORY @POS @AUTOMATED
  Scenario: POS - Inventory - Cancel button navigates back to admin screen on Stock Adjustments Movements screen
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory Button" icon button
    And user presses "Adjust Button" icon button
    And user presses "Adjust Stock Button" icon button
    And "Select Adjustment" page is shown
    Then user presses "Requested" button and "Select Stock Adjustment Request" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button and "Enter User" page shown

  @PT-12494 @INVENTORY @POS @AUTOMATED @ToBeFixedAutTest
  Scenario: POS - Inventory - Select button on Stock Adjustments Movements screen opens Adjustment Summary page
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory Button" icon button
    And user presses "Adjust Button" icon button
    And user presses "Adjust Stock Button" icon button
    And "Select Adjustment" page is shown
    Then user presses "Requested" button and "Select Stock Adjustment Request" page shown
    And user selects "${Stock Adjustment 2 ID}" from "Stock Adjustments Movements List" list
    Then user presses "Select" button and "Adjustment Summary" page shown
    # Field validation
    And "Adjustment ID Label" field displays the text "${Stock Adjustment 2 ID}"
    And "Reason Label" field displays the text "${Reason Test Add Ava Description}"
    And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button and "Enter User" page shown


  @PT-12495 @INVENTORY @POS @AUTOMATED
  Scenario: POS - Inventory - Ad Hoc button on Stock Adjustments Movements screen navigates to Adjustment Summary page
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory Button" icon button
    And user presses "Adjust Button" icon button
    And user presses "Adjust Stock Button" icon button
    And "Select Adjustment" page is shown
    Then user presses "Requested" button and "Select Stock Adjustment Request" page shown
    And user presses "Ad Hoc" button and "Adjustment Summary" page shown
    And user presses "Back" button and "Select Stock Adjustment Request" page shown
    And user presses "Back" button and "Select Adjustment" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button and "Enter User" page shown

  @PT-12496 @INVENTORY @POS @AUTOMATED
  Scenario: POS - Inventory - Back button on Stock Adjustments Movements screen navigates to Select Adjustment page
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory Button" icon button
    And user presses "Adjust Button" icon button
    And user presses "Adjust Stock Button" icon button
    And "Select Adjustment" page is shown
    Then user presses "Requested" button and "Select Stock Adjustment Request" page shown
    And user presses "Back" button and "Select Adjustment" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button and "Enter User" page shown

  @PT-12497 @INVENTORY @POS @AUTOMATED
  Scenario: POS - Inventory - Numbers period and CLR do nothing and ENT returns adjustment summary page
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory Button" icon button
    And user presses "Adjust Button" icon button
    And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
    Then user presses "Requested" button and "Select Stock Adjustment Request" page shown
    # Numbers, ., and CLR buttons do nothing, and ENT goes to the Adjustment Summary page
    And user presses "Numbutton 0" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton 1" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton 2" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton 3" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton 4" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton 5" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton 6" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton 7" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton 8" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton 9" icon button and "Select Stock Adjustment Request" page shown
    And user presses "Numbutton ." icon button and "Select Stock Adjustment Request" page shown
    And user presses "CLR" icon button and "Select Stock Adjustment Request" page shown
    And user selects "${Stock Adjustment 1 ID}" from "Stock Adjustments Movements List" list
    Then user presses "ENT" icon button and "Adjustment Summary" page shown
    And "Adjustment ID Label" field displays the text "${Stock Adjustment 1 ID}"
    And "Reason Label" field displays the text "${Adjustment Summary Reason}"
    And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
    And user presses "OK" button and "Select Stock Adjustment Request" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button and "Transaction Basket" page shown
    Then user presses "SignOff" button and "Enter User" page shown
