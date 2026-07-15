Feature: Recall Stored Baskets through API

  @PT-18571 @POS @AUTOMATED @RESTAPI
  Scenario: Verify customer basket creation through REST API using a postman collection
    # Create basket through API
    Given the Postman collection "basket/CreateBasketPostmanCollection.json" is executed
    # Recall the basket
    When user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Customer Basket" button and "Stored Customer Baskets List Selection Prompt" page shown
    And user selects "Test_Customer_Basket_001" from "Stored Customer Baskets List Selection" list
    And user presses "View" button and "Display Transaction With Msg Config" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown