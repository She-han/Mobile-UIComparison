Feature: Estate Manager Functions in POS

  @PT-537 @POS @AUTOMATED @Dune @Regression
  Scenario: Load Estate Manager
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Estate Manager" icon button
    # waits for Estate Manager screen to load
    And user waits "30" seconds
    Then "Show Browser" page is shown
    And user waits "Estate Manager Browser Panel" to display
    And user presses "Keyboard" icon button
    And "Browser Keyboard Hidden" page is shown    
    And user presses "Show Basket" icon button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown