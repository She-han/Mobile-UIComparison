Feature: Tender with Credit Note on German Fiscal POS

  @PT-2152 @GermanyFiscalSaleByCreditNote @AUTOMATED @Germany @Fiscalisation @FiscalGermany @ManualVerification
  Scenario: Complete transaction and tender with Credit Note on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    And user enters "${Product Fiscal DE 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Credit Note" button and "Enter Serial Number" page shown
    And user enters "21654986546879" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    
