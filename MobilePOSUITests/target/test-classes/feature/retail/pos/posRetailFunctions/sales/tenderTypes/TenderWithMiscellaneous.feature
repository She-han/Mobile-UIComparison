Feature: Tender With Miscellaneous

  @PT-1862 @AUTOMATED
  Scenario: Transaction with Miscellaneous tender
    Given user signs on as "Manager"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Manager Transaction Discount (Amount)" from "Selection List" list
    Then user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "2.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount -£2.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Miscellaneous" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description}, ${Product 2 Price}          |
      | item      |  Disc (Manager Transaction   Discount (Amount))       |
      | item      | Cash UK,-£8.00                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1863 @AUTOMATED
  Scenario: Return to miscellaneous tender
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Miscellaneous" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    Given user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    When user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Complete Receipt" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty (No date limit)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Return Tender" page shown
    Then user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Miscellaneous" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 2 Description},-${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
