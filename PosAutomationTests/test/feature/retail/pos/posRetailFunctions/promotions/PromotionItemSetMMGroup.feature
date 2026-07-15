Feature: Promotion - Item Set with MM Group

  @PT-332 @PromotionItemSetMMGroup @POS @MVP @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Verify that Item Set promotion for the included MM Group is applied in the basket
    Given user signs on as "Sales Assistant"
    When user enters "${Product 5}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 5 Description}" is displayed in "Receipt" list
    And "${Product 5 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 5 Description},${Product 5 Price}           |
      | text      | Promotion Saving                                      |
      | text      | ${Product 5 Promotion}                                |
      | text      | -${Product 5 Promotion Saving Amount}                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
