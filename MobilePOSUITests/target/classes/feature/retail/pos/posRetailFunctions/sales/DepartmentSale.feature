@DepSale
Feature: Department Sale
  To test the Department Sale / Unknown product sale functionality.

  @PT-7018 @POS @AUTOMATED
  Scenario: Verifying the Product Id length in the POS when doing a Department sale
    Given user signs on as "Sales Assistant"
    When user presses "Dept Sale" button and "Select Reason" page shown
    Then user selects "Not on file" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter c button" icon button
    And user waits "1" seconds
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter o button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter l button" icon button
    And user waits "2" seconds
    And user selects "Cologne Gift Sets (All Regions)" from "MMG Group List" list
    And user presses "Toggle Alpha Keyboard" icon button
    And user presses "Select" button and "Enter Item State" page shown
    And user enters "123456789123456789122134" into "Input Box" field
    And user presses "OK" button and "Pop Up Message" page shown
    And user presses "OK" button and "Enter Item State" page shown
    When user enters "1234" into "Input Box" field
    And user presses "OK" button and "Enter MMG Item Comment" page shown
    Then user enters "dep sale not on file" into "Input Box" field
    And user presses "OK" button and "Enter Item Price" page shown
    When user enters "£13.45" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | -£13.45                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-252 @AUTOMATED @MVP @DepSale_NotOnFile @POS @POSValidatedTest @POSSet3
  Scenario: Perform a Department Sale operation (Not on file)
    Given user signs on as "Sales Assistant"
    When user presses "Dept Sale" button and "Select Reason" page shown
    Then user selects "Not on file" from "Selection List" list
		And user presses "OK" button and "Filtered MMG" page shown
		And user presses "Toggle Alpha Keyboard" icon button
		Then "Enter User with Keyboard" page is shown
		And user presses "Keyboard Letter c button" icon button
		And user waits "1" seconds
		And "Filtered MMG" page is shown
		And user presses "Keyboard Letter o button" icon button
		And user waits "1" seconds
		And user presses "Keyboard Letter l button" icon button
		And user waits "2" seconds
		And user selects "Cologne Gift Sets (All Regions)" from "MMG Group List" list
		And user presses "Toggle Alpha Keyboard" icon button
		And user presses "Select" button and "Enter Item State" page shown
    When user enters "1234" into "Input Box" field
    And user presses "OK" button and "Enter MMG Item Comment" page shown
    Then user enters "dep sale not on file" into "Input Box" field
    And user presses "OK" button and "Enter Item Price" page shown
    When user enters "£13.45" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | -£13.45                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-251 @AUTOMATED @MVP @DepSale_FaultyBarcode @POS @POSValidatedTest @POSSet3
  Scenario: Perform a Department Sale operation (Faulty Barcode)
    Given user signs on as "Sales Assistant"
    When user presses "Dept Sale" button and "Select Reason" page shown
    Then user selects "Faulty Barcode" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter a button" icon button
    And user waits "1" seconds
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter c button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter c button" icon button
    And user waits "2" seconds
    And user selects "Accessories (All Regions)" from "MMG Group List" list
    And user presses "Toggle Alpha Keyboard" icon button
    And user presses "Select" button and "Enter Item Price" page shown
    When user enters "£13.45" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Accessories                                           |
      | text      | -£13.45                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1154 @AUTOMATED @UnknownProduct_NotOnFile @POS @POSValidatedTest @POSSet3
  Scenario: Perform an Unknown Product Sale operation (Not on file)
    Given user signs on as "Sales Assistant"
    When user enters "unknown1" into "Input Box" field
    And user presses "ENT" icon button
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Sell" button and "Select Reason" page shown
    Then user selects "Not on file" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter c button" icon button
    And user waits "1" seconds
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter o button" icon button
    And user waits "2" seconds
    And user selects "Cosmetics (All Regions)" from "MMG Group List" list
    And user presses "Toggle Alpha Keyboard" icon button
    And user presses "Select" button and "Enter MMG Item Comment" page shown
    Then user enters "unknown product not on file" into "Input Box" field
    And user presses "OK" button and "Enter Item Price" page shown
    When user enters "£12.46" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cosmetics                                             |
      | text      | -£12.46                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1155 @AUTOMATED @UnknownProduct_FaultyBarcode @POS @POSValidatedTest @POSSet3
  Scenario: Perform an Unknown Product Sale operation (Faulty Barcode)
    Given user signs on as "Sales Assistant"
    When user enters "unknown2" into "Input Box" field
    And user presses "ENT" icon button 
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Sell" button and "Select Reason" page shown
    Then user selects "Faulty Barcode" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
		Then "Enter User with Keyboard" page is shown
		And user presses "Keyboard Letter h button" icon button
		And user waits "1" seconds
		And "Filtered MMG" page is shown
		And user presses "Keyboard Letter o button" icon button
		And user waits "1" seconds
		And user presses "Keyboard Letter m button" icon button
		And user waits "2" seconds
		And user selects "Homeware (All Regions)" from "MMG Group List" list
		And user presses "Toggle Alpha Keyboard" icon button
		And user presses "Select" button and "Enter Item Price" page shown
    When user enters "£17.99" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Homeware                                              |
      | text      | -£17.99                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-264 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Verify that user without 'Allow Unknown Product Sale' privilege is not able to perform Department Sale
    Given user signs on as "Pos Operator"
    When user presses "Dept Sale" button
    Then "Unknown Product Not Allowed" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    @PT-11602
    Scenario: POS - Verify changing quantity on MMG Sale
    Given user signs on as "Sales Assistant"
    When user presses "Dept Sale" button and "Select Reason" page shown
    Then user selects "Faulty Barcode" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
		Then "Enter User with Keyboard" page is shown
		And user presses "Keyboard Letter c button" icon button
		And user waits "1" seconds
		And "Filtered MMG" page is shown
		And user presses "Keyboard Letter h button" icon button
		And user waits "1" seconds
		And user selects "Children (All Regions)" from "MMG Group List" list
		And user presses "Select" button and "Enter Item Price" page shown
    When user enters "Â£13.45" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    When user selects "Children" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Change Quantity" button
    And "Modify Quantity" page is shown
    Then user enters "5" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Children                                           |
      | text      | -Â£13.45                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-164 @AUTOMATED @HOF @Regression
  Scenario: POS - Department Sale - MMG sale through MMG Sale button
    Given user signs on as "Manager 3"
    When user presses "Sell Item" button and "Transaction Basket" page shown
    Then user presses "MMG Sale" button and "Select Reason" page shown
    When user selects "Not on file" from "Selection List" list
    Then user presses "ENT" button
    And user waits "2" seconds
    And "Filtered MMG" page is shown
    And user waits "2" seconds
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user waits "2" seconds
    And user presses "Keyboard Letter f button" icon button
    And user waits "1" seconds
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter r button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter a button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter g button" icon button
    And user waits "2" seconds
    And user selects "Fragrance (All Regions)" from "MMG Group List" list
    And user presses "Select" button and "Enter Item State" page shown
    When user enters "${Style Colour Size Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Enter MMG Item Comment" page shown
    And user enters "Test Reason" into "Input Box" field
    And user presses "ENT" button and "Enter Item Price" page shown
    When user enters "${Style Colour Size Product 1 Price}" into "Input Box" field
    Then user presses "ENT" button and "Sell Unknown Product" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Fragrance                                             |
      | text      | ${Style Colour Size Product 1 Price}                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Enter User" page is shown

  @PT-11602 @AUTOMATED @POS
  Scenario: POS - Verify changing quantity on MMG Sale
    Given user signs on as "Sales Assistant"
    When user presses "Dept Sale" button and "Select Reason" page shown
    Then user selects "Faulty Barcode" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter c button" icon button
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter o button" icon button
    And user presses "Keyboard Letter l button" icon button
    And user selects "Cologne Gift Sets (All Regions)" from "MMG Group List" list
    And user presses "Select" button and "Enter Item Price" page shown
    And user enters "£13.45" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | -£13.45                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
