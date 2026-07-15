Feature: Items with the price 0 and Transaction Amount as Zero on Czech Fiscal POS

  @PT-2208 @Fiscalisation @CzechRepublic @AUTOMATED @ManualVerification
  Scenario: Verify Items with the price 0 are allowed and Transaction Amount Can be Zero on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user enters "${Product Fiscal CZ 0}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button 
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And receipt display with following details
      | item      | ${Product Fiscal CZ 0 Description},${Product Fiscal CZ 0 Price}|
