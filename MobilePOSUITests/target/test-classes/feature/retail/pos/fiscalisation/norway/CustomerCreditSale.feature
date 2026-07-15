Feature: Customer Credit Sale

  @PT-859 @Fiscalisation @Norway @FiscalNorwayCustomerCreditSale @No_Printer @AUTOMATED
  Scenario: Customer Credit Sale
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user enters "${Product Fiscal No 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Customers" button
    And user presses "Credit Account" button and "Loyalty Account Enquiry" page shown
    And user enters "NO_1" into "Input Box" field
    And user presses "OK" button and "Card_Tender Amount" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
