Feature: Tender with Credit Note on Czech Fiscal POS

  @PT-2203 @CzechRepublicFiscalSaleByCreditNote @AUTOMATED @CzechRepublic @Fiscalisation @ManualVerification
  Scenario: Complete transaction and tender with Credit Note on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user enters "${Product Fiscal CZ 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "CreditNote" button and "Enter Serial Number" page shown
    And user enters "5502244200828130933029" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    
