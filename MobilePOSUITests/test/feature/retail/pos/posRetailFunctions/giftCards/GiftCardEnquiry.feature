Feature: Validate Gift Card Enquiry

  @PT-4140 @PreSales @GiftCard @AUTOMATED @ReactPOS @POS @WithCucumberSteps @ToBeAutomated
  Scenario: View transaction details via Gift Card Enquiry
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Enquiry" button
    Then "Get Gift Card Number" page is shown
    And user enters "${Gift Card Number 1}" into "Input Box" field
    And user presses "OK" button
    And "Gift Card Enquiry Details" page is shown
    And "Gift Card Number" field displays the text "${Gift Card Number 1}"
    And "Gift Card Status" field displays the text "Active"
    And user presses "Show History" button
    And "Gift Card History List" page is shown
    And user presses "View Transaction" button
    Then "Display Transaction With Msg Config" page is shown
    And user presses "Back" button and "Select Transaction Details" page shown
    And user presses "Cancel" button and "Gift Card History List" page shown
    And user presses "OK" button
    And "Gift Card Enquiry Details" page is shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5206 @PreSales @GiftCard @AUTOMATED @ReactPOS @POS @WithCucumberSteps @ActiveAccountGiftCardBalance @Dunelm @MVP @POS @POSSet2 @POSValidatedTest @RI @Smoke @ToBeAutomated
  Scenario: Print The Gift Card Enquiry
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Enquiry" button
    Then "Get Gift Card Number" page is shown
    And user enters "${Gift Card Number 1}" into "Input Box" field
    And user presses "OK" button
    And "Gift Card Enquiry Details" page is shown
    And "Gift Card Number" field displays the text "${Gift Card Number 1}"
    And "Gift Card Status" field displays the text "Active"
    And user presses "Print" button
    And receipt display with following details
      | text | ***************7461 |
      | item | Balance             |
    When user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
