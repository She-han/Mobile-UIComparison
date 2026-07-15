Feature: Gift Card

	@PT-5234 @AUTOMATED @POS
  Scenario: Gift Card part tender with multiple tenders
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 9}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Credit Note" button and "Enter Credit Note Serial Number" page shown
    And user enters "${Credit Note Serial Number 5}" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Card Tender Amount" page shown
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" icon button
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" icon button
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10449 @AUTOMATED @POS @SCnotReady
  Scenario: Verify whether the user should be able to do transaction with an expired gift card
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button and "Select Tender" page shown
    And user presses "Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 10}" into "Input Box" field
    And user presses "OK" button and "Get Tender Amount" page shown
    And user presses "OK" button and "Gift Card Expired" page shown
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10445 @AUTOMATED @POS @SCnotReady
  Scenario: Verify whether the user is able to create a new giftcard with the minimum value amount
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then "Transaction Basket" page is shown
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 11}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10446 @AUTOMATED @POS @SCnotReady
  Scenario: Verify whether the user is able to create a new giftcard less than the minimum value amount defined
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then "Transaction Basket" page is shown
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 12}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button and "Amount Too Small" page shown
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10447 @AUTOMATED @POS @SCnotReady
  Scenario: Verify whether the user is able to create a new giftcard with the Maximum value amount
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then "Transaction Basket" page is shown
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 13}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "15.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1184 @InvalidGiftCard @AUTOMATED @POS @GiftCard @POSValidatedTest @POSSet2 @ToBeFixedAutTest
  Scenario: Sell Gift card with invalid number
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Invalid Gift Card Number}" into "Input Box" field
    And user presses "OK" button and "Select Gift Card Type" page shown
    And user selects "Gift Card UK" from "Selection List" list
    And user presses "OK" button
    And "Invalid Card Number" page is shown
    When user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1 @SET2 @ToBeFixedAutTest @GiftCardSale @GiftCard @POS @Dune @Dunelm @Harrods @JYSK @MVP @Mobile @Support @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Gift Card Sale
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 1}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Gift Card UK (***************7461)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | ***************7461 |
      | text | New Balance: ${Gift Card New Balance} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-319 @SET2 @ToBeFixedAutTest @GiftCardTopUp @GiftCard @POS @Dune @Harrods @JYSK @MVP @RI @Support @AUTOMATED @ReactPOS @POSValidatedTest @POSSet2
  Scenario: Gift Card Top Up
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Top Up" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 1}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Gift Card UK (***************7461)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | ***************7461 |
      | text | New Balance: £35.00 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5 @SET2 @ToBeFixedAutTest @ViewGiftCardHistory @GiftCard @POS @Dunelm @JYSK @MVP @AUTOMATED @ReactPOS @POSValidatedTest @POSSet2
  Scenario: View Gift Card history
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card History" button and "Gift Card Search" page shown
    And user enters "${Gift Card number 1}" into "Input Box" field
    And user presses "OK" button and "Select Gift Card" page shown
    And user presses "OK" button and "Gift Card History List" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1185 @ViewGiftCardHistoryFromGiftCardEnquiryScreen @GiftCard @POS @AUTOMATED @ReactPOS @POSValidatedTest @POSSet2
  Scenario: View Gift Card History from Gift Card Enquiry screen
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Enquiry" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 1}" into "Input Box" field
    And user presses "OK" button and "Gift Card Enquiry Details" page shown
    And "Gift Card Number" field displays the text "${Gift Card Number 1}"
    And "Gift Card Status" field displays the text "Active"
    And user presses "Show History" button and "Gift Card History List" page shown
    And user presses "OK" button and "Gift Card Enquiry Details" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-63 @SET2 @ToBeFixedAutTest @GiftCardMerge @GiftCard @POS @JYSK @MVP @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Merge 2 Gift Cards
    # Create Gift Card #2
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 2}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "15.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Gift Card UK (***************7462)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | ***************7462 |
      | text | New Balance: £15.00 |
    When user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    Then "Transaction Basket" page is shown
    # Merge Gift card #1 and #2
    Given user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Merge" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 1}" into "Input Box" field
    And user presses "OK" button
    And user enters "${Gift Card number 2}" into "Input Box" field
    And user presses "OK" button and "Gift Card Confirm Transfer Balance" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "Gift Card UK (***************7461)" is displayed in "Receipt" list
    And "Cancelled" is displayed in "Receipt" list
    And "Gift Card UK (***************7462)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | ***************7461 Cancelled |
      | text | New Balance: £50.00           |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1186 @SET2 @ToBeFixedAutTest @InvalidAccountGiftCardBalance @GiftCard @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Attempt to view balance of an invalid Gift Card number
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Enquiry" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 3}" into "Input Box" field
    When user presses "OK" button 
    Then user waits "2" seconds
    And "No Account Message" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1187 @ToBeFixedAutTest @ClosedAccountGiftCardBalance @GiftCard @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: View Closed Account Gift Card Balance
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Enquiry" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 7}" into "Input Box" field
    When user presses "OK" button
    Then user waits "2" seconds
    And "Gift Account Not Active Message" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-3 @SET2 @ToBeFixedAutTest @ActiveAccountGiftCardBalance @GiftCard @POS @Dunelm @MVP @RI @AUTOMATED @Smoke @ReactPOS @POSValidatedTest @POSSet2
  Scenario: Gift Card Enquiry
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Enquiry" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 4}" into "Input Box" field
    When user presses "OK" button 
    Then user waits "2" seconds
    And "Gift Card Enquiry Details" page is shown
    And "Gift Card Number" field displays the text "${Gift Card Number 4}"
    And "Gift Card Status" field displays the text "Active"
    #And "Gift Card Balance" field displays the text "£50.00"
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-4 @SET2 @ToBeFixedAutTest @CancelGiftCard @GiftCard @POS @Harrods @JYSK @MVP @Support @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Cancel Gift Card
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Cancel" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 2}" into "Input Box" field
    When user presses "OK" button and "Gift Card Confirm Cancel" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "Gift Card UK (***************7462)" is displayed in "Receipt" list
    And "Cancelled" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | ***************7462 Cancelled |
      | item | Refund Cash UK,£50.00         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-280 @SaleGiftCardProduct @Dune @Dunelm @MVP @AUTOMATED
  Scenario: Sale Gift Card Product
    Given user signs on as "Manager 2"
    When user enters "${Gift Card Product 1}" into "Input Box" field
    And "Empty Basket" page is shown
    When user presses "ENT" button and "Get Gift Card Number" page shown
    And user enters "111111" into "Input Box" field
    And user presses "ENT" button and "Issue Gift Card Main" page shown
    And user enters "100.00" into "Input Box" field
    And user presses "ENT" button and "Sell Unknown Product" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "ENT" button and "Select Receipt Destination" page shown
    And user presses "Print Only" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    And "Sell Unknown Product" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

 @PT-84 @Regression @AUTOMATED @Airport_Harrods @Harrods @Support @Regression
  Scenario: Verify POS - Promotions - Item Set - Issue Gift Card is successful
    Given user signs on as "Sales Assistant"
    When user enters "${Product 54}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 54 Description}" is displayed in "Receipt" list
    And "${Product 54 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 1}" into "Input Box" field
    And user presses "ENT" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-808 @Regression @Dune @ManualVerification @AUTOMATED
  Scenario: POS - Verify Return Item with Gift Card
    Given user signs on as "Manager 2"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Not Wanted (10 Days)(Credit Note)" from "Selection List" list
    And user presses "OK" button and "Enter Original Date" page shown
    And user enters "09/09/20" into "Input Box" field
    And user presses "OK" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "M" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    When user selects "Mark" from "Selection List" list
    Then user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Customer: Mr Mark Harrison" is displayed in "Receipt" list
    And "Return ${Product 1 Description}" is displayed in "Receipt" list
    And "-${Product 1 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Transaction Basket" page shown
    And user presses "Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 1}" into "Input Box" field
    And user presses "ENT" button and "Issue Gift Card Main" page shown
    And user enters "18.00" into "Input Box" field
    And user presses "ENT" button and "Sell Unknown Product" page shown
    And user presses "TOTAL" button
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "ENT" button and "Select Receipt Destination" page shown
    And user presses "Print Only" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    And "Sell Unknown Product" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11398 @PreSales @GiftCardTopUp @GiftCard @POS @POSValidatedTest @POSSet2
  Scenario: Verify whether user is able to top up a gift card with a value less than the minimum threshold value
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Top Up" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 8}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "0.50" into "Input Box" field
    And user presses "OK" button 
    When "Amount Too Small" page is shown
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10442 @PreSales @GiftCardTopUp @GiftCard @POS @POSValidatedTest @POSSet2 @ToBeFixedAutTest
  Scenario: Verify whether the user is able to topup a giftcard with a value more than the threshold value
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Top Up" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 8}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    When user enters "1250.00" into "Input Box" field
    And user presses "OK" button 
    And "Top Up Amount Too Large" page is shown
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10443 @PreSales @GiftCardTopUp @GiftCard @POS @POSValidatedTest @POSSet2 @ToBeFixedAutTest
  Scenario: Verify whether the user is able to topup a giftcard with a value within the threshold value
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Top Up" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 8}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "550.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Gift Card UK (***************7783)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | ***************7783 |
      | text | New Balance: £550.00 |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-20070 @AUTOMATED @POS
  Scenario: Gift Card Tender - Validate that Tender mapped to Gift Card Type
    Given user signs on as "Sales Assistant"
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button and "Select Tender" page shown
    And user presses "Gift Card Types" button and "Select Tender" page shown
    And user presses "Gift Card 1" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card Type 2 Number}" into "Input Box" field
    And user presses "OK" button 
    And "Gift Card Type Error" page is shown
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-23331 @Regression @AUTOMATED @POS
  Scenario: Verify whether the customer details are captured when a gift card top up exceeds the configured threshold value
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Top Up" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card Threshold Limit}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "60.00" into "Input Box" field
    And user presses "OK" button
    Then user waits "2" seconds
    And "Capture Customer Name" page is shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    Then user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Transaction Basket" page shown
    And "${Customer 1 Name Without Title}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
