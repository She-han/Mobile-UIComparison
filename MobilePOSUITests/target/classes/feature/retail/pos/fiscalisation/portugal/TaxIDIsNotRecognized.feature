Feature: Verify when Tax id is not recognized simplified fiscal invoice will print 999999990 on Portugal Fiscal POS

  @PT-5002 @Portugal @AUTOMATED @Fiscalisation @ManualVerification
  Scenario: Verify when Tax id is not recognized simplified fiscal invoice will print 999999990 on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    Then user presses "Request Simple Fiscal Invoice" button and "Transaction Basket" page shown
    And user enters "${Product Fiscal PT 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Name Contact" page shown
    And user enters "Tom" into "Customer Forename Text PT" field
    And user enters "Sauyer" into "Customer Surname Text PT" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    And user enters "Notingham" into "Customer Address Line1 Text" field
    And user enters "2321" into "Customer Postcode Field" field
    And user presses "OK" button and "Customer Confirmation" page shown
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
