Feature: Transaction Discount

  @PT-10613 @TurkeyFiscalTransactionDiscountPercentage @AUTOMATED @Turkey @Fiscalisation @ManualVerification
  Scenario: Verify Transaction Discount: Issue Gift card
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10% Transaction Discount" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When "Transaction Discount (10% Transaction Discount % 10)" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
