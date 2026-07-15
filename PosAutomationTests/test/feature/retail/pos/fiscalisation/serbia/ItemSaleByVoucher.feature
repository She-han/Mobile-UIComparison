Feature: Complete transaction by Voucher on Serbia fiscal POS

  @PT-1484 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify the Fiscal Receipt for the transaction completed with Voucher on Serbia Fiscal Printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 4}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    And user selects "RS Gift voucher" from "Selection List" list 
    And user presses "OK" button and "Select Redeem Voucher Sub Type" page shown
    And user selects "RS Subtype2" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
 