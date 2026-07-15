Feature: Cash Management - Cashup on Serbia Fiscal Printer

  @PT-1523 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify the Fiscal Receipt for  Cash up function with Day End operation on Serbia Fiscal Printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    And user presses "OK" button and "Select Terminal Prompt" page shown
    And user presses "OK" button
    And "Cash Management Select Tender Reason" page is shown
    And user selects "Cash RS" from "Selection List" list
    And user enters "100.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
