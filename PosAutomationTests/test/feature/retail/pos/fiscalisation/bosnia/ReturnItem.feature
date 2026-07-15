Feature: Return Item

  @PT-987 @No_Printer @AUTOMATED @Bosnia @Fiscalisation @FiscalBosnia
  Scenario: Return an item - Fiscal Bosnia
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal BA 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Bosnia Capture Fiscal Receipt Number" page shown
    And user enters "543" into "Receipt Number" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
