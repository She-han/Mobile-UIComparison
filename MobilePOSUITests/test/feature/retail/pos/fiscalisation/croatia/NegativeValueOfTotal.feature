Feature: Negative values of totals are allowed on Croatia Fiscal POS

  @PT-2271  @AUTOMATED @Croatia @Fiscalisation @ManualVerification
  Scenario: Verify Negative values of lines are allowed and negative values of totals are allowed on Croatia Fiscal POS
    Given user signs on as "Croatia Fiscal Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal HR 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
    And receipt display with following details
      | item      | ${Product Fiscal HR 2 Return Description},${Product Fiscal HR 2 Return Price}|