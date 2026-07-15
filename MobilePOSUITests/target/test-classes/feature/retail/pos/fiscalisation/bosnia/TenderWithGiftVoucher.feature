Feature: Tender with Gift Voucher

  @PT-1010 @No_Printer @AUTOMATED @Bosnia @Fiscalisation @FiscalBosnia
  Scenario: Complete transaction and tender with Gift Voucher on Bosnia Fiscal POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user enters "${Product Fiscal BA 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    And user selects "Gift Voucher BA" from "Selection List" list
    And user presses "OK" button and "Select Redeem Voucher Sub Type" page shown
    And user selects "5" from "Selection List" list
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And "${Product Fiscal BA 2 Description}" is displayed in "Receipt" list
    And "Redeem Gift Voucher BA" is displayed in "Receipt" list
    When user presses "SignOff" button
    Then "Enter User" page is shown
