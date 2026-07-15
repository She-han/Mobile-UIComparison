Feature: Reason Configuration With Witness Capturing

  @PT-1063 @AUTOMATED @JYSK @Regression @POS @POSValidatedTest @POSSet4
  Scenario: Perform a department sale operation with a witness captured reason (Old Stock - Always Witness)
    Given user signs on as "Sales Assistant"
    And user presses "Dept Sale" button and "Select Reason" page shown
    When user selects "Old Stock - Always Witness" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter c button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter o button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter l button" icon button
    And user waits "2" seconds
    And user selects "Cologne Gift Sets (All Regions)" from "MMG Group List" list
    And user presses "Toggle Alpha Keyboard" icon button
    And user presses "Select" button and "Enter Item State" page shown
    And user enters "1234" into "Input Box" field
    And user presses "OK" button and "Enter MMG Item Comment" page shown
    And user enters "dep sale witness capture" into "Input Box" field
    And user presses "OK" button and "Enter Item Price" page shown
    And user enters "£13.45" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | -£13.45                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1064 @AUTOMATED @JYSK @Regression @POS @POSValidatedTest @POSSet4
  Scenario: Perform a department sale operation with a reason which witness capturing is not configured (Old Stock - Never Witness)
    Given user signs on as "Sales Assistant"
    And user presses "Dept Sale" button and "Select Reason" page shown
    When user selects "Old Stock - Never Witness" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter c button" icon button
    And user waits "1" seconds
    And "Filtered MMG" page is shown
    And user presses "Keyboard Letter o button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter l button" icon button
    And user waits "2" seconds
    And user selects "Cologne Gift Sets (All Regions)" from "MMG Group List" list
    And user presses "Toggle Alpha Keyboard" icon button
    And user presses "Select" button and "Enter Item State" page shown
    And user enters "1234" into "Input Box" field
    And user presses "OK" button and "Enter MMG Item Comment" page shown
    And user enters "dep sale witness capture" into "Input Box" field
    And user presses "OK" button and "Enter Item Price" page shown
    And user enters "£13.45" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | -£13.45                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1068 @AUTOMATED @JYSK @Regression @POS
  Scenario: Verify that Witness Capture cannot be cancelled for user without skip privileges
    Given user signs on as "Witness Capture"
    And user presses "Dept Sale" button and "Select Reason" page shown
    And user selects "Old Stock - Always Witness" from "Selection List" list
    When user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    Then button with label "Skip" is not displayed
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user presses "Cancel" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Filtered MMG" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1069 @AUTOMATED @JYSK @Dune @POS @POSValidatedTest @POSSet4
  Scenario: Verify witness capture using original POS user for Department Sale reason configured to always prompt witness
    Given user signs on as "Sales Assistant"
    And user presses "Dept Sale" button and "Select Reason" page shown
    And user selects "Old Stock - Always Witness" from "Selection List" list
    And user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    When user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Witness Not Allowed" page shown
    Then "Witness Not Allowed" page is shown
    And user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter c button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter o button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter l button" icon button
    And user waits "2" seconds
    And user selects "Cologne Gift Sets (All Regions)" from "MMG Group List" list
    And user presses "Toggle Alpha Keyboard" icon button
    And user presses "Select" button and "Enter Item State" page shown
    And user enters "1234" into "Input Box" field
    And user presses "OK" button and "Enter MMG Item Comment" page shown
    And user enters "dep sale witness capture" into "Input Box" field
    And user presses "OK" button and "Enter Item Price" page shown
    And user enters "£13.45" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | -£13.45                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1070 @AUTOMATED @JYSK @Dune @ManualVerification @POS @POSValidatedTest @POSSet4
  Scenario: Verify witness capture using different POS user for Department Sale reason configured to always prompt witness
    Given user signs on as "Sales Assistant"
    And user presses "Dept Sale" button and "Select Reason" page shown
    When user selects "Old Stock - Always Witness" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter c button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter o button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter l button" icon button
    And user waits "2" seconds
    And user selects "Cologne Gift Sets (All Regions)" from "MMG Group List" list
    And user presses "Toggle Alpha Keyboard" icon button
    And user presses "Select" button and "Enter Item State" page shown
    And user enters "1234" into "Input Box" field
    And user presses "OK" button and "Enter MMG Item Comment" page shown
    And user enters "dep sale witness capture" into "Input Box" field
    And user presses "OK" button and "Enter Item Price" page shown
    And user enters "£15.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | -£15.00                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1074 @AUTOMATED @JYSK @Regression @ManualVerification @POS @POSValidatedTest @POSSet4
  Scenario: Verify transaction with item discount with witness capture reason
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "£1.00 Item. Disc. - Witness Capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (KAT VON D Eye Liner),-£1.00            |
      #| item      | Item Discount (£1.00 Item. Disc. - W,-£1.00           |
      | text      | -£16.80                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1075 @AUTOMATED @JYSK @Regression @ManualVerification @POS 
  Scenario: Verify transaction with transaction discount with witness capture reason
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "£1.00 Trans. Disc. - Witness Capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (£1.00 Trans. Disc. - Witness Capture)" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | Discount (£1.00 Trans. Disc. -   Witness Capture)     |
      | item      | -£1.00                                                |     
      | text      | -£16.80                                               |  
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1078 @AUTOMATED @JYSK @Regression @ManualVerification @POS
  Scenario: Verifying item return with witness capture reason
    Given user signs on as "Pos Operator"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    When user selects "Damaged / Faulty - witness capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Damaged / Faulty - witness capture" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | Refund Cash UK,£21.60                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1079 @AUTOMATED @JYSK @Regression @ManualVerification @POS @TobeFixedAutTest
  Scenario: Verifying receipt return with witness capture reason
    Given user signs on as "POS Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
    And user waits "90" seconds
    And user signs on as "POS Operator"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (Over 30 Days) - witness capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "Damaged / Faulty (Over 30 Days) - witness capture" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 1 Description},-${Product 1 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1082 @POS @JYSK @ManualVerification @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify witness capture for No Sale reason configured to always prompt for witness
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    When user selects "Incorrect change given - witness capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | No Sale                                               |
      | text      | Incorrect change given - witness                      |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1083 @POS @JYSK @ManualVerification @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify witness capture for Price override reason configured to always prompt for witness
    Given user signs on as "POS Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Merchandise Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Merchandise Product 1 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Price Override Up - witness capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Enter Price Override Amount" page shown
    And user enters "£22.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Merchandise Product 1 Description} £22.00" is displayed in "Receipt" list
    And "Price Override Up - witness capture" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Override (£20.00 to £22.00)                           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1084 @AUTOMATED @JYSK @ManualVerification @POS
  Scenario: Complete Witness Process With POS Manager
    Given user signs on as "Sales Assistant"
    And user presses "Dept Sale" button and "Select Reason" page shown
    When user selects "Old Stock - Always Witness" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Filtered MMG" page shown
    And user enters "Cologne Gift Sets " into "Input Box" field 
    And user presses "CLR" icon button 
    And user waits "2" seconds
    And user presses "Select" button and "Enter Item State" page shown
    And user enters "1234" into "Input Box" field
    And user presses "OK" button and "Enter MMG Item Comment" page shown
    And user enters "dep sale witness capture" into "Input Box" field
    And user presses "OK" button and "Enter Item Price" page shown
    And user enters "£15.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | -£15.00                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1071 @AUTOMATED @JYSK @ManualVerification @POS 
  Scenario: Verify witness capture for department sale reason configured to always prompt witness for witness skip privileged original user
    Given user signs on as "Manager 2"
    And user presses "Dept Sale" button and "Select Reason" page shown
    When user selects "Old Stock - Always Witness" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user presses "Skip" button and "Filtered MMG" page shown
    And user enters "Cologne Gift Sets " into "Input Box" field 
    And user presses "CLR" icon button
    And user waits "2" seconds 
    And user presses "Select" button and "Enter Item State" page shown
    And user enters "1234" into "Input Box" field
    And user presses "OK" button and "Enter MMG Item Comment" page shown
    And user enters "dep sale witness capture" into "Input Box" field
    And user presses "OK" button and "Enter Item Price" page shown
    And user enters "£16.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Cologne Gift Sets                                     |
      | text      | -£16.00                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1076 @AUTOMATED @JYSK @Regression @ManualVerification @POS @POSValidatedTest @POSSet4
  Scenario: Verify item void with witness capture reason
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    When user selects "Item Faulty - Witness Capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1077 @AUTOMATED @JYSK @Regression @ManualVerification @POS @POSValidatedTest @POSSet4
  Scenario: Verify Transaction void with witness capture reason
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store - Witness Capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1080 @ManualVerification @JYSK @POS @AUTOMATED 
  Scenario: Verify witness capture for Safe Income reason configured to always prompt for witness
    Given user signs on as "Manager 2"
    And "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Cash Management Safe Cash Management" page shown
    And user presses "Cash Management Screen Income Button" icon button
    And "Cash Management Select Expense Reason" page is shown
    When user selects "Store Income - witness capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 3 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 3 Password}" into "Input Box" field
    And user presses "ENT" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button
    And user presses "Confirm" button and "Cash Management Select Tender Reason" page shown
    And user presses "Notes" button and "Enter Notes" page shown
    And user enters "This is Safe Income" into "Cash Management Text Area" field
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user presses "Complete" button and "Enter Notes" page shown
    And "Cash Management Text Area" field displays the text "This is Safe Income"
		And user presses "OK" button and "Selection State" page shown
    And receipt display with following details
      | text | Safe Income           |
      | text | Safe ${Safe ID}       |
      | item | Cash UK,£10.00        |
      | item | Pence,£10.00          |
      | text | This is Safe Income   |
      | text | ${Manager 2 Username} |
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1081 @ManualVerification @MVP @POS @AUTOMATED @SafeCashManagement
  Scenario: Verify witness capture for Safe Expense reason configured to always prompt for witness
    Given user signs on as "Manager 2"
    And "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Selection State" page shown
    And user presses "Cash Management Screen Expense Button" icon button
    And "Cash Management Select Expense Reason" page is shown
    When user selects "Store Expense - witness capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 3 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 3 Password}" into "Input Box" field
    And user presses "ENT" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button
    And user presses "Confirm" button and "Cash Management Select Tender Reason" page shown
    And user presses "Notes" button and "Cash Management Add Notes" page shown
    And user enters "This is Safe Expense" into "Cash Management Text Area" field
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user presses "Notes" button and "Enter Notes" page shown
    And "Cash Management Text Area" field displays the text "This is Safe Expense"
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user presses "Complete" button and "Enter Notes" page shown
    And "Cash Management Text Area" field displays the text "This is Safe Expense"
    And user presses "OK" button and "Selection State" page shown
    And receipt display with following details
      | text | Safe Expense          |
      | text | Safe ${Safe ID}       |
      | item | Cash UK,£10.00        |
      | item | Pence,£10.00          |
      | text | This is Safe Expense  |
      | text | ${Manager 2 Username} |
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
