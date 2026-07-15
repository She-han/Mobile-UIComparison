Feature: Return item - Credit Note

  @PT-333 @ItemReturnWithCreditNote @POS @AUTOMATED @MVP @POSValidatedTest @POSSet4
  Scenario: Item Return by issuing a Credit Note
    Given user signs on as "POS Operator"
    When user presses "Returns" button
    And user presses "Return Item" button
    Then "Enter Return Item" page is shown
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Select Reason" page shown
    When user selects "Not Wanted (10 Days) (Credit Note)" from "Selection List" list
    And user presses "OK" button and "Enter Original Date" page shown
    And user enters "#{today}" into "Input Box" field
    Then user presses "OK" button and "Capture Customer Name" page shown
    When user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "M" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user presses "OK" button
    Then "Confirm Customer" page is shown
    When user presses "Confirm" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "Ret Reason: Not Wanted (10 Days) (Credit Note)" is displayed in "Receipt" list
    Then user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Credit Note" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item      | R,${Product 1 Description}                            |
      | item      | ${Product 1 Description},${Product 1 Refund Price}    |
      | text      | Credit Note                                           |
      | text      | Refund Credit Note UK                                 |
      | text      | Expiry Date                                           |
    When user presses "SignOff" button
    Then "Enter User" page is shown
