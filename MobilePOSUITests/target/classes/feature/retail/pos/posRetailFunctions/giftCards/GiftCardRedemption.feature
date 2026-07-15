Feature: Gift card redemption

  @PT-2 @PreSales @GiftCardRedemption @GiftCard @AUTOMATED @POS @POSValidatedTest @POSSet2
  Scenario: Perform a Sale transaction and tender with Gift Card
    #Top up the gift card before redeem
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Top Up" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 4}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "15.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    Then "Transaction Basket" page is shown    
    
    #Tender with Gift Card
    Given user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 4}" into "Input Box" field
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | ***************1141  |
      | item | Gift Card UK,-£10.00 |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-321 @GiftCardRedemption @GiftCard @AUTOMATED @POS @JYSK @Dunelm @Harrods @ReactPOS @Support @MVP @Mobile @POSValidatedTest @POSSet2
  Scenario: Perform a Sale transaction and tender with Gift Card and Cash
    #Top up the gift card before redeem
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Top Up" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 6}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "50.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    Then "Transaction Basket" page is shown
    #Tender with Cash and Gift Card
    Given user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "ENT" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 6}" into "Input Box" field
    And user presses "OK" button and "Card Tender Amount" page shown
    #And user presses "OK" button and "Transaction Basket" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | Cash UK,-£5.00       |
      | item | Gift Card UK,-£13.00 |
      | text | ***************7458  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11595 @POS @AUTOMATED @SCnotReady
  Scenario: Verify tendering with a Gift Card when transaction value is greater than the gift card value
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button and "Sell Unknown Product" page shown
    And user presses "QTY Sale" button and "Enter Qty" page shown
    When user enters "3" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    And user enters "${Product 34}" into "Input Box" field
    And user waits "2" seconds
    And user selects "${Product 34}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card Number 14}" into "Input Box" field
    And user presses "OK" button and "Employee Account Tender Amount" page shown
    And user presses "OK" button and "Giftcard Amount Limited" page shown
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | Cash UK,-£158.76      |
      | item | Gift Card UK,-£200.00 |
      | text | ***************7999   |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button
    And "Enter User" page is shown

  @PT-11560 @POS @AUTOMATED @SCnotReady
  Scenario: Attempt a Receipt Return using an invalid gift card
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button and "Sell Unknown Product" page shown
    And user presses "QTY Sale" button and "Enter Qty" page shown
    When user enters "1" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    And user enters "${Product 34}" into "Input Box" field
    And user waits "2" seconds
    And user selects "${Product 34}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift Card Number" page shown
    # Gift card should have a larger value than the product
    And user enters "${Gift Card Number 15}" into "Input Box" field
    And user presses "OK" button and "Employee Account Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | item | Gift Card UK,-£119.99 |
      | text | ***************7998   |
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    # user enters transaction ID
    And user waits "100" seconds
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user waits "2" seconds
    And user presses "OK" button and "Display Transaction With Msg Config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user presses "Finish" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Gift Card UK" from "Selection List" list
    And user presses "OK" button and "Get Gift Card Number" page shown
    When user enters "1234" into "Input Box" field
    And user presses "OK" button and "Invalid Card Number" page shown
    And user presses "OK" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button
    And "Enter User" page is shown
