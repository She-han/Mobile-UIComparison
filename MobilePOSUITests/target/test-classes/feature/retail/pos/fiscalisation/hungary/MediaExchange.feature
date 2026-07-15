Feature: Perform Media Exchange on Hungary POS

  @PT-1733 @HungaryMediaExchange @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Do a Payment Media Change and verify the fiscal Receipt on Hungary Fiscal Printer
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary Vat Rates Sync in Progress" page is shown
    And "Fiscal Hungary Vat Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    Then "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    Then user presses "Payment Media Change" button and "Hungary Correct Payment" page shown
    And user enters "10" into "Input Box" field
    And user presses "OK" button and "Hungary Prompt State" page shown
    And user selects "Cards HU" from "Selection List" list
    And user presses "OK" button
    And user selects "Cash HU" from "Selection List" list
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown