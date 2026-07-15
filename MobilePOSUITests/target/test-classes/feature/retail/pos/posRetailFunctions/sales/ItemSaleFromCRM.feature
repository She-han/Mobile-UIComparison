Feature: Item Sale from CRM
  To test item sale after customer capture from CRM

  @PT-1156 @ItemSaleFromCRM @POS @AUTOMATED @CRM @POSValidatedTest @POSSet3 @NotForRC1
  Scenario: Capture customer from CRM and perform a sale transaction
    Given user signs on as "Manager 2"
    And user presses "CRM Button" icon button
    And "CRM Menu Screen" page is shown
    When user presses "Customers" icon button 
    Then "CRM Select Customers Screen" page is shown
    And user waits "CRM Customer Search Page Search Button" to display
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "5" seconds
    And "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Start Sale Button" icon button
    And "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | text | Customer: Mark Harrison                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-13488 @POS @AUTOMATED @CRM
  Scenario: Verify that user can access the CRM during a transaction
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "CRM Back" icon button
    Then "Transaction Basket" page is shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-17408 @POS @AUTOMATED @CRM @ToBeFixedAutTest
  Scenario: Verify that Loyalty Account ID doesn't persist in the basket when switching to a user without a loyalty account
    Given user signs on as "Manager 2"
    And user presses "CRM Button" icon button
    And "CRM Menu Screen" page is shown
    When user presses "Customers" icon button 
    And "CRM Select Customers Screen" page is shown
    And user waits "CRM Customer Search Page Search Button" to display
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And "CRM Client Details" page is shown
    And user presses "CRM Customer Client Details Page Start Sale Button" icon button
    And "Transaction Basket" page is shown
    And "${Customer 1 Full Name}" is displayed in "Receipt" list
    And "Loyalty Account: 1" is displayed in "Receipt" list
    # Switch to a user without loyalty account
    And user presses "CRM Button" icon button
    And "CRM Menu Screen" page is shown
    When user presses "Customers" icon button 
    And "CRM Select Customers Screen" page is shown    
    And user waits "CRM Customer Search Page Search Button" to display
    And user waits "2" seconds
    And user enters "${Customer 2 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 2 Name}"
    And user enters "${Customer 2 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 2 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And "CRM Client Details" page is shown
    And user presses "CRM Customer Client Details Page Start Sale Button" icon button
    And "Transaction Basket" page is shown
    # Verify that loyalty account id doesn't persists
    And "${Customer 2 Full Name}" is displayed in "Receipt" list
    And "Loyalty Account: 1" is not displayed in "Receipt" list
    And user presses "SignOff" button
    And "Enter User" page is shown