Feature: Set Logo

  @PT-615 @Fiscalisation @Poland @FiscalPolandSetLogo @No_Printer @AUTOMATED
  Scenario: Set Logo
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "Fiscalisation" icon button
    And user presses "Set Logo" icon button
    Then "Fiscal Poland" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
