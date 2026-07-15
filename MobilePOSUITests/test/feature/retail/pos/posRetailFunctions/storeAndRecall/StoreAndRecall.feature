Feature: Store/Recall Transactions

  @PT-10547 @AUTOMATED @POS @SCnotReady @Regression
  Scenario: Verify Store Basket by Customer Loyalty Card Number
    Given user signs on as "Sales Assistant"
    And user enters "1" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Store / Recall Options" button
    And user presses "Store by Customer Basket" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button and "Loyalty Account Details" page shown
    And "Customer Loyalty Details Forname" field contains the text "Mark"
    And "Customer Loyalty Details Surname" field contains the text "Harrison"
    And "Customer Loyalty Details Account Number" field contains the text "1"
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Customer Basket" button and "Stored Customer Baskets List Selection Prompt" page shown
    And user presses "View" button and "Display Transaction With Msg Config" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6428 @AUTOMATED @POS @SCnotReady @ToBeFixedAutTest
  Scenario: To test Store Transaction By Customer Id
    Given user signs on as "Manager 2"
    And user enters "1" into "Input Box" field
    And user presses "ENT" button
    And user enters "2" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Store / Recall Options" button
    And user presses "Store by Customer ID" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    # Recall scenario
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Customer ID" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button and "Loyalty Account Details" page shown
    And user presses "OK" button and "Transaction Selection Prompt" page shown
    And user presses "OK" button
    And user waits "5" seconds
    And "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6427 @AUTOMATED @POS @SCnotReady @ToBeFixedAutTest
  Scenario: To test Store and Recall Transaction By Storage Id
    Given user signs on as "Manager 2"
    And user enters "1" into "Input Box" field
    And user presses "ENT" button
    And user enters "2" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Store / Recall Options" button
    And user presses "Store by Storage ID" button and "Store By Storage Id" page shown
    And user enters "123" into "Input Box" field
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    # Recall scenario
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Storage ID" button and "Recall By Storage Id" page shown
    And user enters "123" into "Input Box" field
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-8696 @AUTOMATED @POS @SCnotReady @Regression
  Scenario: Verify recalling basket in POS when POS has several stored user baskets
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    And user presses "Clear" button on external "Primary Printer" window
    Then "Enter User" page is shown
    Given user signs on as "POS Operator"
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    And user presses "Clear" button on external "Primary Printer" window
    Then "Enter User" page is shown
    Given user signs on as "POS Operator"
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 2 Price}" is displayed in "Receipt" list
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    And user presses "Clear" button on external "Primary Printer" window
    Then "Enter User" page is shown
    Given user signs on as "POS Operator"
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 2 Price}" is displayed in "Receipt" list
    And "${Product 3 Description}" is displayed in "Receipt" list
    And "${Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown  

  @PT-14422 @AUTOMATED @POS 
  Scenario: Verify recall customer basket - Existing Customer in Basket
  Given user signs on as "Sales Assistant"
  And user presses "Sales" button
  And user presses "More" button
  And user presses "Customers" button  
  And user presses "Capture Customer" button and "Capture Customer Name" page shown
  And user presses "Search By Name" button and "Enter Search Name" page shown
  And user enters "Mark" into "Input Box" field
  And user presses "OK" button and "Select Customer" page shown
  And user presses "OK" button and "Confirm Customer" page shown
  And user presses "Confirm" button and "Transaction Basket" page shown
  And user enters "${Product 1}" into "Input Box" field
  And user presses "ENT" button and "Transaction Basket" page shown
  And user presses "Sales" button
  And user presses "Store / Recall Options" button
  And user presses "Store by Customer" button and "Transaction Basket" page shown
  And user presses "SignOff" button
  And "Enter User" page is shown
  And user signs on as "Sales Assistant"
  And user presses "Sales" button
  And user presses "More" button
  And user presses "Customers" button  
  And user presses "Capture Customer" button and "Capture Customer Name" page shown
  And user presses "Search By Name" button and "Enter Search Name" page shown
  And user enters "Mark" into "Input Box" field
  And user presses "OK" button and "Select Customer" page shown
  And user presses "OK" button and "Confirm Customer" page shown
  And user presses "Confirm" button and "Transaction Basket" page shown
  And user presses "Sales" button
  And user presses "Store / Recall Options" button
  When user presses "Recall by Customer" button and "Transaction Selection Prompt" page shown
  Then user presses "OK" button and "Transaction Basket" page shown  
  And user presses "TOTAL" button and "Select Tender" page shown
  And user presses "Cash" button and "Enter Cash Tender Amount" page shown
  And user presses "OK" button and "Await Drawer Closed" page shown
  And receipt display with following details
    | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
    | telephone | Tel: ${Store Phone 1}                                 |
    | item      | ${Product 1 Description},${Product 1 Price}           |
  And user presses "Close" button on external "Cash Drawer" window
  And "Transaction Basket" page is shown
  And user presses "SignOff" button
  And "Enter User" page is shown