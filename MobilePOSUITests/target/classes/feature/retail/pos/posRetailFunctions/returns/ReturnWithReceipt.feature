Feature: Return With Receipt

  @PT-290 @AUTOMATED @Airport_Harrods @Dune @Dunelm @Harrods @Support @CompleteReceiptReturnWithReceipt @POS @ReceiptReturn @POSValidatedTest @POSSet4 
  Scenario: Perform a complete Receipt Return
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
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1315 @AUTOMATED @CompleteReceiptReturnOfItemsWithDiscount @POS @ReceiptReturn @POSValidatedTest @POSSet4 @ToBeFixedAutTest 
  Scenario: Perform a Receipt Return of a transaction which includes discounts
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price}       |
      | item | Discount (Transaction Discount   (Amount)),-£5.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
    And user waits "100" seconds
    When user signs on as "POS Operator"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty (30 Days)" is displayed in "Receipt" list
    And "Transaction Discount (Amount)" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user presses "Skip Original Tenders" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | text | Transaction Discount (Amount)                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1316 @AUTOMATED @CompleteReceiptReturnOfItemsWithPromotions @POS @ReceiptReturn @POSValidatedTest @POSSet4 @TobeFixedAutTest
  Scenario: Perform a Receipt Return of a transaction which includes promotions
    Given user signs on as "POS Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
    And user waits "100" seconds
    When user signs on as "POS Operator"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user presses "Skip Original Tenders" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty (30 Days)" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 1 Description},-${Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-379 @AUTOMATED @ReturnOneItemFromMultipleItemsReceipt @POS @ReceiptReturn @POSValidatedTest @POSSet4 @ToBeFixedAutTest
  Scenario: Return only one item from multiple items receipt
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "POS Operator"
    When user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    And user selects "${Product 2 Description}" from "Selection List" list
    And user presses "Select" button
    #Then "Return ${Product 2 Description}" is displayed in "Selection List" list
    #Change in 2.7 from "Return" to "R"
    Then "R ${Product 2 Description}" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Not Wanted (10 Days)" from "Selection List" list
    And user presses "OK" button and "Capture Customer Name" page shown
    When user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "M" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    When user selects "Mark" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Customer: Mr Mark Harrison" is displayed in "Receipt" list
    And "Return ${Product 2 Description}" is displayed in "Receipt" list
    And "-${Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                         |
      | text | Customer: Mark Harrison                        |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | item | Refund Cash UK                                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-350 @Dunelm @JIRA @MVP @AUTOMATED @POS @ReceiptReturn @POSValidatedTest @POSSet4
  Scenario: Refund to Card
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
	And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    And user presses "Close" button on external "Cash Drawer" window
    When "Transaction Basket" page is shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "POS Operator"
    When user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return ${Product 2 Description}" is displayed in "Receipt" list
    And "-${Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" icon button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" icon button
    And "Transaction Signature Verification" page is shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | text | Refund Mastercard                              |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-947 @PreSales @AUTOMATED @CompleteReceiptReturnAsAGiftCard @POS @ReceiptReturn @GiftCard @POSValidatedTest @POSSet4 @ToBeFixedAutTest 
  Scenario: Receipt Return as a Gift Card
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
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "POS Operator"
    When user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Gift Card UK" from "Selection List" list
    And user presses "OK" button and "Get Gift Card Number" page shown
    Then user enters "${Gift Card Number 4}" into "Input Box" field
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | text | Refund Gift Card UK                            |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-367 @Dune @POS @Harrods @HoF @MVP @RI @Support @AUTOMATED @ManualVerification @POSValidatedTest @POSSet4 
  Scenario: Return with Receipt No date limits with return tender Cash
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
    And user waits "100" seconds
    And user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Finish" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Select Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | text | Refund Cash UK                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-978 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Refund Multiple Lines from Multiple Receipts using Cash Tender
    #Perform the first transaction
    Given user signs on as "POS Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 2 Description},${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    #Perform the second transaction
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    And "${Product 4 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 3 Description},${Product 3 Price} |
      | item | ${Product 4 Description},${Product 4 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "100" seconds
    #Perform the first return
    When user signs on as "POS Operator"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 1 Description}" from "Selection List" list
    And user presses "Select" button
    Then "Return" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "-${Product 1 Price}" is displayed in "Receipt" list
    #Perform the second return
    When user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(2)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 4 Description}" from "Selection List" list
    And user waits "1" seconds
    And user waits "Select Button" to display
    And user presses "Select" button
    Then "Return" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 4 Description}" is displayed in "Receipt" list
    And "-${Product 4 Price}" is displayed in "Receipt" list
    #Return using Cash Tender
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 1 Description},-${Product 1 Price} |
      | item | R,${Product 4 Description},-${Product 4 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-997  @Regression @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Refund Multiple Lines from Multiple Receipts using Card Tender
    #Perform the first transaction
    Given user signs on as "POS Operator"
    And user enters "${Product 5}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 5 Description}" is displayed in "Receipt" list
    And "${Product 6 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    And user presses "Close" button on external "Cash Drawer" window
    When "Transaction Basket" page is shown
    Then receipt display with following details
      | item | ${Product 5 Description},${Product 5 Price} |
      | item | ${Product 6 Description},${Product 6 Price} |
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    #Perform the second transaction
    And user enters "${Product 7}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 8}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 7 Description}" is displayed in "Receipt" list
    And "${Product 8 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    And user presses "Close" button on external "Cash Drawer" window
    When "Transaction Basket" page is shown
    Then receipt display with following details
      | item | ${Product 7 Description},${Product 7 Price} |
      | item | ${Product 8 Description},${Product 8 Price} |
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "100" seconds
    #Perform the first return
    When user signs on as "POS Operator"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button 
    And "Display Transaction with MSG config" page is shown
    And user presses "Continue" button 
    And "Extended Return Details" page is shown
    And "${Product 6 Description}" is displayed in "Selection List" list
    And user presses "Down" button   
    And user presses "Select" button
    Then "R" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button 
    And "Promotion Details Screen" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "-${Product 6 Price}" is displayed in "Receipt" list
    #Perform the second return
    When user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(2)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 7 Description}" from "Selection List" list
    And user presses "Select" button
    Then "R" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And "Damaged / Faulty (No date limit)" is displayed in "Selection List" list
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button 
    And "Promotion Details Screen" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 7 Description}" is displayed in "Receipt" list
    And "-${Product 7 Price}" is displayed in "Receipt" list
    #Return using Card Tender
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" icon button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" icon button
    And "Transaction Signature Verification" page is shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 6 Description},-${Product 6 Price} |
      | item | R,${Product 7 Description},-${Product 7 Price} |
      | text | Refund Voucher                                 |
      | text | Customer Copy                                  |
      | item | Refund Mastercard,£18.80                       |
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-977 @Dune @Dunelm @AUTOMATED @Regression @POS @POSValidatedTest @POSSet4
  Scenario: Refund with Receipt - No date limits with return tender EURO
    #Perform the first transaction
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 3 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Get Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "100" seconds
    #Return using Foreign Currencies -EURO
    When user signs on as "POS Operator"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Euro Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty (No date limit)" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | item | R,${Product 3 Description},-${Product 3 Price} |
      | text | Refund Euro Cash UK                            |
      | item | €26.16 @ 1.635 €/£,£16.00                      |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1858 @Dune @POS @Support @AUTOMATED @POSValidatedTest @POSSet4 @ToBeFixedAutTest 
  Scenario: Perform a Return where a Cash Tender requires Change money
    #Perform the first transaction
    Given user signs on as "POS Operator"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 17 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 17 Description},${Product 17 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "POS Operator"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user presses "Skip Original Tenders" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "-£7.25" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "${Product 17 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                           |
      | item | R,${Product 17 Description},-${Product 17 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-194 @HoF @POS @Regression @AUTOMATED @POSValidatedTest @POSSet4 @TobeFixedAutTest @NotForWeeklyRegression
  Scenario: Receipt return within 30 days limit
    When user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
	#Use current date in search due to past data availability limitations
    And user enters "#{today}" into "Original Date" field
    And user presses "Search" button and "Select Transaction Details" page shown
    And user selects "£18.00" from "Selection List" list
    And user presses "Select" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Select Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-195 @HoF @POS @Regression @AUTOMATED @POSValidatedTest @ToBeFixedAutTest
  Scenario: Receipt return over 30 days limit
    #Precondition: There should be a transaction with value £18.00 performed 35 days before the current date
    When user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user enters "#{today-35}" into "Original Date" field
    And user presses "Search" button and "Select Transaction Details" page shown
    And user selects "£18.00" from "Selection List" list
    And user presses "Select" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (Over 30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Select Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "Damaged / Faulty (Over 30 Days)" is displayed in "Receipt" list
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-998 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Multi-quantity Refund with Multiple Receipts
    #Perform the first transaction
    Given user signs on as "POS Operator"
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "QTY Sale" button and "Enter QTY" page shown
    And user enters "4" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "QTY Sale" button and "Enter QTY" page shown
    And user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 1 Description},£72.00 |
      | item | ${Product 2 Description},£50.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    #Perform the second transaction
    Given user signs on as "POS Operator"
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "QTY Sale" button and "Enter QTY" page shown
    And user enters "4" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user enters "${Product 4}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "QTY Sale" button and "Enter QTY" page shown
    And user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user enters "${Product 5}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 4 Description},£78.00  |
      | item | ${Product 5 Description},£275.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "100" seconds
    #Perform the first return
    When user signs on as "POS Operator"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 1 Description}" from "Selection List" list
    And user presses "Select" button
    And user presses "Change Return Quantity" button and "Capture Return Quantity" page shown
    And user enters "2" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    And user presses "Down" button
    And user presses "Select" button
    And user presses "Change Return Quantity" button and "Capture Return Quantity" page shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    Then "Return" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    #Perform the second return
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(2)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 4 Description}" from "Selection List" list
    And user presses "Select" button
    And user presses "Change Return Quantity" button and "Capture Return Quantity" page shown
    And user enters "2" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    And user presses "Down" button
    And user presses "Select" button
    And user presses "Change Return Quantity" button and "Capture Return Quantity" page shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    Then "Return" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 4 Description}" is displayed in "Receipt" list
    And "${Product 5 Description}" is displayed in "Receipt" list
    #Return using Cash Tender
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                              |
      | item | R,${Product 1 Description},-£36.00  |
      | item | R,${Product 2 Description},-£30.00  |
      | item | R,${Product 4 Description},-£39.00  |
      | item | R,${Product 5 Description},-£165.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-4723 @POS @AUTOMATED
  Scenario: Verify whether transactions are filtered as per the original date
    Given user signs on as "Sales Assistant"
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
    # waits for transaction to appear &proccess in EM
    And user waits "140" seconds
    When user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user enters "#{today}" into "Original Date" field
    And user presses "Search" button and "Select Transaction Details" page shown
    #Need to add support to calculate "#{today}" expression for below step
    #And "#{today}" is displayed in "Selection List" list
    When user selects "£10.00" from "Selection List" list
    And user presses "Select" button and "Extended Return Details" page shown
    And user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Sell Unknown Product" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6838 @PreSales @AUTOMATED @POS @JYSK_SL @OfflineRecieptReturn  @NotForWeeklyRegression
  Scenario: Validate that an alert message is displayed when attempting to Return with receipt when POS is offline
    Given user signs on as "Sales Assistant"
    When user presses "Returns" button and "Transaction Basket" page shown
    Then user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user presses "Search" button
    When "Transaction Not Found Popup" page is shown
    Then user presses "OK" button
    And "Enter Original Transaction Details" page is shown
    And user presses "Back" button and "Enter Original Transaction Id" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-9870 @AUTOMATED @CompleteReceiptReturnWithReceipt @POS @ReceiptReturn 
   Scenario: Perform a complete Receipt Return
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 19}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 19 Description},-${Product 19 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 2 Description}" from "Selection List" list
    And "R" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Return" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-${Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Return Receipt Skip Original Tender" page shown 
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10843 @AUTOMATED @POS @ReceiptReturn @GiftCard @POSValidatedTest @POSSet4 @TobeFixedAutTest
  Scenario: Return Receipt of a transaction which includes gift card sale
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button
    And "Get Gift Card Number With Icc" page is shown
    And user enters "${Gift Card number 6}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Gift Card UK (***************7458)" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "80" seconds
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
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10789 @AUTOMATED @CompleteReceiptReturnWithReceipt @POS @ReceiptReturn 
   Scenario: Verify More Search option is accessible for user
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    When user presses "More Search Options" button and "Enter Transaction Archive Search Data" page shown   
    And user selects "Enactor Store" from "Location Dropdown" combobox
    And user enters "#{today-5}" into "Start Date field" field
    And user enters "06:00" into "Start Time field" field
    And user enters "#{today}" into "End Date field" field
    And user enters "06:00" into "End Time field" field
    And user enters "Test pan" into "Tender Card Pan Field" field
    And user selects "Debit" from "Card Type Dropdown" combobox
    And user selects "Accessories" from "Brand Dropdown" combobox
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10788  @AUTOMATED @CompleteReceiptReturnWithReceipt @POS @ReceiptReturn @ToBeFixedAutTest
  Scenario: Verify returning take now items in a mixed order basket
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 2}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
    And user waits "5" seconds
    And user presses "Product Size 1 Button" icon button
    And user presses "Product Order Product" icon button
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
    And user presses "Sales" button   
    And user presses "Rich Product Search" button
    And "Rich Product Search" page is shown
    And user enters "${Style Colour Size Product 3}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Style Colour Size Product 3}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Style Colour Size Product 3 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 3}"
    And "Product Price Field" field displays the text "${Style Colour Size Product 3 Price}"
    And user waits "5" seconds    
    And user selects "${Style Colour Size Product 3 Size 8}" from "Product Size Combo" combobox
    And user presses "Product Order Product" icon button
    And "Transaction Basket" page is shown
    And "${Style Colour Size Product 3 Description}" is displayed in "Receipt" list
    And "${Style Colour Size Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Item 1 Delivery To Home" icon button
    And user presses "Item 2 Take now" icon button
    And user presses "Item 3 Take now" icon button
    And user presses "Continue" button
    And user presses "OK" button and "Get Delivery Notifications" page shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list     
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Await Drawer Closed" page shown     
    And receipt display with following details
      | text      | TAKEN																																						|
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |                                                                          
      | item      | ${Sku Product 1 Description},${Sku Product 1 Price} 														|
      | text      | Customer: Mark Harrison                                                         |
      | item      | ${Product 2 Description},${Product 2 Price}                                     |
      | text      | On Order                                                                        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "100" seconds
    When user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    #And user confirms "Up" not display  
    #And user presses "Down" button
    #And user confirms "Down" not display
    #And user presses "Up" button
    And user selects "${Style Colour Size Product 3 Description}" from "Selection List" list
    And user presses "Select" button
    And "Return" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Style Colour Size Product 3 Description}" is displayed in "Receipt" list
    And "-${Style Colour Size Product 3 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                                                                             |
      | item | R,${Style Colour Size Product 3 Description},-${Style Colour Size Product 3 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown    
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-11628 @AUTOMATED @POS @ReceiptReturn
  Scenario: Return with receipt before transaction id is stored
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
    Then "Transaction Basket" page is shown
    # don't wait for transaction to appear &proccess in EM
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Transaction not founded" page shown
    And user presses "OK" button and "Enter original transaction details" page shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9688 @PreSales @AUTOMATED @POS @ReceiptReturn @SCnotReady
  Scenario: Non-returnable items cannot be returned during a receipt return by returning entire receipt
    Given user signs on as "POS Operator"
    And user enters "${Product 43}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 45}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 43 Description}" is displayed in "Receipt" list
    And "${Product 45 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 43 Description},${Product 43 Price} |
      | item | ${Product 45 Description},${Product 45 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    And user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Return" is displayed in "Receipt" list
    And "${Product 43 Description}" is displayed in "Receipt" list
    And "-${Product 43 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "${Product 43 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                           |
      | item | R,${Product 43 Description},-${Product 43 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    #waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    And user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "No Items To Return" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9996 @AUTOMATED @POS @ReceiptReturn
  Scenario: Validate the same receipt cannot be returned more than once
    Given user signs on as "POS Operator"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Select Sales Person" page shown
    And user selects "PO1" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And "${Product 2 Description}" is displayed in "Receipt List" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt List" list
    Then receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Signature OK" button and "Empty Basket" page shown
    And "Transaction Basket" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "No Items Available To Return" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-3497 @AUTOMATED @POS @ReceiptReturn
  Scenario: Verifying the prices of the return sale of a Price override transaction
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Price}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Price}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user selects "${Product 3 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item Discount 20%" is displayed in "Receipt" list
    And "-£1.00" is displayed in "Receipt" list
    And user enters "${Merchandise Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Merchandise Product 1 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Price Override Up" from "Selection List" list
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "£22.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Merchandise Product 1 Description} £22.00" is displayed in "Receipt" list
    And "Price Override Up ( £20.00 to £22.00 )" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Merchandise Product 1 Description},£22.00           |
      | text      | Override (£20.00 to £22.00)                           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
    And user waits "90" seconds
    And user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 2 Description}" from "Selection List" list
    And user presses "Select" button
    And "R" is displayed in "Selection List" list
    And user presses "Finish" button and "Select Reason" page shown
    And user selects "Not Wanted (10 Days)" from "Selection List" list
    And user presses "OK" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "M" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Customer: Mr Mark Harrison" is displayed in "Receipt" list
    And "Return ${Product 2 Description}" is displayed in "Receipt" list
    And "-${Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                                         |
      | text | Customer: Mark Harrison                        |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | item | Refund Cash UK                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-11608 @AUTOMATED @POS @ReceiptReturn @SCnotReady @ToBeFixedAutTest
  Scenario: Return Flow for a Staff Sale
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "Employee Fixed 20% - 1" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    When user enters "1" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 1 ID}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    When user presses "OK" button and "Transaction Basket" page shown
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    And "Employee Transaction" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | Employee Fixed 20%                          |
      | item | ${Product 1 Description},${Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # waits for transaction to appear & proccess in EM
    And user waits "50" seconds
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And "${Product 1 Description}" is displayed in "Selection List" list
    And "Employee Fixed 20% - 1" is displayed in "Selection List" list
    And user presses "Cancel" button and "Transaction Basket" page shown
    And "Employee Transaction" is not displayed in "Receipt" list
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-12868 @POS @AUTOMATED
  Scenario: Receipt Return - Returning unknown and known items with invalid transaction IDs
    Given user signs on as "Pos Operator 9"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${Invalid Transaction Id}" into "Input Box" field
    And user presses "ENT" button and "Enter Return Item" page shown
    And user enters "${Unknown Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "Confirm Unknown Product Return" page is shown
    And user presses "Return" button
    And "Filtered MMG" page is shown
    And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter y button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user selects "${MMG Product 2 Description With Region}" from "MMG Group List" list
    And user presses "Select" button
    And "Enter Coded Price" page is shown
    And user enters "${MMG Product 2 Price}" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENTER" icon button 
    And "Select Reason" page is shown
    When user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Enter Return Item" page shown
    And user presses "Finish" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                                                       |
      | item | R,${MMG Product 2 Description},${MMG Product 2 Refund Price} |
      | item | R,${Product 1 Description},-${Product 1 Price}               |
      | item | Refund Cash UK                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-12885 @POS @AUTOMATED
  Scenario: Receipt Return - Item return for invalid transaction IDs
    Given user signs on as "Pos Operator 9"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${Invalid Transaction Id}" into "Input Box" field
    And user presses "ENT" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    When user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    When user selects "Managers Discretion" from "Selection List" list
    And user presses "OK" button and "Enter Return Item" page shown
    And user presses "Finish" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 1 Description},-${Product 1 Price} |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | item | Refund Cash UK                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-14221 @POS @AUTOMATED
  Scenario: Continue button should display when the UnverifiedReceiptReturns role is configured for the POS
    Given user signs on as "Pos Operator 9"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user waits "Continue Button" to display
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-14172 @POS @AUTOMATED
  Scenario: Receipt Return - Returning unknown and known items with invalid transaction IDs
    Given user signs on as "Pos Operator 9"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${Invalid Transaction Id}" into "Input Box" field
    And user presses "ENT" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    When user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Enter Return Item" page shown
    And user enters "${Unknown Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "Confirm Unknown Product Return" page is shown
    And user presses "Return" button
    And "Filtered MMG" page is shown
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter y button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user selects "${MMG Product 2 Description With Region}" from "MMG Group List" list
    And user presses "Select" button
    And "Enter Coded Price" page is shown
    And user enters "${MMG Product 2 Price}" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user presses "Finish" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                                       |
      | item | R,${Product 2 Description},-${Product 2 Price}               |
      | item | R,${MMG Product 2 Description},${MMG Product 2 Refund Price} |
      | item | Refund Cash UK                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-15105 @POS @AUTOMATED @Regression
  Scenario: Validate the search should auto-populate date with today's date
    #Perform the transaction
    Given user signs on as "POS Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
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
    And user waits "50" seconds
    And user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And "Original Date" field displays the text "#{today}" 
    And user presses "Search" button and "Select Transaction Details" page shown
    And user selects "${Product 1 Price}" from "Selection List" list       
    And user presses "View" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 1 Description}" from "Selection List" list
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "${Complete Item Return Damaged 30 Days}" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user presses "Skip Original Tenders" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 1 Description},-${Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-13515 @AUTOMATED @POS @ReceiptReturn
  Scenario: Receipt Return with reason configured with capture Customer Name and Address
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
    And user waits "50" seconds
    And user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "${Complete Receipt Return Not Wanted}" from "Selection List" list
    And user presses "OK" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text    | Refund                                                |
      | text    | Customer: ${Customer 1 Name Without Title}            |
      | address | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | item    | R,${Product 2 Description},-${Product 2 Price}        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
      
  @PT-3503 @POS @AUTOMATED
  Scenario: Verifying the prices of the return sale of a modified quantity sale transaction
    #Perform the transaction
    Given user signs on as "POS Operator"
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "QTY Sale" button and "Enter QTY" page shown
    And user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 1 Description},5 @,${Product 1 Price}|
      | item | ${Product 2 Description},Â£10.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
  	# waits for transaction to appear & proccess in EM
    And user waits "50" seconds
    And user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 2 Description}" from "Selection List" list
    And button with label "Change Return Quantity" is not displayed
    And user selects "${Product 1 Description}" from "Selection List" list
    And user presses "Change Return Quantity" button and "Capture Return Quantity" page shown
    And user enters "2" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    Then "Return" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "-Â£36.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Cash UK" from "Selection List" list    
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund                                                       |
      | item | R,${Product 1 Description},-Â£36.00               						|
      | item | Refund Cash UK                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown    

  @PT-17165 @AUTOMATED @POS @ReceiptReturn
  Scenario: Receipt Return - Transaction completed in training mode does not appear when returning in non-training mode
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "** TRAINING MODE **" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then receipt display with following details
      | text | ** TRAINING MODE **                         |
      | text | Sale                                        |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "Management" button and "Transaction Basket" page shown
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
    And user waits "100" seconds
    When user signs on as "Sales Assistant"
    When user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Not In Training Mode Transaction Error Popup" page shown
    And user presses "OK" button and "Enter Original Transaction Id" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-17345 @AUTOMATED @POS @ReceiptReturn
  Scenario: Receipt Return - Transaction completed in non-training mode does not appear when returning in training mode
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Sale                                        |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
    And user waits "100" seconds
    When user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "** TRAINING MODE **" is displayed in "Receipt" list
    When user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "In Training Mode Transaction Error Popup" page shown
    And user presses "OK" button and "Enter Original Transaction Id" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-19299 @AUTOMATED @POS @ReceiptReturn @TransactionReference 
  Scenario: Return gift receipt
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Request Gift Receipt" button
    And "Gift Receipt Requested" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Request Gift Receipt Total" page shown
    When user presses "Individual Receipts" button and "Select Tender" page shown
    And "Gift" is displayed in "Receipt" list
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | Cash UK,-Â£16.00                                       |
    Then gift receipt "1" display with following details
      | text | Gift Receipt                  |
      | item | ${Product 2 Description},OUZ  |
    Then gift receipt "2" display with following details
      | text | Gift Receipt                  |
      | item | ${Product 3 Description},HKR  |
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "150" seconds
    #Return gift Receipt 1
    When user signs on as "Sales Assistant"
    When user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransactionReference(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 2 Description}" from "Selection List" list
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #Return gift Receipt 2
    When user signs on as "Sales Assistant"
    When user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransactionReference(2)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 3 Description}" from "Selection List" list
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 3 Description},-${Product 3 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-16631 @AUTOMATED @POS @ReceiptReturn @Regression
  Scenario: Unknown Product Sale - Receipt Return
    Given user signs on as "Manager 2"
    And user enters "${Unknown Product 1}" into "Input Box" field
    And user presses "ENT" icon button 
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Sell" button and "Select Reason" page shown
    And user selects "${MMG Sale Reason 1}" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    When user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter W button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter C button" icon button
    And user waits "2" seconds
    When user presses "Toggle Alpha Keyboard" icon button
    Then "Keyboard Hidden Screen" page is shown    
    And user selects "${MMG Product Description with Region}" from "MMG Group List" list
    And user presses "ENT" button
    And "Enter Item Price" page is shown
    When user enters "${MMG Product Price}" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And "${MMG Product Description}" is displayed in "Receipt" list     
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    And receipt display with following details
      | item | ${MMG Product Description},${MMG Product Price}|
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    # waits for transaction to appear & proccess in EM    
    And user waits "50" seconds
    And user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "${Complete Receipt Return Damaged}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return ${MMG Product Description}" is displayed in "Receipt" list
    And "-${MMG Product Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${MMG Product Description},-${MMG Product Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown      
    When user presses "SignOff" button
    Then "Enter User" page is shown    