Feature: Rich Product Search Results

  @PT-3177 @AUTOMATED @RichProductSearch @Regression
  Scenario: POS - RPS - Verify that filtered Search results are reset when Reset button is pressed
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user presses "Product Category 1" icon button
    Then "Rich Product Search Result" page is shown
    And user enters "30.00" into "Price Range From" field
    And user enters "40.00" into "Price Range To" field
    And user waits "2" seconds
    And "Rich Product Search Result" page is shown
    And user presses "Reset Filters" icon button
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10894 @AUTOMATED @POS @RichProductSearch
  Scenario: Rich Product Search - Verify sub categories are displayed when a category is selected from dropdown
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "cosmetic" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    When user selects "Makeup" from "Product Parent Group List" combobox
    And user waits "2" seconds
    And "Rich Product Main Result" page is shown
    Then user waits "EYE MAKEUP" to display
    And user waits "EYELINER" to display
    And user waits "EYE SHADOW" to display
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-17702 @AUTOMATED @POS @ReactPos @RichProductSearch
  Scenario: Rich Product Search - Verify that when the sub menu category clicked the expanded category is not collapses
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "cosmetic" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    When user selects "Makeup" from "Product Parent Group List" combobox
    And user waits "2" seconds
    And "Rich Product Main Result" page is shown
    Then user waits "Face Makeup" to display
    And user presses "Face Makeup Droparrow" icon button
    And user waits "Blush" to display
    And user waits "Concealer" to display
    And user waits "Foundation Sets" to display
    And user presses "Blush Droparrow" icon button
    And user waits "Blush" to display
    And user waits "Concealer" to display
    And user waits "Foundation Sets" to display
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-6529 @AUTOMATED @POS
  Scenario: Verify the products include in the RPs when RPS is enabled in EM.Type is determined by the lucene index
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    And user enters "${Product 4}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product 4}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search Result" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user presses "Product Search" button and "Select Product" page shown
    When user enters "${Product 4}" into "Input Box" field
    Then "${Product 4}" is displayed in "Selection List" list
    And user presses "Back" button and "Enter Item" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6543 @AUTOMATED @POS @ToBeFixedAutTest
  Scenario: Verify the products include in the RPs when RPS is enabled in EM.Type is determined by the lucene index
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    And user enters "${Product 30695}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And user waits "2" seconds
    And user confirms "Product Search Result Item 1" not display
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user presses "Product Search" button and "Select Product" page shown
    When user enters "${Product 30695}" into "Input Box" field
    Then "${Product 30695}" is displayed in "Selection List" list
    And user presses "Back" button and "Enter Item" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6544 @AUTOMATED @POS
  Scenario: Verify the products include in the RPs when the RPS is enabled in the EM .Type is determined by the database
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    And user enters "${Product 4}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product 4}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search Result" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user presses "Product Search" button and "Select Product" page shown
    When user enters "${Product 4}" into "Input Box" field
    Then "${Product 4}" is displayed in "Selection List" list
    And user presses "Back" button and "Enter Item" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6545 @AUTOMATED @POS @NotForWeeklyRegression
  Scenario: Verify the products include in the RPs when RPS is enabled in the EM.Type is determined by the database
    Given user signs on as "Pos Operator"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Product 30695}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product 30695}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search Result" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user presses "Product Search" button and "Select Product" page shown
    When user enters "${Product 30695}" into "Input Box" field
    Then "${Product 30695}" is displayed in "Selection List" list
    And user presses "Back" button and "Enter Item" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-15820 @RichProductSearch @POS @AUTOMATED
  Scenario: Rich Product Search - Verify that an error message is displayed when searching products with an invalid price range
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user presses "Product Category 1" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Price Range From" to display
    And user enters "${Price Range Max Value}" into "Price Range From" field
    And user enters "${Price Range Min Value}" into "Price Range To" field
    And user presses "Full Screen Product Search Button" icon button
    And "Invalid Price Range Rich Product Main Result Full Screen" page is shown
    When user presses "OK" button
    Then "Rich Product Search Result" page is shown
    And user selects "Fragrance" from "Product Parent Group List" combobox
    And user waits "2" seconds
    And "Rich Product Main Result" page is shown
    And user enters "${Price Range Max Value}" into "Main Screen Price Range From" field
    And user enters "${Price Range Min Value}" into "Main Screen Price Range To" field
    And user presses "Main Screen Product Search Button" icon button
    And "Invalid Price Range Rich Product Main Result Screen" page is shown
    When user presses "OK" button
    Then "Rich Product Search Result" page is shown
    Then user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-16113 @AUTOMATED @POS @ReactPos @RichProductSearch
  Scenario: Rich Product Search - Verify that the category search menus are expandable and minimized
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "cosmetic" into "Product Search Input" field
    Then user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    When user selects "Makeup" from "Product Parent Group List" combobox
    Then user waits "2" seconds
    And "Rich Product Main Result" page is shown
    When user waits "Face Makeup" to display
    Then user presses "Face Makeup Droparrow" icon button
    And user waits "Blush" to display
    And user waits "Concealer" to display
    And user waits "Foundation Sets" to display
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-17429 @POS @AUTOMATED
  Scenario: Verify that the size selection is available for the Style Size product when search the product through Rich Product Search
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Style Size Product 2 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Size Product 2 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Size Product 2}"
    And user waits "2" seconds
    And user selects "${Style Size Product 2 Size 1}" from "Product Size Combo" combobox
    And user waits "1" seconds
    And user selects "${Style Size Product 2 Size 2}" from "Product Size Combo" combobox
    And user waits "1" seconds
    And user selects "${Style Size Product 2 Size 3}" from "Product Size Combo" combobox
    And user waits "1" seconds
    And user selects "${Style Size Product 2 Size 4}" from "Product Size Combo" combobox
    And user waits "1" seconds
    When user presses "Back Button" icon button
    Then "Rich Product Search Result" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
