Feature: Transaction Stored On SignOut

  @PT-1812 @Dune @POS @ReactPOS @Regression @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Transaction stored on POS during manual sign out
    Given user signs on as "Manager 2"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "SignOff" button
    And user signs on as "Manager 2"
    And "Transaction Basket" page is shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 2 Price}" is displayed in "Receipt" list
    And "${Product 3 Description}" is displayed in "Receipt" list
    And "${Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1813 @Dune @POS @ReactPOS @Regression @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Transaction stored on POS during inactivity sign out
    Given user signs on as "Pos Operator 2"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" icon button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" icon button
    #user waits 25 seconds for auto inactivity out
    And user waits "25" seconds
    And user signs on as "Pos Operator 2"
    And "Transaction Basket" page is shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    #Press on a button to avoid Inactivity signout before completing verification
    And user presses "Sales" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 2 Price}" is displayed in "Receipt" list
    #Press on a button to avoid Inactivity signout before completing verification
    And user presses "Back" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    And "${Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "Logout button" icon button
    And "Enter User" page is shown
    
  @PT-12120 @POS @AUTOMATED
  Scenario: Store and Recall order (Sales Menu) with Auto Sign Off
    Given user signs on as "Pos Operator 2"
	And user presses "Sales" button
	And user presses "More" button
	And user presses "Customers" button
	And user presses "Order Functions" button
	And user presses "Order" button
	And user waits "5" seconds
	And user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
	#User will wait for auto signoff
	And user waits "25" seconds
	And user signs on as "Pos Operator 2"
	Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user waits "20" seconds
    And "Enter User" page is shown
    
  @PT-12121 @POS @AUTOMATED
  Scenario: Store and Recall order (Sales Menu) with Manual Sign Off
    Given user signs on as "Pos Operator 8"
	And user presses "Sales" button
	And user presses "More" button
	And user presses "Customers" button
	And user presses "Order Functions" button
	And user presses "Order" button
	And user waits "10" seconds
	And user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
	#User will manually signoff
	And user presses "SignOff" button
	And user signs on as "Pos Operator 8"
	Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
	
  @PT-12122 @POS @AUTOMATED
  Scenario: Store and Recall order (Rich Product Search) with Auto Sign Off
  	Given user signs on as "Pos Operator 2"
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "1" seconds
    And user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "1" seconds
    And user presses "Product Size 1 Button" icon button
    And user waits "2" seconds
    And user presses "Product Order Product" icon button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    #User will wait for auto signoff
    And user waits "25" seconds
    And user signs on as "Pos Operator 2"
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user waits "20" seconds
    And "Enter User" page is shown
    
  @PT-12123 @POS @AUTOMATED
  Scenario: Store and Recall order (Rich Product Search) with Manual Sign Off
  	Given user signs on as "Manager 2"  	
	And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
	And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "1" seconds
	And user presses "Product Search Result Item 1" icon button
	Then "Rich Product Details" page is shown
	And user waits "4" seconds
	And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
	And user presses "Product Size 1 Button" icon button
	And user presses "Product Order Product" icon button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list	
	#User will manually signoff
	And user presses "SignOff" button
	And user signs on as "Manager 2"
	Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And "Order" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
	
	
	@PT-12123 @NUI_ScriptToBeUpdated  
    Scenario: test001 
        And "EnterUser" page is shown
        And user enters "000101" into "Input Text 1" field
        And user enters "000101" into "Input Text 2" field
        #And user enters "000115" into "UserID" field
        #And user enters "000115" into "Password" field
        When user presses "Sign On" icon button
        And "LaunchScreen" page is shown
        When user presses "Sell" button
        And "Sale" page is shown
        When user presses "Product" icon button
        And "RichProductSearchMainCategories" page is shown
        And user enters "Df517xm" into "Search" field
        When user presses Enter key
        And "RichProductSearchFullScreenResults" page is shown
        When user presses "Button Down Collar Western Sh" button
        And "DisplayRichProductDetails" page is shown
        When user presses "S" icon button
        #When user presses "Component" icon button
        When user presses "Order" icon button
        And "Sale" page is shown
        When user presses "NativeSaleHeader Exit" icon button
        And "Enteruser" page is shown
        And user enters "000101" into "Input Text 1" field
        And user enters "000101" into "Input Text 2" field
        #And user enters "000115" into "UserID" field
        #And user enters "000115" into "Password" field
        When user presses "Sign On" icon button 
        And "Sale" page is shown
        And user selects "Button Down Collar Red" from "Selection" list
        And "ModifyItemOptionsPrompt" page is shown
        When user presses "Void" button
        And "VoidModalYesNo" page is shown
        When user presses "Ok" icon button
        And "SelectReason" page is shown
        And user selects "Customer Left Store" from "Selection" list
        When user presses "SelectReasonConfirm" icon button
        And "Launchscreen" page is shown
        When user presses "NativeSaleHeader Exit" icon button
        And "Enteruser" page is shown  