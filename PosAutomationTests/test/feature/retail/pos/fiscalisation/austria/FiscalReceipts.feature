@Fiscalisation @FiscalAustria
Feature: Print Initial Receipt

  @PT-630 @Fiscal_Austria_Initial_Receipt @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Print Initial Receipt
    Given user signs on as "Austria Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Fiscalisation" button
    And user presses "Initial Receipt" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-631 @Fiscal_Austria_Monthly_Receipt @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Print Monthly Receipt
    Given user signs on as "Austria Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Fiscalisation" button
    And user presses "Monthly Receipt" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-632 @Fiscal_Austria_Yearly_Receipt @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Print Yearly Receipt
    Given user signs on as "Austria Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Fiscalisation" button
    And user presses "Yearly Receipt" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-633 @Fiscal_Austria_Final_Receipt @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Print Final Receipt
    Given user signs on as "Austria Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Fiscalisation" button
    And user presses "Final Receipt" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
