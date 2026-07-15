Feature: Cash Tender on Italy Fiscal POS

  @PT-5729 @Fiscalisation @Italy @FiscalItalySingleItemSale @AUTOMATED
  Scenario: Verify Item Sale with Cash Tender on Italy Fiscal POS
    Given user signs on as "Italy Fiscal Sales Assistant"
    When user enters "${Product Fiscal IT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    And receipt display with following details
      | item      | ${Product Fiscal IT 1 Description},${Product Fiscal IT 1 Price}|