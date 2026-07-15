Feature: Transaction void of normal single item sale

  @PT-17370 @Fiscalisation @France @FiscalFranceTransactionVoid @No_Printer @AUTOMATED
  Scenario: Transaction void of normal single item sale
    Given user signs on as "France Fiscal Sales Assistant"
    And user enters "${Product Fiscal Fr 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown