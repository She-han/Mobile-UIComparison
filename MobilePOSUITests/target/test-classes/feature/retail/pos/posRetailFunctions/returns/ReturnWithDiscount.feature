Feature: Return With Discounts

  @PT-976 @ToBeFixedAutTest @POS @AUTOMATED @Dunelm
  Scenario: Refund a Single discount Item and Sell a Single discount Item
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user selects "${Product 2 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "${Reason 10% Item Discount}" from "Selection List" list
    Then user presses "OK" button and "Transaction Basket" page shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 2 Price}" is displayed in "Receipt" list
    And "${Receipt Display 10% Item Discount} ${Transaction 10% Item Discount 1 Item}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                              |
      | telephone | Tel: ${Store Phone 1}                                                              |
      | text      | Sale                                                                               |
      | item      | ${Product 2 Description},${Product 2 Price}                                        |
      | item      | Item Discount (HD Complexion Starter    ${Transaction 10% Item Discount 1 Item}		 |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
    Then user waits "90" seconds
    And user signs on as "Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction with MSG config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return ${Product 2 Description}" is displayed in "Receipt" list
    And "-${Product 2 Price}" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% Item Discount" from "Selection List" list
    Then user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 10% Item Discount} ${Transaction 10% Item Discount 1 Item}" is displayed in "Receipt" list
    And "Total Label" label displays the text "£0.00"
    And user presses "TOTAL" button
    And "Transaction Signature Verification" page is shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | R,${Product 2 Description},-${Product 2 Price}         |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Item Discount (HD Complexion Starter    ${Transaction 10% Item Discount 1 Item}		 |
    Then user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-12177 @POS @AUTOMATED
  Scenario: Receipt return for an item which includes a voided discount
    Given user signs on as "Pos Operator 9"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "${Reason Manager Item Discount Amount}" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Manager Item Discount Amount} -£5.00" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Item Void" button
    Then "Select Basket Item" page is shown
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear & proccess in EM
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
