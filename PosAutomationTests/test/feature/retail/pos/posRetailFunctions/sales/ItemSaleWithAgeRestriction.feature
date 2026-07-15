Feature: Item Sale with Age Restriction

  @PT-247 @ItemSaleWithAgeRestricted @POS @AUTOMATED @Dunelm @POSValidatedTest @POSSet4
  Scenario: Item Sale with Age Restricted Prompt
    Given user signs on as "Sales Assistant"
    When user enters "${Product 14}" into "Input Box" field
    And user presses "ENT" icon button
    And "Confirm Customer Age" page is shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Product 14 Description}" is displayed in "Receipt" list
    When user enters "${Product 15}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user enters "${Product 16}" into "Input Box" field
    When user presses "ENT" icon button
    And "Confirm Customer Age" page is shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    #Functional change - Item added to basket with strikethrough to show voided
    #Old Step:And "${Product 16 Description}" is not displayed in "Receipt" list
    And "${Product 16 Description}" is displayed in "Receipt" list
    And "Age Restricted" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 14 Description},${Product 14 Price}         |
      | item      | ${Product 15 Description},${Product 15 Price}         |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
