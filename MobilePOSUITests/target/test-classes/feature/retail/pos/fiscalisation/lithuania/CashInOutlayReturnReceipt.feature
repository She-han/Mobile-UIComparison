Feature: Print Fiscal Cash In Outlay Receipt - Lithuania
    
  @PT-15082 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @CashDrawer @CashIn @OutlayReturn @ManualVerification
  Scenario: Lithuania - Verify cash drawer is opening when doing cash in - outlay return and print the outlay return receipt
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen Terminal Outlay Return Button" icon button
    Then "Cash Management Select Outlay" page is shown
    And user presses "Down" button
    And user presses "Select" button
    Then "Select Terminal Prompt" page is shown
    When user selects "POS 1 @ Enactor (Lithuania)" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Outlay Return" page is shown
    And user presses "Complete" button
    And user presses "ENT" button
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Enter User" page is shown