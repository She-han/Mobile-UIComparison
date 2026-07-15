Feature: Non citizen can perform transactions upto 10000 EUR on Portugal Fiscal POS

  @PT-5013 @Fiscalisation @Portugal @FiscalPortugalItemSale @AUTOMATED @ManualVerification
  Scenario: Non citizen can perform transactions upto 10000 EUR on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "1000" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal PT 2}" into "Input Box" field
    When user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Above 1000 Window" page shown
    And user presses "Continue" button and "Over 3000EUR" page shown
    And user presses "Cancel" button and "Over 10000EUR Prompt" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "20" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal PT 2}" into "Input Box" field
    When user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "ChequeTender" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "123456" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Sort Code" page shown
    And user enters "23-1902" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user enters "1234567" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
