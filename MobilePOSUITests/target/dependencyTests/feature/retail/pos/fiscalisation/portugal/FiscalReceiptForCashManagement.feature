@PT-50350 @CashManagement @Portugal @AUTOMATED @Fiscalisation @ManualVerification
Feature: Fiscal Receipts for Cash Management on Portugal Fiscal POS

  @PT-5035 @Portugal @AUTOMATED @Fiscalisation @ManualVerification
  Scenario: Fiscal Receipt for Cash Management Expenses on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    When user presses "Management" button
    When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen Expense Button" icon button
    Then "Select Terminal Prompt" page is shown
    And user selects "pos1@PT0001.sand.enactor" from "Selection List" list
    And user presses "OK" button
    Then "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash PT" from "Selection List" list
    And user enters "20000" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5034 @Portugal @AUTOMATED @Fiscalisation @ManualVerification
  Scenario: Fiscal Receipt for Cash Management Float on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    When user presses "Management" button
    When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen Float Button" icon button
    Then "Select Terminal Prompt" page is shown
    And user selects "pos1@PT0001.sand.enactor" from "Selection List" list
    And user presses "OK" button
    Then "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash PT" from "Selection List" list
    And user enters "20000" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5033 @Fiscalisation @Portugal @FiscalPortugalItemSale @AUTOMATED @ManualVerification
  Scenario: Fiscal Receipt for Cash Management Income on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    When user presses "Management" button
    When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen Income Button" icon button
    Then "Select Terminal Prompt" page is shown
    And user selects "pos1@PT0001.sand.enactor" from "Selection List" list
    And user presses "OK" button
    Then "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash PT" from "Selection List" list
    And user enters "1000.00" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5037 @Portugal @AUTOMATED @Fiscalisation @ManualVerification
  Scenario: Fiscal Receipt for Cash Management Pickup on Portugal Fiscal POS
    Given "Confirm Document Series Successfull Prompt" page is shown
    When user presses "OK" button
    Then "Enter User" page is shown
    Given user signs on as "Portugal Fiscal Sales Assistant"
    When user presses "Management" button
    When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen Pickup Button" icon button
    Then "Select Terminal Prompt" page is shown
    And user selects "pos1@PT0001.sand.enactor" from "Selection List" list
    And user presses "OK" button
    Then "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash PT" from "Selection List" list
    And user enters "20.00" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
