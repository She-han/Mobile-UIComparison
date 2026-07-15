Feature: Pos Self Checkout Age Restriction

  @PT-13942 @Agerestriction @SCO_Test
  Scenario: Verify age restriction alert displayed immediately once item added to basket with specific and amber light displayed
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
    And user enters "${Product 14}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Age Restricted Warning" page is shown
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    Given "${Product 14 Description}" is displayed in "Receipt Basket" list
    Given user confirms "amber" color is displayed on "Polegreen" panel in PoleLight
    Then "Scanner" page is shown
    And user enters "${Sco Bakery Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Given user waits "5" seconds
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Total Price 2 With Age Restricted Product Id}" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Attendant Blocking With Auth" page is shown
    When user presses "Sco Attendant Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco Confirm Age" page is shown
    When user presses "Confirm Age" button
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

  @PT-13943 @Agerestriction @SCO_Test
  Scenario: Verify supervisor able to remove the age restriction and lights been disappeared
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
    And user enters "${Product 14}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Age Restricted Warning" page is shown
    When "Sco Age Restricted Warning Message" label displays the text "This product is age restricted. Please continue shopping, a supervisor is coming to assist you."
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    Given "${Product 14 Description}" is displayed in "Receipt Basket" list
    Given user confirms "amber" color is displayed on "Polegreen" panel in PoleLight
    Then "Scanner" page is shown
    And user enters "${Sco Bakery Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Given user waits "5" seconds
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Total Price 2 With Age Restricted Product Id}" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Attendant Blocking With Auth" page is shown
    Given user confirms "red" color is displayed on "Polegreen" panel in PoleLight
    When user presses "Sco Attendant Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco Confirm Age" page is shown
    When user presses "Confirm Age" button
    Then "Sco Select Tender" page is shown
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
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

  @PT-13944 @Agerestriction @SCO_Test
  Scenario: If the supervisor couldn’t confirm the age of customer, whether supervisor able to void or refuse the item
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
    And user enters "${Product 14}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Age Restricted Warning" page is shown
    When "Sco Age Restricted Warning Message" label displays the text "This product is age restricted. Please continue shopping, a supervisor is coming to assist you."
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    Given "${Product 14 Description}" is displayed in "Receipt Basket" list
    Given user confirms "amber" color is displayed on "Polegreen" panel in PoleLight
    Then "Scanner" page is shown
    And user enters "${Sco Bakery Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Given user waits "5" seconds
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Total Price 2 With Age Restricted Product Id}" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Attendant Blocking With Auth" page is shown
    Given user confirms "red" color is displayed on "Polegreen" panel in PoleLight
    When user presses "Sco Attendant Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco Confirm Age" page is shown
    When user presses "Void Item" button
    Then "Operator Sale" page is shown
    When user selects "${Product 14 Description}" from "Receipt" list
    And user presses "Item Void" button
    Then "Select Reason" page is shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Operator Sale" page is shown
    And following details are not displayed on the receipt
      | item | ${Product 14 Description},${Product 14 Price} |
    And user presses "Back to SCO" button
    Then "Sco Select Tender" page is shown
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
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

  @PT-13945 @Agerestriction @SCO_Test
  Scenario: Verify age restriction alert displayed until customer click pay button. Customer should be able to add other items to basket
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
    And user enters "${Product 14}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Age Restricted Warning" page is shown
    When "Sco Age Restricted Warning Message" label displays the text "This product is age restricted. Please continue shopping, a supervisor is coming to assist you."
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    Given "${Product 14 Description}" is displayed in "Receipt Basket" list
    Given user confirms "amber" color is displayed on "Polegreen" panel in PoleLight
    Then "Scanner" page is shown
    And user enters "${Sco Bakery Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Given user waits "5" seconds
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Total Price 2 With Age Restricted Product Id}" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Attendant Blocking With Auth" page is shown
    Given user confirms "red" color is displayed on "Polegreen" panel in PoleLight
    When user presses "Sco Attendant Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco Confirm Age" page is shown
    When user presses "Confirm Age" button
    Then "Sco Select Tender" page is shown
    Given user confirms "red" color is displayed on "Polegreen" panel in PoleLight
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

  @PT-13946 @Agerestriction @SCO_Test
  Scenario: Verify proper user message displayed in screen until the supervisor comes to assist the customer
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
    And user enters "${Product 14}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Age Restricted Warning" page is shown
    When "Sco Age Restricted Warning Message" label displays the text "This product is age restricted. Please continue shopping, a supervisor is coming to assist you."
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    Given "${Product 14 Description}" is displayed in "Receipt Basket" list
    Given user confirms "amber" color is displayed on "Polegreen" panel in PoleLight
    Then "Scanner" page is shown
    And user enters "${Sco Bakery Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Given user waits "5" seconds
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Total Price 2 With Age Restricted Product Id}" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Attendant Blocking With Auth" page is shown
    Given user confirms "red" color is displayed on "Polegreen" panel in PoleLight
    When user presses "Sco Attendant Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco Confirm Age" page is shown
    When user presses "Confirm Age" button
    Then "Sco Select Tender" page is shown
    Given user confirms "red" color is displayed on "Polegreen" panel in PoleLight
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

  @PT-14089 @Agerestriction @SCO_Test
  Scenario: Verify supervisor is overaged to confirm age restricted Item
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
    And user enters "${Sco Cashier Age Restricted Product Id}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Age Restricted Warning" page is shown
    When "Sco Age Restricted Warning Message" label displays the text "This product is age restricted. Please continue shopping, a supervisor is coming to assist you."
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Cashier Age Restricted Product Description}" is displayed in "Receipt Basket" list
    Given user confirms "amber" color is displayed on "Polegreen" panel in PoleLight
    Then "Scanner" page is shown
    And user enters "${Sco Bakery Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Given user waits "5" seconds
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Total Price 2 With Age Restricted Product Id}" is displayed in "SCO Total Amount" panel
    When user presses "Payment" button
    Then "Sco Attendant Blocking With Auth" page is shown
    Given user confirms "red" color is displayed on "Polegreen" panel in PoleLight
    When user presses "Sco Attendant Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sco Underage User Id}" into "Sco User Id Input Text" field
    And user enters "${Sco Underage User Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco Under Age Cashier Message" page is shown
    And user presses "OK" button
    Then "Sco Attendant Signon 2" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco Confirm Age" page is shown
    When user presses "Confirm Age" button
    Then "Sco Select Tender" page is shown
    Given user confirms "red" color is displayed on "Polegreen" panel in PoleLight
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
	
	@PT-16938 @POSSelfCheckout @POS
	Scenario: If the supervisor cannot confirm the age of the customer, check supervisor able to void the item 
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    Then "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco Password Input Text" field
    And user presses "Sco Sign On Button" icon button
		Then "Sco laneopen" page is shown	
		When user presses "Sco Open Lane Button" icon button
		And user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    Then "Sco Start Transaction" page is shown
    And "Sco Welcome Label" label displays the text "Welcome!"
    And "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    When user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And "Scanner" page is shown
    And user enters "${Product 14}" into "Scan Text" field 
    When user presses "Test Scanner Scan Button" icon button
    Then "Sco Age Restricted Warning" page is shown
    When "Sco Age Restricted Warning Message" label displays the text "This product is age restricted. Please continue shopping, a supervisor is coming to assist you."
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    And "${Product 14 Description}" is displayed in "Receipt Basket" list
    And user confirms "amber" color is displayed on "Polegreen" panel in PoleLight
    And "Scanner" page is shown
    And user enters "${Sco Bakery Product 1}" into "Scan Text" field 
    When user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user waits "1" seconds
    And "${Sco Total Price 2 With Age Restricted Product Id}" is displayed in "Sco Total Amount" panel
    When user presses "Payment" button
    Then "Sco Attendant Blocking With Auth" page is shown
    And user confirms "red" color is displayed on "Polegreen" panel in PoleLight
    When user presses "Sco Attendant Hidden Button" icon button
    Then "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco Password Input Text" field
    And user presses "Sco Sign On Button" icon button
    Then "Sco Confirm Age" page is shown
    When user presses "Void Item" button 
    Then "Operator Sale" page is shown 
    When user selects "${Product 14 Description}" from "Receipt" list
    And user presses "Item Void" button
    Then "Select Reason" page is shown
    And user selects "Item Faulty" from "Selection List" list
    When user presses "OK" button
    Then "Operator Sale" page is shown 
    When user presses "Back to SCO" button
    And user confirms "green" color is displayed on "Polegreen" panel in PoleLight
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
    And user presses "Sco No Print" icon button
    And "Sco Transaction End" page is shown
    When user presses "Sco Next Customer" icon button
    Then "Sco Start Transaction" page is shown
    When user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    When user presses "Sco Hidden Div" icon button
    Then "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco Password Input Text" field
    And user presses "Sco Sign On Button" icon button
    Then "Operator Sale" page is shown 
    When user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown      
    
    