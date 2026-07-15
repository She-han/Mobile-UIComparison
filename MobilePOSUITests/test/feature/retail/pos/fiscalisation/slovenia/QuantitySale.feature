Feature: Quantity Sale on Slovenia Fiscal POS

  @PT-2285 @Fiscalisation @Slovenia @FiscalQuanitySale @AUTOMATED @ManualVerification
  Scenario: Verify Quantity Sale on Slovenia Fiscal POS
    Given user signs on as "Slovenia Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "4" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal SI 2}" into "Input Box" field
    And user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
