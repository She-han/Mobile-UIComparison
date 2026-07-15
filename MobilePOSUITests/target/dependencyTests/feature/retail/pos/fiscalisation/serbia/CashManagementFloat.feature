Feature: Cash Management - Float on Serbia fiscal printer

  @PT-1518 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify the Fiscal Receipt for Cash Management Float on Serbia Fiscal Printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Float Button" icon button
    And "Select Terminal Prompt" page is shown
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash RS" from "Selection List" list
    And user enters "5000.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    And user presses "Back" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
