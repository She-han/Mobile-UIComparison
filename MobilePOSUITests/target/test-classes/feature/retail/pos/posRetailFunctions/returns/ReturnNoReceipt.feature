Feature: Return - No Receipt

  @PT-1060 @PreSales @ItemReturnWithoutReceipt @POS @AUTOMATED @POSValidatedTest @POSSet4 @Regression
  Scenario: Item Return by scanning an item
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    Then "Enter Return Item" page is shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty Test" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    When user presses "No" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item flag | R,${Product 1 Description}                            |
      | item      | ${Product 1 Description},${Product 1 Refund Price}    |
      | text      | Copy 1                                                |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-347 @PreSales @QuanttiyReturnWithoutReceipt @POS @AUTOMATED @MVP @POSValidatedTest @POSSet4
  Scenario: Return Quantity Without Receipt
    Given user signs on as "POS Operator"
    When user presses "Returns" button
    Then user presses "Quantity Return" button and "Enter Return Quantity" page shown
    When user enters "2" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    Then user presses "No" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-2 @ ${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And receipt display with following details
      | text | Refund                                             |
      | item | R,${Product 2 Description},-2 @ ${Product 2 Price} |
      | item | Refund Cash UK                                     |
      | text | Customer signature                                 |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-196 @PreSales @POS @AUTOMATED @Dune @Dunelm @Harrods @RI @MVP @Mobile @Support @Smoke @ReactPOS @Regression @POSValidatedTest @POSSet4
  Scenario: Item Return through Product Search
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    Then "Enter Return Item" page is shown
    When user presses "ENT" button
    Then "Invalid Product Code" page is shown
    When user presses "OK" button
    Then "Enter Return Item" page is shown
    When user presses "Product Search" button
    Then "Select Product" page is shown
    When user enters "Cosmetic" into "Input Box" field
    Then "Cosmetic" is displayed in "Selection List" list
    And user waits "2" seconds
    When user selects "${Product 6 Description}" from "Selection List" list
    And user presses "View" button
    Then "Display Product Details" page is shown
    When user presses "RETURN" button
    Then "Select Reason" page is shown
    When user selects "Damaged / Faulty Test" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "-${Product 6 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty Test" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item flag | R,${Product 6 Description},-${Product 6 Price}        |
      | text      | Copy 1                                                |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-346 @PreSales @AUTOMATED @POS @POSValidatedTest @POSSet3
  Scenario: Return Wthout Receipt Item Exchange
    Given user signs on as "Authorising user 1"
    And user presses "Returns" button
    And "Return Product" page is shown
    And user presses "Return Without Receipt" button
    And "Return Product" page is shown
    And user presses "Item Exchange" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Enter Sales Person" page shown
    And user selects "${Assistant Manager 1 Id}" from "Selection List" list
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Refund Price}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And user presses "TOTAL" button
    Then "End Transaction Continue" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | Salesperson:  ${Assistant Manager 1 Name}             |
      | item      | R,${Product 1 Description},-${Product 1 Price}        |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "User Functions" button
    When user presses "Sign Off" button
    Then "Enter User" page is shown

  @PT-909 @Regression @POS @AUTOMATED @Dunelm @POSValidatedTest @POSSet4
  Scenario: Multiple quantity & Multiple Reasons- Item Return
    #Perform the first transaction
    Given user signs on as "POS Operator"
    #Perform the first return
    And user presses "Returns" button
    And user presses "Quantity Return" button and "Enter Return Quantity" page shown
    And user enters "1" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "Return Item" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "-${Product 1 Price}" is displayed in "Receipt" list
    #Perform the second return
    And user presses "Returns" button
    When user presses "Quantity Return" button and "Enter Return Quantity" page shown
    And user enters "1" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "Return Item" button and "Select Reason" page shown
    And user selects "Managers Discretion" from "Selection List" list
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Select Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-${Product 2 Price}" is displayed in "Receipt" list
    #Return using Cash Tender
    And user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 1 Description},-${Product 1 Price} |
      | item | R,${Product 2 Description},-${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1774 @AUTOMATED @POS @POSValidatedTest @POSSet4
  Scenario: Verify multiple reasons are listed when proceeding with an Item Return
    Given user signs on as "POS Operator"
    When user presses "Returns" button and "Transaction Basket" page shown
    Then user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And "Damaged / Faulty" is displayed in "Selection List" list
    And "Not Wanted (10 Days) (Credit Note)" is displayed in "Selection List" list
    And "Managers Discretion" is displayed in "Selection List" list
    And "Item Return Alert" is displayed in "Selection List" list
    And "Refund to Credit Note Only" is displayed in "Selection List" list
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 2 description}" is displayed in "Receipt" list
    And "Item Return Alert" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | item | Refund Cash UK                                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6834 @AUTOMATED @POS @JYSK_SL @OfflineRecieptReturn
  Scenario: Return without Original Receipt when POS is offline - Item Return
    Given user signs on as "POS Operator"
    When user presses "Returns" button and "Transaction Basket" page shown
    Then user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty Test" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "-${Product 1 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty Test" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item flag | R,${Product 1 Description}                            |
      | item      | ${Product 1 Description},${Product 1 Refund Price}    |
      | text      | Copy 1                                                |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6837 @AUTOMATED @POS @JYSK_SL @OfflineRecieptReturn
  Scenario: Validate that Signature Capture during Receipt without return works when POS is offline
    Given user signs on as "POS Operator"
    When user presses "Returns" button and "Transaction Basket" page shown
    Then user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty Test" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "-${Product 1 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty Test" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item flag | R,${Product 1 Description}                            |
      | item      | ${Product 1 Description},${Product 1 Refund Price}    |
      | text      | Copy 1                                                |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6836 @AUTOMATED @POS @JYSK_SL @OfflineRecieptReturn @NotForRC1
  Scenario: Validate that Capture Customer Details during Receipt without return works when POS is offline
    Given user signs on as "POS Operator"
    When user presses "Returns" button and "Transaction Basket" page shown
    Then user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button
    Then "Capture Customer Name" page is shown
    And user presses "Search By Name" button
    And "Enter Search Name" page is shown
    And user enters "Mary" into "Input Box" field
    And user presses "OK" button and "select customer" page shown
    Then user selects "9" from "Selection List" list
    And user presses "OK" button
    And "Confirm Customer" page is shown
    And user presses "Confirm" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                         |
      | text | Customer: Mary Coles|
      | item | R,${Product 1 Description},-${Product 1 Price} |
      | item | Refund Cash UK                                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6839 @AUTOMATED @POS @OfflineRecieptReturn
  Scenario: Return without Original Receipt when POS is offline - Return Unknown Product
    Given user signs on as "POS Operator"
    When user presses "Returns" button and "Transaction Basket" page shown
    Then user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "unknown" into "Input Box" field
    And user presses "ENT" button and "Confirm Unknown Product Return" page shown
    And user presses "Return" button
    And user waits "2" seconds
    And "Filtered MMG" page is shown
    And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter m button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user selects "Men (All Regions)" from "MMG Group List" list
    And user presses "Keyboard Enter Button" icon button
    And "Enter Authorising User" page is shown
    And user enters "${Supervisor Username}" into "Input Box" field
    And user presses "Keyboard Enter Button" icon button
    And "Enter Authorising Pin" page is shown
    And user enters "${Supervisor Password}" into "Input Box" field
    And user presses "Keyboard Enter Button" icon button
    And "Enter Coded Price" page is shown
    And user enters "25000" into "Input Box" field
    And user presses "Keyboard Enter Button" icon button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund         |
      | item | R,Men,-£250.00 |
      | item | Refund Cash UK |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-14464 @AUTOMATED @POS @POSReturnReceipts
  Scenario: Exchange without receipt including complex product promotions
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 196}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown    
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 197}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And user enters "${Product 196}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 197}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    Then receipt display with following details
      | text | Sale         |
      | item | R,${Product 196 Description},-${Product 196 Price} |
      | item | R,${Product 197 Description},-${Product 197 Price} |
      | item | ${Product 196 Description},${Product 196 Price} |
      | item | ${Product 197 Description},${Product 197 Price} |
      | text | TOTAL |
      | item | £0.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
		