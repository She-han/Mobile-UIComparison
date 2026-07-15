Feature: Disable Promotion

  @PT-12604 @Promotion @POS @AUTOMATED
  Scenario: Verify Promotions are NOT triggered outside the specified time range
    Given user signs on as "Sales Assistant"
    When user enters "${Product 77}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 77 Description}" is displayed in "Receipt" list
    When user enters "${Product 78}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 78 Description}" is displayed in "Receipt" list
    # Verify promotion is added to the basket - To trigger this promotion user needs to log in between 17:00 - 24:00
    And "Test promo-Outside time" is not displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 77 Description},${Product 77 Price} |
      | item | ${Product 78 Description},${Product 78 Price} |
    And following details are not displayed on the receipt
      | text | Test promo-Outside time |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-12606 @POS @AUTOMATED @Promotions
  Scenario: Verify Promotions are NOT triggered for Exclude Locations
    Given user signs on as "Sales Assistant"
    When user enters "${Product 71}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 71 Description}" is displayed in "Receipt" list
    When user enters "${Product 72}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 71 Description}" is displayed in "Receipt" list
    # Verify promotion is added to the basket
    And "Test promo include enactor store" is displayed in "Receipt" list
    # Verify promotion is not added to the basket
    And "Test promo for  Exclude Locations" is not displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 71 Description},${Product 71 Price} |
      | item | ${Product 72 Description},${Product 72 Price} |
      | text | Promotion Saving                              |
      | text | Test promo include enactor store              |
    And following details are not displayed on the receipt
      | text | Test promo for  Exclude Locations |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-524 @DisablePromotion @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Disable a promotion in the basket
    Given user signs on as "Sales Assistant"
    When user enters "${Product 5}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 5 Description}" is displayed in "Receipt" list
    And "${Product 5 Promotion}" is displayed in "Receipt" list
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 4 Description}" is displayed in "Receipt" list
    And "${Product 4 Promotion}" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Disable Promotion" button
    Then "Select Promotion Screen" page is shown
    When user selects "${Product 5 Promotion}" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Product 4 Promotion}" is displayed in "Receipt" list
    And "Disable Promotion" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 5 Description},${Product 5 Price}           |
      | item      | ${Product 4 Description},${Product 4 Price}           |
      | text      | Promotion Saving                                      |
      | text      | ${Product 4 Promotion}                                |
    And following details are not displayed on the receipt
      | text | ${Product 5 Promotion} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-15256 @Promotion @POS @AUTOMATED
  Scenario: Promotions and discounts do not get triggered when Disallow Promotions and Disallow Discounts flags are enabled for product price
    Given user signs on as "Sales Assistant"
    When user enters "${Product 93}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 93 Description}" is displayed in "Receipt" list
    And "${Promotion 10% Discount}" is not displayed in "Receipt" list
    When user enters "${Product 94}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 94 Description}" is displayed in "Receipt" list
    And "${Promotion 10% Discount}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 93 Description},${Product 93 Price} |
      | item | ${Product 94 Description},${Product 94 Price} |
      | text | Promotion Saving                              |
      | text | ${Product 94 Promotion Discount}              |
    And following details are not displayed on the receipt
      | text | ${Promotion 10% Discount},${Product 93 Promotion Discount} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
