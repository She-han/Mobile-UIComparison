Feature: Item Sale
  Sale item

  @PT-202 @PreSales @ItemSale_Cash @POS @AUTOMATED @Dune @POSValidatedTest @POSSet3
  Scenario: Sale of SKU that has a style - Cash
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1371 @PreSales @ItemSaleWith10Items_Cash @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Sale with multiple items - 10 items
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 5}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 6}" into "Input Box" field
    And user presses "ENT" icon button
    And user waits "2" seconds
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" icon button
    And user waits "2" seconds
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" icon button
    And user waits "2" seconds
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" icon button
    And user waits "2" seconds
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Product 4 Description},${Product 4 Price}           |
      | item      | ${Product 5 Description},${Product 5 Price}           |
      | item      | ${Product 6 Description},${Product 6 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-378 @ItemSaleWithCashAndCardTenders @POS @Dunelm @MVP @RI @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Item sale transaction with cash and card tenders
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "ENT" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" icon button
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" icon button
    And "Await Drawer Closed" page is shown
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | Cash UK,-£5.00                              |
      | item | Mastercard,-£5.00                           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-337 @ItemSaleTenderByCashWithChange @POS @AUTOMATED @POSValidatedTest @POSSet3 @Regression
  Scenario: Item sale transaction with cash tender and change
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "£50.00" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 3 Description},${Product 3 Price} |
      | item | Cash UK,-£50.00                             |
      | item | Change (Cash UK),£44.00                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-199 @PreSales @ItemSale_StyleColourSizeCode @AUTOMATED @Dune @Harrods @JIRA @MVP @Mobile @RI @Support @POS @POSValidatedTest @POSSet3
  Scenario: Sale of StyleColourSize code
    Given user signs on as "Sales Assistant"
    And user enters "${Style Colour Size Product 1}" into "Input Box" field
    When user presses "ENT" icon button
    #When "Sell Style Colour Item" page is shown
    And "Select Colour" page is shown
    Then user selects "Yellow Undertone" from "Selection List" list
    And user presses "OK" button and "Select Size" page shown
    When user selects "2" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | item      | ${Style Colour Size Product 1 Description},${Style Colour Size Product 1 Price} |
      | text      | -£12.00                                                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-201 @PreSales @ItemSale_StyleSizeCode @AUTOMATED @Dune @JIRA @MVP @RI @POS @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Sale of StyleSize code
    Given user signs on as "Sales Assistant"
    And user enters "${Style Size Product 1}" into "Input Box" field
    When user presses "ENT" icon button
    And "Select Size" page is shown
    When user selects "Medium" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}             |
      | telephone | Tel: ${Store Phone 1}                                             |
      | item      | ${Style Size Product 1 Description},${Style Size Product 1 Price} |
      | text      | -£15.00                                                           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-248 @AUTOMATED @POS @HOF @JYSK @POSValidatedTest @POSSet3
  Scenario: Display price per line in bag
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Price}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Price}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user selects "${Product 3 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    When user selects "20% Item Discount" from "Selection List" list
    Then user presses "OK" button and "Transaction Basket" page shown
    And "20% Item Discount 20%" is displayed in "Receipt" list
    And "-£1.00" is displayed in "Receipt" list
    And user enters "${Merchandise Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Merchandise Product 1 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Price Override Up" from "Selection List" list
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "£22.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Merchandise Product 1 Description} £22.00" is displayed in "Receipt" list
    And "Price Override Up ( £20.00 to £22.00 )" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Merchandise Product 1 Description},£22.00           |
      | text      | Override (£20.00 to £22.00)                           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-905 @Dunelm @POS @AUTOMATED @POSValidatedTest @POSSet3 @TPE-9484
  Scenario: Item Sale with On Screen Keyboard
    Given user signs on as "Sales Assistant"
    And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User With Keyboard" page is shown
    And user presses "Keyboard Number 2 Button" icon button
    When user presses "Keyboard Enter Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "Toggle Alpha Keyboard" icon button
    And "CRM Capture Customer Details Hide Keyboard" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-13840 @ReactPOS @POS @AUTOMATED
  Scenario: React POS specific - Item Sale with On Screen Keyboard
    Given user signs on as "Sales Assistant"
    And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User With Keyboard" page is shown
    And user presses "Keyboard Number 2 Button" icon button
    When user presses "Keyboard Enter Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "Toggle Alpha Keyboard" icon button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-246 @JYSK @Regression @POS @AUTOMATED @POSValidatedTest @POSSet4 @TPE-9484
  Scenario: Verify Running Total
    Given user signs on as "Sales Assistant"
    And "Total Label" label displays the text "£0.00"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "Total Label" label displays the text "£10.00"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "Total Label" label displays the text "£28.00"
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | Cash UK,-£28.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-200 @PreSales @POS @Airport_Harrods @Dune @Harrods @JYSK @MVP @Mobile @RI @ReactPOS @Support @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Sale of Merchandise Product
    Given user signs on as "Pos Operator"
    And user enters "${Merchandise Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Merchandise Product 1 Description}" is displayed in "Receipt" list
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}               |
      | telephone | Tel: ${Store Phone 1}                                               |
      | item      | ${Merchandise Product 1 Description},${Merchandise Product 1 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1920 @AUTOMATED @Regression @JYSK @POS @POSValidatedTest @POSSet3
  Scenario: Cancel half way through tender and return to sale
    Given user signs on as "POS Operator"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "Cancel" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1943 @AUTOMATED @Regression @JYSK @POS @POSValidatedTest @POSSet3
  Scenario: Over tender by entering the over-tender amount
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user enters "2000" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Cash UK -£20.00" is displayed in "Receipt" list
    And "Change (Cash UK) £2.00" is displayed in "Receipt" list
    And user presses "Close" button on external "Cash Drawer" window
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | Cash UK,-£20.00                             |
      | item | Change (Cash UK),£2.00                      |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @SP-2503 @AUTOMATED @POS @Spurs
  Scenario: Retail sale transaction for a tshirt and order collection
    Given user signs on as "Sales Assistant"
    When user enters "${Personalised Product 1}" into "Input Box" field
    And user presses "ENT" icon button
    And "Capture Optionset References" page is shown
    And user presses "Garment Personalisation Yes" icon button
    And user presses "Premier League White" icon button
    And user presses "Own Personalisation" icon button
    And user presses "Numbers Only" icon button
    And user enters "77" into "Text Input" field
    And user presses "Next" icon button
    And user presses "Additional Badges Yes" icon button
    And user presses "Europa Badge" icon button
    And "Transaction Basket" page is shown
    And "${Personalised Product 1 Price}" is displayed in "Receipt" list
    And "${Personalised Product 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    #And user presses "OK" button and "Select Collection Point" page shown
    #Then user selects "Wait" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Personalised Product 1 Description},${Personalised Product 1 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "5" seconds
    And user signs on as "Sales Assistant"
    And user presses "More" button and "Transaction Basket" page shown
    And user presses "Manage Print Queue" button and "Enter Number of requests" page shown
    And user waits "3" seconds
    And user presses "Collection Status" button and "Enter Transaction Id" page shown
    And user waits "3" seconds
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Select Option" page shown
    And user waits "10" seconds
    And user presses "In Progress" button and "Enter Number of requests" page shown
    And user waits "10" seconds
    And user presses "Collection Status" button and "Enter Transaction ID" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user waits "3" seconds
    And user presses "OK" button and "Select Option" page shown
    And user waits "3" seconds
    And user presses "Complete" button and "Enter Number of requests" page shown
    And user waits "3" seconds
    And user presses "Collection Status" button and "Enter Transaction ID" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Select Option" page shown
    And user waits "3" seconds
    And user presses "Collect" icon button
    And user waits "3" seconds
    And "Enter Number of requests" page is shown
    And user presses "Back" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @SP-2504 @AUTOMATED @POS @Spurs
  Scenario: Return transaction for a tshirt and order collection
    Given user signs on as "Sales Assistant"
    When user enters "${Personalised Product 1}" into "Input Box" field
    And user presses "ENT" icon button
    And "Capture Optionset References" page is shown
    And user presses "Garment Personalisation Yes" icon button
    And user presses "Premier League White" icon button
    And user presses "Own Personalisation" icon button
    And user presses "Numbers Only" icon button
    And user enters "77" into "Text Input" field
    And user presses "Next" icon button
    And user presses "Additional Badges Yes" icon button
    And user presses "Europa Badge" icon button
    And "Transaction Basket" page is shown
    And "${Personalised Product 1 Price}" is displayed in "Receipt" list
    And "${Personalised Product 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Select Collection Point" page shown
    Then user selects "Wait" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Personalised Product 1 Description},${Personalised Product 1 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "90" seconds
    And user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Detail" page shown
    When user presses "Complete Receipt" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    Then user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-12298 @ItemSale_Cash @POS @AUTOMATED @POSValidatedTest @POSSet3 @ToBeFixedAutTest
  Scenario: Perform a Sale with Alternative Products
    Given user signs on as "Sales Assistant"
    And user enters "${SKU Product 7}" into "Input Box" field
    And user presses "ENT" icon button
    And "Alternative Product List" page is shown
    And user selects "Rose Print Tea Dress" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And "${SKU Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Sku Product 6 Description},${Sku Product 6 Price}   |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-19890 @POS @AUTOMATED
  Scenario: Perform a Sale with carrier bag and without carrier bag
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}  |
      | telephone | Tel: ${Store Phone 1}                                  |
      | item      | ${Product 2 Description},${Product 2 Price}            |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    When template "AUT_RETAIL_FIXED_POS_TEMPLATE" is set for the current POS terminal
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button
    Then "Carrrier Bag Prompt" page is shown
    And user enters "1" into "Carrier Bag Input Box" field
    Given user presses "Carrier Bag Continue Button" icon button
    Then "Select Tender" page is shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}  |
      | telephone | Tel: ${Store Phone 1}                                  |
      | item      | ${Product 2 Description},${Product 2 Price}            |
      | item      | ${Product Carrier Bag 1 Description}                   |
      | item      | ${Product Carrier Bag 1 Price}                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-19892 @POS @AUTOMATED
  Scenario: Perform a Sale with customized trailer line in receipt
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    Given user signs on as "Sales Assistant"
    When template "AUT_STORE_TEMPLATE_UK" is set for the current POS location
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | Thank you for shopping with us                        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-16637 @POS @AUTOMATED @Regression
  Scenario: Performing a sale with less than the minimum tender amount set for foreign currency
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    And "Enter Return Item" page is shown
    When user presses "ENT" button
    Then "Invalid Product Code" page is shown
    When user presses "OK" button
    Then "Enter Return Item" page is shown
    When user presses "Product Search" button
    Then "Select Product" page is shown
    When user enters "${Product 3 Description}" into "Input Box" field
    Then "${Product 3 Description}" is displayed in "Selection List" list
    When user selects "${Product 3 Description}" from "Selection List" list
    And user presses "View" button
    Then "Display Product Details" page is shown
    When user presses "Return Button" icon button
    Then "Select Reason" page is shown
    When user selects "${Return Capture Details Reason}" from "Selection List" list
    Then user presses "OK" button
    And "Capture Customer Name" page is shown
    And user presses "Search By Name" button
    And "Enter Search Name" page is shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "select customer" page shown
    And user presses "OK" button
    And "Confirm Customer" page is shown
    And user presses "Confirm" button and "Add Item Text" page shown
    And user presses "OK" button and "Capture Return Original Tender" page shown
    And user selects "${Return Tender Cash UK}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And "Return" is displayed in "Receipt" list
    And "Customer: ${Customer 1 Full Name}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "${Return Tender Cash UK}" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-21155 @POS @AUTOMATED
    Scenario: Verifying the latest Transaction xml
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And latest transaction xml contains
     |	normalRetailSaleTransaction.applicationId	 														  | POS 										 |
     |	normalRetailSaleTransaction.basket.items.merchandiseItem.description	  | ${Product 1 Description} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-20232 @AUTOMATED @POS
  Scenario: Validate Capture Name and Address For sale transaction with Gift Card Type tenders
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button and "Select Tender" page shown
    And user presses "Gift Card Types" button and "Select Tender" page shown
    And user presses "Gift Card 3" button and "Get Gift Card Number" page shown
    Then user enters "${Gift Card number 17}" into "Input Box" field
    And user presses "OK" button and "Employee Account Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
    And user waits "2" seconds
    And "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Sale                                                                            |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-14884 @PreSales @ItemSale
  Scenario: Verify normal retail sale transaction with cash tender
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown