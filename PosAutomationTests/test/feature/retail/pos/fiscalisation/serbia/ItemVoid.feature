Feature: Void an item in a transaction on Serbia fiscal POS

  @PT-1493 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify the voiding an item in a transaction with multiple items on Serbia fiscal POS
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button and "Select Basket Item" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-1494 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify item void in a transaction with single item on Serbia fiscal POS
    Given user signs on as "Serbia Fiscal Sales Assistant"
    When user enters "${Product Fiscal RS 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button and "Cannot Void Last Item" page shown
    And user presses "Yes" button and "End Transaction Continue" page shown
    And user presses "OK" button 
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10731 @AUTOMATED @POS
  Scenario: Verify Voiding Items from a Basket that contains Quantity Priced Products
    Given user signs on as "Sales Assistant"
    And user enters "${Product 25}" into "Input Box" field
    And user presses "ENT" icon button
    And "Total Label" label displays the text "£20.00"
    And user enters "${Product 25}" into "Input Box" field
    And user presses "ENT" icon button
    And "Total Label" label displays the text "£38.00"
    And user waits "1" seconds
    And user enters "${Product 25}" into "Input Box" field
    And user presses "ENT" icon button
    And user enters "${Product 25}" into "Input Box" field
    And user presses "ENT" icon button
    And user enters "${Product 25}" into "Input Box" field
    And user presses "ENT" icon button
    And user waits "1" seconds
    And "Total Label" label displays the text "£70.00"
    And user enters "${Product 25}" into "Input Box" field
    And user presses "ENT" icon button
    And "Total Label" label displays the text "£88.00"
    And user presses "Voids" button
    When user presses "Item Void" button and "Select Basket Item" page shown
    Then user presses "OK" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "Total Label" label displays the text "£70.00"
    And user presses "Voids" button
    When user presses "Item Void" button and "Select Basket Item" page shown
    Then user presses "OK" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Voids" button
    When user presses "Item Void" button and "Select Basket Item" page shown
    Then user presses "OK" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Voids" button
    When user presses "Item Void" button and "Select Basket Item" page shown
    Then user presses "OK" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "Total Label" label displays the text "£38.00"
    And user presses "Voids" button
    When user presses "Item Void" button and "Select Basket Item" page shown
    Then user presses "OK" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "Total Label" label displays the text "£20.00"
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown