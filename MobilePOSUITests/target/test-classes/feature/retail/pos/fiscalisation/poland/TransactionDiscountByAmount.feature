Feature: Transaction Discount as an amount

  @PT-628 @Fiscalisation @Poland @FiscalPolandTransactionDiscountAmount @No_Printer @AUTOMATED
  Scenario: Transaction Discount as an amount - Poland Fiscalisation
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user enters "${Product Fiscal Pl 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Pl 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Manager Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Enter Transaction Discount Amount" page is shown
    When user enters "3.00" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Given "Transaction Discount (Manager Transaction Discount (Amount))" is displayed in "Receipt" list
    And "-3,00 PLN" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
