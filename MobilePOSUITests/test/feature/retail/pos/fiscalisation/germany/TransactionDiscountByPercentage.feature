Feature: Transaction Discount as a percentage on Germany Fiscal POS

  @PT-2178 @Fiscalisation @Germany @FiscalGermanyTransactionDiscountPercentage @AUTOMATED @ManualVerification
  Scenario: Add a Transaction Discount (Percentage) and Complete Transaction on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    When user enters "${Product Fiscal De 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal De 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "20 % Transaction Discount" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Given "Transaction Discount (20 % Transaction Discount 20%)" is displayed in "Receipt" list
    And "-€54.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
