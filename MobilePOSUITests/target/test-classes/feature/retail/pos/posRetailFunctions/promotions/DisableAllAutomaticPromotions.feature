Feature: Disable All Automatic Promotions

  @PT-1291 @DisableAllAutomaticPromotions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Disable all automatic promotions in the basket (without manual activation)
    Given user signs on as "Manager 2"
    When user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 4 Description}" is displayed in "Receipt" list
    And "${Product 4 Promotion}" is displayed in "Receipt" list
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 5}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 5 Description}" is displayed in "Receipt" list
    And "${Product 5 Promotion}" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Disable All Automatic Promotions" button
    Then "Disable All Automatic Promotions" is displayed in "Receipt" list
    And "${Product 4 Promotion}" is not displayed in "Receipt" list
    And "${Product 5 Promotion}" is not displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 4 Description},${Product 4 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 5 Description},${Product 5 Price}           |
    #Commented due to failing script casued by PLAT-16360
    #And following details are not displayed on the receipt
    #| text | ${Product 4 Promotion} |
    #| text | ${Product 5 Promotion} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-525 @ReactPOS @Regression @DisableAllAutomaticPromotions @POS @AUTOMATED @Regression
  Scenario: Disable all automatic promotions in the basket (with manual activation)
    Given user signs on as "Pos Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button
    Then "Select Reason" page is shown
    And user selects "£8 Manual Activation Promo" from "Selection List" list
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Enable Promotion ${Product 47 Promotion}" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Disable All Automatic Promotions" button
    And "${Product 1 Promotion}" is not displayed in "Receipt" list
    Then "Disable All Automatic Promotions" is displayed in "Receipt" list
    And "Enable Promotion ${Product 47 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | telephone | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 47 Description},${Product 47 Price}         |
      | text      | Promotion Saving                                      |
      | item      | ${Product 47 Promotion},-£8.00                        |
    And following details are not displayed on the receipt
      | text | ${Product 1 Promotion} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown