Feature: Transaction Discount on Serbia fiscal printer

  @PT-1528 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Add a Transaction Discount(by percentage) and Complete Transaction on Serbia fiscal printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 4}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Discount / Overrides" button and "Transaction Basket" page shown
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10 % Off" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And "Transaction Discount (10 % Off 10%)" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1635  @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Add a Transaction Discount(by amount) and Complete Transaction on Serbia fiscal printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 4}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Discount / Overrides" button and "Transaction Basket" page shown
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "din 300 Off" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And "Transaction Discount (din 300 Off)" is displayed in "Receipt" list
    And "-din300.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown