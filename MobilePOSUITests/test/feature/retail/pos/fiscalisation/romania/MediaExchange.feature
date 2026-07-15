Feature: Perform Media Exchange on Romania POS

  @PT-961 @RomaniaMediaExchange @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Perform Media Exchange on Romania POS
    Given user signs on as "Romania Fiscal Sales Assistant"
    When user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipt" button
    Then user presses "Media Exchange" button and "Romania Correct Payment" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button and "Romania Prompt State" page shown
    And user selects "Cards RO" from "Selection List" list
    And user presses "OK" button
    And user selects "Cash RO" from "Selection List" list
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
