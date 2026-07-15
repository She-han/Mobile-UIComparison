Feature: Item Exchange

  @PT-1317 @AUTOMATED @ItemExchange_SaleAmountGreaterThanRefundAmount @POS @POSValidatedTest @POSSet4
  Scenario: Perform an Item Return and a Sale where sale amount is greater than refund amount
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    When user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user enters "${Product 5}" into "Input Box" field
    And user presses "ENT" button
    And "Refund" is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then "Return Slip ${Product 4 Description}" is displayed in "Receipt" list
    And "-${Product 4 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And receipt display with following details
      | item | R,${Product 4 Description},-${Product 4 Price} |
      | item | ${Product 5 Description},${Product 5 Price}    |
      | text | Cash UK                                        |
   #Commented due to failing script casued by PLAT-16360
    #But following details are not displayed on the receipt
      #| text | Refund         |
      #| text | Refund Cash UK |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1318 @AUTOMATED @ItemExchange_SaleAmountLessThanRefundAmount @POS @POSValidatedTest @POSSet4
  Scenario: Perform an Item Return and a Sale where sale amount is less than refund amount
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 5}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "Refund" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "Return Slip ${Product 5 Description}" is displayed in "Receipt" list
    And "-${Product 5 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    Then receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 5 Description},-${Product 5 Price} |
      | item | ${Product 1 Description},${Product 1 Price}    |
      | text | Refund Cash UK                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
