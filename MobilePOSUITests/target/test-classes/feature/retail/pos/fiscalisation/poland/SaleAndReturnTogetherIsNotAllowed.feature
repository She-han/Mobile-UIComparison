Feature: Sale and Return together is not allowed

  @PT-731 @Fiscalisation @Poland @FiscalPolandSaleAndReturnTogetherIsNotAllowed @No_Printer @AUTOMATED
  Scenario: Sale and Return together is not allowed
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user enters "${Product Fiscal Pl 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal Pl 2}" into "Input Box" field
    And user presses "ENT" button
    And "Select Reason" page is shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Poland Sale And Return Not Allowed" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "Voids" button
    And user presses "Void Transaction" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
