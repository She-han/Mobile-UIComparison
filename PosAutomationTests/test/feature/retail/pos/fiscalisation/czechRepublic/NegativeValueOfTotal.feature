Feature: Negative values of totals are allowed on Czech Fiscal POS

  @PT-2219  @AUTOMATED @CzechRepublic @Fiscalisation @ManualVerification
  Scenario: Verify Negative values of lines are allowed and negative values of totals are allowed on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal CZ 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty " from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown