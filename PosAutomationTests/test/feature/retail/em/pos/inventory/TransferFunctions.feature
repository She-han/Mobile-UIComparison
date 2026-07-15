Feature: Transfer Functions Test Scenarios

  @PT-11612
  Scenario: Sales and Returns
  	#Sell a standard item
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
    And user waits "100" seconds
    #EM Switch
    When user logs in and navigates to the "Configuration,Merchandise,Item Inventory Levels" app
    And the "Item Inventory Level Maintenance" page is shown with the "Create a new Item Inventory Level" button
    And the user presses "Reset Filters" filter button
    And the user selects "Available" from the "Inventory Level Item Type Dropdown" dropdown field
    And the user enters "2" into the "Inventory Level Item ID Filter" input field
    And the user selects "Equals" from the "Inventory Level Item ID Dropdown" dropdown field
    When the user presses "Apply Filters" filter button
    And the searched item is shown in the search results table
    | Item ID |      2 |
    | Value   | 19,999 |
    And user signs off the enactor app
    #Return the sold item back to Returned" - need to make sure we have a return reason back to Returned
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "Return Item" button and "Select Reason" page shown
    And user selects "Returned Unwanted" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "Ret Reason: Returned Unwanted" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then the receipt displayed on "Primary Printer" printer with following details
    | text | Refund                     |
    | text | R ${Product 2 Description} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "100" seconds
    #EM Switch
    Then the "Login" page is shown
    When the user enters "${Valid Username}" into the "User Id" input field
    Then the user enters "${Valid Password}" into the "Password" input field
    And the user presses "Sign On" button
    And the "Home Page" page is shown
    And user presses on "Configuration" menu button
    And user presses on "Merchandise" menu button
    And user presses on "Item Inventory Levels" menu button
    And the "Item Inventory Level Maintenance" page is shown
    And the "Item Inventory Level Maintenance" page is shown with the "Create a new Item Inventory Level" button
    And the user presses "Reset Filters" filter button
    And the user selects "Returned" from the "Inventory Level Item Type Dropdown" dropdown field
    And the user enters "2" into the "Inventory Level Item ID Filter" input field
    And the user selects "Equals" from the "Inventory Level Item ID Dropdown" dropdown field
    When the user presses "Apply Filters" filter button
    And the searched item is shown in the search results table
    | Item ID        |        2 |
    | Value          |        1 |
    | Inventory Type | Returned |
    And user signs off the enactor app
    #Stock adjustment from Returned to Available - need to make sure we have an adjustment reason of Returned to Available
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Adjust" icon button
    And user presses "Adjust Stock" icon button
    And "Select Adjustment" page is shown
    And user presses "Requested" button
    And "Select Stock Adjustment Request" page is shown
    And user presses "Ad Hoc" button and "Adjustment Summary" page shown
    And user presses "Select Adjustment Reason" icon button
    And "Select Adjustment Reason" page is shown
    And user selects "Returned to Available" from "Reason List" list
    And user presses "Select" button and "Adjustment Summary" page shown
    When user enters "Test Note" into "Notes Input Text" field
    And user presses "Add or Edit Items" button and "Adjustment Items" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Adjustment Edit Quantity Enter Items" page shown
    And user presses "Add" button and "Adjustment Items" page shown
    And user presses "Done" button and "Adjustment Summary" page shown
    And user presses "Continue" button and "Adjustment Confirmation" page shown
    And user presses "Confirm" button and "Confirm Adjustment Popup" page shown
    Then user presses "Yes" button and "Select Stock Adjustment Request" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Log Out Button" icon button
    And "Enter User" page is shown
    And user waits "100" seconds
    #EM Switch
    Then the "Login" page is shown
    When the user enters "${Valid Username}" into the "User Id" input field
    Then the user enters "${Valid Password}" into the "Password" input field
    And the user presses "Sign On" button
    And the "Home Page" page is shown
    And user presses on "Configuration" menu button
    And user presses on "Merchandise" menu button
    And user presses on "Item Inventory Levels" menu button
    And the "Item Inventory Level Maintenance" page is shown
    And the "Item Inventory Level Maintenance" page is shown with the "Create a new Item Inventory Level" button
    And the user presses "Reset Filters" filter button
    And the user selects "Returned" from the "Inventory Level Item Type Dropdown" dropdown field
    And the user enters "2" into the "Inventory Level Item ID Filter" input field
    And the user selects "Equals" from the "Inventory Level Item ID Dropdown" dropdown field
    When the user presses "Apply Filters" filter button
    And the searched item is shown in the search results table
    | Item ID        |        2 |
    | Value          |        0 |
    | Inventory Type | Returned |
    And the user presses "Reset Filters" filter button
    And the user selects "Available" from the "Inventory Level Item Type Dropdown" dropdown field
    And the user enters "2" into the "Inventory Level Item ID Filter" input field
    And the user selects "Equals" from the "Inventory Level Item ID Dropdown" dropdown field
    When the user presses "Apply Filters" filter button
    And the searched item is shown in the search results table
    | Item ID        |        2 |
    | Value          |    20,000|
    | Inventory Type | Available|

  @PT-2668 @AUTOMATED
  Scenario: Verify the normal retail sale transaction displayed in Estate Manager
  	#Perform a sale in POS
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "50" seconds
    #EM Switch     
    # waits for transacation to appear &proccess in EM
    When user logs in and navigates to the "Administration,Processing,Inbound Documents" app
    And the "Inbound Document Viewer" page is shown with the "Apply Filters" button
    And the user selects "Estate Manager Transaction Processing" from the "Queue Name Filter" dropdown field
    And the user waits "3" seconds
    And the user enters "${Source ID}" into the "Source ID Filter" input field
    And the user waits "3" seconds
    And the user selects "Processed" from the "Status Filter" dropdown field
    And the user presses "Apply Filters" filter button
    And the user waits "4" seconds
    And the searched item is shown in the search results table
      | Document Type | normalRetailSaleTransaction |   