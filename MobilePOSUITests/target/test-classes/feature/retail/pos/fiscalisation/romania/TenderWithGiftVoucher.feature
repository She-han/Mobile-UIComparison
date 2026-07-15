Feature: Tender with Gift Voucher

  @PT-950 @RomaniaFiscalSaleByGiftVoucher @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Complete transaction and tender with Gift Voucher on Romania Fiscal POS
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 7}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    When user selects "Gift Voucher RO" from "Selection List" list
    And user presses "OK" button and "Select Redeem Voucher Sub Type" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
