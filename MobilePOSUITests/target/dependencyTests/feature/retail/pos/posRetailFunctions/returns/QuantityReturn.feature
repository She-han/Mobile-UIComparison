Feature: Quantity Return

   @PT-16646 @AUTOMATED @POS  
   Scenario: Quantity return using additional search filters   
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button		
    And user presses "Quantity Return" button
    And "Enter Return Quantity" page is shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user presses "Product Search" button
    Then "Select Product" page is shown
    And user presses "Additional Filters" button and "Product Filters" page shown
    And user enters "${Product 1 Description}" into "Product Search Description Filter" field
    And user presses "OK" button
    Then "Select Product" page is shown
    Then "${Product 1}" is displayed in "Selection List" list
    When user selects "${Product 1 Description}" from "Selection List" list  
    And user presses "View" button
    And "Display Product Details" page is shown
    When user presses "Return Button" icon button
    Then "Select Reason" page is shown
    When user selects "${Return Unwanted Reason}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Return" is displayed in "Receipt" list
    And "-3 @ ${Product 1 Price}" is displayed in "Receipt" list    
    And "Ret Reason: ${Return Unwanted Reason}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
     | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
     | telephone | Tel: ${Store Phone 1}                                 |
     | text      | Refund                                                |
     | item 		 | R ${Product 1 Description},-3 @ ${Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
     		       