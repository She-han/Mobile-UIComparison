Feature: Cash Management - Cash Up

  @PT-1439 @NorwayFiscalCashup @No_Printer @AUTOMATED @Norway @Fiscalisation
  Scenario: Verify the Fiscal Receipt for Terminal Cash up on Norway Fiscal Printer when doing a Day End
    Given user signs on as "Norway Fiscal Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    Then user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash NO" from "Selection List" list
    And user enters "100,00" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
