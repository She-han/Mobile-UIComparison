Feature: Pos Self Checkout Loyalty

  @PT-13948 @SCOLoyalty @SCO_Test
  Scenario: Verify customer able to add loyalty number to the transaction
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
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    And user presses "Loyalty" button
    Then "Sco Capture Loyalty" page is shown
    When "Scanner" page is shown
    And user enters "${Sco Loyalty Card Capture}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Loyalty Captured" page is shown
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Loyalty Customer Full Name}" is displayed in "Receipt Basket" list
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

  @PT-13963 @SCOLoyalty @SCO_Test
  Scenario: Verify the loyalty card number is hidden and only last 4 digit number been displayed
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
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    And user presses "Loyalty" button
    Then "Sco Capture Loyalty" page is shown
    When "Scanner" page is shown
    And user enters "${Sco Loyalty Card Capture}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Loyalty Captured" page is shown
    When "Sco Loyalty Captured Message" label displays the text "Your Loyalty Card details have been captured!"
    And user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Loyalty Customer Full Name}" is displayed in "Receipt Basket" list
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

  @PT-13965 @SCOLoyalty @SCO_Test
  Scenario: Verify customer able to proceed with payment without entering reward card after checkout
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Then "Sco Start Transaction" page is shown
    Given user confirms "green" color is displayed on "Polegreen" panel in PoleLight
    When "Sco Welcome Label" label displays the text "Welcome!"
    When "Sco Start Transaction Label" label displays the text "Please scan an item or press Start Transaction"
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Then "Scanner" page is shown
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    And "${SCO Product 1 Price}" is displayed in "Receipt" list
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
    And user presses "Sco Yes Print" icon button
    Then "Sco Transaction End" page is shown
    Then receipt display with following details
      | item | ${SCO Product 1 Price} |
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

  @PT-13967 @SCOLoyalty @SCO_Test
  Scenario: Verify the error message been captured If scan an incorrect loyalty number
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
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    And "${SCO Product 1 Price}" is displayed in "Receipt" list
    And user presses "Loyalty" button
    Then "Sco Capture Loyalty" page is shown
    When "Scanner" page is shown
    And user enters "Invalid" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Loyalty Capture Error" page is shown
    And user presses "Cancel" button
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
    
	@PT-19012 @POSSelfCheckout @POS
	Scenario: Verify whether the user is able to scan and complete a transaction using Loyalty capture when the SCO POS is offline
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
    When user presses "Loyalty" button
    Then "Sco Capture Loyalty" page is shown
    When "Scanner" page is shown
    And user enters "${Sco Loyalty Card Capture}" into "Scan Text" field 
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Offline Error" page is shown
    When user presses "Cancel" button
    Then "Sco Block Alert for Assistant At Sale" page is shown
    When user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Transaction Basket" page is shown
    When user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown
