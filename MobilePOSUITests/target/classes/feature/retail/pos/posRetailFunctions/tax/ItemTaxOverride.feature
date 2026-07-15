Feature: Item Tax Override

  @PT-2089
  Scenario: Item Level Tax Override - Availability for No Tax Product
    Given user signs on as "Manager 2"
    And user enters "${Product 1}" into "Product" Input Box field
    When user presses "ENT" button Then "Transaction Basket" page shown
    And user selects "${Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Tax Override" button Then "Select Tax" page shown
    Then user selects "UK Fragrance" from the Selection List
    And user presses "OK" button Then "Select Reason" page is shown
    And user selects "Item Level Tax Override Reason 1" from the Selection List
    When user presses "OK" button Then "Enter Tax Percentage" page is shown
    Then user enters "20.4845" into "Input Box" field
    When user presses "ENT" button Then "Transaction Basket" page shown
    Then "${Tax Override Description}" is displayed in Receipt list
    When user presses "Total" button Then "Select Tender" page is shown
    Then user presses "Cash" button Then "Enter Cash Tender Amount" page is shown
    When user presses "OK" button Then "Await Drawer Closed" page shown
    And receipt display with following details
      | item      | <Product Description Receipt>,<Product Price Receipt>     |
      | item      | <Total After Tax Override Receipt>                        |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button Then "Enter User" page is shown

  @PT-1313 @POS @TaxOverride @AUTOMATED @TM_Release_1 @POSValidatedTest @POSSet4
  Scenario: Item Level Tax Override - Availability for No Tax Product
    Given user signs on as "Sales Assistant"
    And user enters "${Product Tax 0}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product Tax 0 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product Tax 0 Description},${Product Tax 0 Price}   |
      | item      | Cash UK,-£18.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1312 @POS @TaxOverride @AUTOMATED @TM_Release_1
  Scenario: Item Level Tax Override - Void
    Given user signs on as "Sales Assistant"
    And user enters "${Product Tax 1}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product Tax 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "More..." button and "Modify Item" page shown
    And user presses "Tax Override" button and "Select Tax" page shown
    And user selects "UK Fragrance" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Level Tax Override Reason 1" from "Selection List" list
    And user presses "OK" button and "Enter Tax Percentage" page shown
    And "Input Box" field contains the text "10"
    And user enters "25%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "UK Fragrance" is displayed in "Receipt" list
    And "Tax Override" is displayed in "Receipt" list
    And "20% to 25%" is displayed in "Receipt" list
    And user selects "UK Fragrance" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product Tax 1 Description},${Product Tax 1 Price}   |
      | item      | Cash UK,-£21.60                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1308 @POS @TaxOverride @AUTOMATED @TM_Release_1
  Scenario: Item Level Tax Override - For Single Tax Product
    Given user signs on as "Sales Assistant"
    And user enters "${Product Tax 1}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product Tax 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "More..." button and "Modify Item" page shown
    And user presses "Tax Override" button and "Select Tax" page shown
    And user selects "UK Fragrance" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Level Tax Override Reason 2" from "Selection List" list
    And user presses "OK" button and "Enter Tax Percentage" page shown
    And "Input Box" field contains the text "15"
    And user enters "30%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "UK Fragrance" is displayed in "Receipt" list
    And "Tax Override" is displayed in "Receipt" list
    And "20% to 30%" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product Tax 1 Description},${Product Tax 1 Price}   |
      | item      | Cash UK,-£23.40                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1310 @POS @TaxOverride @AUTOMATED @TM_Release_1
  Scenario: Item Level Tax Override - For Multiple Tax Product
    Given user signs on as "Sales Assistant"
    And user enters "${Product Tax 2}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product Tax 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "More..." button and "Modify Item" page shown
    And user presses "Tax Override" button and "Select Tax" page shown
    And user selects "UK Fragrance" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Level Tax Override Reason 2" from "Selection List" list
    And user presses "OK" button and "Enter Tax Percentage" page shown
    And "Input Box" field contains the text "15"
    And user enters "30%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "UK Fragrance" is displayed in "Receipt" list
    And "Tax Override" is displayed in "Receipt" list
    And "20% to 30%" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product Tax 2 Description},${Product Tax 2 Price}   |
      | item      | Cash UK,-£27.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1311 @POS @TaxOverride @AUTOMATED @TM_Release_1
  Scenario: Item Level Tax Override - Tax Percentage Validation
    Given user signs on as "Sales Assistant"
    And user enters "${Product Tax 1}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product Tax 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "More..." button and "Modify Item" page shown
    And user presses "Tax Override" button and "Select Tax" page shown
    And user selects "UK Fragrance" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Level Tax Override Reason 1" from "Selection List" list
    And user presses "OK" button and "Enter Tax Percentage" page shown
    And "Input Box" field contains the text "10"
    And user enters "35%" into "Input Box" field
    And user presses "OK" button and "Tax Percentage Too High" page shown
    And user presses "OK" button and "Enter Tax Percentage" page shown
    And user enters "25%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "UK Fragrance" is displayed in "Receipt" list
    And "Tax Override" is displayed in "Receipt" list
    And "20% to 25%" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product Tax 1 Description},${Product Tax 1 Price}   |
      | item      | Cash UK,-£22.50                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
