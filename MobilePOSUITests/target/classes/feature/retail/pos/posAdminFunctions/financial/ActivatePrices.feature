Feature: Activate Prices

  @PT-529 @SET2 @AUTOMATED @Regression @POS @ReactPos @POSValidatedTest @POSSet1
  Scenario: Postponed Active Product Price change for a product and verify already activated price is applying for the product
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U003" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And "Price Change Id Field" field displays the text "U003"
    And "Price Change Description Field" field displays the text "Test 3"
    And "Price Change Status Field" field displays the text "Active"
    Then user presses "Back" button and "Product Price Change Selection" page shown
    When user presses "Complete" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And "Transaction Basket" page is shown
    And user enters "${Product 21}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 21 Description}" is displayed in "Receipt" list
    And "${Product 21 Activate Price}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    Then user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U003" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Postponed" button and "Product Price Change Selection" page shown
    Then user enters "U003" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And "Price Change Status Field" field displays the text "Postponed"
    When user presses "Back" button and "Product Price Change Selection" page shown
    Then user presses "Complete" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 21}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 21 Description}" is displayed in "Receipt" list
    And "${Product 21 Original Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #Reset "U003" Product Price Change status back to "Active"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U003" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Active" button and "Product Price Change Selection" page shown
    Then user presses "Complete" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-530 @SET2 @AUTOMATED @Regression @POS @ReactPos @POSValidatedTest @POSSet1
  Scenario: Cancelled Active Product Price change for a product and verify the applying price for the product
    Given user signs on as "Sales Assistant"
    And user enters "${Product 22}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 22 Description}" is displayed in "Receipt" list
    And "${Product 22 Activate Price}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    Then user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U004" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And "Price Change Id Field" field displays the text "U004"
    And "Price Change Description Field" field displays the text "Seasonal Price Change"
    And "Price Change Status Field" field displays the text "Active"
    And user presses "Cancelled" button and "Product Price Change Selection" page shown
    And user enters "U004" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And "Price Change Status Field" field displays the text "Cancelled"
    And user presses "Back" button and "Product Price Change Selection" page shown
    Then user presses "Complete" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 22}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 22 Description}" is displayed in "Receipt" list
    And "${Product 22 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #Reset "U004" Product Price Change status back to "Active"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U004" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Active" button and "Product Price Change Selection" page shown
    Then user presses "Complete" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

 @PT-531 @SET2 @AUTOMATED @Regression @POS @ReactPos @POSValidatedTest @POSSet1
  Scenario: Verify Change status for Change Product Price in a POS location
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U999" into "Input Box" field
    When user presses "ENT" button and "Faild to Load Price Change Prompt" page shown
    And user presses "OK" button and "Product Price Change Selection" page shown
    Then user enters "U005" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And "Price Change Id Field" field displays the text "U005"
    And "Price Change Description Field" field displays the text "Year End Product Price Change"
    And "Price Change Status Field" field displays the text "Active"
    And user presses "Inactive" button and "Product Price Change Selection" page shown
    Then user selects "U005" from "Selection List" list
    And user presses "Change Filters" button and "Filter Change Prompt" page shown
    And user selects "Inactive" from "Price Change Status Dropdown" combobox
    And user presses "OK" button and "Product Price Change Selection" page shown
    When user selects "U005" from "Selection List" list
    Then user presses "Complete" button and "Administration Screen" page shown
    #Reset "U005" Product Price Change status back to "Active"
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U005" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Active" button and "Product Price Change Selection" page shown
    Then user presses "Complete" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

 @PT-532 @SET2 @AUTOMATED @Regression @POS @ReactPos @POSValidatedTest @POSSet1
  Scenario: Manually Activate Product Price change for a product
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U006" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And "Price Change Id Field" field displays the text "U006"
    And "Price Change Description Field" field displays the text "Test 6"
    And "Price Change Status Field" field displays the text "Manual Activated"
    Then user presses "Back" button and "Product Price Change Selection" page shown
    When user presses "Complete" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 23}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 23 Description}" is displayed in "Receipt" list
    And "${Product 23 Activate Price}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    Then user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U006" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Inactive" button and "Product Price Change Selection" page shown
    Then user enters "U006" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And "Price Change Status Field" field displays the text "Inactive"
    When user presses "Back" button and "Product Price Change Selection" page shown
    Then user presses "Complete" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 23}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 23 Description}" is displayed in "Receipt" list
    And "${Product 23 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #Reset "U006" Product Price Change status back to "Manual Activated"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U006" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Manual Activated" button and "Product Price Change Selection" page shown
    Then user presses "Complete" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

 @PT-526 @SET2 @POS @AUTOMATED @ReactPos @POSValidatedTest @POSSet1
  Scenario: Activate Product Price change for a product
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    #Precondition - Set "U001" status as "Inactive"
    And "Product Price Change Selection" page is shown
    And user enters "U001" into "Input Box" field
    And user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Inactive" button and "Product Price Change Selection" page shown
    And user presses "Complete" button and "Administration Screen" page shown
    #Activate Product Price change for a product
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    And user enters "U001" into "Input Box" field
    And user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Active" button and "Product Price Change Selection" page shown
    And user presses "Complete" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

 @PT-528 @SET2 @POS @AUTOMATED @ReactPos @POSValidatedTest @POSSet1
  Scenario: Inactivate Product Price change for a product
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    #Inactivate Product Price change for a product
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    And user enters "U001" into "Input Box" field
    And user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Inactive" button and "Product Price Change Selection" page shown
    And user presses "Complete" button and "Administration Screen" page shown
    #Reset "U001" Product Price Change status back to "Active"
    And user presses "Activate Prices" icon button
    And "Product Price Change Selection" page is shown
    Then user enters "U001" into "Input Box" field
    When user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Active" button and "Product Price Change Selection" page shown
    Then user presses "Complete" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-4498 @POS @ReactPos @AUTOMATED
  Scenario: Set status of Product Price and filter by respective status to check that it is listed
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Financial" icon button
    And user presses "Activate Prices" icon button
    Then "Product Price Change Selection" page is shown
    When user enters "U005" into "Input Box" field
    And user presses "ENT" button and "Price Change Change Status" page shown
    And user presses "Inactive" button and "Product Price Change Selection" page shown
    And user presses "Change Filters" button and "Filter Change Prompt" page shown
    And user enters "U005" into "Price Change" field
    And user selects "Inactive" from "Price Change Status Dropdown" combobox
    Then user presses "OK" button and "Product Price Change Selection" page shown
    When user selects "U005" from "Selection List" list
    And user presses "OK" button and "Price Change Change Status" page shown
    And user presses "Cancelled" button and "Product Price Change Selection" page shown
    And user presses "Change Filters" button and "Filter Change Prompt" page shown
    And user enters "U005" into "Price Change" field
    And user selects "Cancelled" from "Price Change Status Dropdown" combobox
    Then user presses "OK" button and "Product Price Change Selection" page shown
    When user selects "U005" from "Selection List" list
    And user presses "OK" button and "Price Change Change Status" page shown
    And user presses "Manual Activated" button and "Product Price Change Selection" page shown
    And user presses "Change Filters" button and "Filter Change Prompt" page shown
    And user enters "U005" into "Price Change" field
    And user selects "Manual Activated" from "Price Change Status Dropdown" combobox
    Then user presses "OK" button and "Product Price Change Selection" page shown
    When user selects "U005" from "Selection List" list
    And user presses "OK" button and "Price Change Change Status" page shown
    And user presses "Postponed" button and "Product Price Change Selection" page shown
    And user presses "Change Filters" button and "Filter Change Prompt" page shown
    And user enters "U005" into "Price Change" field
    And user selects "Postponed" from "Price Change Status Dropdown" combobox
    And user presses "OK" button and "Product Price Change Selection" page shown
    Then user selects "U005" from "Selection List" list
    And user presses "OK" button and "Price Change Change Status" page shown
    And user presses "Active" button and "Product Price Change Selection" page shown
    And user presses "Change Filters" button and "Filter Change Prompt" page shown
    And user enters "U005" into "Price Change" field
    And user selects "Active" from "Price Change Status Dropdown" combobox
    Then user presses "OK" button and "Product Price Change Selection" page shown
    When user presses "Complete" button and "Administration Screen" page shown
    And user presses "Admin Screen Home" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
