Feature: Tender with Gift Voucher

  @PT-1709 @HungaryFiscalSaleByGiftVoucher @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Complete transaction and tender with Gift Voucher on Hungary Fiscal POS
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary Vat Rates Sync in Progress" page is shown
    And "Fiscal Hungary Vat Rates Up to Date Prompt" page is shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user enters "${Product Fiscal HU 2}" into "Input Box" field
    Then user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    When user selects "Gift Voucher HU" from "Selection List" list
    And user presses "OK" button and "Select Redeem Voucher Sub Type" page shown
    And user selects "HUF 50" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown