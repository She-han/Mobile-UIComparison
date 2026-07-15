Feature: Terminal cashup using Cashup (Empty) configuration

  @PT-1388 @Fiscalisation @Bosnia @CashupEmpty @No_Printer @AUTOMATED
  Scenario: End of the day cash up operation on a Bosnia fiscal POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    When user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash BA" from "Selection List" list
    And user enters "100.75" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Confirm Day End Message" page is shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
