Feature: Item Sale with EPC tag

  @PT-17041 @POS
  Scenario: Offline Validation of Serial Numbers for Normal Retail Transactions Using EPC Tags
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    Then "RFID Scanner" page is shown
    When user enters "${Product 193 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "${Product 193 Description}" is displayed in "Receipt" list
    When user selects "${Product 193 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "More..." button 
    And "Modify Item" page is shown
    And user presses "Change Serial" button and "Enter Serial Number 2" page shown
    And user enters "${Sample Serial Number 2}" into "Input Box" field
		And user presses "ENT" button
    And "Transaction Basket" page is shown
    And "${Product 193 Description}" is displayed in "Receipt" list
    Then "Serial: 654321" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    
    @PT-19502 @POS @ReactPOS @ScanAndSale @RFID
    Scenario: Validate user able to add same product to transaction basket once transaction is completed
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    Then "RFID Scanner" page is shown
    When user enters "${Product 198 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Product 198 Description}" is displayed in "Receipt" list
    Then "RFID Scanner" page is shown
    And user presses "Test Scanner Clear Button" icon button
    When user enters "${Product 199 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Product 199 Description}" is displayed in "Receipt" list
    Then "RFID Scanner" page is shown
    And user presses "Test Scanner Clear Button" icon button
    When user enters "${Product 198 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Product 198 Description}" is displayed in "Receipt" list
    Then "Serial: ${Product 198 Serial Number}" is displayed in "Receipt" list
    And "${Product 199 Description}" is displayed in "Receipt" list
    Then "Serial: ${Product 199 Serial Number}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    Then "RFID Scanner" page is shown
    When user enters "${Product 198 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    @PT-19503 @POS @ReactPOS @ScanAndSale @Void @RFID
    Scenario: Validate user able to use the same RFID tag if Voided
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    And "RFID Scanner" page is shown
    When user enters "${Style Colour Size Product 5 Epc}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 5 Description}" is displayed in "Receipt" list
    Then "RFID Scanner" page is shown
    And user presses "Test Scanner Clear Button" icon button
    When user enters "${Merchandise Product 22692 Epc}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Merchandise Product 22692 Description}" is displayed in "Receipt" list
    Then "RFID Scanner" page is shown
    And user presses "Test Scanner Clear Button" icon button
    When user enters "${Style Colour Size Product 5 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    Then "${Style Colour Size Product 5 Description}" is displayed in "Receipt" list
    And "${Merchandise Product 22692 Description}" is displayed in "Receipt" list
    When user selects "${Style Colour Size Product 5 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Merchandise Product 22692 Description}" is displayed in "Receipt" list
    Then "RFID Scanner" page is shown
    And user presses "Test Scanner Clear Button" icon button
    When user enters "${Style Colour Size Product 5 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 5 Description}" is displayed in "Receipt" list
    And "${Merchandise Product 22692 Description}" is displayed in "Receipt" list
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    @PT-19504 @POS @ReactPOS @ScanAndReturn @RFID
    Scenario: Validate user able to return product by scanning the RFID Tag
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    Then "RFID Scanner" page is shown
    When user enters "${Style Colour Size Product 5 Epc}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Select Reason" page is shown
    And user selects "${Complete Item Return Damaged}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "${Style Colour Size Product 5 Description}" is displayed in "Receipt" list
    And "Serial: ${Style Colour Size Product 5 Serial Number}" is displayed in "Receipt" list
    And "Ret Reason: ${Complete Item Return Damaged}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    @PT-19505 @POS @ReactPOS @ScanAndReturn @ReceiptReturn @RFID
  	Scenario: Perform a complete receipt return by searching using thesearch by serial number
		Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    Then "RFID Scanner" page is shown
    When user enters "${Style Colour Size Product 5 Epc}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 5 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Style Colour Size Product 5 Description},${Style Colour Size Product 5 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search by Serial" button and "Enter Return Serial Number" page shown
    And user enters "${Style Colour Size Product 5 Serial Number}" into "Input Box" field
    And user presses "OK" button and "Select Transaction Details" page shown
    And user presses "Select" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "${Complete Item Return Damaged 30 Days}" from "Selection List" list
    And user presses "OK" button and "Select Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user waits "2" seconds
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user presses "Skip Original Tenders" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Style Colour Size Product 5 Description},-${Style Colour Size Product 5 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    @PT-19609 @POS @ReactPOS @ScanAndSale @RFID
    Scenario: Validate that the user can scan multiple RFID tags without duplicate entries
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    Then "RFID Scanner" page is shown
    When user enters "${Comma Separated Epc Tags Set 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Product 198 Description}" is displayed in "Receipt" list
    And "${Product 199 Description}" is displayed in "Receipt" list
    Then "RFID Scanner" page is shown
    And user presses "Test Scanner Clear Button" icon button
    When user enters "${Comma Separated Epc Tags Set 2}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Product 198 Description}" is displayed in "Receipt" list
    And "${Product 199 Description}" is displayed in "Receipt" list
    And "${Product 200 Description}" is displayed in "Receipt" list
    Then "RFID Scanner" page is shown
    And user presses "Test Scanner Clear Button" icon button
    When user enters "${Comma Separated Epc Tags Set 3}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Product 198 Description}" is displayed in "Receipt" list
    Then "Serial: ${Product 198 Serial Number}" is displayed in "Receipt" list
    And "${Product 199 Description}" is displayed in "Receipt" list
    Then "Serial: ${Product 199 Serial Number}" is displayed in "Receipt" list
    And "${Product 200 Description}" is displayed in "Receipt" list
    And "${Product 201 Description}" is displayed in "Receipt" list
    Then "Serial: ${Product 201 Serial Number}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    @PT-18060 @POS @ReactPOS @ScanAndSale @RichProductSearch @RFID
  	Scenario: Perform a Rich Product Search and return to the basket without adding the product after selling the same product.
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When "RFID Scanner" page is shown
    Then user enters "${Merchandise Product 22692 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Merchandise Product 22692 Selling Code}"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    Then "RFID Scanner" page is shown
    And user presses "Test Scanner Clear Button" icon button
    When user enters "${Merchandise Product 22692 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Transaction Basket" page is shown
    And "${Merchandise Product 22692 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Merchandise Product 22692 Description},${Merchandise Product 22692 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
    @PT-18061 @POS @ReactPOS @ScanAndSale @RichProductSearch @RFID
  	Scenario: Validate that the user can add a product using the rich product search by scanning the RFID tag
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    When "RFID Scanner" page is shown
    Then user enters "${Product 200 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product 200 Selling Code}"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    Then "RFID Scanner" page is shown
    And user presses "Test Scanner Clear Button" icon button
    When user enters "${Product 201 EPC}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product 201 Selling Code}"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "${Product 201 Color}" is selected in "Product Color Combo" combobox
     And user presses "Product Add To Bag" icon button
    When "Transaction Basket" page is shown
    And "${Product 201 Description}" is displayed in "Receipt" list
    And "${Product 201 Color}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 201 Description},${Product 201 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
   