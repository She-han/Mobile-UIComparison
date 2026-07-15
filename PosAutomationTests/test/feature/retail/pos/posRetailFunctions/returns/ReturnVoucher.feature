Feature: Return Gift Voucher

  @PT-345 @ReturnVoucher @POS @AUTOMATED @MVP @POSValidatedTest @POSSet3
  Scenario: Return an Issued Voucher
    Given user signs on as "Manager 2"
    When user presses "Returns" button
    And user presses "Voucher Return" button
    Then "Enter Return Voucher Code" page is shown
    And user presses "Select Voucher" button and "Select Voucher" page shown
    And user selects "${Gift Voucher Number 4 Type}" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user enters "123" into "Input Box" field
    When user presses "OK" button
    Then "Serial Number Not Found" page is shown
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user enters "${Gift Voucher Number 4}" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Refund" is displayed in "Receipt" list
    And "R ${Gift Voucher Number 4 Type}" is displayed in "Receipt" list
    And "Serial: ${Gift Voucher Number 4}" is displayed in "Receipt" list
    And user waits "1" seconds
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Refund                           |
      | text | R                                |
      | text | ${Gift Voucher Number 4 Type}    |
      | text | Serial: ${Gift Voucher Number 4} |
      | text | Refund Cash UK                   |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
