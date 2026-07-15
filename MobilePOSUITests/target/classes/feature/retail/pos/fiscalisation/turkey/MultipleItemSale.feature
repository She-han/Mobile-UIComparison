Feature: Multiple Items Sale on Turkey Fiscal POS

  @PT-10651 @Fiscalisation @Turkey @FiscalTurkeyMultipleItemSale @AUTOMATED @ManualVerification
  Scenario: Verify the Multiple items Sale receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal TR 3}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown