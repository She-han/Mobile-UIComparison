Feature: Sales From Product Search

  @PT-927 @SearchByFullProductCode @Dunelm @AUTOMATED @POS @POSValidatedTest @POSSet2
  Scenario: Product Search - Search By Full Product Code
    Given user signs on as "Sales Assistant"
    And "Empty Basket" page is shown
    When user presses "ENT" icon button 
    Then "Enter Item" page is shown
    And user presses "Product Search" button and "Select Product" page shown
    When user enters "${Product 4}" into "Input Box" field
    Then "${Product 4}" is displayed in "Selection List" list
    And user selects "${Product 4}" from "Selection List" list
    And user presses "View" button and "Display Product Details" page shown
    And user waits "2" seconds
    And user presses "OK" button and "Enter Item" page shown
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user waits "2" seconds
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-929 @AUTOMATED @POS @POSValidatedTest @POSSet2
  Scenario: Product Search To Return No Results
    Given user signs on as "Sales Assistant"
    And "Empty Basket" page is shown
    When user presses "ENT" icon button 
    Then "Enter Item" page is shown
    And user presses "Product Search" button and "Select Product" page shown
    And user enters "11111111" into "Input Box" field
    And "11111111" is not displayed in "Selection List" list
    And user presses "Back" button and "Enter Item" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-16727 @AUTOMATED @POS
  Scenario: Verify whether the product search screen is refreshed
		Given user signs on as "Sales Assistant"
		And "Empty Basket" page is shown
		And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    And user presses "Additional Filters" button and "Product Filters" page shown
    And user presses "Search Size" icon button
    Then "Product Search Additional Filters Select Size List" page is shown
    And user presses "OK" button and "Product Filters" page shown
    And user presses "Search Colour" icon button
    Then "Product Search Additional Filters Select Size List" page is shown
    And user presses "OK" button and "Product Filters" page shown
    And user presses "Search Product Group" icon button 
    Then "Select Group List" page is shown
    And user presses "OK" button and "Product Filters" page shown
    And user enters "100" into "Start Price" field
    And user enters "1000" into "End Price" field
    And user presses "OK" button and "Select Product" page shown
    When user presses "Back" button
    Then "Enter Return Item" page is shown
    And user presses "Cancel" button and "Empty Basket" page shown
    #Verfiy the product search criteria has been refreshed
    #Note:Currently only handled price ranges
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    And user presses "Additional Filters" button and "Product Filters" page shown
    And user confirms "Start Price" field does not displays the text "Â£100.00"
    And user confirms "End Price" field does not displays the text "Â£1000.00"
    And user presses "Cancel" button and "Select Product" page shown
    When user presses "Back" button
    Then "Enter Return Item" page is shown
    And user presses "Cancel" button and "Empty Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-28195 @Regression @AUTOMATED @POS 
  Scenario: Verify whether an item added via product search is added to the basket with the correct price
    Given user signs on as "Sales Assistant"
    And "Empty Basket" page is shown
    When user presses "ENT" icon button
    Then "Enter Item" page is shown
    And user presses "Product Search" button and "Select Product" page shown
    When user enters "${Product 4}" into "Input Box" field
    Then "${Product 4}" is displayed in "Selection List" list
    And user selects "${Product 4}" from "Selection List" list 
    And user presses "OK" button and "Enter Item" page shown
    And user presses "Sell Item" button and "Transaction Basket" page shown
    Then "${Product 4 Description}" is displayed in "Receipt" list
    And "${Product 4 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-28193 @Regression @AUTOMATED @POS
  Scenario: Verify whether an item added via product search with view product details is added to the basket with the correct price
    Given user signs on as "Sales Assistant"
    And "Empty Basket" page is shown
    When user presses "ENT" icon button
    Then "Enter Item" page is shown
    And user presses "Product Search" button and "Select Product" page shown
    When user enters "${Style Colour Size Product}" into "Input Box" field
    Then "${Style Colour Size Product 2 Description}" is displayed in "Selection List" list
    And user selects "${Style Colour Size Product}" from "Selection List" list
    And user presses "View" button and "Display Product Details" page shown
    And user presses "OK" button and "Enter Item" page shown
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown