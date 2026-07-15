Feature: Multiple item transaction by Cheque tender

  @PT-1483 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify the Fiscal Receipt for Multiple products by Cheque tender on Serbia Fiscal Printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal RS 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Cheque Tender Options" page shown
    And user presses "Business" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
