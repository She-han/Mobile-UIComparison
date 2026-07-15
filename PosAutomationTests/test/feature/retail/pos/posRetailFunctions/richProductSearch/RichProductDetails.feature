Feature: Rich Product Details

  @PT-460 @RichProductSearch @Dune @MVP @RI @ReactPOS @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Rich Product Details - Verify 'Suggested With' and 'You've Just Seen' tabs
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "Rose Print Tea Dress" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Rose Print Tea Dress"
    And user waits "5" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And "Rich Product Search Result" page is shown
    And user presses "Product Search Result Item 1" icon button
    And user waits "7" seconds
    And "Rich Product Details" page is shown
    When user presses "Product Details Suggested With Button" icon button
    And user waits "Suggested With Tab Result Item 1" to display
    And user presses "Product Details You've Just Seen Button" icon button
    And user waits "You Have Just Seen Result Item 1" to display
    And user presses "Back Button" icon button
    Then "Rich Product Search Result" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Empty Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-269 @Dune @Dunelm @MVP @RI @ReactPOS @POS @AUTOMATED @POSValidatedTest @POSSet4 @SKU
  Scenario: Verify stock check on nearby store
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user enters "Rose Print Tea Dress" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Rose Print Tea Dress"
    And user waits "Product Search Result Item 1" to display
    And "Rich Product Search Result" page is shown
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    #2.7 Change - Colour is displayed as a read only text
    #And user selects "Navy Blue" from "Rich Product Colour Select" combobox
    And user presses "Product Size 1 Button" icon button
    And user presses "STOCK CHECK" button and "Rich Product Stock In Nearby Stores" page shown
    And user enters "Enactor Store" into "Stock Check Text Area" field
    And user presses "Location Search Button" icon button
    When user presses "Back Button" icon button
    Then "Rich Product Details" page is shown
    And user presses "Larger Image" icon button
    And user waits "Larger Popup Image" to display
    When user presses "Back Button" icon button
    Then "Rich Product Search Result" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-8130 @Dune @Dunelm @MVP @RI @ReactPOS @POS @AUTOMATED @POSValidatedTest @POSSet4 @Non-SKU
  Scenario: Verify non-SKU stock check on nearby store
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user enters "Figs and Leaves" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Figs and Leaves"
	  And user waits "1" seconds
    And user waits "Product Search Result Item 2" to display
    And "Rich Product Search Result" page is shown
	  And user waits "2" seconds
    And user presses "Product Search Result Item 2" icon button
    And "Rich Product Details" page is shown
    And user waits "2" seconds
    And user presses "STOCK CHECK" button and "Rich Product Stock In Nearby Stores" page shown
    And user enters "Enactor Store" into "Stock Check Text Area" field
    And user presses "Location Search Button" icon button
    When user presses "Back Button" icon button
    Then "Rich Product Details" page is shown
    And user presses "Larger Image" icon button
    And user waits "Larger Popup Image" to display
    When user presses "Back Button" icon button
    Then "Rich Product Search Result" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-23341 @POSRichProductDetails @Regression @POS
  Scenario: Validate suggested item views at nearby stores screen
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user enters "Figs and Leaves" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Figs and Leaves"
	And user waits "1" seconds
    And user waits "Product Search Result Item 2" to display
    And "Rich Product Search Result" page is shown
	And user waits "2" seconds
    And user presses "Product Search Result Item 2" icon button
    And "Rich Product Details" page is shown
    And user waits "2" seconds
    And user presses "STOCK CHECK" button and "Rich Product Stock In Nearby Stores" page shown
    When user presses "Suggested With Tab Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And user waits "2" seconds
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23387 @POSRichProductDetails @Regression @POS
  Scenario: Validate just seen item views at nearby stores screen
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user enters "Figs and Leaves" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Figs and Leaves"
		And user waits "1" seconds
    And user waits "Product Search Result Item 2" to display
    And "Rich Product Search Result" page is shown
		And user waits "2" seconds
    And user presses "Product Search Result Item 2" icon button
    And "Rich Product Details" page is shown
    And user waits "2" seconds
    And user presses "STOCK CHECK" button and "Rich Product Stock In Nearby Stores" page shown
    And user presses "Product Details You've Just Seen Tab Button" icon button
    And user waits "You Have Just Seen Result Item 1" to display
    When user presses "You Have Just Seen Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And user waits "2" seconds
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
  @PT-5201 @TobeFixedAutTest @POS @AUTOMATED @RichProductSearch @Dunelm
  Scenario: Rich Product Search Return to Basket without adding Product
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product 2}"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And user presses "Bag Button Rich Product" icon button
    Then "Transaction Basket" page is shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 2 Description}" is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-266 @TobeFixedAutTest @POS @AUTOMATED @Spurs
  Scenario: Verify Search for Products with partial and full ID or description
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "MB709SN" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "MB709SN"
    And user waits "5" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "5" seconds
    And "Rich Product Search Result" page is shown
    And user presses "Product Search Result Item 1" icon button
    And user waits "5" seconds
    And "Rich Product Details" page is shown
    And user presses "Back Button" icon button
    And "Rich Product Search Result" page is shown
    #######-------- Verifying with Partial ID ----------#####################
    When user enters "709SN" into "Product Search Results Input" field
    And user presses "Full Screen Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "709SN"
    And user waits "5" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "5" seconds
    And "Rich Product Search Result" page is shown
    #######-------- Verifying with Product description ----------#####################
    When user enters "Rose Print Tea Dress" into "Product Search Results Input" field
    And user presses "Full Screen Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Rose Print Tea Dress"
    And user waits "5" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "5" seconds
    And "Rich Product Search Result" page is shown
    #######-------- Verifying with Products under the Dress category ----------#####################
    When user enters "Dress" into "Product Search Results Input" field
    And user presses "Full Screen Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    ########-----Lists all the products under the dress category-----##############
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Back Button" icon button
    And "Empty Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-267 @PreSales @POS @AUTOMATED @Spurs
  Scenario: Click on a category to view results and Verify
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button and "Rich Product Search" page shown
    And user presses "Product Category 1" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product Search Result Next Page" to display
    And user waits "Product Search Result Last Page" to display
    And user presses "Back Button" icon button
    And "Rich Product Search" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10492 @POS @AUTOMATED
  Scenario: Rich Product Detail - Adding single product from Suggested With tab to the basket
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "Kat Von D" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Kat Von D"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And "Rich Product Search Result" page is shown
    And user presses "Product Search Result Item 1" icon button
    And user waits "4" seconds
    And "Rich Product Details" page is shown
    When user presses "Product Details Suggested With Button" icon button
    And user waits "Suggested With Tab Result Item 1" to display
    And "Rich Product Details" page is shown
    When user presses "Suggested With Tab Result Item 1" icon button
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And user presses "Product Add To Bag" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10493 @POS @AUTOMATED
  Scenario: Rich Product Detail - Adding single product from You have Just Seen tab to the basket
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "Rose Print Tea Dress" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Rose Print Tea Dress"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And "Rich Product Search Result" page is shown
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "Kat Von D" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Kat Von D"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And "Rich Product Search Result" page is shown
    And user presses "Product Search Result Item 1" icon button
    And user waits "4" seconds
    And "Rich Product Details" page is shown
    And user presses "Product Details You've Just Seen Button" icon button
    And user waits "You Have Just Seen Result Item 1" to display
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And user presses "You Have Just Seen Result Item 1" icon button
    And "Rich Product Details" page is shown
	And user waits "2" seconds
    And user presses "Product Size 2 Button" icon button
    And user waits "2" seconds
    And user presses "Product Add To Bag" icon button
    And user waits "4" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10494 @POS @AUTOMATED
  Scenario: Rich Product Detail - Adding multiple quantity of products from Suggested With tab to the basket
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "Kat Von D" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Kat Von D"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And "Rich Product Search Result" page is shown
    And user presses "Product Search Result Item 1" icon button
    And user waits "4" seconds
    And "Rich Product Details" page is shown
    When user presses "Product Details Suggested With Button" icon button
    And user waits "Suggested With Tab Result Item 1" to display
    And "Rich Product Details" page is shown
    When user presses "Suggested With Tab Result Item 1" icon button
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And user selects "2" from "Product Quantity Combo" combobox
    And user presses "Product Add To Bag" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10495 @POS @AUTOMATED
  Scenario: Rich Product Detail - Adding multiple quantity of products from You have Just Seen tab to the basket
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "Rose Print Tea Dress" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Rose Print Tea Dress"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And "Rich Product Search Result" page is shown
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "Kat Von D" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "Kat Von D"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And "Rich Product Search Result" page is shown
    And user presses "Product Search Result Item 1" icon button
    And user waits "4" seconds
    And "Rich Product Details" page is shown
    And user presses "Product Details You've Just Seen Button" icon button
    And user waits "You Have Just Seen Result Item 1" to display
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And user presses "You Have Just Seen Result Item 1" icon button
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And user presses "Product Size 2 Button" icon button
    And user waits "2" seconds
    And user selects "2" from "Product Quantity Combo" combobox
    And user presses "Product Add To Bag" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

	@PT-18219 @AUTOMATED
  Scenario: Pos - Validate the correct color is displayed on the product details page when viewing the details of SKU product with more size from the basket
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    When user enters "${SKU Product 8}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${SKU Product 8 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Product Details" button
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And "Navy" is selected in "Product Color Combo" combobox
    And user presses "ADD TO BAG" button
    When "Transaction Basket" page is shown
    And "${SKU Product 8 Colour 1}" is displayed in "Receipt" list
    And "${SKU Product 8 Size 1}" is displayed in "Receipt" list    
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}   |
      | telephone | Tel: ${Store Phone 1}                                   |
      | item      | ${SKU Product 8 Description} |
      | text      | ${SKU Product 8 Price}                                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-18224 @AUTOMATED
  Scenario: Pos - Validate the correct color is displayed on the product details page when viewing the details of SKU product with one size from the basket
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    When user enters "${SKU Product 9}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${SKU Product 9 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Product Details" button
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And "${SKU Product 9 Colour 1}" is selected in "Product Color Combo" combobox
    And user selects "Silver" from "Product Color Combo" combobox
    And user presses "Product Size 1 Button" icon button                        
    And user presses "ADD TO BAG" button
    When "Transaction Basket" page is shown
    And "${SKU Product 9 Colour 1}" is displayed in "Receipt" list
    And "${SKU Product 9 Size 1}" is displayed in "Receipt" list    
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}   |
      | telephone | Tel: ${Store Phone 1}                                   |
      | item      | ${SKU Product 9 Description} |
      | text      | ${SKU Product 9 Price}                                  | 
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown