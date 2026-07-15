Feature: Tender with Credit Note

  @PT-949 @RomaniaFiscalSaleByCreditNote @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Complete transaction and tender with Credit Note
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 8}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Credit Note" button and "Enter Serial Number" page shown
    When user enters "${Credit Note Fiscal RO 1}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
