Feature: Gift Voucher Sale

  @PT-12133 @POS @AUTOMATED
  Scenario: Purchase Gift Voucher - Prompt for value
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Gift Voucher" button and "Select Voucher Type" page shown
    When user selects "Gift Voucher Test UK" from "Selection List" list
    And user presses "OK" button
    And "Select Voucher Sub Type" page is shown
    And user selects "£10" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-330 @GiftVoucherSale @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Purchase Gift Voucher
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Gift Voucher" button and "Select Voucher Type" page shown
    When user selects "Gift Voucher Test UK" from "Selection List" list
    And user presses "OK" button
    And "Select Voucher Sub Type" page is shown
    And user selects "£10" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-8 @TobeFixedAutTest @GiftVoucherSale @POS @AUTOMATED
  Scenario: Void Gift Voucher
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Gift Voucher" button and "Select Voucher Type" page shown
    When user selects "${Gift Voucher Number 3 Type}" from "Selection List" list
    Then user presses "OK" button
    And "Select Voucher Sub Type" page is shown
    And user selects "£10" from "Selection List" list
    And user presses "OK" button
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" button and "Transaction Basket" page shown
    Then user selects "${Gift Voucher Number 3 Type}" from "Receipt List" list
    And "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    Then user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And following details are not displayed on the receipt
      | text      | ${Gift Voucher Number 3 Type}                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11533 @GiftVoucherSale @POS @AUTOMATED
  Scenario: Verify Voucher subtype default selection is the first item in the list
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Gift Voucher" button and "Select Voucher Type" page shown
    And user selects "Gift Voucher UK" from "Selection List" list
    And user presses "OK" button
    And "Select Voucher Sub Type" page is shown
    And "£5" is selected in "Selection List" list
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
