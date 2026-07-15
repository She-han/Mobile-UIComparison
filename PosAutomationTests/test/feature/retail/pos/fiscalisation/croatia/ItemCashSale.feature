Feature: Cash Tender on Croatia Fiscal POS

  @PT-2243 @Fiscalisation @Croatia @FiscalCroatiaSingleItemSale @ManualVerification @AUTOMATED
  Scenario: Verify Item Sale with Cash Tender on Croatia Fiscal POS
    Given user signs on as "Croatia Fiscal Sales Assistant"
    When user enters "${Product Fiscal HR 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    And receipt display with following details
      | item      | ${Product Fiscal HR 1 Description},${Product Fiscal HR 1 Price}|