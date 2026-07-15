Feature: Sales from Rich Product Search

  @PT-1158 @PreSales @RichProductSearch @DunePhase2 @JYSK @ReactPOS @Regression @POS @AUTOMATED @SalesFromRichProductSearch @POSValidatedTest @POSSet3
  Scenario: Sell Style Colour Size item from Rich Product Search
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Long Description Field" field displays the text "${Style Colour Size Product 2 Long Description}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And "Product Info Field" field displays the text "${Style Colour Size Product 2 Extended Description}"
    And user waits "3" seconds
    When user presses "Product Details You've Just Seen Button" icon button
    And "Rich Product Details" page is shown
    And user waits "2" seconds
    And user selects "${Style Colour Size Product 2 Colour 1}" from "Product Color Combo" combobox
    And user presses "PRODUCT SIZE 2 BUTTON" icon button
    And user presses "ADD TO BAG" button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Size 2}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 2}                                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-198 @RichProductSearch @POS @AUTOMATED @SalesFromRichProductSearch @Dunelm @JYSK @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Sell Merchandise item from Rich Product Search
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Merchandise Product 1 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Merchandise Product 1 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Merchandise Product 1 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Merchandise Product 1}"
    And "Product Long Description Field" field displays the text "${Merchandise Product 1 Long Description}"
    And "Product Price Field" field displays the text "${Merchandise Product 1 Price}"
    And "Product Info Field" field displays the text "${Merchandise Product 1 Extended Description}"
    When user presses "ADD TO BAG" button
    Then "Transaction Basket" page is shown
    And "${Merchandise Product 1 Description}" is displayed in "Receipt" list
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}               |
      | telephone | Tel: ${Store Phone 1}                                               |
      | item      | ${Merchandise Product 1 Description},${Merchandise Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-274 @RichProductSearch @POS @AUTOMATED @Dune @MVP @POSValidatedTest @POSSet4
  Scenario: Verify search for products using filter options
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user presses "Product Category 1" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Price Range From" to display
    And user enters "0.50" into "Price Range From" field
    And user enters "10.00" into "Price Range To" field
    And user selects "Fragrance" from "Product Parent Group List" combobox
    And user waits "2" seconds
    And "Rich Product Main Result" page is shown
    And user waits "Product Category Panel" to display
    Then user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-22698 @PreSales @POS
  Scenario: Verify search in Rich Product search by RFID tag, Selected Style and color not matched RFID
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then user presses "Rich Product Search" button and "Rich Product Search" page shown
    And "RFID Scanner" page is shown
    When user enters "${Style Colour Size Product 5 EPC}" into "Scan Text" field
    Then user presses "Test Scanner Scan Button" icon button
    And "Rich Product Search" page is shown
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 5 Description}"
    And user presses "Product Size 2 Button" icon button
    And user presses "ADD TO BAG" button and "Enter Serial Number" page shown
    And user enters "${Style Colour Size Product 5 Serial Number}" into "Input Box" field
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 5 Price}" is displayed in "Receipt" list
    And "RFID Scanner" page is shown
    When user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 5 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-22696 @PreSales @POS
  Scenario: Verify selling mix basket with RFID items and not RFID items
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button and "Sell Unknown Product" page shown
    Then user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "1" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 22912}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And "${Product 22912 Description}" is displayed in "Receipt" list
    And "RFID Scanner" page is shown
    When user enters "${Style Colour Size Product 5 EPC}" into "Scan Text" field
    Then user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 5 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    
  @PT-22692 @PreSales @POS
  Scenario: Verify selling mix basket with RFID items
    Given user signs on as "Sales Assistant"
    And "RFID Scanner" page is shown
    When user enters "${Style Colour Size Product 5 EPC}" into "Scan Text" field
    Then user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 5 Description}" is displayed in "Receipt" list
    And "RFID Scanner" page is shown
    When user enters "${Merchandise Product 22692 Epc}" into "Scan Text" field
    Then user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Merchandise Product 22692 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-21562 @PreSales @POS
  Scenario: Validate user able to notify if the RFID Tag is not configured properly
    Given user signs on as "Sales Assistant"
    And "RFID Scanner" page is shown
    When user enters "${Style Colour Size Product 5 EPC}" into "Scan Text" field
    Then user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 5 Description}" is displayed in "Receipt" list
    And "RFID Scanner" page is shown
    When user enters "${Not Configured Epc}" into "Scan Text" field
    Then user presses "Test Scanner Scan Button" icon button
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1604 @PreSales @RichProductSearch @Dunelm @Dune @DunePhase2 @JYSK @Regression @RI @MVP @ReactPOS @AUTOMATED @POS @POSValidatedTest @POSSet3 @Regresssion
  Scenario: Search for Product in Rich Product Search with full Description
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user presses "Product Category 1" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product Search Result Next Page" to display
    And user waits "Product Search Result Last Page" to display
    And user enters "${Style Colour Size Product 3 Description}" into "Product Search Results Input" field
    And user presses "Full Screen Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 3 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 3}"
    And "Product Long Description Field" field displays the text "${Style Colour Size Product 3 Long Description}"
    And "Product Info Field" field displays the text "${Style Colour Size Product 3 Extended Description}"
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-268 @RichProductSearch @Dunelm @Dune @DunePhase2 @JYSK @RI @MVP @ReactPOS @Regression @AUTOMATED @POS @POSValidatedTest @POSSet3 @Regression
  Scenario: Search for Product in Rich Product Search with full ID
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user presses "Product Category 1" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product Search Result Next Page" to display
    And user waits "Product Search Result Last Page" to display
    And user enters "${Style Colour Size Product 3}" into "Product Search Results Input" field
    And user presses "Full Screen Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 3}"
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1606 @Dunelm @Dune @RI @MVP @ReactPOS @AUTOMATED @POS @ManualVerificaiton @POSValidatedTest @POSSet3 @Regression
  Scenario: Search for Product in Rich Product Search with partial ID
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user presses "Product Category 1" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product search Result Next Page" to display
    And user waits "Product search Result Last Page" to display
    And user waits "2" seconds
    And user enters "709" into "Product Search Results Input" field
    When "Product Search Results Input" field displays the text "709"
    And user presses "Full Screen Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    Then user waits "Product Search Result Item 1" to display
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product ID Field" field contains the text "709"
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1605 @Dunelm @Dune @RI @MVP @ReactPOS @AUTOMATED @POS @ManualVerificaiton @POSValidatedTest @POSSet3 @Regression
  Scenario: Search for Product in Rich Product Search with partial description
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user presses "Product Category 1" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product search Result Next Page" to display
    And user waits "Product search Result Last Page" to display
    And user waits "2" seconds
    When user enters "Crinkle" into "Product Search Results Input" field
    And "Product Search Results Input" field displays the text "Crinkle"
    And user presses "Full Screen Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    Then user waits "Product Search Result Item 1" to display
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field contains the text "Crinkle"
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-15031 @POS
  Scenario: Rich Product Search - Product validation with both Positive and Negative Inventory - Approved
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    When user enters "${Product 191}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    Then user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    When user presses "ADD TO BAG" button and "Transaction Basket" page shown   
    And "Â£10.00" is displayed in "Receipt" list
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    When user enters "${Product 191}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    Then user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And user waits "2" seconds
    Then "Rich Product Details" page is shown
    When user presses "ADD TO BAG" button
    And user waits "2" seconds
    Then "Not Enough Stock" page is shown
    And user presses "Yes" button
    And "User Authorisation" page is shown
    When user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button
    And "User Authorisation Enter Pin" page is shown
    When user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then "Total Label" label displays the text "Â£20.00" 
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button 
    And "Enter Cash Tender Amount" page is shown
    And user presses "OK" button
    And "Printing Receipt" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-16166 @POS @PreSales
  Scenario: Rich Product Search - Scan RFID tag to add product to basket
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user enters "${Sku Product 1 Selling Code}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And user presses "Product Size 1 Button" icon button
    And user presses "ADD TO BAG" button and "Enter Serial Number" page shown
    And user enters "2222" into "Input Box" field
    When user presses "ENT" button
    Then "Transaction Basket" page is shown
    And "${Sku Product 1 Price}" is displayed in "Receipt" list
    And "Total Label" label displays the text "${Sku Product 1 Price}"
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button
    And "Enter Cash Tender Amount" page is shown
    And user presses "OK" button
    And "Printing Receipt" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
  
  @PT-16681 @POS @PreSales	
  Scenario: Rich Product Search - Scan RFID tag to add product to basket
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user enters "3035BF67140AFD40000003E7" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And user presses "Product Size 1 Button" icon button
    And user presses "ADD TO BAG" button and "Transaction Basket" page shown
    And "${Sku Product 1 Price}" is displayed in "Receipt" list
    And "Total Label" label displays the text "${Sku Product 1 Price}"
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button
    And "Enter Cash Tender Amount" page is shown
    And user presses "OK" button
    And "Printing Receipt" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-18021 @RichProductSearch @ReactPOS @POS @AUTOMATED @SalesFromRichProductSearch
  Scenario: Sell SKU items from Rich Product Search - Verify Displaying Correct Product Prices for Style Colour Size items and SKU items in RichProductDetails Page
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 4 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 4 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And user waits "2" seconds
    And "Product Description Field" field displays the text "${Style Colour Size Product 4 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 4}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 4 Maximum SKU Price}"
    And user selects "${Style Colour Size Product 4 Colour 1}" from "Product Color Combo" combobox
    And user presses "Product Size 3 Button" icon button
    And user waits "1" seconds
    And "Product Price Field" field displays the text "${Style Colour Size Product 4 Colour Red Size Large Price}"
    And user presses "Product Size 2 Button" icon button
    And user waits "1" seconds
    And "Product Price Field" field displays the text "${Style Colour Size Product 4 Colour Red Size Medium Price}"
    And user presses "ADD TO BAG" button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 4 SKU Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4 Colour Red Size Medium Price}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4 Colour 1}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4 Size Medium}" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 4 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 4 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And user waits "2" seconds
    And "Product Description Field" field displays the text "${Style Colour Size Product 4 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 4}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 4 Maximum SKU Price}"
    And user selects "${Style Colour Size Product 4 Colour 1}" from "Product Color Combo" combobox
    And user presses "Product Size 1 Button" icon button
    And user waits "1" seconds
    And "Product Price Field" field displays the text "${Style Colour Size Product 4 Price}"
    And user presses "ADD TO BAG" button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 4 SKU Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4 Price}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4 Colour 1}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4 Size S}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                               |
      | telephone | Tel: ${Store Phone 1}                                                               |
      | item      | ${Style Colour Size Product 4 SKU Description},${Style Colour Size Product 4 Price} |
      | item      | Style: ${Style Colour Size Product 4}                                               |
      | item      | Colour: ${Style Colour Size Product 4 Colour 1}                                     |
      | item      | Size: ${Style Colour Size Product 4 Size Medium}                                    |
      | item      | ${Style Colour Size Product 4 SKU Description},${Style Colour Size Product 4 Price} |
      | item      | Style: ${Style Colour Size Product 4}                                               |
      | item      | Colour: ${Style Colour Size Product 4 Colour 1}                                     |
      | item      | Size: ${Style Colour Size Product 4 Size S}                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown    
    
  @PT-11484 @RichProductSearch @POS @AUTOMATED @Regression
  Scenario: Verify rich product search with just Price From To selection
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    And user presses "Product Category 1" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Price Range From" to display
    And user enters "158.00" into "Price Range From" field
    And user enters "159.01" into "Price Range To" field    
    When user presses "full Screen Product Search Button" icon button
    And user waits "2" seconds
    Then "Rich Product Search Result" page is shown
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search Result" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-17773 @POS @AUTOMATED
  Scenario: Verify that selecting various colours in Rich Product Details page resets size selection for Style Colour Size product
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 6}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 6}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 6}"
    And user waits "2" seconds
    And user selects "${Style Colour Size Product 6 Colour 1}" from "Product Color Combo" combobox
    And user selects "${Style Colour Size Product 6 Size 1}" from "Product Size Combo" combobox
    And user waits "1" seconds
    And user selects "${Style Colour Size Product 6 Colour 2}" from "Product Color Combo" combobox
    And user waits "1" seconds
    And user selects "${Style Colour Size Product 6 Size 2}" from "Product Size Combo" combobox
    And user waits "1" seconds
    When user selects "${Style Colour Size Product 6 Colour 1}" from "Product Color Combo" combobox
    And user selects "${Style Colour Size Product 6 Size 1}" from "Product Size Combo" combobox
    And user presses "PRODUCT ADD TO BAG" icon button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 6 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 6}" is displayed in "Receipt" list
    And "${Style Colour Size Product 6 Colour 1}" is displayed in "Receipt" list
    And "${Style Colour Size Product 6 Size 1}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                         |
      | telephone | Tel: ${Store Phone 1}                                                                         |
      | item      | ${Style Colour Size Product 6 Description}                                                                                                                                                                                                          |
      | item      | Style: ${Style Colour Size Product 6}                                                         |
      | item      | Colour: ${Style Colour Size Product 6 Colour 1}                                               |
      | item      | Size: ${Style Colour Size Product 6 Size 1}                                                   |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-17724 @POS @AUTOMATED
  Scenario: Verify that the Style Size products allowed to select Quantity in Rich Product Screen
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Style Size Product 1}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Size Product 1}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Size Product 1}"
    And user waits "2" seconds
    And user presses "Product Size 2 Button" icon button
    And user waits "1" seconds
    And user selects "${Style Size Product 1 Selected Quantity}" from "Product Quantity Combo" combobox
    When user presses "PRODUCT ADD TO BAG" icon button
    Then "Transaction Basket" page is shown
    And "${Style Size Product 1 Description}" is displayed in "Receipt" list
    And "${Style Size Product 1}" is displayed in "Receipt" list
    And "${Style Size Product 1 Size 1}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}   |
      | telephone | Tel: ${Store Phone 1}                                   |
      | item      | ${Style Size Product 1 Description}                     |
      | item      | Style: ${Style Size Product 1}                          |
      | item      | Size: ${Style Size Product 1 Size 1}                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
 
  @PT-17723 @POS @AUTOMATED
  Scenario: Verify that the Style Colour Size products allowed to select Colour and Quantity in Rich Product Screen
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 7 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 7 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 7}"
    And user waits "2" seconds
    And user selects "${Style Colour Size Product 7 Colour 2}" from "Product Color Combo" combobox
    And user waits "1" seconds
    And user selects "${Style Colour Size Product 7 Size 1}" from "Product Size Combo" combobox
    And user waits "1" seconds
    And user selects "${Style Colour Size Product 7 Selected Quantity}" from "Product Quantity Combo" combobox
    When user presses "PRODUCT ADD TO BAG" icon button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 7 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 7}" is displayed in "Receipt" list
    And "${Style Colour Size Product 7 Colour 2}" is displayed in "Receipt" list
    And "${Style Colour Size Product 7 Size 1}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}       |
      | telephone | Tel: ${Store Phone 1}                                       |
      | item      | ${Style Colour Size Product 7 Description}                  |
      | item      | Style: ${Style Colour Size Product 7}                       |
      | item      | Colour: ${Style Colour Size Product 7 Colour 2}             |
      | item      | Size: ${Style Colour Size Product 7 Size 1}                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown