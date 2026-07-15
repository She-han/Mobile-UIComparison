Feature: Show fiscal details screen

  @PT-17380 @Fiscalisation @France @FiscalDetails @No_Printer @AUTOMATED
  Scenario: Show fiscal details screen
    Given user signs on as "France Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Information Details" button and "France Fiscal Details" page shown
    And user presses "Back" button and "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown