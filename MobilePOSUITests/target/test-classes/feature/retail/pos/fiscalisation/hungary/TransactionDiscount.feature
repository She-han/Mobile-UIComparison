Feature: Transaction Discount

  @PT-1717 @HungaryFiscalTransactionDiscountAmount @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Add a Transaction Discount (Amount) and Complete Transaction
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary VAT Rates Sync in Progress" page is shown
    And "Fiscal Hungary VAT Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    And user enters "${Product Fiscal HU 2}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal HU 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Enter Transaction Discount Amount" page is shown
    When user enters "5.00" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And "Transaction Discount (Transaction Discount (Amount))" is displayed in "Receipt" list
    And "-500 HUF" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1718 @HungaryFiscalTransactionDiscountPercentage @No_Printer @AUTOMATED @Hungary @Fiscalisation @FiscalHungary
  Scenario: Add a Transaction Discount (Percentage) and Complete Transaction
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary VAT Rates Sync in Progress" page is shown
    And "Fiscal Hungary VAT Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    And user enters "${Product Fiscal HU 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal HU 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10% Transaction Discount" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When "Transaction Discount (10% Transaction Discount)" is displayed in "Receipt" list
    And "-200 HUF" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
