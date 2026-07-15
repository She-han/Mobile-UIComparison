Feature: Restrict Return an Item with Normal Retail Sale

  @PT-1033  @No_Printer @AUTOMATED @Bosnia @Fiscalisation @FiscalBosnia
  Scenario: Verify return function is not possible to mix with an Item sale in Bosnia Fiscal POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user enters "${Product Fiscal BA 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal BA 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Bosnia Mixing Sale Not Allowed Prompt" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
