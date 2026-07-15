Feature: Return Quantity

  @PT-938 @AUTOMATED @Dunelm @POS @POSValidatedTest @POSSet4
  Scenario: Verify Return with Multiple Quantity
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    When user presses "Quantity Return" button and "Enter Return Quantity" page shown
    And user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "Return Item" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-5 @ ${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                     |
      | item | R ${Product 2 Description} |
      | item | -5 @ ${Product 2 Price}    |
      | text | Refund Cash UK             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-8661 @AUTOMATED @POS @POSValidatedTest @POSSet4
  Scenario: Verify Item Return with Item Quantity prompt
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    When user enters "${Product 55}" into "Input Box" field
    And "${Product 55}" is displayed in "Selection List" list
    And user selects "${Product 55}" from "Selection List" list
	And user presses "Return" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Enter Quantity" page shown
    Then user enters "5" into "Input Box" field
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 55 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                      |
      | item | R ${Product 55 Description} |
      | text | Refund Cash UK              |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-908 @ToBeFixedAutTest @AUTOMATED @Dunelm @POS @POSValidatedTest @POSSet4
  Scenario: Verify Receipt Return with Multiple Quantity and Multiple Reasons
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    When user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "4" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 10}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 9}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},3 @,${Product 2 Price}       |
      | item      | ${Product 10 Description},4 @,${Product 10 Price}     |
      | item      | ${Product 9 Description},3 @,${Product 9 Price}       |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user waits "2" seconds
    And user selects "${Product 2 Description}" from "Selection List" list
    And user presses "Change Return Quantity" button and "Capture Return Quantity" page shown
    And user enters "2" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    And user presses "Finish" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Select Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Down" button
    And user presses "Change Return Quantity" button and "Capture Return Quantity" page shown
    And user enters "2" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    And user presses "Finish" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Return Tender" page shown
    Then user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Refund                      |
      | item | R ${Product 2 Description}  |
      | item | -2 @ ${Product 2 Price}     |
      | item | R ${Product 10 Description} |
      | item | -2 @ ${Product 10 Price}    |
      | text | Refund Cash UK              |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-12003 @POS @AUTOMATED
  Scenario: Verify that its not allowed to return more than the original quantity
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    And user enters "4" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    When user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Change Return Quantity" button and "Capture Return Quantity" page shown
    And user enters "5" into "Input Box" field
    And user presses "OK" button and "Quantity Too High Error" page shown
    When user presses "OK" button and "Capture Return Quantity" page shown
    Then user presses "Cancel" button and "Extended Return Details" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-3500 @POS @AUTOMATED
  Scenario: Verifying the prices of the return sale of a quantity sale transaction
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    And user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Finish" button and "Select Reason" page shown
    And user selects "Not Wanted (10 Days)" from "Selection List" list
    And user presses "OK" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "M" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Customer: Mr Mark Harrison" is displayed in "Receipt" list
    And "Return ${Product 2 Description}" is displayed in "Receipt" list
    And "-£30.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                             |
      | text | Customer: Mark Harrison            |
      | item | R,${Product 2 Description},-£30.00 |
      | item | Refund Cash UK                     |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-3501 @POS @AUTOMATED
  Scenario: Verifying the prices of the return sale of a quantity sale transaction with promotions
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "5" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "5 @ ${Product 1 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    And user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Finish" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return ${Product 1 Description}" is displayed in "Receipt" list
    And "-£90.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                             |
      | item | R,${Product 1 Description},-£90.00 |
      | item | Refund Cash UK                     |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
