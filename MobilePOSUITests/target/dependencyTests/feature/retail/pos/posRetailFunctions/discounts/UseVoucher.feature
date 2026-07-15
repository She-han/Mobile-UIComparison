Feature: Use Voucher

  @PT-20190 @AUTOMATED @POS
  Scenario: Verify that multiple vouchers of the same type cannot be added to a transaction.
    Given user signs on as "Sales Assistant"
    When user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Use Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    Then user selects "EMS Bounceback Reward: $20 UK" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user enters "${Voucher Serial Number 1}" into "Input Box" field
    And user presses "OK" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    And user selects "EMS Bounceback Reward: $20 UK" from "Selection List" list
    And user presses "OK" button 
    And "Already Redeemed Voucher Type" page is shown
    And user presses "OK" button and "Transaction Basket" page shown  
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Style Colour Size Product 2}                                                                              |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown