Feature: Enable Promotion

  @PT-12601 @Promotion @POS @AUTOMATED
  Scenario: Verify Promotions are triggered for the specified time range
    Given user signs on as "Sales Assistant"
    When user enters "${Product 83}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 83 Description}" is displayed in "Receipt" list
    When user enters "${Product 84}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 84 Description}" is displayed in "Receipt" list
    # Verify promotion is added to the basket - To trigger this promotion user needs to log in between 10:00 - 17:00
    And "${Product 84 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 83 Description},${Product 83 Price} |
      | item | ${Product 84 Description},${Product 84 Price} |
      | text | Promotion Saving                              |
      | text | ${Product 84 Promotion}                       |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-12603 @Promotion @POS @AUTOMATED
  Scenario: Verify Promotions are triggered for the specified time range
    Given user signs on as "Sales Assistant"
    When user enters "${Product 80}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 80 Description}" is displayed in "Receipt" list
    When user enters "${Product 81}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 81 Description}" is displayed in "Receipt" list
    # Verify promotion is added to the basket - To trigger this promotion user needs to log in between 10:00 - 17:00
    And "${Product 81 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 80 Description},${Product 80 Price} |
      | item | ${Product 81 Description},${Product 81 Price} |
      | text | Promotion Saving                              |
      | text | ${Product 81 Promotion}                       |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-12605 @Promotion @POS @AUTOMATED
  Scenario: Verify Promotions are triggered for Include Locations
    Given user signs on as "Sales Assistant"
    When user enters "${Product 74}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 74 Description}" is displayed in "Receipt" list
    When user enters "${Product 75}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 75 Description}" is displayed in "Receipt" list
    # Verify promotion is added to the basket
    And "${Product 75 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 74 Description},${Product 74 Price} |
      | item | ${Product 75 Description},${Product 75 Price} |
      | text | Promotion Saving                              |
      | text | ${Product 75 Promotion}                       |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-522 @EnablePromotion @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Enable manually activation required promotion
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is not added to the basket
    And "${Product 2 Promotion}" is not displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Select Reason" page shown
    And user selects "${Reason Enable Promotion 1}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    # Verify promotion is  added to the basket
    Then "${Product 2 Promotion}" is displayed in "Receipt" list
    And "Enable Promotion ${Product 2 Promotion}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price},${Product 2 Promotion} |
      | text | Promotion Saving                                                   |
      | item | ${Product 2 Promotion},${Product 2 Promotion Saving Amount}        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

	@PT-5921 @EnablePromotion @POS @AUTOMATED @POSValidatedTest @POSSet2 @Regression
  Scenario: Enable and disable manually activation required promotion multiple times
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Promotion}" is not displayed in "Receipt" list
    # Enable Promotion
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Select Reason" page shown
    And user selects "Â£5 Manual Activation Promotion" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Product 2 Promotion With Price}" is displayed in "Receipt" list
    And "Enable Promotion ${Product 2 Promotion}" is displayed in "Receipt" list
    # Disable Promotion
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Disable Promotion" button
    Then "Select Promotion Screen" page is shown
    When user selects "${Product 2 Promotion}" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Product 2 Promotion With Price}" is not displayed in "Receipt" list
    # Enable Promotion
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Select Reason" page shown
    And user selects "Â£5 Manual Activation Promotion" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Product 2 Promotion With Price}" is displayed in "Receipt" list
    And "Enable Promotion ${Product 2 Promotion}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price},${Product 2 Promotion} |
      | text | Promotion Saving                                                   |
      | item | ${Product 2 Promotion},-Â£5.00                                      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
  @PT-10720 @POS @AUTOMATED
  Scenario: PROMOTION - % Discount - Dearest Products - verify Promotion is triggered correctly
    Given user signs on as "Sales Assistant"
    And user enters "${SKU Product 10}" into "Input Box" field
    When user presses "ENT" button
    Then "${SKU Product 10 Description}" is displayed in "Receipt" list
    When user enters "${SKU Product 14}" into "Input Box" field
    And user presses "ENT" button
    Then "${SKU Product 14 Description}" is displayed in "Receipt" list
    # Verify promotion is added to the basket
    And "${Dearest Product Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
    	| item | ${SKU Product 10 Description} |
    	| item | ${SKU Product 14 Description} |
    	| text | Promotion Saving              |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
	  
  @PT-10722 @POS @AUTOMATED
  Scenario: PROMOTION - Offer Price Promotion - verify Promotion is triggered correctly
    Given "Enter User" page is shown
    When user enters "${Sales Assistant US Username}" into "User Name Text" field
    And user enters "${Sales Assistant US Password}" into "Password Text" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And privilege "enactor.pos.OfferPriceLookup" is added to the current user
    And user enters "${SKU Product 12}" into "Input Box" field
    When user presses "ENT" button
    Then "${SKU Product 12 Description}" is displayed in "Receipt" list
    When user enters "${SKU Product 13}" into "Input Box" field
    And user presses "ENT" button
    Then "${SKU Product 13 Description}" is displayed in "Receipt" list
    # Verify promotion is added to the basket
    And "${Offer Mark Down Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
    	| item | ${SKU Product 12 Description} |
	| item | ${SKU Product 13 Description} |
	| text | Promotion Saving              |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown