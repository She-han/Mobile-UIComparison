Feature: MMG Return

  @PT-344 @MMGReturn @MVP @AUTOMATED @POS @POSValidatedTest @POSSet3
  Scenario: MMG Product Return By Sales Person
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "MMG Return" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "1" seconds
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter y button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user selects "${MMG Product 1 Description With Region}" from "MMG Group List" list
    And user presses "Select" button and "Enter Authorising User" page shown
    And user enters "${Authorising user 1 Username}" into "Input Box" field
    And user presses "Keyboard Enter Button" icon button 
    And "Enter Authorising Pin" page is shown
    And user enters "${Authorising user 1 Password}" into "Input Box" field
    And user presses "OK" button and "Enter Coded Price" page shown
    And user enters "${MMG Product 1 Price}" into "Input Box" field
    And user presses "OK" button and "Enter Sales Person" page shown
    And user selects "PO1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Return ${MMG Product 1 Description}" is displayed in "Receipt" list
    And "${MMG Product 1 Refund Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                                       |
      | item | R,${MMG Product 1 Description},${MMG Product 1 Refund Price} |
      | item | Refund Cash UK,${MMG Product 1 Price}                        |
      | text | Auth User: ${Authorising user 1 Name}                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-197 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: MMG Return - Return Unknown Product
    Given user signs on as "POS Operator"
    And "Transaction Basket" page is shown
    And user presses "Returns" button
    And user presses "Return Item" button
    And "Enter Return Item" page is shown
    When user enters "MMG" into "Input Box" field
    And user presses "ENT" button
    Then "Confirm Unknown Product Return" page is shown
    And user presses "Return" button
    And "Filtered MMG" page is shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "1" seconds
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter y button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user selects "${MMG Product 2 Description With Region}" from "MMG Group List" list
    And user presses "Select" button
    And "Enter Authorising User" page is shown
    And user enters "${Authorising User 1 Username}" into "Input Box" field
    And user presses "Keyboard Enter Button" icon button
    And "Enter Authorising Pin" page is shown
    And user enters "${Authorising User 1 Password}" into "Input Box" field
    And user presses "Keyboard Enter Button" icon button
    And "Enter Coded Price" page is shown
    And user enters "${MMG Product 2 Price}" into "Input Box" field
    And user presses "Keyboard Enter Button" icon button
    And "Enter Sales Person" page is shown
    And user selects "PO1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${MMG Product 2 Description}" is displayed in "Receipt" list
    And "${MMG Product 2 Price}" is displayed in "Receipt" list
    And "Refund Cash UK" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                                       |
      | text | Salesperson:  ${POS Operator Name}                           |
      | item | R,${MMG Product 2 Description},${MMG Product 2 Refund Price} |
      | item | Refund Cash UK,${MMG Product 2 Price}                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10893 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet3 @TobeFixedAutTest
  Scenario: Return receipt of a transaction containing only an MMG Sale
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "1" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user enters "2478" into "Input Box" field
    And user presses "ENT" button
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Sell" button and "Select Reason" page shown
    And user selects "Faulty Barcode" from "Selection List" list
    And user presses "OK" button and "Filtered Mmg" page shown
    When user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "1" seconds
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter y button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user selects "${MMG Product 2 Description With Region}" from "MMG Group List" list
    And user presses "ENT" button
    And "Enter Item Price" page is shown
    And user enters "20.00" into "Input Box" field 
	  And user presses "OK" button and "Transaction Basket" page shown
	  And "${MMG Product 2 Description}" is displayed in "Receipt" list
    And "${MMG Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "60" seconds
    And user signs on as "POS Operator"
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user presses "Search" button and "Select Transaction Details" page shown
    And user presses "View" button and "Display Transaction With MSG Config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    When "Return ${MMG Product 2 Description} ${MMG Product 2 Refund Price} Ret Reason: Damaged / Faulty (30 Days)" is displayed in "Receipt" list
    Then user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                                      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "SignOff" button
    And "Enter User" page is shown 
    
  @PT-10895 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet3 @TobeFixedAutTest @ToBeFixedAutTest
  Scenario: Return receipt of a transaction containing an MMG Sale product and merchandise product
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "1" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user enters "2478" into "Input Box" field
    And user presses "ENT" button
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Sell" button and "Select Reason" page shown
    And user selects "Faulty Barcode" from "Selection List" list
    And user presses "OK" button and "Filtered Mmg" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "1" seconds
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter y button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user selects "${MMG Product 2 Description With Region}" from "MMG Group List" list
    And user presses "ENT" button
    And "Enter Item Price" page is shown
    And user enters "20.00" into "Input Box" field 
	  And user presses "OK" button and "Transaction Basket" page shown
	  And "${MMG Product 2 Description}" is displayed in "Receipt" list
    And "${MMG Product 2 Price}" is displayed in "Receipt" list
	  And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${MMG Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "60" seconds
    And user signs on as "POS Operator"
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user presses "Search" button and "Select Transaction Details" page shown
    And user presses "View" button and "Display Transaction With MSG Config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    When "Return ${MMG Product 2 Description} ${MMG Product 2 Refund Price} Ret Reason: Damaged / Faulty (30 Days)" is displayed in "Receipt" list
    Then user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                                      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "SignOff" button
    And "Enter User" page is shown 

  @PT-12866 @POS @AUTOMATED @ToBeFixedAutTest
  Scenario: Verify that the tax is calculated correctly when returning an MMG item
    Given user signs on as "Pos Operator 9"
    And user enters "${Product 2356}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2356 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2356 Description},${Product 2356 Price}     |
      | item      | Total Tax,£3.60                                       |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
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
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Select Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user presses "Skip Original Tenders" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "${Product 2356 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                               |
      | item | R,${Product 2356 Description},-${Product 2356 Price} |
      | item | Total Tax,-£3.60                                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
