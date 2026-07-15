Feature: Receipt Locale Selection

  @PT-1042 @AUTOMATED @POS @LocaleSpecific @ReceiptLocaleSelection
  Scenario: Reprint Receipt language
    Given template "POS_TEMPLATE_WITH_RECEIPT_LOCALE" is set for the current POS terminal
    When user signs on as "Sales Assistant"
    Then user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    Then "Select Receipt Locale" page is shown
    And "English (UK)" is displayed in "Selection List" list
    When user selects "French" from "Selection List" list
    Then user presses "OK" button
    And receipt display with following details
      | text | Vente |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Receipts" button and "Transaction Basket" page shown
    When user presses "Reprint Recent" button and "Reprint Recent  Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And user presses "Print" button and "Select Receipt Locale" page shown
    And user selects "French" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Vente |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1062 @AUTOMATED @POS @LocaleSpecific @ReceiptLocaleSelection
  Scenario: Receipt Locale Selection of Empty Basket
    Given template "POS_TEMPLATE_WITH_RECEIPT_LOCALE" is set for the current POS terminal
    When user signs on as "Sales Assistant 11"
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Select Receipt Locale" button
    Then "Select Receipt Locale" page is shown
    And "English (UK)" is displayed in "Selection List" list
    When user selects "French" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Vente |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1147 @LocaleSpecific @ReceiptLocaleSelection
  Scenario: Select Receipt Locale at Print stage
    Given user signs on as "Sales Assistant"
    Then user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    Then "Receipt Destination Selection" page is shown
    And user presses "Print Only" button
    Then "Select Receipt Locale" page is shown
    Then "English (UK)" is displayed in "Selection List" list
    When user selects "French" from "Selection List" list
    And user presses "OK" button
    And receipt display with following details
      | text | Vente |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1148 @LocaleSpecific @ReceiptLocaleSelection
  Scenario: Select Receipt Locale at No sale
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "No Sale" button
    Then "Select Reason" page is shown
    Then "Incorrect change given" is displayed in "Selection List" list
    When user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button
    Then "Select Receipt Locale" page is shown
    Then "English (UK)" is displayed in "Selection List" list
    When user selects "French" from "Selection List" list
    And user presses "OK" button
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
