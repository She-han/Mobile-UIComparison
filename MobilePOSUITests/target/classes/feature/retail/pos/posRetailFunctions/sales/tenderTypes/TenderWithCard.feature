Feature: Tender with Card - Key Entry

  @PT-123 @PreSales @TenderWithCardICCReader @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Attempt to sell a product using ICC Reader
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" icon button
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" icon button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price}       |
      | item | Mastercard,-${Product 1 Price With Tax And Promo} |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-388 @PreSales @CardTenderCancellationAtPinEntry @MVP @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Card Tender Cancellation At Pin Entry Point
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" icon button
    And "Processing Card" page is shown
    And user presses "Cancel" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Select Tender" page is shown
    And receipt display with following details
      | text | Void Card Sale    |
      | text | Customer Copy     |
      | text | *** CANCELLED *** |
    And user presses "Back" button
    Then "Transaction Basket" page is shown
    When user presses "Voids" button
    And user presses "Void Transaction" button
    Then "Select Reason" page is shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Sale                                                     |
      | text | *** TRANSACTION VOID ***                                 |
      | text | V Mastercard VOID -${Product 1 Price With Tax And Promo} |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-357 @PreSales @CardRefundCancellation @Dunelm @MVP @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Card Refund Cancellation
    Given user signs on as "Sales Assistant"
    When user presses "Returns" button
    And user presses "Return Item" button
    Then "Enter Return Item" page is shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "${Card Refund Cancellation Reason 1}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    When user presses "Yes" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return Slip" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "-${Product 1 Price}" is displayed in "Receipt" list
    And "Ret Reason: ${Card Refund Cancellation Reason 1}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" icon button
    And user waits "2" seconds
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" icon button
    And "Transaction Signature Verification" page is shown
    And user presses "Cancel" button
    Then "Customer Void Or Reprint" page is shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 1 Description},-${Product 1 Price} |
      | text | Refund Mastercard                              |
      | text | Void Card Refund                               |
      | text | *** CANCELLED ***                              |
      | item | V,Refund Mastercard VOID                       |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-380 @PreSales @RedeemLoyaltyPoints @Loyalty @POS @MVP @Mobile @Harrods @Support @AUTOMATED
  Scenario: Redeem Loyalty Points by Loyalty Card Number
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button
    Then "Select Tender" page is shown
    When user presses "Customers" button
    And user presses "Loyalty Account" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 7}" into "Input Box" field
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | item | Customer: ${Loyalty Card Number 7 Name}                 |
      | item | ${Product 1 Description},${Product 1 Price}              |
      | text | Loyalty Points UK                                        |
      | text | Loyalty Account: ${Loyalty Card Number 7 Account Number} |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-356 @PreSales @TobeFixedAutTest @TenderWithCardKeyEntry @POS @AUTOMATED
  Scenario: Attempt to sell a product by Key Entry of Card Number in POS
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    When user presses "CardTender(CNP)" button and "Get Card Details" page shown
    #And user presses "Cards" button and "Insert Swipe Card" page shown
    #And user presses "Key Card" button and "Enter Card Number" page shown
    And user enters "${Payment Card Number}" into "Input Box" field
    And user presses "OK" button and "Enter Card Expiry Date" page shown
    And user enters "${Payment Card Expiry Date}" into "Input Box" field
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Signature Verification" page shown
    And user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
