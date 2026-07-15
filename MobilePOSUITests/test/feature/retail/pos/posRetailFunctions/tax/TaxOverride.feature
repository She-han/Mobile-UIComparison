Feature: Tax Refund

  @PT-9974 @AUTOMATED @POS
  Scenario: Verify whether the tax region can be modified while a return transaction
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty - Tax region capture" from "Selection List" list
    And user presses "OK" button and "Select Tax Region" page shown
    And user selects "United Kingdom" from "Selection List" list
    When user presses "Select Region" button
    Then "Return Slip Message" page is shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "Return Slip ${Product 1 Description}" is displayed in "Receipt" list
    And "-${Product 1 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty - Tax region capture" is displayed in "Receipt" list
    Then receipt display with following details
      | text | Refund                                                                             |
      | item | R,${Product 1 Description},-${Product 1 Price},Ret Reason:  Damaged / Faulty       |
      | text | Refund Cash UK                                                                     |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
