Feature: Verify Mixing of Void and sales on Portugal Fiscal POS is restricted

  @PT-5006 @Portugal @AUTOMATED @Fiscalisation @ManualVerification
  Scenario: Verify Mixing of Void and sales on Portugal Fiscal POS is restricted
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    And user enters "${Product Fiscal PT 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal PT 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Item" button and "Scan Item Void" page shown
    And user enters "${Product Fiscal PT 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
