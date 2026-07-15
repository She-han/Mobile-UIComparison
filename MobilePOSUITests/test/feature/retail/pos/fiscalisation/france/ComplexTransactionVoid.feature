Feature: Transaction Void a Complex Sale
    
  @PT-17372 @Fiscalisation @France @ComplexTransactionVoid @No_Printer @AUTOMATED
  Scenario: Transaction Void a Complex Sale
    Given user signs on as "France Fiscal Sales Assistant"
    And user enters "${Product Fiscal Fr 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal Fr 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% Item Discount (%)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    When user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal Fr 3}" into "Input Box" field
    And user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown