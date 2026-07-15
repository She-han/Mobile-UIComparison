Feature: Item return

  @PT-6423 @POS @AUTOMATED
  Scenario: Item return - customer deposit account refund
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    Then user presses "OK" button and "Enter Sales Person" page shown
    And user selects "2020" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    When user presses "Yes" button and "Transaction Basket" page shown
    Then user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Customer Deposit Account" from "Selection List" list
    When user presses "OK" button and "Loyalty Account Enquiry" page shown
    Then user enters "${Customer 1 Account Number}" into "Input Box" field
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Transaction Signature Verification" page shown
    Then "${Product 2 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
    And user presses "Signature OK" button and "Transaction Basket" page shown
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
