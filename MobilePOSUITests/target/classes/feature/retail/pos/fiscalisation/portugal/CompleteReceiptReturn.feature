Feature: Complete Receipt return on Portugal Fiscal POS

  @PT-5008 @Fiscalisation @Portugal @FiscalPortugalItemSale @AUTOMATED @ManualVerification
  Scenario: Complete Receipt return on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "87900003000892207070931007" into "Input Box" field
    And user presses "OK" button
    Then "Extended Return Details" page is shown
    When user presses "Return Entire Receipt" button
    Then "Confirm Return Complete Receipt Prompt" page is shown
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Damaged / Faulty (Over 30 Days)" from "Selection List" list
    And user presses "OK" button and "Enter Original Date" page shown
    Then user enters "07-07-2022" into "Input Box" field
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash PT" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
