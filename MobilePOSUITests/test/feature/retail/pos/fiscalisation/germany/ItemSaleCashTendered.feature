Feature: Item Sale paid with Cash on German Fiscal POS

  @PT-2148 @Fiscalisation @Germany @FiscalGermanyItemSale @AUTOMATED @ManualVerification
  Scenario: Item sale paid with cash on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    And user enters "${Product Fiscal De 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And receipt display with following details
      | item      | ${Product Fiscal DE 1 Description},${Product Fiscal DE 1 Price}|
