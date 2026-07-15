Feature: Spend X Get Free Item Promotion

  @PT-2570 @DevelopmentInProgress
  Scenario: Spend X Get Free Item Promotion Allow For Item with Price Change Type
    Given user signs on as "Sales Assistant"
    When user enters "${Product 39}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 39 Description}" is displayed in "Receipt" list
    Then user enters "${Product 36}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 36 Description}" is displayed in "Receipt" list
    And "${Product 36 Price}" is displayed in "Receipt" list
    And "${Product 36 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 36 Description},${Product 36 Price}         |
      | text      | Promotion Saving                                      |
      | item      | ${Product 36 Promotion}                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2571 @DevelopmentInProgress
  Scenario: Spend X Get Free Item Promotion Allow for a Merchandise Product
    Given user signs on as "Sales Assistant"
    When user enters "${Product 39}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 39 Description}" is displayed in "Receipt" list
    Then user enters "${Product 38}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 38 Description}" is displayed in "Receipt" list
    And "${Product 38 Price}" is displayed in "Receipt" list
    And "${Product 38 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 38 Description},${Product 38 Price}         |
      | text      | Promotion Saving                                      |
      | item      | ${Product 38 Promotion}                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2572 @DevelopmentInProgress
  Scenario: Spend X Get Free Item Promotion Disallow For Item with Price Change Type
    Given user signs on as "Sales Assistant"
    When user enters "${Product 39}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 39 Description}" is displayed in "Receipt" list
    Then user enters "${Product 37}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 37 Description}" is displayed in "Receipt" list
    And "${Product 37 Price}" is displayed in "Receipt" list
    And "${Product 37 Promotion}" is not displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 39 Description},${Product 39 Price}         |
      | item      | ${Product 37 Description},${Product 37 Price}         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2573 @Regression @Automated
  Scenario: Spend X Get Free Item Promotion Disallow For a Merchandise Product
    Given user signs on as "Sales Assistant"
    When user enters "${Product 39}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 39 Description}" is displayed in "Receipt" list
    Then user enters "${Product 40}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 40 Description}" is displayed in "Receipt" list
    And "${Product 40 Price}" is displayed in "Receipt" list
    And "${Product 40 Promotion}" is not displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 39 Description},${Product 39 Price}         |
      | item      | ${Product 40 Description},${Product 40 Price}         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-82 @POS @AUTOMATED @Regression @POSValidatedTest @POSSet4
  Scenario: Spend X Get Free Item Promotion for All Items and Disallow For Item with Price Change Type
    Given user signs on as "Sales Assistant"
    When user enters "${Product 42}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 42 Description}" is displayed in "Receipt" list
    Then user enters "${Product 41}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 41 Description}" is displayed in "Receipt" list
    And "${Product 41 Price}" is displayed in "Receipt" list
    And "${Product Any Exclude PCT Promotion}" is not displayed in "Receipt" list
    Then user enters "${Product 36}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 36 Description}" is displayed in "Receipt" list
    And "${Product 36 Price}" is displayed in "Receipt" list
    And "${Product Any Exclude PCT Promotion}" is not displayed in "Receipt" list
    Then user enters "${Product 36}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 36 Description}" is displayed in "Receipt" list
    And "${Product 36 Price}" is displayed in "Receipt" list
    And "${Product Any Exclude PCT Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 42 Description},${Product 42 Price}         |
      | item      | ${Product 41 Description},${Product 41 Receipt Price} |
      | item      | ${Product 36 Description},${Product 36 Price}         |
      | item      | ${Product 36 Description},${Product 36 Price}         |
      | text      | Promotion Saving                                      |
      | item      | ${Product Any Exclude PCT Promotion}                  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-67 @POS @AUTOMATED @Regression
  Scenario: Verify Spend X Get Y promotion is not triggered when the captured customer is part of an excluded customer group
  	Given user signs on as "Sales Assistant"
  	And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button
    And "Capture Customer Name" page is shown
    And user presses "Search By Name" button
    And "Enter Search Name" page is shown
    And user enters "${Spend X Get Y Exclude Customer Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Spend X Get Y Exclude Customer Name Without Initials}" from "Selection List" list
    And user presses "OK" button
    And "Confirm Customer" page is shown
    And user presses "Confirm" button
    Then "Transaction Basket" page is shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 2 Price}" is displayed in "Receipt" list
    And "${Spend X Get Y Transaction Promotion}" is not displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown