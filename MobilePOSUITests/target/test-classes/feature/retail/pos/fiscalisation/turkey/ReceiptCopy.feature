Feature: Verify Copy receipt

  @PT-10621 @TurkeyReceiptCopy @AUTOMATED @Turkey @Fiscalisation @ManualVerification
  Scenario: Verify Copy receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown   
    When user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Reprint Recent" button and "Reprint Recent Select Transaction" page shown
    And user presses "OK" button and "Confirm Print transaction" page shown
    And user presses "Print" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown