Feature: Pos Self Checkout Supervisor Login '

  @PT-14006 @SupervisorLogin @SCO_Test @SCOTestError
  Scenario: Verify void entry of an item
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
    Then "Scanner" page is shown
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    And user presses "Sco I Need Help" icon button
    Then "Sco Attendant Blocking" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Given user confirms "red" color is displayed on "Polegreen" panel in PoleLight
    Then "Operator Sale" page is shown
    When user selects "${Sco Product 1 Description}" from "Receipt" list
    And user presses "Item Void" button
    Then "Cannot Void Last Item" page is shown
    When user presses "Yes" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "End Transaction Continue" page is shown
    And user presses "OK" button
    Then "Sco Start Transaction" page is shown
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

	@PT-19000 @POSSelfCheckout @POS
  Scenario: Verify whether the user is able to close the Lane when there are products still in the transaction basket.
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
    When user presses "Sco I Need Help" icon button
    Then "Sco Attendant Blocking" page is shown
    When user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    When user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    When user presses "Log Out Button" icon button
    Then "Sign Off Error" page is shown
    And user presses "OK" button
    And user presses "Voids" button
    And user presses "Void Transaction" button
    Then "Select Reason" page is shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "End Transaction Continue" page is shown
    And user presses "OK" button
    Then "Sco Start Transaction" page is shown
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

	@PT-19001 @POSSelfCheckout @POS
	Scenario: Verify whether only the sign on authorising screen should be displayed when there is an error on the SCO POS
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
    And "Primary Printer" page is shown
    When user presses "Test Printer Paper Out Button" icon button
    Then "Sco Block Alert for Assistant" page is shown
    When user presses "Sco Hidden div Button" link button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco printer error message" page is shown
    When user presses "OK" button
    Then "Sco Transaction Basket" page is shown
    When user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field  
    And user presses "Sco sign on button" icon button
    And "Primary Printer" page is shown
    And user presses "Test Printer Paper Out Button" icon button
    Then "Operator Sale" page is shown 
    When user presses "Back to SCO" button
    Then "Sco Transaction Basket" page is shown
    When user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field  
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown 
    When user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown  
    
	@PT-19008 @POSSelfCheckout @POS
	Scenario: Verify whether a Sign-On with Card enabled user can logon to the SCO POS
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    Then "Sco Signon" page is shown
    And "Scanner" page is shown
    And user enters "${Passwordless Sign On with Card Username}" into "Scan Text" field 
    When user presses "Test Scanner Scan Button" icon button
		Then "Sco laneopen" page is shown	
		When user presses "Sco open lane button" icon button
    Then "Sco Start Transaction" page is shown
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
