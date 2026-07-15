Feature: Sale and Returns together is not allowed

  @PT-879 @Fiscalisation @Norway @FiscalNorwaySaleAndReturnsTogetherIsNotAllowed @No_Printer @AUTOMATED
  Scenario: Sale and Returns together is not allowed
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user enters "${Product Fiscal No 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal No 2}" into "Input Box" field
    And user presses "ENT" button
    And "Select Reason" page is shown
    And user selects "Damaged / Faulty " from "Selection List" list
    And user presses "OK" button and "Sale And Return Not Allowed" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
