Feature: Product with selling options

  @PT-2722 @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify that Product having Discontinued status cannot be sold on the POS
    # Product 50 is created with Product Maintenance > General tab > General tab > Product Status = Discontinued
    Given user signs on as "POS Operator"
    When user enters "${Product 50}" into "Input Box" field
    And user presses "ENT" icon button
    And "Not For Sale" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2723 @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify that Product having Suspended status cannot be sold on the POS
    # Product 51 is created with Product Maintenance > General tab > General tab > Product Status = Suspended
    Given user signs on as "POS Operator"
    When user enters "${Product 51}" into "Input Box" field
    And user presses "ENT" icon button
    And "Not For Sale" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2724 @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify that adding Product with Open Cashdrawer option enabled to basket causes Cashdrawer to be opened
    # Product 52 is created with Product Maintenance > Selling Options tab > Selling Options tab > Open Cashdrawer <enabled>
    Given user signs on as "POS Operator"
    When user enters "${Product 52}" into "Input Box" field
    And user presses "ENT" icon button 
    And "Await Drawer Closed" page is shown
    And user waits "1" seconds
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And "${Product 52 description}" is displayed in "Receipt" list
    When user presses "Voids" button
    Then user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2725 @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify that Item Discount cannot be applied to product with Allow Discounts disabled
    # Product 52 is created with Product Maintenance > Selling Options tab > Restrictions tab > Allow Discounts = Disabled
    Given user signs on as "POS Operator"
    When user enters "${Product 52}" into "Input Box" field
    And user presses "ENT" icon button 
    And "Await Drawer Closed" page is shown
    And user waits "1" seconds
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And "${Product 52 description}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    Then button with label "Item Discount" is not displayed
    When user presses "Back" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10298 @POS @AUTOMATED @SCnotReady @ToBeFixedAutTest
  Scenario: Verify that Mandatory Product Option Set cannot be bypassed without adding an option Product to the basket
    Given user signs on as "POS Operator"
    When user enters "${Option Set Product 5}" into "Input Box" field
    And user presses "ENT" icon button
    And "Capture Optionset References" page is shown
    And user waits "1" seconds
    And user presses "Capture Optionset Next Button" icon button
    And "Popup Modal Ok" page is shown
    And user presses "OK" button
    And "Capture Optionset References" page is shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    And user presses "Clear" button on external "Primary Printer" window
    Then "Enter User" page is shown

  @PT-10758 @POS @AUTOMATED
  Scenario: Clear Options when doing a sale with Multiple Product Options
    Given user signs on as "Sales Assistant"
    When user enters "${Option Set Product 3}" into "Input Box" field
    And user presses "ENT" icon button
    Then "Capture Optionset References" page is shown
    And "${Option Set Product 3 Description}" is displayed in "Capture Optionset Header Panel" panel
    And user enters "4" into "Capture Optionset Text Option" field
    And user presses "Capture Optionset Next Button" icon button
    And user presses "Capture Optionset Remove Button 2" icon button
    Then "Capture Optionset References" page is shown
    And user enters "4" into "Capture Optionset Text Option" field
    And user presses "Capture Optionset Next Button" icon button
    And user selects "Gray" from "Capture Optionset Choice Option Dropdown 2" combobox
    And user presses "Capture Optionset Next Button 2" icon button
    And user presses "Capture Optionset Row 3 Product List Item 3" icon button
    #And user waits "15" seconds
    And user presses "Capture Optionset Boolean Option 2" checkbox
    #And user waits "15" seconds
    And user presses "Capture Optionset Next Button 4" icon button
    #And user waits "15" seconds
    And user presses "Capture Optionset Row 5 Product List Item 1" icon button
    And user presses "Capture Optionset Next Button 5" icon button
    Then "Transaction Basket" page is shown
    And "${Option Set Product 3 Description}" is displayed in "Receipt" list
    And "Number Print : 4" is displayed in "Receipt" list
    And "Color Selection : Gray" is displayed in "Receipt" list
    And "Are you a VIP User? : true" is displayed in "Receipt" list
    And "Crinkle Day Dress" is displayed in "Receipt" list
    And "Nike Capri Trainer" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}             |
      | telephone | Tel: ${Store Phone 1}                                             |
      | item      | ${Option Set Product 3 Description},${Option Set Product 3 Price} |
      | text      | Number Print : 4                                                  |
      | text      | Color Selection : Gray                                            |
      | text      | Crinkle Day Dress                                                 |
      | text      | Nike Capri Trainer                                                |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-16116 @POS @AUTOMATED
  Scenario: Verify the sale of a product having a mandatory text data option that cannot be bypassed without adding an text and text is reflected when the option set product is added to the transaction basket
    Given user signs on as "POS Operator"
    When user enters "${Option Set Product 6}" into "Input Box" field
    And user presses "ENT" icon button
    And "Capture Optionset References" page is shown
    And user waits "1" seconds
    And user presses "Capture Optionset Next Button" icon button
    And "Popup Modal Ok" page is shown
    And user presses "OK" button
    And "Capture Optionset References" page is shown
    And user enters "PRINT" into "Capture Optionset Text Option" field
    And user presses "Capture Optionset Next Button" icon button
    Then "Transaction Basket" page is shown
    And "${Option Set Product 6 Description}" is displayed in "Receipt" list
    And "Text To Be Printed : PRINT" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}             |
      | telephone | Tel: ${Store Phone 1}                                             |
      | item      | ${Option Set Product 6 Description},${Option Set Product 6 Price} |
      | text      | Text To Be Printed : PRINT                                        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
