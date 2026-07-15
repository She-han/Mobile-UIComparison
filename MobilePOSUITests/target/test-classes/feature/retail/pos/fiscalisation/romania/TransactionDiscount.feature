Feature: Transaction Discount

  @PT-953 @RomaniaFiscalTransactionDiscountAmount @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Add a Transaction Discount (Amount) and Complete Transaction
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 2}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal RO 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Enter Transaction Discount Amount" page is shown
    When user enters "5.00" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And "Transaction Discount (Transaction Discount (Amount))" is displayed in "Receipt" list
    And "-RON5.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1171 @RomaniaFiscalTransactionDiscountPercentage @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Add a Transaction Discount (Percentage) and Complete Transaction
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 2}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal RO 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "20% Transaction Discount" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When "Transaction Discount (20% Transaction Discount 20%)" is displayed in "Receipt" list
    And "-RON7.01" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
