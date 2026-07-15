Feature: Sales from Rich Product Search

  @PT-17394 @RichProductSearch @POS @AUTOMATED @SalesFromRichProductSearch @Dunelm @JYSK @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Sell Merchandise item from Rich Product Search
    Given user signs on as "France Fiscal Sales Assistant"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Product Fiscal Fr 1}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product Fiscal Fr 1 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Product Fiscal Fr 1 Description}"
    When user presses "ADD TO BAG" button
    Then "Transaction Basket" page is shown
    And "${Product Fiscal Fr 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown