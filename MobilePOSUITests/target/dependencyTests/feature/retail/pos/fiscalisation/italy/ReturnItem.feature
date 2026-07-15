Feature: Return Item on Italy Fiscal POS

  @PT-5747 @ItalyFiscalReturnItem @AUTOMATED @Italy @Fiscalisation @FiscalItaly @ManualVerification
  Scenario: Return of an item on Italy Fiscal POS
    Given user signs on as "Italy Fiscal Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal IT 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
    And receipt display with following details
      | item      | ${Product Fiscal IT 2 Return Description},${Product Fiscal IT 2 Return Price}|
      