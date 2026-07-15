Feature: Item Sale paid with Cash on Czech Fiscal POS

  @PT-2200 @Fiscalisation @CzechRepublic @AUTOMATED @ManualVerification
  Scenario: Item sale paid with cash on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user enters "${Product Fiscal CZ 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And receipt display with following details
      | item      | ${Product Fiscal CZ 1 Description},${Product Fiscal CZ 1 Price}|
