Feature: Tenders with PDC  

  @PT-5836 @POSPDCCardPayment @PDCAutomation @AUTOMATED @PaymentServicesRegression @ToBeFixedAutTest
  Scenario: Attempt to do a Payment Service Tender(MasterCard-Chip)
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Payment Service" button and "Enter Payment Service Tender Amount" page shown
    And user presses "OK" button and "Begin Payment Service Transaction" page shown
    And user waits "15" seconds
    Then "Transaction Basket" page is shown
    And receipt display with following details
    	| text | Sale                                        |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | Payment Service,-£10.00                     |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-5871 @POSPDCCardPayment @PDCAutomation @AUTOMATED @PaymentServicesRegression @ToBeFixedAutTest
  Scenario: Attempt to do a Payment Service Refund Tender (Item refund - MasterCard-Chip)
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button
    And "Enter Return Item" page is shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-£10.00" is displayed in "Receipt" list
    When user presses "Total" button and "Refund Item" page shown
    And user presses "More" button
    And user presses "Payment Service" button and "Get Tender Amount" page shown
    And user presses "OK" button and "Begin Payment Service Transaction" page shown
    And user waits "15" seconds
    Then "Transaction Signature Verification" page is shown
    And user presses "Signature OK" button and "Receipt Print" page shown
    And "Transaction Basket" page is shown
    And receipt display with following details
    	 | text | Refund                                       |
       | item | ${Product 2 Description},-${Product 2 Price} |
       | item | Refund Payment Service,£10.00                |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-5872 @POSPDCCardPayment @PDCAutomation @AUTOMATED @PaymentServicesRegression @ToBeFixedAutTest
  Scenario: Attempt to do a Payment Service Reversal Tender (Visa Chip)
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Payment Service" button and "Enter Payment Service Tender Amount" page shown
    And user presses "OK" button and "Begin Payment Service Transaction" page shown
    And user waits "15" seconds
    Then "Payment Service Signature Verification Confirmation" page is shown
    And user presses "Yes" button and "Payment Service Signature Verification" page shown
    And user presses "Cancel" button and "Payment Service Signature Cancel Confirmation" page shown
    And user presses "Yes" button and "Continue Payment Service Transaction" page shown
    And user waits "5" seconds
    And "Payment Service Message Ok" page is shown
    And user presses "OK" button and "Select Tender" page shown
    And receipt display with following details
    	| text | Void Card Sale    |
      | text | *** CANCELLED *** |
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
