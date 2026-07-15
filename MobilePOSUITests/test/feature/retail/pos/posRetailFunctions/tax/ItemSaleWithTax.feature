Feature: Item Sale with Tax

  @PT-241 @ManualVerification @Regression @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Tax on Item Sale (Basket)
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Total Tax £1.00" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-242 @ManualVerification @Regression @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Tax on Item Sale (Receipt)
    Given user signs on as "Sales Assistant"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 3 Description}" is displayed in "Receipt" list
    And "${Product 3 Price}" is displayed in "Receipt" list
    And "Total Tax £1.00" is displayed in "Receipt" list
    Then receipt display with following details
      | item | ${Product 3 Description},${Product 3 Price} |
      | item | Total Tax,£1.00                             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
