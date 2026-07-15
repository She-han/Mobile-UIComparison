Feature: Item Sale With Product Optionset

  @PT-320 @ItemSaleProductBooleanOptionAndProductList @POS @AUTOMATED @MVP @POSValidatedTest @POSSet4 @TPE-9487
  Scenario: Item sale with ProductBoolean Option and product list
    Given user signs on as "Sales Assistant"
    When user enters "${Option Set Product 1}" into "Input Box" field
    When user presses "ENT" icon button
    Then "Capture Optionset References" page is shown
    And "${Option Set Product 1 Description}" is displayed in "Capture Optionset Header Panel" panel
    And "${Option Set Product 1 price}" is displayed in "Capture Optionset Header Panel" panel
    And user presses "Capture Optionset Boolean Option" checkbox
    And user waits "2" seconds
    And user presses "Capture Optionset Next Button" icon button
    And user presses "Capture Optionset Row 2 Product List Item 1" icon button
    And user presses "Capture Optionset Next Button 2" icon button
    And "Transaction Basket" page is shown
    And "${Option Set Product 1 Description}" is displayed in "Receipt" list
    And "Loyalty Customer Confirmation : true" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}             |
      | telephone | Tel: ${Store Phone 1}                                             |
      | item      | ${Option Set Product 1 Description},${Option Set Product 1 Price} |
      | text      | Loyalty Customer Confirmation                                     |
      | text      | ${Product 2 Description}                                          |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-324 @ItemSaleChoiceOptionAndProductList @POS @AUTOMATED @MVP
  Scenario: Item sale with Choice Option Product and Product List
    Given user signs on as "Sales Assistant"
    When user enters "${Option Set Product 2}" into "Input Box" field
    When user presses "ENT" icon button
    Then "Capture Optionset References" page is shown
    And "${Option Set Product 2 Price}" is displayed in "Capture Optionset Header Panel" panel
    And user selects "${Option Set Product 2 Option 1 Choice}" from "Capture Optionset Choice Option Dropdown 1" combobox
    And user presses "Capture Optionset Next Button" icon button
    And user selects "${Option Set Product 2 Option 2 Choice}" from "Capture Optionset Choice Option Dropdown 2" combobox
    And user presses "Capture Optionset Next Button 2" icon button
    And user presses "Capture Optionset Row 3 Product List Item 1" icon button
    And "Transaction Basket" page is shown
    And "${Option Set Product 2 Description}" is displayed in "Receipt" list
    And "Select Bag Color : ${Option Set Product 2 Option 1 Choice}" is displayed in "Receipt" list
    And "Select Bag Material ${Option Set Product 2 Option 2 Choice}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}             |
      | telephone | Tel: ${Store Phone 1}                                             |
      | item      | ${Option Set Product 2 Description},${Option Set Product 2 Price} |
      | text      | Select Bag Color : ${Option Set Product 2 Option 1 Choice}                                          |
      | text      | Select Bag Material ${Option Set Product 2 Option 2 Choice}                                       |
      | item      | ${Product 2 Description}                                          |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-325 @MultipleOptionTypeProductSale @POS @AUTOMATED @MVP @Mobile @POSValidatedTest @POSSet3 @TPE-9487
  Scenario: Item sale with Multiple Product Options
    Given user signs on as "Sales Assistant"
    When user enters "${Option Set Product 3}" into "Input Box" field
    And user presses "ENT" icon button
    Then "Capture Optionset References" page is shown
    And "${Option Set Product 3 Description}" is displayed in "Capture Optionset Header Panel" panel
    And user enters "${Option Set Product 3 Option 1 Choice}" into "Capture Optionset Text Option" field
    And user presses "Capture Optionset Next Button" icon button
    And user selects "${Option Set Product 3 Option 2 Choice}" from "Capture Optionset Choice Option Dropdown 2" combobox
    And user presses "Capture Optionset Next Button 2" icon button
    And user presses "Capture Optionset Row 3 Product List Item 3" icon button
    And user presses "Capture Optionset Boolean Option 2" checkbox
    And user presses "Capture Optionset Next Button 4" icon button
    When user presses "Capture Optionset Row 5 Product List Item 1" icon button
    And user presses "Capture Optionset Next Button 5" icon button
    Then "Transaction Basket" page is shown
    And "${Option Set Product 3 Description}" is displayed in "Receipt" list
    And "Number Print : ${Option Set Product 3 Option 1 Choice}" is displayed in "Receipt" list
    And "Color Selection : ${Option Set Product 3 Option 2 Choice}" is displayed in "Receipt" list
    And "Are you a VIP User? : ${Option Set Product 3 Option 3 Choice}" is displayed in "Receipt" list
    And "${Style Colour Size Product 3 Description}" is displayed in "Receipt" list
    And "${Option Set Product 3 Option 4 Choice}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}             |
      | telephone | Tel: ${Store Phone 1}                                             |
      | item      | ${Option Set Product 3 Description},${Option Set Product 3 Price} |
      | text      | Number Print : ${Option Set Product 3 Option 1 Choice}            |
      | text      | Color Selection : ${Option Set Product 3 Option 2 Choice}         |
      | text      | ${Style Colour Size Product 3 Description}                        |
      | text      | ${Option Set Product 3 Option 4 Choice}                           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-328 @CancelOptionProductSale @POS @AUTOMATED @MVP @POSValidatedTest @POSSet3
  Scenario: Cancel Option Product in a Product sale
    Given user signs on as "Sales Assistant"
    When user enters "${Option Set Product 2}" into "Input Box" field
    And user presses "ENT" icon button
    Then "Capture Optionset References" page is shown
    And user selects "${Option Set Product 2 Option 1 Choice}" from "Capture Optionset Choice Option Dropdown 1" combobox
    And user presses "Capture Optionset Next Button" icon button
    And user selects "${Option Set Product 2 Option 2 Choice}" from "Capture Optionset Choice Option Dropdown 2" combobox
    And user presses "Capture Optionset Next Button 2" icon button
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And "${Product U0007 Description}" is not displayed in "Receipt" list
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-327 @VerifyClearOptions @POS @AUTOMATED @MVP @Mobile @POSValidatedTest @POSSet3
  Scenario: Verify Clear Options of Item sale with Multiple Product Options
    Given user signs on as "Sales Assistant"
    When user enters "${Option Set Product 3}" into "Input Box" field
    And user presses "ENT" icon button
    Then "Capture Optionset References" page is shown
    And "${Option Set Product 3 Description}" is displayed in "Capture Optionset Header Panel" panel
    And user enters "${Option Set Product 3 Option 1 Choice}" into "Capture Optionset Text Option" field
    And user presses "Capture Optionset Next Button" icon button
    And user selects "${Option Set Product 3 Option 2 Choice}" from "Capture Optionset Choice Option Dropdown 2" combobox
    And user presses "Capture Optionset Next Button 2" icon button
    And user presses "Capture Optionset Row 3 Product List Item 3" icon button
    #And user presses "Capture Optionset Next Button 3" icon button
    And user presses "Capture Optionset Boolean Option 2" checkbox
    And user presses "Capture Optionset Next Button 4" icon button
    And user presses "Capture Optionset Remove Button 5" icon button
    And user confirms "Capture Optionset Row 4 Product List Item 4" not display     
    And user presses "Capture Optionset Remove Button 4" icon button
    And user presses "Capture Optionset Remove Button 3" icon button
    And user confirms "Capture Optionset Boolean Option 2" not display
    And user presses "Capture Optionset Remove Button 2" icon button
    And user confirms "Capture Optionset Row 3 Product List Item 3" not display
    And user presses "Capture Optionset Remove Button 1" icon button
    And user confirms "Capture Optionset Choice Option Dropdown 2" not display
    Then "Transaction Basket" page is shown
    And "${Option Set Product 3 Description}" is not displayed in "Receipt" list
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-8719 @MultipleOptionProductSale @POS @AUTOMATED @MVP @POSValidatedTest @Sprint40-Week4 @POSSet3
  Scenario: Verify product sale with multiple options
    Given user signs on as "Sales Assistant"
    When user enters "${Option Set Product 4}" into "Input Box" field
    And user presses "ENT" icon button
    Then "Capture Optionset References" page is shown
    And "${Option Set Product 4 Description}" is displayed in "Capture Optionset Header Panel" panel
    And user presses "Option Row1 Column1" icon button
    And user presses "Option Row1 Column2" icon button
    And user presses "Capture Optionset Next Button" icon button
    And user presses "Option Row2 Column1" icon button
    And user presses "Option Row2 Column2" icon button
    And user presses "Capture Optionset Remove Button 2" icon button
    And user presses "Capture Optionset Next Button" icon button
    And user presses "Capture Optionset Next Button 2" icon button
    And "Transaction Basket" page is shown
    And "${Option Set Product 4 Description} ${Option Set Product 4 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                   |
	    | telephone | Tel: ${Store Phone 1}             			                                        |
	    | text      | ${Option Set Product 4 Description}                     ${Option Set Product 4 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-326 @AUTOMATED @MVP
  Scenario: POS - Option Product Sale with Option Prices
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    When user enters "${Style Color Size Option Product}" into "Input Box" field
    And user presses "ENT" icon button
    And "CAPTURE OPTIONSET REFERENCES" page is shown
    And user presses "Yes" button and "CAPTURE OPTIONSET REFERENCES" page shown
    And user presses "Nike Capri Trainer" icon button
    And "Transaction Basket" page is shown
    And "Creamy Candy, �2.75" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Creamy Candy,  �2.75                                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
  
  @PT-11627 @MultipleOptionProductSale @POS @AUTOMATED @Sprint45-Week4 @MVP
  Scenario: Option Set Product - Product selection from Product List where 'Multi-Select' is enabled
   Given user signs on as "Sales Assistant"
   When user enters "${Product Pizza}" into "Input Box" field
   And user presses "ENT" icon button
   Then "Capture Optionset References" page is shown
   And "${Product Pizza Description}" is displayed in "Capture Optionset Header Panel" panel
   And user presses "Pizza Option Row1 Column1" icon button
   And user presses "Pizza Option Row1 Column2" icon button
   And user presses "Capture Optionset Next Button" icon button
   And "Transaction Basket" page is shown
   And "${Product Pizza Description}" is displayed in "Receipt" list
   And "${Product Pizza Price}" is displayed in "Receipt" list
   When user presses "TOTAL" button and "Select Tender" page shown
   And user presses "Cash" button and "Enter Cash Tender Amount" page shown
   And user presses "OK" button and "Await Drawer Closed" page shown
   And receipt display with following details
	   | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
	   | telephone | Tel: ${Store Phone 1}             			               |
	   | text      | ${Product Pizza Description}                          |
       | text      | ${Product Pizza Price}                                | 
	   | item      | TOTAL                                                 |
	   | text      | ${Product Pizza Total}                                |
   When user presses "Close" button on external "Cash Drawer" window
   Then "Transaction Basket" page is shown
   When user presses "SignOff" button
   Then "Enter User" page is shown

 @PT-10805 @POS @AUTOMATED @MVP @AUTOMATED @POSSet @ToBeFixedAutTest
 Scenario: Verify selling products using product list
   Given user signs on as "Sales Assistant"
   And "Transaction Basket" page is shown
   And user presses "Sales" button
   And user presses "More" button
   And user presses "More" button
   And user presses "Product Lists" button
   And user presses "Sell Usual Products" button
   And "CONCESSION PRODUCT LIST SCREEN" page is shown
   And user presses "Select" button
   And "Transaction Basket" page is shown
   And user presses "Sales" button
   And user presses "More" button
   And user presses "More" button
   And user presses "Product Lists" button
   And user presses "Sell Usual Products" button
   And "CONCESSION PRODUCT LIST SCREEN" page is shown
   And user presses "Down" button
   And user presses "Select" button
   And "Transaction Basket" page is shown
   And "KAT VON D Eye Liner" is displayed in "Receipt" list
   And "Shimmy Shimmy" is displayed in "Receipt" list
   And user presses "TOTAL" button and "Select Tender" page shown
   And user presses "Cash" button and "Enter Cash Tender Amount" page shown
   When user presses "OK" button and "Await Drawer Closed" page shown
   Then receipt display with following details
     | item | KAT VON D Eye Liner,£18.00 |
     | item | Shimmy Shimmy,£4.95        |
   And user presses "Close" button on external "Cash Drawer" window
   And user presses "Clear" button on external "Primary Printer" window
   And "Transaction Basket" page is shown
   And user presses "SignOff" button
   And "Enter User" page is shown
   
  @PT-10601 @POS @AUTOMATED
  Scenario: Verify product details when sell a product from Product List
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    When user presses "Product Lists" button and "Concession Product List Screen" page shown
    Then "${PRODUCT_1}" is displayed in "Selection List" list
    And "${PRODUCT_1_DESCRIPTION}" is displayed in "Selection List" list
    And "${PRODUCT_1_PRICE}" is displayed in "Selection List" list
    And "${PRODUCT_2}" is displayed in "Selection List" list
    And "${PRODUCT_2_DESCRIPTION}" is displayed in "Selection List" list
    And "${PRODUCT_2_PRICE}" is displayed in "Selection List" list
    And "${PRODUCT_3}" is displayed in "Selection List" list
    And "${PRODUCT_3_DESCRIPTION}" is displayed in "Selection List" list
    And "${PRODUCT_3_PRICE}" is displayed in "Selection List" list
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown  
   