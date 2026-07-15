Feature: Item Return on Croatia Fiscal POS

  @PT-2255 @Fiscalisation @Croatia @FiscalCroatiaItemReturn @ManualVerification @AUTOMATED
  Scenario: Verify Item Return on Croatia Fiscal POS
    Given user signs on as "Croatia Fiscal Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal HR 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
