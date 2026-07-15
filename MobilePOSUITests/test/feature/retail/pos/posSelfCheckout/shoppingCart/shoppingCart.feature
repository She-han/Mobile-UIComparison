Feature: Shopping cart

  @PT-13924 @VerifywelcomeScreen @shoppingCart @SCO_Test
  Scenario: Verify the screen when the cart is empty
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Then "Sco Start Transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given user confirms "Receipt Basket" not display
    Given "Bakery" is displayed in "Sco Sale Buttons" panel
    Given "Fruits" is displayed in "Sco Sale Buttons" panel
    Given "Barcode" is displayed in "Sco Sale Buttons" panel
    Given "Loyalty" is displayed in "Sco Sale Buttons" panel
    Given "£0.00" is displayed in "SCO Total Amount" panel
    Given "0" is displayed in "Sco Total Items" panel
    Then "Scanner" page is shown
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13925 @VerifyBakeryandFruits @shoppingCart @SCO_Test
  Scenario: Verify Bakery and Fruits menu available in SCO screen
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Then "Sco Start Transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Bakery" is displayed in "Sco Sale Buttons" panel
    Given "Fruits" is displayed in "Sco Sale Buttons" panel
    When user presses "Bakery" button
    Then "Sco Product Display" page is shown
    When user presses "Sco Category Item 0" icon button
    Given "Croissant" is displayed in "Sco Product Item Container" panel
    Given "Pastel De Nata" is displayed in "Sco Product Item Container" panel
    And user presses "Sco Product Display Cancel" icon button
    Then "Sco Transaction Basket" page is shown
    When user presses "Fruits" button
    Then "Sco Product Display" page is shown
    When user presses "Sco Category Item 0" icon button
    Given "Pear" is displayed in "Sco Product Item Container" panel
    Given "Banana" is displayed in "Sco Product Item Container" panel
    And user presses "Sco Product Display Cancel" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13926 @VerifyBakeryandFruits @shoppingCart @SCO_Test
  Scenario: Verify customer able to add bakery and fruit items to the basket
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Given "Bakery" is displayed in "Sco Sale Buttons" panel
    Given "Fruits" is displayed in "Sco Sale Buttons" panel
    When user presses "Bakery" button
    Then "Sco Product Display" page is shown
    When user presses "Sco Category Item 0" icon button
    Given "Croissant" is displayed in "Sco Product Item Container" panel
    Given "Pastel De Nata" is displayed in "Sco Product Item Container" panel
    When user presses "Sco Subcategory Item 0" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Croissant" is displayed in "Receipt Basket" list
    When user presses "Fruits" button
    Then "Sco Product Display" page is shown
    When user presses "Sco Category Item 0" icon button
    Given "Pear" is displayed in "Sco Product Item Container" panel
    Given "Banana" is displayed in "Sco Product Item Container" panel
    When user presses "Sco Subcategory Item 0" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Pear" is displayed in "Receipt Basket" list
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13927 @shoppingCart @SCO_Test
  Scenario: Verify the barcode button for keying in items
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Barcode" is displayed in "Sco Sale Buttons" panel
    When user presses "Barcode" button
    Then "Sco Barcode" page is shown
    And user enters "1" into "Sco Barcode Input" field
    When user presses "ENT" button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13928 @shoppingCart @SCO_Test
  Scenario: Verify proper error message displayed, if the keyed in product id not correct
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Barcode" is displayed in "Sco Sale Buttons" panel
    When user presses "Barcode" button
    Then "Sco Barcode" page is shown
    When user presses "Sco Ent Button" icon button
    Then "Sco Empty Barcode Error" page is shown
    When "Sco Error Message" label displays the text "Enter a barcode number"
    And user presses "OK" button
    Then "Sco Barcode" page is shown
    And user enters "${Unknown Product 1}" into "Sco Barcode Input" field
    Then user presses "Sco Ent Button" icon button
    Then "Sco Incorrect Barcode Error" page is shown
    When "Sco Error Message" label displays the text "Incorrect product code entered"
    And user presses "OK" button
    Then "Sco Barcode" page is shown
    And user enters "${Sco Product 1}" into "Sco Barcode Input" field
    Then user presses "Sco Ent Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13929 @shoppingCart @SCO_Test
  Scenario: Verify the items in the basket. Confirm the price is updated correctly
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Bakery" is displayed in "Sco Sale Buttons" panel
    Given "Fruits" is displayed in "Sco Sale Buttons" panel
    When user presses "Bakery" button
    Then "Sco Product Display" page is shown
    When user presses "Sco Category Item 0" icon button
    Given "Croissant" is displayed in "Sco Product Item Container" panel
    Given "Pastel De Nata" is displayed in "Sco Product Item Container" panel
    When user presses "Sco Subcategory Item 0" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Croissant" is displayed in "Receipt Basket" list
    When user presses "Fruits" button
    Then "Sco Product Display" page is shown
    When user presses "Sco Category Item 0" icon button
    Given "Pear" is displayed in "Sco Product Item Container" panel
    Given "Banana" is displayed in "Sco Product Item Container" panel
    When user presses "Sco Subcategory Item 0" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Pear" is displayed in "Receipt Basket" list
    Given "£5.95" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13930 @shoppingCart @SCO_Test
  Scenario: Verify the error message, if unknown product is scanned
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Then "Scanner" page is shown
    And user enters "111111111111111111111111111111" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Unknown Product Error" page is shown
    And user presses "OK" button
    Then "Sco Attendant Blocking" page is shown
    When user presses "Sco Attendant Hidden Button" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    Then "Scanner" page is shown
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Operator Sale" page is shown
    Given user waits "5" seconds
    When user presses "Back to SCO" button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13931 @shoppingCart @SCO_Test
  Scenario: Verify customer able to scan the items and add to basket
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Then "Scanner" page is shown
    And user enters "${Sku Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sku Product 1 Description}" is displayed in "Receipt Basket" list
    Given "${Sku Product 1 Price}" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13938 @shoppingCart @SCO_Test
  Scenario: Verify customer able to scan items on welcome screen
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    Then "Scanner" page is shown
    And user enters "${Sku Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sku Product 1 Description}" is displayed in "Receipt Basket" list
    Given "${Sku Product 1 Price}" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13939 @shoppingCart @SCO_Test
  Scenario: Verify customer  able to search related product item and items to basket Under Fruits/Bakery
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Bakery" is displayed in "Sco Sale Buttons" panel
    Given "Fruits" is displayed in "Sco Sale Buttons" panel
    When user presses "Bakery" button
    Then "Sco Product Display" page is shown
    When user presses "Sco Category Item 0" icon button
    Given "Croissant" is displayed in "Sco Product Item Container" panel
    Given "Pastel De Nata" is displayed in "Sco Product Item Container" panel
    When user presses "Search" button
    Then "Sco Product Search" page is shown
    When user presses "c" button
    And user presses "r" button
    And user presses "o" button
    And user presses "i" button
    And user presses "s" button
    And user presses "s" button
    And user presses "a" button
    And user presses "n" button
    And user presses "t" button
    Given "${Sco Search Product}" is displayed in "Sco Search Product Item Container" panel
    And user presses "Sco Search Item 0" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Search Product Description}" is displayed in "Receipt Basket" list
    Given "${Sco Search Product Price}" is displayed in "SCO Total Amount" panel
    When user presses "Fruits" button
    Then "Sco Product Display" page is shown
    When user presses "Sco Category Item 0" icon button
    Given "Pear" is displayed in "Sco Product Item Container" panel
    Given "Banana" is displayed in "Sco Product Item Container" panel
    When user presses "Search" button
    Then "Sco Product Search" page is shown
    When user presses "p" button
    And user presses "e" button
    And user presses "a" button
    And user presses "r" button
    Given "${Sco Search 2 Product}" is displayed in "Sco Search Product Item Container" panel
    And user presses "Sco Search Item 0" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Search 2 Product Description}" is displayed in "Receipt Basket" list
    Given "${Sco Product Search Total}" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13940 @shoppingCart @SCO_Test
  Scenario: Verify error message displayed when search for unknown/unavailable item
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Bakery" is displayed in "Sco Sale Buttons" panel
    Given "Fruits" is displayed in "Sco Sale Buttons" panel
    When user presses "Bakery" button
    Then "Sco Product Display" page is shown
    When user presses "Sco Category Item 0" icon button
    Given "${Sco Search Product}" is displayed in "Sco Product Item Container" panel
    When user presses "Search" button
    Then "Sco Product Search" page is shown
    When user presses "u" button
    When user presses "n" button
    When user presses "k" button
    When user presses "n" button
    When user presses "o" button
    When user presses "w" button
    When user presses "n" button
    Given button with label "unknown" is not displayed
    And user presses "Sco Product Search Cancel Button" icon button
    Then "Sco Product Display" page is shown
    When user presses "Sco Product Display Cancel" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    Then "Scanner" page is shown
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Operator Sale" page is shown
    Given user waits "5" seconds
    When user presses "Back to SCO" button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13941 @shoppingCart @SCO_Test
  Scenario: Customer able to scan the product instead of keying using barcode button
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "Barcode" is displayed in "Sco Sale Buttons" panel
    When user presses "Barcode" button
    Then "Sco Barcode" page is shown
    Then "Scanner" page is shown
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-14088 @shoppingCart @CustomerMessage @SCO_Test
  Scenario: Verify  customer message is displayed ,if scan an  item with a customer message.
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Then "Scanner" page is shown
    And user enters "${Product With Customer Message}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Customer Message" page is shown
    And "Sco Customer Message" label displays the text "${Customer Message Product Message}"
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    When user presses "Log Out Button" icon button
    Given "Sco Laneclose" page is shown
    
  @PT-19003 @POSSelfCheckout @POS 
	Scenario: Verify whether the user is able to select any item on the transaction basket and do an item modify function
		Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    Then "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
		Then "Sco laneopen" page is shown	
		When user presses "Sco open lane button" icon button
		And user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    And "Sco Welcome Label" label displays the text "Welcome!"
    And "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    When user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And "Barcode" is displayed in "Sco Sale Buttons" panel
    When user presses "Barcode" button
    Then "Sco Barcode" page is shown   
    And "Scanner" page is shown
    When user enters "${Sco Bakery Product 1}" into "Scan Text" field 
    And user presses "Test Scanner Scan Button" icon button
    And user enters "${Sco Bakery Product 2}" into "Scan Text" field 
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    And "${Sco Bakery Product 1 Description}" is displayed in "Receipt Basket" list
    And "${Sco Bakery Product 2 Description}" is displayed in "Receipt Basket" list
    When user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field  
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown 
   	And user selects "${Sco Bakery Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Cancel" button
    Then "Transaction Basket" page is shown
    
	@PT-19007 @POSSelfCheckout @POS
	Scenario: Verify whether the user can sell a product which requires a reference number in the SCO POS
	Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    Then "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
		Then "Sco laneopen" page is shown	
		When user presses "Sco open lane button" icon button
		Then "Sco Start Transaction" page is shown
    When user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And "Barcode" is displayed in "Sco Sale Buttons" panel
    When user presses "Barcode" button
    Then "Sco Barcode" page is shown
    And user enters "${Sco Reference Product 1}" into "Sco Barcode Input" field
    When user presses "ENT" button
    Then "Sco Assistant Required For Reference Number" page is shown 
    When user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field 
    And user presses "Sco sign on button" icon button
    Then "Sco Enter Reference Number" page is shown
    And user enters "${Sco Reference Product 1 Reference}" into "Input Box" field
    When user presses "ENT" button
    Then "Sco Transaction Basket" page is shown
    And "${Sco Reference Product 1 Description}" is displayed in "Receipt Basket" list
    And "Ref: ${Sco Reference Product 1 Reference}" is displayed in "Receipt Basket" list
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown 
    When user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    And user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    When user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    When user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    When user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    When user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    When user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field 
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown 
    When user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown   
