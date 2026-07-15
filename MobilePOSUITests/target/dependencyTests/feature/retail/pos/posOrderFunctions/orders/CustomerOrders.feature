Feature: Order Product with Rich Product Search

  @PT-310 @PreSales @MVP @AUTOMATED @POS @POSValidatedTest @POSSet1
  Scenario: Verify that only orderable products can be orderd
    Given user signs on as "Sales Assistant"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    When user enters "${Product 3}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And button with label "ORDER PRODUCT" is not displayed
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-308 @PreSales @POS @AUTOMATED @MVP @POSValidatedTest @POSSet1 @Regression
  Scenario: Search for product through RPS and then start an order with the product and complete the order using Home Delivery
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    #2.7 Change - Colour is displayed as a read only text
    #When user selects "${Style Colour Size Product 2 Colour 1}" from "Product Color Combo" combobox
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    Then user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      #2.7 Change - PLAT-12651 - Text changed from "Deposit Payment" to "Deposit"
      | text      | Deposit                                                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-3542 @POS @AUTOMATED @Regression @D4 @D4_Testing @Dune @Sprint40-Week4
  Scenario: Verify Capture Customer Details on Order flow - Searched by phone
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    Then user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Phone Number" button and "Enter Phone" page shown
    And user enters "${Search Phone Number}" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Phone" page is shown
    When user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Customer: Mark Harrison                                                         |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-309 @PreSales @Smoke @POS @AUTOMATED @MVP @POSValidatedTest @POSSet1 @Regression
  Scenario: Initiate an Order and then search and add product through RPS and complete the order using Home Delivery
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    #2.7 Change - Colour is displayed as a read only text
    #When user selects "${Style Colour Size Product 2 Colour 1}" from "Product Color Combo" combobox
    And user presses "Product Size 1 Button" icon button
    And user presses "Product Order Product" icon button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Customer: Mark Harrison                                                         |
      | address   | Bluecoats,Hertford,,SG141PB                                                     |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      #2.7 Change - PLAT-12651 - Text changed from "Deposit Payment" to "Deposit"
      | text      | Deposit                                                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-316 @TobeFixedAutTest @POS @AUTOMATED @MVP @POSValidatedTest @POSSet1 @Regression
  Scenario: Perform a transaction with a Mixed basket - having Taken and Ordered products with Home Delivery
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    When user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    #2.7 Change - Colour is displayed as a read only text
    #When user selects "${Style Colour Size Product 2 Colour 1}" from "Product Color Combo" combobox
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And "Order Number" is displayed in "Receipt" list
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    And user enters "${Product 1 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product 1 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Product 1 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Product 1}"
    And "Product Price Field" field displays the text "${Product 1 Price}"
    When user presses "ADD TO BAG" button
    And "Transaction Basket" page is shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "Taken" is displayed in "Receipt" list
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    #2.7 Change - Colour is displayed as a read only text
    #When user selects "${Style Colour Size Product 3 Colour 1}" from "Product Color Combo" combobox
    #2.7 Change - Multiple Sizes listed in combobox instead of buttons
    #And user presses "Product Size 1 Button" icon button
    And user presses "Product Size 1 Button" icon button
    And user presses "Product Order Product" icon button
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    Then "Select Customer Postcode" page is shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    When user presses "Address Delivery Whole Order" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | address   | Bluecoats,Hertford,,SG141PB                                                     |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | text      | TAKEN                                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                                     |
      | text      | Home Delivery Details                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-311 @POS @AUTOMATED @MVP
  Scenario: Place an order from POS <Path: Product Icon Button, Search By Name, Delivery Type = Deliver to Home>
    Given user signs on as "Manager 2"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And user waits "2" seconds
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    #2.7 Change - Colour is displayed as a read only text
    #When user selects "${Style Colour Size Product 2 Colour 1}" from "Product Color Combo" combobox
    And user waits "5" seconds
    When user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | text      | Home Delivery Details                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      #2.7 Change - PLAT-12651 - Text changed from "Deposit Payment" to "Deposit"
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-312 @PreSales @POS @AUTOMATED @MVP
  Scenario: Place an order from POS <Path: Product Icon Button, Search By Name, Delivery Type = Collect at Store>
    Given user signs on as "Manager 2"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And user waits "2" seconds
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    #2.7 Change - Colour is displayed as a read only text
    #When user selects "${Style Colour Size Product 2 Colour 1}" from "Product Color Combo" combobox
    And user waits "5" seconds
    When user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Collect at store" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "${Reason 10% Plus Preauth}" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Store Collection Details                                                        |
      | text      | Store: ${Location}                                                              |
      | text      | Tel: ${Store Phone 1}                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      #2.7 Change - PLAT-12651 - Text changed from "Deposit Payment" to "Deposit"
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-313 @PreSales @POS @AUTOMATED @MVP @Sprint40-Week4
  Scenario: Place an order from POS <Path: Product Icon Button, Search By Name, Delivery Type = Take Now>
    Given user signs on as "Sales Assistant"
    When user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And user waits "2" seconds
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    #2.7 Change - Colour is displayed as a read only text
    #And user selects "${Style Colour Size Product 2 Colour 1}" from "Product Color Combo" combobox
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${CUSTOMER_1_NAME_WITHOUT_TITLE}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user waits "2" seconds
    And user presses "Take Now" icon button
    And user presses "Continue" button and "Confirm Order" page shown
    And user presses "Continue" button
    Then "Select Tender" page is shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Customer: ${Customer 1 Name Without Title}                                      |
      | text | ${Customer 1 Address Line2}                                                     |
      | text | Tel: ${Customer 1 Phone No}                                                     |
      | item | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item | Style: ${Style Colour Size Product 2}                                           |
      | item | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item | Size: ${Style Colour Size Product 2 Size 1}                                     |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-343 @POS @AUTOMATED @MVP @POSValidatedTest @POSSet1 @Regression
  Scenario: Initiate an Order then search and add items with multiple qty through RPS and complete the order using Home Delivery
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    #2.7 Change - Colour is displayed as a read only text
    #And user selects "${Style Colour Size Product 2 Colour 1}" from "Product Color Combo" combobox
    And user presses "Product Size 1 Button" icon button
    And user selects "3" from "Product Quantity Combo" combobox
    And user presses "Product Order Product" icon button
    And "Transaction Basket" page is shown
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2}" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "2" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user enters "MB709SN-1" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
    And "Order Delivery Option Panel" page is shown
    And user presses "Address Delivery Whole Order" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | address   | Bluecoats,Hertford,,SG141PB                           |
      | text      | Tel: ${Customer 1 Phone No}                           |
      | text      | Home Delivery Details                                 |
      | text      | Customer: ${Customer 1 Name Without Title}            |
      | item      | ${Style Colour Size Product 2 Description},3 @ £42.60 |
      | item      | Style: ${Style Colour Size Product 2}                 |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}       |
      | item      | Size: ${Style Colour Size Product 2 Size 1}           |
      | item      | ${Style Colour Size Product 2 Description},2 @ £42.60 |
      | item      | Style: ${Style Colour Size Product 2}                 |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}       |
      | item      | Size: ${Style Colour Size Product 2 Size 1}           |
      | text      | On Order                                              |
      #2.7 Change - PLAT-12651 - Text changed from "Deposit Payment" to "Deposit"
      | text      | Deposit                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    
  @PT-314 @POS @AUTOMATED @Regression
  Scenario: Place an order from POS <Path: Product Icon Button, Search By Name, Delivery Type = Take Now>
    Given user signs on as "Manager 2"
    When user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 4}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 4}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 4 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 4}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 4 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    When user presses "ADD TO BAG" button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 4 SKU Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4 Price}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user waits "2" seconds
    And user presses "Item 1 Collect At Store" icon button
    And user presses "Item 2 Delivery To Home" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Customer: ${Customer 1 Name Without Title}                                          |
      | text | ${Customer 1 Address Line2}                                                         |
      | text | Tel: ${Customer 1 Phone No}                                                         |
      | item | ${Style Colour Size Product 4 SKU Description},${Style Colour Size Product 4 Price} |
      | item | Style: ${Style Colour Size Product 4}                                               |
      | item | Colour: ${Style Colour Size Product 4 Colour 1}                                     |
      | item | Size: ${Style Colour Size Product 4 Size S}                                         |
      | item | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price}     |
      | item | Style: ${Style Colour Size Product 2}                                               |
      | item | Colour: ${Style Colour Size Product 2 Colour 1}                                     |
      | item | Size: ${Style Colour Size Product 2 Size 1}                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
  @PT-3151 @POS @AUTOMATED @Spurs
  Scenario: Order Initiation and Product Selection
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And user waits "2" seconds
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "10" seconds
    #User selects product options
    And user presses "Product Size 1 Button" icon button
    And user waits "10" seconds
    #User adds product to the basket - Order product
    Then user presses "Product Order Product" icon button
    And user waits "10" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    #User captures customer
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    #User selects a delivery option
    When user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7756 @POS @AUTOMATED @Spurs
  Scenario: Add Order With Delivery Options Capture
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And user waits "2" seconds
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    Then user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${CUSTOMER_1_NAME_WITHOUT_TITLE}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    When user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7757 @POS @AUTOMATED @Spurs
  Scenario: Order Initiation and Product Selection Without Delivery
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And user waits "2" seconds
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "3" seconds
    Then user presses "Product Order Product" icon button
    And user waits "3" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    When user presses "Take Now" icon button
    And user presses "Continue" button and "Confirm Order" page shown
    And user presses "Continue" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-3155 @Regression @POS @AUTOMATED @Spurs
  Scenario: Delivery Options Capture
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "3" seconds
    Then user presses "Product Order Product" icon button
    And user waits "3" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    When user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6356 @Regression @POS @AUTOMATED @MVP
  Scenario: Collect Single item from a submitted Order in order functions
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Collect at store" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Store Collection Details                                                        |
      | text      | Store: ${Location}                                                              |
      | text      | Tel: ${Store Phone 1}                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "100" seconds
    Given user signs on as "POS Collect Order"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Collection" button
    And "Search Order" page is shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Order Details" page shown
    And "Order Transaction ID" label displays the text "${retrieveTransaction(1)}"
    And "Reference ID" label displays the text "-"
    And "Creation Date" label displays the text "#{today}"
    And "Customer Number 1" label displays the text "${Customer 1 ID}"
    And "Customer Full Name" label displays the text "Mr. Mark Harrison"
    And "Line Number" label displays the text "1"    
    And "Destination Type" label displays the text "Store Collection"
    And "Order Product ID" label displays the text "${Style Colour Size Product}"
    And user presses "Collect Item" button and "Collection Select Items" page shown
    And "${Style Colour Size Product}" is displayed in "Selection List" list
    And user selects "${Style Colour Size Product}" from "Selection List" list
    And user presses "Select" button
    And user presses "Complete" button
    Then "Transaction Basket" page is shown 
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}  |
      | telephone | Tel: ${Store Phone 1}                                  |
      | text      | Collect: ${Style Colour Size Product}                          |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6358 @Regression @POS @AUTOMATED @MVP
  Scenario: Collect Multiple items from a submitted Order in order functions
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user enters "${SKU Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${SKU Product 1 Description}" is displayed in "Receipt" list
    And "${SKU Product 1 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Collect Whole At Store" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Store Collection Details                                                        |
      | text      | Store: ${Location}                                                              |
      | text      | Tel: ${Store Phone 1}                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "100" seconds
    Given user signs on as "POS Collect Order"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Collection" button
    And "Search Order" page is shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Order Details" page shown
    And "Order Transaction ID" label displays the text "${retrieveTransaction(1)}"
    And "Reference ID" label displays the text "-"
    And "Creation Date" label displays the text "#{today}"
    And "Customer Number 1" label displays the text "${Customer 1 ID}"
    And "Customer Full Name" label displays the text "Mr. Mark Harrison"
    And "Line Number" label displays the text "1"    
    And "Destination Type" label displays the text "Store Collection"
    And "Order Product ID" label displays the text "${Style Colour Size Product}"
    And user presses "Collect Item" button and "Collection Select Items" page shown
    And "${Style Colour Size Product}" is displayed in "Selection List" list
    And "${SKU Product 1}" is displayed in "Selection List" list
    And user presses "Select All" button
    And user presses "Complete" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}  |
      | telephone | Tel: ${Store Phone 1}                                  |
      | text      | Collect: ${Style Colour Size Product}                          |
      | text      | Collect: ${SKU Product 1}                                          |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10850 @POS @AUTOMATED @Sprint39
  Scenario: Verify that user can navigate to the product details page using 'Product Details' button on the menu
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Product Details" button
    And "Rich Product Details" page is shown
    And user waits "10" seconds
    And user presses "Back Button" icon button
    Then "Modify Item" page is shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-14484 @POS @AUTOMATED @MVP @Regression
  Scenario: Place an order from the POS with Store Collection - Zero Deposit <Path: Product Icon Button, Search By Name, Delivery Type = Collect at Store>
    Given user signs on as "Manager 2"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    #2.7 Change - Colour is displayed as a read only text
    #When user selects "${Style Colour Size Product 2 Colour 1}" from "Product Color Combo" combobox
    And user waits "5" seconds
    When user presses "Product Size 3 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Collect at store" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "0% no preauth" from "Selection List" list
    And user presses "OK" button
    And "Confirm Order No Deposit" page is shown
    And user presses "OK" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Store Collection Details                                                        |
      | text      | Store: ${Location}                                                              |
      | text      | Tel: ${Store Phone 1}                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 3}                                     |
      | text      | On Order                                                                        |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown 
    
    @PT-16899 @POS @AUTOMATED @MVP @Regression
    Scenario: Verify Address Delivery option <Path: Product Icon Button, Search By Name, Delivery Type = Deliver to Home>
    Given user signs on as "Manager 2"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-16900 @POS @AUTOMATED @Orders @Orders-HomeDelivery
    Scenario: Place an order from POS with Pickup Point Delivery method <Path: Product Icon Button, Search By Name, Delivery Type = Deliver to Pickup Point>
    Given user signs on as "Manager 2"
    And template "RETAIL_FIXED_POS_PICKUP_POINT_TEMPLATE" is set for the current POS terminal
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Change Pickup Point" icon button and "Pickup Point Delivery Option Panel" page shown
    And user presses "OK" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And receipt display with following details
      | text      | Pickup Point Delivery Details                                                   |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    @PT-16901 @POS @AUTOMATED @MVP @Regression
    Scenario: Place an order from POS by changing Pickup Point address <Path: Product Icon Button, Search By Name, Delivery Type = Deliver to Pickup Point>
    Given user signs on as "Manager 2"
    And template "RETAIL_FIXED_POS_PICKUP_POINT_TEMPLATE" is set for the current POS terminal
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Change Pickup Point" icon button
    And user waits "2" seconds
    And "Pickup Point Delivery Option Panel" page is shown
    And user presses "Change Pickup Address" button and "Capture Customer Name Contact" page shown
    And user presses "OK" button and "Capture Customer Address Prompt" page shown
    And user presses "OK" button and "Pickup Point Delivery Option Panel" page shown
    And user waits "2" seconds
    And user presses "OK" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And receipt display with following details
      | text      | Pickup Point Delivery Details                                                   |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    @PT-16902 @POS @AUTOMATED @MVP @Regression
    Scenario: Place an order from POS with Change Pickup Point option but then Cancel <Path: Product Icon Button, Search By Name, Delivery Type = Deliver to Pickup Point>
    Given user signs on as "Manager 2"
    And template "RETAIL_FIXED_POS_PICKUP_POINT_TEMPLATE" is set for the current POS terminal
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Change Pickup Point" icon button
    And user waits "2" seconds
    And "Pickup Point Delivery Option Panel" page is shown
    And user presses "Cancel" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | text      | Home Delivery Details                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
        
    @PT-16899 @POS @AUTOMATED @MVP
    Scenario: Verify Address Delivery option <Path: Product Icon Button, Search By Name, Delivery Type = Deliver to Home>
    Given user signs on as "Manager 2"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    @PT-17124 @POS @AUTOMATED @MVP @Regression
    Scenario: Place an order from POS  with both enactor.pos.OrderExternalReferenceAllowed and enactor.pos.OrderReferenceAllowed privileges on
    Given user signs on as "Sales Assistant 8"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    When user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    Then "Enter External Reference Number" page is shown
    And user enters "Test External Reference" into "Input Box" field
    And user presses "OK" button
    Then "Enter Reference Number" page is shown
    And user enters "Test New Order Reference" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Delivery to home" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown 
      
    @PT-17125 @POS @AUTOMATED @MVP @Regression 
    Scenario: Place an order from POS With enactor.pos.OrderExternalReferenceAllowed off and enactor.pos.OrderReferenceAllowed on
    Given user signs on as "Sales Assistant 9"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    When user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    Then "Enter Reference Number" page is shown
    And user waits "2" seconds
    And user enters "Test New Order Reference 2" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Delivery to home" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-17126 @POS @AUTOMATED @MVP @Regression
  Scenario: Place an order from POS  with enactor.pos.OrderExternalReferenceAllowed on and enactor.pos.OrderReferenceAllowed off
    Given user signs on as "Sales Assistant 10"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    When user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    Then "Enter External Reference Number" page is shown
    And user enters "Test External Reference 3" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Delivery to home" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-17424 @POS @AUTOMATED @Regression
  Scenario: Verify that user navigates back to 'Search Order' prompt from 'Display Order Details' prompt after trying to collect an order when there are no items to be collected
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Collect at store" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Store Collection Details                              |
      | item      | ${SKU Product 6 Description},${SKU Product 6 Price}   |
      | item      | Style: ${Style Colour Size Product 2}                 |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}       |
      | item      | Size: ${Style Colour Size Product 2 Size 1}           |
      | text      | On Order                                              |
      | text      | Deposit                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #waits for transaction to appear & proccess in EM
    And user waits "100" seconds
    And user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Collection" button
    And "Search Order" page is shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Order Details" page shown
    And "Order Transaction ID" label displays the text "${retrieveTransaction(1)}"
    And "Order Product ID" label displays the text "MB709SN-1"
    And user presses "Collect All" button and "No Order Item To Collect" page shown
    And user presses "OK" button and "Order Details" page shown
    And user presses "Back" button and "Search Order" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11309 @POS @AUTOMATED
  Scenario: Verify the edited customer name, delivery address and contact numbers
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Edit" button and "Capture Customer Name" page shown
    And user enters "${Customer 1 Name Edited}" into "Customer Forename Text" field
    Then user presses "OK" button and "Capture Customer Address" page shown
    And user enters "${Customer 1 Address Line1 Edited}" into "Customer Address Line1 Text" field    
    And user presses "OK" button and "Capture Customer Phone Email" page shown
    Then user enters "01295768257" into "Customer Phone1 Text" field    
    And user presses "OK" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button
    And "Get Delivery Notifications" page is shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And "Customer: ${Customer 1 FullName Edited}" is displayed in "Receipt" list
    And "Address: ${Customer 1 Address Edited}" is displayed in "Receipt" list            
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And the receipt displayed on "Primary Printer" printer with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Tel: ${Customer 1 Phone No Edited}																							|                                                           
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-18668 @POS @AUTOMATED
  Scenario: Validate Customer order Change address in Address Confirmation and Place the order
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And the receipt displayed on "Primary Printer" printer with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-9156 @POS @AUTOMATED
  Scenario: Making a payment after performing a customer order search
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    And user selects "${CUSTOMER_1_NAME_WITHOUT_TITLE}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "100" seconds
    And user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Find Order" button and "Find Order" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user waits "3" seconds
    And user presses "OK" button and "Order Details" page shown
    And user presses "Other" button and "Order Details" page shown
    And user presses "Make Payment" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-15879 @POS @AUTOMATED
  Scenario: Validate the Order Details page shows when load the order using the Transaction ID
    #Precondition: Make sure that an order with ID 'TEST_ORDER_15879' is not already saved in the system before re-running the test  
    Given user signs on as "Sales Assistant 9"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
  	Then "Enter Reference Number" page is shown
    And user enters "	TEST_ORDER_15879" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown    
    And "Order Number" is displayed in "Receipt" list
    When user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Collect at store" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user enters "Collect at the store next week" into "Order Note Input Box" field    
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Store Collection Details                              |
      | item      | ${SKU Product 6 Description},${SKU Product 6 Price}   |
      | item      | Style: ${Style Colour Size Product 2}                 |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}       |
      | item      | Size: ${Style Colour Size Product 2 Size 1}           |
      | text      | On Order                                              |
      | text      | Deposit                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #waits for transaction to appear & proccess in EM
    And user waits "100" seconds
    And user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Find Order" button
    And "Enter Order ID" page is shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Order Details" page shown
    #Verifiy order header details
    And "Order ID" label displays the text "TEST_ORDER_15879"
    And "Order Transaction ID" label displays the text "${retrieveTransaction(1)}"
   	And "Reference ID" label displays the text "-"
    And "Creation Date" label displays the text "#{today}"
    And "Customer Number" label displays the text "${Customer 1 ID}"
    And "Customer Full Name" label displays the text "Mr. Mark Harrison"
    #verify order item details
    And "Line Number" label displays the text "1"    
    And "Destination Type" label displays the text "Store Collection"
    And "Order Product ID" label displays the text "${SKU Product 6}"
    #And "Order Product Description" field displays the text "${SKU Product 6 Description}"
    #And "Order Product Price" label displays the text "£42.60"
    #verify payment details
    And "Voided" label displays the text "-"
    And "Payment Number" label displays the text "1"
    And "Payment Status" label displays the text "Payment Taken"
    And "Payment Type" label displays the text "Cash"
    And "Submitted Date" label displays the text "#{today}"
    And "Submitted Amount" label displays the text "£4.26"
    #verify order notes
    And "Created By" label displays the text "17125"
    And "Created On" label displays the text "#{today}"
    And "Order Note" label displays the text "Collect at the store next week"
    #verify total
    And "Order Total" label displays the text "£42.60"
    And "Order Balance Due" label displays the text "£38.34"     
    And user presses "Back" button and "Enter Order ID" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-21957 @POS @AUTOMATED @Regression
  Scenario: Validate Real-Time Note Update in Find Order Flow
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    #and "Order Country From Postcode" page shown
    #And user presses "OK" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #waits for transaction to appear & proccess in EM
    And user waits "100" seconds
    And user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Find Order" button
    And "Enter Order ID" page is shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Order Details" page shown
    And "Order Transaction ID" label displays the text "${retrieveTransaction(1)}"
    And "Reference ID" label displays the text "-"
    And "Creation Date" label displays the text "#{today}"
    And "Customer Number 1" label displays the text "${Customer 1 ID}"
    And "Line Number" label displays the text "1"
    And "Destination Type" label displays the text "Address Delivery"
    And "Order Product ID" label displays the text "${Style Colour Size Product}"
    And "Voided" label displays the text "-"
    And "Payment Number" label displays the text "1"
    And "Payment Status" label displays the text "Payment Taken"
    And "Payment Type" label displays the text "Cash"
    And "Submitted Date" label displays the text "#{today}"
    And "Submitted Amount" label displays the text "£4.26"
    And user presses "Other" button and "Order Details" page shown
    And user presses "Add Note" button and "Enter Order Note Data" page shown
    And user enters "Test Note 1" into "Add Note Description Field" field
    And user presses "OK" button and "Order Details" page shown
    And "Created By" label displays the text "M1"
    And "Created On" label displays the text "#{today}"
    And "Order Note" label displays the text "Test Note 1"
    And "Order Total" label displays the text "£42.60"
    And "Order Balance Due" label displays the text "£38.34"
    And user presses "Back" button
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-353 @POS @AUTOMATED
  Scenario: Validate the Order Details page shows when load the order using the Order number
    #Precondition: Make sure that an order with ID 'TEST_ORDER_353' is not already saved in the system before re-running the test
    Given user signs on as "Sales Assistant 9"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
  	Then "Enter Reference Number" page is shown
    And user enters "TEST_ORDER_353" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown    
    And "Order Number" is displayed in "Receipt" list
    And user presses "Sales" button
    When user presses "QTY Sale" button
    Then "Enter QTY" page is shown
    And user enters "4" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    When user presses "QTY Sale" button
    Then "Enter QTY" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${SKU Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    When user presses "QTY Sale" button
    Then "Enter QTY" page is shown
    And user enters "2" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${SKU Product 10}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button
    And "Select Customer" page is shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Item 1 Take Now" icon button
    And user presses "Item 2 Collect At Store" icon button
    And user presses "Item 3 Delivery To Home" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "100%" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window      
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    #waits for transaction to appear & proccess in EM
    And user waits "100" seconds  
    And user signs on as "Manager 2"    
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Find Order" button
    Then "Enter Order ID" page is shown
    And user enters "TEST_ORDER_353" into "Input Box" field
    And user presses "OK" button and "Order Details" page shown
    #Verifiy order header details
    And "Order ID" label displays the text "TEST_ORDER_353"
   	And "Reference ID" label displays the text "-"
    And "Creation Date" label displays the text "#{today}"
    And "Customer Number 1" label displays the text "${Customer 1 ID}"
    And "Customer Full Name" label displays the text "Mr. Mark Harrison"
    #verify order item details
    And "Line Number" label displays the text "1"    
    And "Destination Type" label displays the text "Store Collection"
    And "Order Product ID" label displays the text "${SKU Product 1}"
    #And "Order Product Description" field displays the text "${SKU Product 1 Description}"
    #And "Order Product Price" label displays the text "£62.28"
    #verify total
    And "Order Total" label displays the text "£133.44"
    And "Order Balance Due" label displays the text "£0.00"     
    And user presses "Back" button and "Enter Order ID" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-18665 @POSCustomerOrders @POS
  Scenario: Validate Customer order no change of Delivery Address in Address Confirmation and Place the order
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user enters "${Customer 1 Name}" into "Customer Forename Text" field
    And user enters "${Customer 1 Surname}" into "Customer Surname Text" field
    And user enters "${Customer 1 Organisation}" into "Customer Organisation Text" field
    And user selects "${Customer 1 Title}" from "Customer Title Dropdown" combobox
    And user enters "${Customer 1 Initials}" into "Customer Initials Text" field
    And user selects "${Customer 1 Sex}" from "Customer Sex Dropdown" combobox
    And user presses "OK" button and "Capture Customer Address" page shown
    And user enters "${Customer 1 Address Organisation}" into "Customer Address Organisation Text" field
    And user enters "${Customer 1 Address Line1}" into "Customer Address Line1 Text" field
    And user enters "${Customer 1 Address Line2}" into "Customer Address Line2 Text" field
    And user enters "${Customer 1 Address Line3}" into "Customer Address Line3 Text" field
    And user enters "${Customer 1 Address Town}" into "Customer Town Text" field
    And user enters "${Customer 1 Address County}" into "Customer County Text" field
    And user enters "${Customer 1 Address Postcode}" into "Customer Postcode Field" field
    And user presses "OK" button and "Capture Customer Phone Email" page shown
    And user enters "${Customer 1 Contact Phone1 No}" into "Customer Phone1 Text" field
    And user enters "${Customer 1 Contact Phone2 No}" into "Customer Phone2 Text" field
    And user enters "${Customer 1 Contact Mobile Phone No}" into "Customer Mobile Text" field
    And user enters "${Customer 1 Contact Fax No}" into "Customer Fax Text" field
    And user enters "${Customer 1 Contact Email}" into "Customer Email Text Optional" field
    And user enters "${Customer 1 Contact Phone1 No}" into "Customer Phone1 Text" field
    And user presses "OK" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And "Customer: ${Customer 1 Full Name}" is displayed in "Receipt" list
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And the receipt displayed on "Primary Printer" printer with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown 

  @PT-18667 @POS @AUTOMATED
  Scenario: Validate Collection Store Locations list is getting filtered when the user starts typing in the filter input field on the Collection Store selection prompt
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    When user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Change store" icon button and "Collection Location Selection Prompt" page shown
    And user enters "nyc" into "Input Box" field
    And "${Location 4}" is displayed in "Store Collection Location List" list
    And "${Location 3}" is not displayed in "Store Collection Location List" list
    And "${Location 2}" is not displayed in "Store Collection Location List" list
    And user enters "demo" into "Input Box" field
    And "${Location 2}" is displayed in "Store Collection Location List" list
    And "${Location 3}" is not displayed in "Store Collection Location List" list
    And "${Location 4}" is not displayed in "Store Collection Location List" list
    And user selects "${Location 2}" from "Store Collection Location List" list
    And user presses "OK" button and "Order Delivery Option Panel" page shown
    And user presses "Change store" icon button and "Collection Location Selection Prompt" page shown
    And user enters "united" into "Input Box" field
    And "${Location 4}" is not displayed in "Store Collection Location List" list
    And "${Location 3}" is not displayed in "Store Collection Location List" list
    And "${Location 2}" is not displayed in "Store Collection Location List" list
    And user enters "enactor" into "Input Box" field
    And "${Location 2}" is displayed in "Store Collection Location List" list
    And "${Location 3}" is displayed in "Store Collection Location List" list
    And "${Location 4}" is not displayed in "Store Collection Location List" list
    And user selects "${Location 3}" from "Store Collection Location List" list
    And user presses "OK" button and "Order Delivery Option Panel" page shown
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "0% no preauth" from "Selection List" list
    And user presses "OK" button
    And "Confirm Order No Deposit" page is shown
    And user presses "OK" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Store Collection Details                                                        |
      | text      | Store: ${Location}                                                              |
      | text      | Tel: ${Store Phone 1}                                                           |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-554 @POSCustomerOrders @POS
  Scenario: Cancel Item Button availability on POS
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "2" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And user waits "2" seconds
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user waits "2" seconds
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user waits "2" seconds
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Home Delivery Details                                                           |
      | text      | Customer: Mark Harrison                                                         |
      | address   | Bluecoats,Hertford,,SG141PB                                                     |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | item      | Style: ${Style Colour Size Product 2}                                           |
      | item      | Colour: ${Style Colour Size Product 2 Colour 1}                                 |
      | item      | Size: ${Style Colour Size Product 2 Size 1}                                     |
      | text      | On Order                                                                        |
      | text      | Deposit                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "90" seconds
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Find Order" button
    And "Enter Order ID" page is shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Order Details" page shown
    And user waits "5" seconds
    And "Order Transaction ID" label displays the text "${retrieveTransaction(1)}"
    And "Reference ID" label displays the text "-"
    And "Creation Date" label displays the text "#{today}"
    And "Customer Number 1" label displays the text "${Customer 1 ID}"
    And "Line Number" label displays the text "1"
    And "Destination Type" label displays the text "Address Delivery"
    And user waits "5" seconds
    And user presses "Cancel Item" button and "Customer Order Cancel Item Pop Up" page shown
    And user waits "5" seconds
    And user presses "OK" button and "Select Items" page shown
    And user waits "5" seconds
    And user presses "Cancel Item" button
    And user waits "5" seconds
    Then user presses "Complete" button and "Customer Order Cancel Info Pop Up" page shown
    And user waits "5" seconds
    And user presses "OK" button
    And user waits "5" seconds
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-602 @POSCustomerOrders @POS
  Scenario: Cancel All Button availability on POS
    Given user signs on as "Manager 2"
    When user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 4}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 4}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 4 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 4}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 4 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    When user presses "ADD TO BAG" button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "2" seconds
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 4 SKU Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 4 Price}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${CUSTOMER_1_NAME_WITHOUT_TITLE}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user waits "2" seconds
    And user presses "Item 1 Collect At Store" icon button
    And user waits "2" seconds
    And user presses "Item 2 Delivery To Home" icon button
    And user waits "2" seconds
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Customer: ${Customer 1 Name Without Title}                                          |
      | text | ${Customer 1 Address Line2}                                                         |
      | text | Tel: ${Customer 1 Phone No}                                                         |
      | item | ${Style Colour Size Product 4 SKU Description},${Style Colour Size Product 4 Price} |
      | item | Style: ${Style Colour Size Product 4}                                               |
      | item | Colour: ${Style Colour Size Product 4 Colour 1}                                     |
      | item | Size: ${Style Colour Size Product 4 Size S}                                         |
      | item | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price}     |
      | item | Style: ${Style Colour Size Product 2}                                               |
      | item | Colour: ${Style Colour Size Product 2 Colour 1}                                     |
      | item | Size: ${Style Colour Size Product 2 Size 1}                                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "90" seconds
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Find Order" button
    And "Enter Order ID" page is shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Order Details" page shown
    And user waits "5" seconds
    And "Order Transaction ID" label displays the text "${retrieveTransaction(1)}"
    And "Reference ID" label displays the text "-"
    And "Creation Date" label displays the text "#{today}"
    And "Customer Number 1" label displays the text "${Customer 1 ID}"
    And "Line Number" label displays the text "1"
    And user presses "Cancel All" button and "Customer Order Cancel All Pop Up" page shown
    And user waits "2" seconds
    And user presses "OK" button and "Customer Order Cancel Info Pop Up" page shown
    And user waits "2" seconds
    And user presses "OK" button
    And user waits "2" seconds
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown
