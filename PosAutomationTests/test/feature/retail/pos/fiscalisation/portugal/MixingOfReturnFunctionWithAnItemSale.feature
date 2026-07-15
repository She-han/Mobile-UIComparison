Feature: Mixing of return function with an Item sale on Portugal Fiscal POS is restricted

  @PT-5007 @Portugal @AUTOMATED @Fiscalisation @ManualVerification
  Scenario: Verify mixing of return function with an Item sale on Portugal Fiscal POS is restricted
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    And user enters "${Product Fiscal PT 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal PT 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty " from "Selection List" list
    And user presses "OK" button and "Mixing Sale and Returns Allowed Prompt" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
