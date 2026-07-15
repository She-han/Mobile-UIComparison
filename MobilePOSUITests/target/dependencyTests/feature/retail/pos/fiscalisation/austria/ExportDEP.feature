Feature: Add entry and Export DEP Report

  @PT-640 @ExportDEP @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Export DEP Report
    Given user signs on as "Austria Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Fiscalisation" button
    And user presses "Export DEP" button
    Then "List Fiscal DEP Entry" page is shown
    And user presses "OK" button and "Dep Successfully Exported Dialog" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
