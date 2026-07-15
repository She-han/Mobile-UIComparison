Feature: Disable delete all function from delete stored transaction maintenance in POS

  @PT-2079 @DevelopmentInProgress
  Scenario: Verify delete all button is displayed in delete stored transaction screen in POS
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    Then user presses "Admin" button
    And user presses "Financial" button
    When user presses "Delete Stored Transaction" button and "Delete Stored Transaction" page shown
    Then user waits "Delete All" to display
    And user presses "Cancel" button
    And user waits "Daily Operations menus" to display
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2078 @DevelopmentInProgress
  Scenario: Verify delete all button is not displayed in delete stored transaction screen in POS
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    Then user presses "Admin" button
    And user presses "Financial" button
    When user presses "Delete Stored Transaction" button and "Delete Stored Transaction" page shown
    Then user confirms "Delete All" not display
    And user presses "Cancel" button
    And user waits "Daily Operations menus" to display
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2081 @DevelopmentInProgress
  Scenario: Verify delete store transaction in guided day end process
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    Then user presses "Admin" button
    And user presses "Daily operations" button
    And user presses "Guided Day End" button and "Delete Stored Transaction" page shown
    And user waits "Delete All" to display
    And user presses "Cancel" button
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2242 @DevelopmentInProgress
  Scenario: Verify user is able to delete stored transaction at line level
    Given user signs on as "Sales Assistant"
    When user presses "Management" button
    Then user presses "Admin" button
    And user presses "Daily operations" button
    And user presses "Delete Stored Transactions" button and "Delete Stored Transactions" page shown
    And user presses "Delete" button
    And user waits "Delete Confirmation Window" to display
    And user presses "Ok" button
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
