Feature: Customer View
	
	@PT-15688 @CustomerView @POS @AUTOMATED
	Scenario: Verify Full Description of Added Item in Customer View
	    Given user signs on as "Sales Assistant"
	    And user enters "${Product 1}" into "Input Box" field
	    And user presses "ENT" button
	    And "Customer View Product Image" page is shown
	    And "${Product 1 Description}" is displayed in "Receipt" list
	    And "Footer Message" field contains the text "${Product 1 Long Description}"
	    
	@PT-15689 @CustomerView @POS @AUTOMATED
	Scenario: Adding more items than the basket capacity, basket view should be allowed to scroll
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
	    And "Customer View Product Image" page is shown
	    And "${Product 6 Description}" is displayed in "Receipt" list

   @PT-15690 @CustomerView @POS @AUTOMATED
   Scenario: Verify Item Full Description when Basket Item is selected
	   	Given user signs on as "Sales Assistant"
	    And user enters "${Product 1}" into "Input Box" field
	    And user presses "ENT" button
	    And user selects "${Product 1 Description}" from "Receipt" list
	    And "Customer View Product Image" page is shown
	    And "${Product 1 Description}" is displayed in "Receipt" list
	    And "Footer Message" field contains the text "${Product 1 Long Description}"
    
   @PT-15692 @CustomerView @POS @AUTOMATED
   Scenario: Verify Correct Basket Total is Shown in the Header of Customer View
	   	Given user signs on as "Sales Assistant"
	    And user enters "${Product 1}" into "Input Box" field
	    And user presses "ENT" button
	    And "Customer View Product Image" page is shown
	    And "${Product 1 Description}" is displayed in "Receipt" list
	    And "Footer Message" field contains the text "${Product 1 Long Description}"
	    And user waits "10" seconds
	    And "Customer View Basket" page is shown
	    And "Header Total" field contains the text "${Product 1 Price}"
    
    @PT-15693 @CustomerView @POS @AUTOMATED
   	Scenario: Verify User Name is Shown in the Footer of Customer View.
	   	Given user signs on as "Sales Assistant"
	    And "Customer View Basket" page is shown
	    And "Footer Username" label displays the text "${Sales Assistant Name}"
	    
 		@PT-16761 @CustomerView @POS @AUTOMATED
   	Scenario: Verify basket displayed correctly when doing a part tender.
	   	Given user signs on as "Sales Assistant"
	   	And user enters "${Product 1}" into "Input Box" field
	    And user presses "ENT" button
	    And user waits "5" seconds
	    And "Customer View Basket" page is shown
	    And "${Product 1 Description}" is displayed in "Receipt" list
	    And "Transaction Basket" page is shown
	    When user presses "TOTAL" button and "Select Tender" page shown
	    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
	    And user enters "10.00" into "Input Box" field
	    And user presses "OK" button
	    And "Customer View Basket" page is shown
	    And "${Product 1 Description} ${Product 1 Price}" is displayed in "Receipt" list
	    And "Cash UK -??10.00" is displayed in "Receipt" list
	    And "Select Tender" page is shown
	    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
	    And user presses "OK" button
	    And "Customer View Transaction Complete" page is shown
	    And "${Product 1 Description} ${Product 1 Price}" is displayed in "Receipt" list
	    And "Cash UK -??10.00" is displayed in "Receipt" list
	    And "Cash UK -??8.00" is displayed in "Receipt" list
	   	And "Await Drawer Closed" page is shown
	   	When user presses "Close" button on external "Cash Drawer" window
    	Then "Transaction Basket" page is shown
    	And "Customer View Basket" page is shown
    	
   	@PT-16762 @CustomerView @POS @AUTOMATED
   	Scenario: Verify basket when doing a return item.
	   	Given user signs on as "Sales Assistant"
	   	And user enters "${Product 1}" into "Input Box" field
	    And user presses "ENT" button
	    And user waits "10" seconds
	    And "Customer View Basket" page is shown
	    And "${Product 1 Description}" is displayed in "Receipt" list
	    And "Transaction Basket" page is shown
	    And user presses "Returns" button
	    And user presses "Return Item" button and "Enter Return Item" page shown
	    When user enters "${Product 2}" into "Input Box" field
	    And user presses "Return Item" button and "Select Reason" page shown
	    And user selects "Damaged / Faulty" from "Selection List" list
	    And user presses "OK" button and "Return Slip Message" page shown
	    And user presses "No" button and "Transaction Basket" page shown
	    And user waits "10" seconds
	    And "Customer View Basket" page is shown
	    And "${Product 1 Description}" is displayed in "Receipt" list
	    And "Return ${Product 2 Description}" is displayed in "Receipt" list
	    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list