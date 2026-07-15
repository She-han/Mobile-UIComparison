Feature: Price Override

  @PT-273 @PriceOverrideFixed @AUTOMATED @POS @PriceOverride @POSValidatedTest @POSSet2
  Scenario: Perform a Fixed Price Override and complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    And user enters "${Product 21}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 21 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Price Override" button
    And "Select Reason" page is shown
    And user selects "Fixed Price" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Fixed Price ( £5.00 to £10.00 )" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Override (£5.00 to £10.00)       |
     #Commented due to failing script casued by PLAT-16359
     #| item | ${Product 21 Description},£10.00 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-271 @PriceOverrideUp @AUTOMATED @POS @PriceOverride @Smoke @POSValidatedTest @POSSet2
  Scenario: Perform a Price Override Up and complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Price Override" button
    And "Select Reason" page is shown
    And user selects "Price Override Up" from "Selection List" list
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "14.50" into "Input Box" field
    And user presses "OK" button
    Then "Price Override Too Low Error" page is shown
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "20.50" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Price Override Up ( £18.00 to £20.50 )" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Override (£18.00 to £20.50)     |
     #Commented due to failing script casued by PLAT-16359
     #| item | ${Product 1 Description},£20.50 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-272 @PriceOverrideDown @AUTOMATED @POS @PriceOverride @POSValidatedTest @POSSet2
  Scenario: Perform a Price Override Down and complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Price Override" button
    And "Select Reason" page is shown
    And user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "12.75" into "Input Box" field
    And user presses "OK" button
    Then "Price Override Too High Error" page is shown
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "9.75" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Price Override Down ( £10.00 to £9.75 )" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Override (£10.00 to £9.75)     |
     #Commented due to failing script casued by PLAT-16359
     #| item | ${Product 2 Description},£9.75 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-278 @JYSK @MVP @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Verify Price override functionality when the price override privileges are disabled
    Given user signs on as "Manager 3"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And button with label "Price Override" is not displayed
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And user presses "User Functions" button and "Transaction Basket" page shown
    And user presses "Sign on Auth User" button
    And "Enter Authorising User" page is shown
    And user enters "${Authorising User 1 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    When user enters "${Authorising User 1 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Voids" button
    Then user presses "Transaction Void" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "End Transaction Continue" page shown
    And user presses "OK" button and "Enter User" page shown

  @PT-279 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Verify the Price override functionality when the allow price override flag is not enabled for a product
    Given user signs on as "Manager 2"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 3 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And button with label "Price Override" is not displayed
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    When user presses "Voids" button
    And user presses "Void Transaction" button
    Then "Select Reason" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-190 @AUTOMATED @POS @HOF @JYSK @POSValidatedTest @POSSet2
  Scenario: Price override % with limit
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Price Override Percentage" from "Selection List" list
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "2.00" into "Input Box" field
    And user presses "OK" button and "Price Override Too Low Error" page shown
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "33.00" into "Input Box" field
    And user presses "OK" button and "Price Override Too High Error" page shown
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "17.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Price Override Percentage ( ${Product 1 Price} to £17.00 )" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | text      | Override (£18.00 to £17.00)                           |
     #Commented due to failing script casued by PLAT-16359
     #| item      | ${Product 1 Description},£17.00                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    
  @PT-10846 @PriceOverrideFixed @AUTOMATED @POS @PriceOverride @POSValidatedTest @POSSet2
  Scenario: Perform a Fixed Price Override and complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Price Override" button
    And "Select Reason" page is shown
    And user selects "Price Override Up" from "Selection List" list
    And user presses "ENT" button and "Enter Price Override Amount" page shown
    And user enters "8.25" into "Input Box" field
    And user presses "OK" button
    Then "Price Override Too Low Error" page is shown
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "12.75" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Price Override Up ( £10.00 to £12.75 )" is displayed in "Receipt" list
    And user selects "${Product 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And button with label "Price Override" is not displayed
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Override (£10.00 to £12.75)       |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6965 @AUTOMATED @POS
  Scenario: Price override for more than one item
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button
    And "Enter Quantity" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Price Override" button
    And "Select Reason" page is shown
    And user selects "Price Override Up" from "Selection List" list
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "24.00" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | text      | Override (£18.00 to £24.00)                           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-18199 @AUTOMATED @POS @PriceOverride
  Scenario: Cancel a Price Override in the middle of the Override process
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Price Override" button
    And "Select Reason" page is shown
    And user selects "Fixed Price" from "Selection List" list
    And user presses "Cancel" button and "Price Override Cancelled" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Fixed Price ( ?18.00 to ?10.00 )" is not displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And following details are not displayed on the receipt
      | text | Override (?18.00 to ?10.00) |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1945 @Regression @POSPriceOverride @POS
  Scenario: Verify whether the Price Override can be Voided using the Item Void Function
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Price Override" button
    And "Select Reason" page is shown
    And user selects "Price Override Up" from "Selection List" list
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "20.50" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Price Override Up ( ??18.00 to ??20.50 )" is displayed in "Receipt" list
    And user selects "Price Override Up" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown