Feature: Verify Price Override receipt

  @PT-10618 @Fiscalisation @Turkey @FiscalTurkeyPriceOverrideDown @AUTOMATED @ManualVerification
  Scenario: Verify Price Override receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button
    Then "Enter Price Override Amount" page is shown
    When user enters "10.00" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

