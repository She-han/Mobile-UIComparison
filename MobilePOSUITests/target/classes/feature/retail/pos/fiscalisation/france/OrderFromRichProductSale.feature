Feature: Order via rich product search

  @PT-17395 @Fiscalisation @France @FiscalFranceOrder @No_Printer @AUTOMATED
  Scenario: Order via rich product search
    Given user signs on as "France Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Product Fiscal Fr 1}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product Fiscal Fr 1 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Product Fiscal Fr 1 Description}"
    When user presses "ADD TO BAG" button
    Then "Transaction Basket" page is shown
    And "${Product Fiscal Fr 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button
    Then "Capture Customer Name" page is shown
    When user enters "Browne" into "Customer Forename Text" field
    And user enters "Michael" into "Customer Surname Text" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    And user enters "Enactor" into "Customer Address Organisation Text" field
    When user enters "Cambridge House" into "Customer Address Line1 Text" field
    And user enters "Bluecoats Avenue" into "Customer Address Line2 Text" field
    And user enters "Oak Grove" into "Customer Address Line3 Text" field
    And user enters "Hertford" into "Customer Town Text" field
    And user enters "Herts" into "Customer County Text" field
    And user selects "Alberta" from "Customer Address Province Dropdown" combobox
    And user enters "SG13 8AT" into "Customer Postcode" field
    And user presses "OK" button
    Then "Capture Customer Phone Email" page is shown
    And user presses "OK" button
    Then "France Order Delivery Options" page is shown
    And user presses "${Delivery to home}" button and user presses "Continue" button
    Then "Capture Customer Name Contact" page is shown
    And user presses "OK" button
    Then "Capture Customer Address Prompt" page is shown
    And user presses "OK" button
    Then "Get Delivery Notifications" page is shown
    And user presses "Skip" button
    Then "Get Delivery Instructions" page is shown
    And user presses "OK" button
    Then "Select Reason" page is shown
    And user selects "100%" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page is shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown