Feature: Tender With Cash

  @PT-8540 @POS @AUTOMATED
  Scenario: Support passing a reference ID during a Cash Tender
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Cash Scotland" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Capture Reference Number" page shown
    And user enters "501105" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Sale                                         |
      | item | ${Product 2 Description}, ${Product 2 Price} |
      | item | Cash UK Scotland,-£10.00                     |
      | item | Ref:  501105                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10740 @POS @AUTOMATED
  Scenario: Verify that Payments below Minimum Debit Amount cannot be tendered
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user enters "${SKU Product 2}" into "Input Box" field
    And user presses "ENT" icon button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Cash Georgia" button and "Enter Tender Amount" page shown
    When user enters "49.00" into "Input Box" field
    And user presses "ENT" button
    Then "Less Than The Minimum Debit Limit Amount" page is shown
    When user presses "Cancel" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Cash Georgia" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${SKU Product 2 Description}, ${SKU Product 2 Price}  |
      | item      | Cash Georgia,-£50.00                                  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10741 @POS @AUTOMATED
  Scenario: Verify that Refunds can be done only up to the limit set in the Cash Tender - Credit Limit
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    Then "Enter Return Item" page is shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    When user presses "No" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "150000.00" into "Input Box" field
    And user presses "ENT" button
    Then "Amount Exceeds The Maximum Credit Limit Amount" page is shown
    When user presses "OK" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10742 @POS @AUTOMATED
  Scenario: Verify that Refunds below Minimum Credit Amount cannot be tendered
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    Then "Enter Return Item" page is shown
    When user enters "${Product 95}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    When user presses "No" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "More" button
    And user presses "Cash Georgia" button and "Enter Cash Tender Amount" page shown
    When user enters "49.00" into "Input Box" field
    And user presses "ENT" button
    Then "Less Than The Minimum Credit Limit Amount" page is shown
    When user presses "Cancel" button and "Refund Item" page shown
    And user presses "More" button
    And user presses "Cash Georgia" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button

  @PT-6997 @POS @AUTOMATED
  Scenario: Verify the debit tender cannot be voided when Prevent tender item void (Debit) flag is enabled
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user enters "${Product 95}" into "Input Box" field
    And user presses "ENT" icon button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "More" button
    And user presses "Cash Wales" button and "Enter Tender Amount" page shown
    When user enters "50.00" into "Input Box" field
    Then user presses "OK" button and "Select Tender" page shown
    And user selects "Cash Wales" from "Receipt" list
    And "Modify Tender" page is shown
    And user presses "Void Tender" button
    And "Void Tender Not Allowed" page is shown
    When user presses "OK" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "More" button
    And user presses "Cash Wales" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 95 Description}, ${Product 95 Price}        |
      | item      | Cash Wales,-£50.00                                    |
      | item      | Cash Wales,-£6.00                                     |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6998 @POS @AUTOMATED
  Scenario: Verify the debit tender can be voided when Prevent tender item void (Credit) is enabled
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user enters "${Product 95}" into "Input Box" field
    And user presses "ENT" icon button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "More" button
    And user presses "Cash Austria" button and "Enter Tender Amount" page shown
    When user enters "50.00" into "Input Box" field
    Then user presses "OK" button and "Select Tender" page shown
    And user selects "Cash Austria" from "Receipt" list
    And "Modify Tender" page is shown
    And user presses "Void Tender" button and "Select Reason" page shown
    And user selects "Other" from "Selection List" list
    When user presses "OK" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "More" button
    And user presses "Cash Austria" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 95 Description}, ${Product 95 Price}        |
      | item      | Cash Austria,-£56.00                                  |
      | text      | V Cash Austria VOID -£50.00                           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6999 @POS @AUTOMATED
  Scenario: Verify the credit tender cannot be voided when Prevent tender item void (Credit) is enabled
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button
    Then "Enter Return Item" page is shown
    When user enters "${Product 95}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    When user presses "No" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "More" button
    And user presses "Cash Austria" button and "Enter Cash Tender Amount" page shown
    When user enters "50.00" into "Input Box" field
    And user presses "ENT" button and "Refund Item" page shown
    And user presses "More" button
    And user selects "Cash Austria" from "Receipt" list
    And "Modify Tender" page is shown
    And user presses "Void Tender" button
    And "Void Tender Not Allowed" page is shown
    When user presses "OK" button and "Refund Item" page shown
    And user presses "More" button
    And user presses "Cash Austria" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button

  @PT-7000 @POS @AUTOMATED
  Scenario: Verify the credit tender can be voided when 'Prevent tender item void (Debit)' is enabled
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button
    Then "Enter Return Item" page is shown
    When user enters "${Product 95}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    When user presses "No" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "More" button
    And user presses "Cash Wales" button and "Enter Cash Tender Amount" page shown
    When user enters "50.00" into "Input Box" field
    And user presses "ENT" button and "Refund Item" page shown
    And user presses "More" button
    And user selects "Cash Wales" from "Receipt" list
    And "Modify Tender" page is shown
    And user presses "Void Tender" button and "Select Reason" page shown
    And user selects "Other" from "Selection List" list
    When user presses "OK" button and "Refund Item" page shown
    And user presses "More" button
    And user presses "Cash Wales" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
