Feature: Item Sale paid with a cheque

  @PT-990 @Fiscalisation @Bosnia @FiscalBosniaItemSaleChequeTender @No_Printer @AUTOMATED
  Scenario: Item Sale paid with a cheque
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user enters "${Product Fiscal Ba 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "ChequeTender" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "123456" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Sort Code" page shown
    And user enters "23-1902" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user enters "1234567" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
