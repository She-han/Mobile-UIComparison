Feature: Transaction Discount

  @PT-857 @Fiscalisation @Norway @FiscalNorwayTransactionDiscount @No_Printer @AUTOMATED
  Scenario: Transaction Discount
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user enters "${Product Fiscal No 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "10 % Off" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Given "Transaction Discount (10 % Off 10%)" is displayed in "Receipt" list
    And "NOK -1,20" is displayed in "Receipt List" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
