Feature: Item Sale with Gift Voucher Tender on Croatia Fiscal POS

  @PT-2275 @AUTOMATED @Croatia @Fiscalisation @FiscalCroatia @ManualVerification
  Scenario: Verify Item Sale with Gift Voucher Tender on Croatia Fiscal POS
    Given user signs on as "Croatia Fiscal Sales Assistant"
    And user enters "${Product Fiscal HR 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    And user selects "Gift Voucher HR" from "Selection List" list
    And user presses "OK" button and "Select Redeem Voucher Sub Type" page shown
    And user selects "HRK5" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user enters "99874565628" into "Input Box" field    
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
