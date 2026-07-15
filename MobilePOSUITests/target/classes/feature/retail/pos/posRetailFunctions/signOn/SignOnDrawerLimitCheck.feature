Feature: Cash Drawer Limit Check

  @PT-816 @Dune @AUTOMATED
  Scenario: Verify Cash Drawer Limit message shows at Sign On
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "2000" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "90" seconds
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #Signin after exceeding drawer limit
    And user waits "90" seconds
    Given "Enter User" page is shown
    And user enters "${SALES_ASSISTANT_USERNAME}" into "User Name Text" field
    When user enters "${SALES_ASSISTANT_PASSWORD}" into "Password Text" field
    And user presses "ENT" button
    And "Drawer Limit Exceeded Screen" page is shown
    Then user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
