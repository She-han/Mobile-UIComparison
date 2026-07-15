Feature: Verify Item Void on Portugal Fiscal POS

  @PT-5011 @Fiscalisation @Portugal @FiscalPortugalItemSale @AUTOMATED @ManualVerification
  Scenario: Verify Item Void on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    And user enters "${Product Fiscal PT 3}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal PT 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Item" button and "Scan Item Void" page shown
    Given user enters "${Product Fiscal PT 3}" into "Input Box" field
    When user presses "ENT" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
