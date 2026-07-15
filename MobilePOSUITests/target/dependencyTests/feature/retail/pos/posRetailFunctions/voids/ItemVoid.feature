Feature: Item Void

  @PT-205 @PreSales @SingleItemVoidWithMultipleItems @POS @Dune @Dunelm @JYSK @MVP @Mobile @AUTOMATED @Smoke @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Single Item void- When there are multiple items in the basket
    Given user signs on as "Sales Assistant"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    And following details are not displayed on the receipt
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-204 @PreSales @ItemVoidWithSingleItemInBasket @POS @Dune @Dunelm @Harrods @Harrods_Sanity @JYSK @MVP @Mobile @RI @Support @AUTOMATED @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Single Item void- When there is only single item in the basket
    Given user signs on as "Sales Assistant"
    When user enters "${Merchandise Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Merchandise Product 1 Description}" is displayed in "Receipt" list
    When user selects "${Merchandise Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button
    Then "Cannot Void Last Item" page is shown
    When user presses "No" button
    Then "Transaction Basket" page is shown
    When user selects "${Merchandise Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button
    Then "Cannot Void Last Item" page is shown
    When user presses "Yes" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | *** TRANSACTION VOID ***                              |
      | text      | Manager signature                                     |
      | text      | £0.00                                                 |
    ##TODO - verify voided item not displayed on the receipt
    And following details are not displayed on the receipt
      | item | ${Merchandise Product 1 Description},${Merchandise Product 1 Price} |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-206 @PreSales @SingleItemVoidWithMultipleItemsThroughVoidsButton @POS @JYSK @MVP @RI @AUTOMATED @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Void an item through Voids button when there are multiple items in the basket
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button
    Then "Select Basket Item" page is shown
    When user presses "Up" button
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    ##TODO - verify voided item not displayed on the receipt
    And following details are not displayed on the receipt
      | item | ${Product 1 Description},${Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-390 @PreSales @MultipleItemVoidWithMultipleItems @POS @Dune @Dunelm @JYSK @MVP @RI @AUTOMATED @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Multiple Item Void - Using the Item Void button in the item detail screen.
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 3 Description},${Product 3 Price}           |
    #Commented due to failing script casued by PLAT-16360
    #And following details are not displayed on the receipt
    #| item | ${Product 1 Description},${Product 1 Price} |
    #| item | ${Product 2 Description},${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-176 @PreSales @ScanItemVoid @POS @Dunelm @Harrods_Sanity @JYSK @MVP @Support @AUTOMATED @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Scan Item void
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Scan Item Void" button
    Then "Scan Item Void" page is shown
    And user enters "MB229XM" into "Input Box" field
    And user presses "Void Item" button
    Then "Void Item Not Found" page is shown
    And user presses "OK" button
    Then "Scan Item Void" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "Void Item" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 3 Description},${Product 3 Price}           |
    And following details are not displayed on the receipt
      | item | ${Product 1 Description},${Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-277 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify Void functionality when Void item/transaction privileges are disabled.
    Given user signs on as "Manager 3"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Voids" button and "Transaction Basket" page shown
    And button with label "Item Void" is not displayed
    And button with label "Void Transaction" is not displayed
    And button with label "Scan Item Void" is not displayed
    Then user presses "Back" button and "Transaction Basket" page shown
    And user presses "User Functions" button and "Transaction Basket" page shown
    And user presses "Sign on Auth User" button
    And "Enter Authorising User" page is shown
    And user enters "${Authorising User 1 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    When user enters "${Authorising User 1 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Voids" button
    Then user presses "Transaction Void" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "End Transaction Continue" page shown
    And user presses "OK" button and "Enter User" page shown

  @PT-469 @AUTOMATED @Dune @JYSK @Regression
  Scenario: POS - Remove Voided Line from Standard Receipt - Return Item
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button
    When "Enter Return Item" page is shown
    Then user enters "${Product 1}" into "Input Box" field
    And user presses "Return Item" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "Return Item" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    When user presses "Yes" button and "Transaction Basket" page shown
    Then user selects "${Product 2 Description}" from "Receipt" list
    When "Modify Item" page is shown
    Then user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    When "Transaction Basket" page is shown
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item flag | R,${Product 1 Description}                            |
      | item      | ${Product 1 Description},${Product 1 Refund Price}    |
    And following details are not displayed on the receipt
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-471 @AUTOMATED @Dune @JYSK @Regression
  Scenario: POS - Remove Voided Line from Standard Receipt - Return Receipt
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    When user signs on as "Manager 2"
    Then user presses "Returns" button and "Transaction Basket" page shown
    When user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return entire receipt" button and "Confirm Return Complete Receipt Prompt" page shown
    Then user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    Then user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty (30 Days)" is displayed in "Receipt" list
    And "${Product 3 Description}" is displayed in "Receipt" list
    And "-${Product 3 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty (30 Days)" is displayed in "Receipt" list
    And user selects "${Product 2 Description}" from "Receipt" list
    When "Modify Item" page is shown
    Then user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    When "Transaction Basket" page is shown
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item flag | R,${Product 3 Description}                            |
      | item      | ${Product 3 Description},${Product 3 Refund Price}    |
    And following details are not displayed on the receipt
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10709 @POS @AUTOMATED @POSValidatedTest @POSSet2 @SCnotReady
  Scenario: Voiding item(s) which triggers a Promotion should remove the Promotion applied to the Transaction
    Given user signs on as "Sales Assistant"
    And user enters "${Product 001444}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is not added to the basket
    And "${Discount Promotion}" is not displayed in "Receipt" list
    And user enters "${Product 001444}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is not added to the basket
    And "${Discount Promotion}" is not displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is not added to the basket
    And "${Discount Promotion}" is not displayed in "Receipt" list
    And user enters "${Product 001455}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is added
    And "${Discount Promotion}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Scan Item Void" button and "Scan Item Void" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Discount Promotion}" is displayed in "Receipt" list
    And user waits "1" seconds
    And user presses "Voids" button
    And user presses "Scan Item Void" button and "Scan Item Void" page shown
    And user enters "${Product 001455}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    When "Transaction Basket" page is shown
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-14154 @POS @AUTOMATED
  Scenario: Transactions void - Bundle products - Void All button
    Given user signs on as "Sales Assistant"
    And user enters "${Product 193}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 194 Description}" from "Receipt" list
    And "Modify Item" page is shown    
    And user waits "2" seconds
    And user presses "Item Void" button and "Bundle Item Void" page shown    
    When user presses "Void All" button and "Cannot Void Last Item" page shown
    And user presses "Yes" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Then "${Product 194 Description}" is not displayed in "Receipt" list
    Then "${Product 195 Description}" is not displayed in "Receipt" list
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-20493 @POS @AUTOMATED
  Scenario: Perform a Transaction Discount (Percentage) and void an item by scanning and then complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "20% Transaction Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (20% Transaction Discount 20%)" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Scan Item Void" button and "Scan Item Void" page shown
    Given user enters "${Product 3}" into "Input Box" field
    When user presses "ENT" button and "Select Reason" page shown     
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    
  @PT-23709 @POS @AUTOMATED @Regression @Voids @Voids_Item @POSItemVoids @Voids_Transaction @POSTransactionVoids @POSReasonWitnessCapture @Receipts
  Scenario: Verify Void Item Visibility on Receipt
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    And following details are not displayed on the receipt
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    When user presses "Void Transaction" button and "Select Reason" page shown
    Then user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
    And following details are not displayed on the receipt
      | item | ${Product 2 Description},${Product 2 Price} |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    
  @PT-23705 @POS @AUTOMATED @Regression @Voids @Voids_Item @POSItemVoids @POSReasonWitnessCapture @Sale_Keyed
  Scenario: Verify item Void Witness Capture
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" button and "Transaction Basket" page shown
    Then user selects "${Product 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    When user selects "Item Faulty - Witness Capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
    
  @PT-23709 @POS @AUTOMATED @Regression @Voids @Voids_Item @POSItemVoids @Voids_Transaction @POSTransactionVoids @POSReasonWitnessCapture @Receipts
  Scenario: Verify Void Item Visibility on Receipt
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    And following details are not displayed on the receipt
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    When user presses "Void Transaction" button and "Select Reason" page shown
    Then user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
    And following details are not displayed on the receipt
      | item | ${Product 2 Description},${Product 2 Price} |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    
  @PT-23705 @POS @AUTOMATED @Regression @Voids @Voids_Item @POSItemVoids @POSReasonWitnessCapture @Sale_Keyed
  Scenario: Verify item Void Witness Capture
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" button and "Transaction Basket" page shown
    Then user selects "${Product 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    When user selects "Item Faulty - Witness Capture" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
             
  @PT-20493 @POS @AUTOMATED
  Scenario: Perform a Transaction Discount (Percentage) and void an item by scanning and then complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "20% Transaction Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (20% Transaction Discount 20%)" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Scan Item Void" button and "Scan Item Void" page shown
    Given user enters "${Product 3}" into "Input Box" field
    When user presses "ENT" button and "Select Reason" page shown     
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
    
             
  @PT-20493 @POS @AUTOMATED
  Scenario: Perform a Transaction Discount (Percentage) and void an item by scanning and then complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "20% Transaction Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (20% Transaction Discount 20%)" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Scan Item Void" button and "Scan Item Void" page shown
    Given user enters "${Product 3}" into "Input Box" field
    When user presses "ENT" button and "Select Reason" page shown     
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown  
    
  @PT-23707 @AUTOMATED @POS @Voids @Voids_Item
  Scenario: Verify item Void Authorization Approval
    Given "Enter User" page is shown
    When user enters "${Pos Operator 10 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Pos Operator 10 Password}" into "Password Text" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 1}" into "Input Box" field
   And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Enter Authorising User" page shown
    And user presses "Cancel" button and "Void Cancelled Item" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      |item      | ${Product 2 Description},${Product 2 Price}            |
    Then "Transaction Basket" page is shown 
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23195 @AUTOMATED @POS @Voids @Voids_Item
  Scenario: Verify whether a transaction containing a promotion can be successfully voided
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user selects "${Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
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
    
  @PT-23191 @AUTOMATED @POS @Voids @Voids_Item
  Scenario:Verify whether the user can void a discount using the button from the Modify menu
    Given user signs on as "POS Operator"
     When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "20% Transaction Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount" is displayed in "Receipt" list
    And "£5.60" is displayed in "Receipt" list
    And user selects "${Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And "Transaction Discount" is displayed in "Receipt" list 
    And "£2.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then following details are not displayed on the receipt
      | text | Transaction Discount (20% Transaction Discount) |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23188 @AUTOMATED @POS @Voids @Voids_Item
  Scenario: Verify whether the user can void an new price item discount type using the Item Void functionality
    Given user signs on as "POS Operator"
     When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "£5 New Price Item Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "£5 New Price Item Discount" is displayed in "Receipt" list
    And user selects "£5 New Price Item Discount" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Invalid discount" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23186 @AUTOMATED @POS @Voids @Voids_Item
  Scenario: Verify whether the user can void an Percentage item discount type using the Item Void functionality
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "10% Item Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "10% Item Discount 10%" is displayed in "Receipt" list
    And "-£1.00" is displayed in "Receipt" list
    And user selects "10% Item Discount" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      |item      | ${Product 2 Description},${Product 2 Price}            |
    Then "Transaction Basket" page is shown 
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23183 @AUTOMATED @POS @Voids @Voids_Item
  Scenario: Verify whether the user can void an Amount item discount type using the Item Void functionality
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "£2.50 Item Disc. - Disallow Promo" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "£2.50 Item Disc. - Disallow Promo" is displayed in "Receipt" list
    And "-£2.50" is displayed in "Receipt" list
    And user selects "£2.50 Item Disc. - Disallow Promo" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      |item       | ${Product 2 Description},${Product 2 Price}           |
    Then "Transaction Basket" page is shown 
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23167 @AUTOMATED @POS @Voids @Voids_Item
  Scenario: Verify whether the user can do a transaction void for an employee transaction
     Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee}" from "Selection List" list
    When user presses "OK" button and "Enter Employee" page shown
    When user enters "${Employee 1 Id}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 1 Id}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    When user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee}" is displayed in "Receipt" list
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Cannot Void Last Item" page shown
    And user presses "Yes" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23152 @AUTOMATED @POS @Voids @Voids_Item
  Scenario: Verify Item Void Function with Capture of Customer Name and Address Mapped to Item Void Reason
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Change - Customer Capture" from "Selection List" list
    And user presses "OK" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    Then user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23150 @AUTOMATED @POS @Voids @Voids_Item
  Scenario: Verify Item Void function with Reference Number Mapping to item Void Reason
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Change - Capture Reference" from "Selection List" list
    And user presses "OK" button and "Enter Reference" page shown
    When user enters "ITEM_CHANGE" into "Input Box" field
    When user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10706 @AUTOMATED @POS @Voids @Voids_Item
  Scenario: Scan Item Void - Item not in Basket - POS should throw error 'The Item entered was not found or cannot be voided' 
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list 
    When user presses "Voids" button and "Transaction Basket" page shown
    When user presses "Scan Item Void" button and "Scan Item Void" page shown
    When user enters "${SKU Product 1}" into "Input Box" field
    When user presses "Void Item" button and "Void Item Not Found" page shown
    When user presses "OK" button and "Scan Item Void" page shown
    And user presses "Cancel" button and "Scan Void Cancelled" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-8656 @AUTOMATED @ItemSaleWithAgeRestricted @POS @Voids @Voids_Item
  Scenario: Verify receipt when selling a Customer Age restricted Product in POS and voiding it in the basket 
    Given user signs on as "Sales Assistant"
    When user enters "${Product 14}" into "Input Box" field
    And user presses "ENT" icon button
    And "Confirm Customer Age" page is shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      |  <s>Wine 0001</s>                                     |
      | text      |  <s>Age Restricted</s>                                |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-1677 @AUTOMATED @POS @Voids
  Scenario: Post Transaction Void
		Given user signs on as "POS Operator"
		When user enters "${Product 1}" into "Input Box" field
		And user presses "ENT" button and "Transaction Basket" page shown
		And user presses "Sales" button
		And user presses "Store / Recall Options" button
		And user presses "Store by Receipt" button and "Transaction Basket" page shown
		Then receipt display with following details
			| item | ${Product 1 Description},${Product 1 Price} |
			| text | TRANSACTION STORED                          |
		And user presses "Clear" button on external "Primary Printer" window
		When user presses "Sales" button and "Transaction Basket" page shown
		And user presses "Store / Recall Options" button
		And user presses "Recall by Receipt" button and "Recall Transaction By Transaction Id" page shown
		And user enters "${retrieveTransaction(1)}" into "Input Box" field
		And user presses "Recall" button and "Transaction Basket" page shown
		And user presses "Voids" button
		And user presses "Void Transaction" button and "Select Reason" page shown
		When user selects "Customer Left Store" from "Selection List" list
		And user presses "OK" button
		Then "Transaction Basket" page is shown
		And receipt display with following details
			| address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
			| telephone | Tel: ${Store Phone 1}                                 |
			| text      | *** TRANSACTION VOID ***                              |
			| text      | Manager signature                                     |
			| text      | £0.00                                                 |
		When user presses "SignOff" button
		Then "Enter User" page is shown
		
 @PT-23721 @AUTOMATED @POS @Voids
 Scenario: Verify Void of Single Exception Among Multiple Captured Against Item
		Given user signs on as "POS Operator"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "10% Item Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "10% Item Discount 10%" is displayed in "Receipt" list
    And "-£1.00" is displayed in "Receipt" list    
    And user selects "${Product 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Price Override" button
    And "Select Reason" page is shown
    And user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "8.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Price Override Down ( £10.00 to £8.00 )" is displayed in "Receipt" list 
    And user selects "10% Item Discount" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      |item      | ${Product 2 Description}, £8.00                        |
    Then "Transaction Basket" page is shown 
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10744 @AUTOMATED @POS @Voids
  Scenario: Verify Post Transaction Void is prevented
   Given "Enter User" page is shown
    When user enters "${Pos Operator 10 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Pos Operator 10 Password}" into "Password Text" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user waits "2" seconds
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list 
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Tender B" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown
    And user waits "100" seconds
    And user signs on as "Manager 3"
    And user presses "Transaction Functions" button and "Transaction Basket" page shown
		And user presses "Other Functions" button and "Transaction Basket" page shown
		And user presses "Post Void" button and "Transaction Basket" page shown
		And user presses "Post Void" button and "Select Reason" page shown
		And user selects "Post Void" from "Selection List" list
		And user presses "OK" button and "Enter original Transaction ID" page shown
		Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction With Msg Config" page shown
    And user presses "Continue" button and "Post Void Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Logout button" icon button
    And "Enter User" page is shown