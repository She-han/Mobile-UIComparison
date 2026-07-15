Feature: Baskets From CSV

  @PLAT-14431 @TobeFixedAutTest @BasketsFromCSV @POS @AUTOMATED
  Scenario: Create and store baskets from csv
    Given user signs on as "Sales Assistant"
    Then "Transaction Basket" page is shown
    Then create and store baskets from csv "testData/BasketItems.csv" with create basket menu "Sales,More,Capture and Sell" and store basket menu "Sales,Store / Recall Options,Save Transaction Receipt"
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
