Feature: Fixed Price Promotion

  @PT-74 @FixedPricePromotion @POS @MVP_DE @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: To test that a Fixed Price Promotion is applied in the basket.
    Given user signs on as "Sales Assistant"
    When user enters "${Product 6}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}              |
      | telephone | Tel: ${Store Phone 1}                                              |
      | item      | ${Product 6 Description},${Product 6 Price}                        |
      | text      | Promotion Saving                                                   |
      | text      | ${Product 6 Promotion}                                             |
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Price}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
