Feature: Customer Collection Transactions

  @PT-9310 @CreateCollection @POS @CustomerCollectionTransaction
  Scenario: Create customer collection and do a transaction
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Collection Functions" button
    And user presses "Customer Collection" button
    And "Enter Collection Details" page is shown
    And user enters "#{today+1}" into "Collection Date" field
    And user presses "OK" button
    And "Capture Customer Name Contact" page is shown
    And user enters "Mark" into "Forename" field
    And user enters "Mason" into "Surname" field
    And user enters "+44257846321" into "Home Telephone" field
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9311 @TobeFixedAutTest @PostTransactionCollection @POS @CustomerCollectionTransaction
  Scenario: Create customer collection for post transaction
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Collection Functions" button
    And user presses "Post Tx Collection" button
    And "Post Transaction Collection" page is shown
    And user presses "Create Collection" button
    And "Enter Original Transaction Id" page is shown
    And user presses "Search by Customer" button
    And "Search Customer Transaction" page is shown
    And user enters "Mason" into "Customer Surname" field
    And user presses "OK" button
    And "Select Transaction Details" page is shown
    And user presses "Select" button
    And "Customer Collection Transactions" page is shown
    And user presses "Complete" button
    And "Enter Collection Details" page is shown
    And user enters "#{today+1}" into "Collection Date" field
    And user presses "OK" button
    When "Transaction Basket" page is shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9312 @PickupPostTransactionCollection @POS @CustomerCollectionTransaction @CurrentlyRunning
  Scenario: Pick up an already created post tranasction
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Collection Functions" button
    And user presses "Customer Collection" button
    And "Enter Collection Details" page is shown
    And user enters "#{today+1}" into "Collection Date" field
    And user presses "OK" button
    And "Capture Customer Name Contact" page is shown
    And user enters "May" into "Forename" field
    And user enters "Mereland" into "Surname" field
    And user enters "+447845122" into "Home Telephone" field
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Collection Functions" button
    And user presses "Post Tx Collection" button
    And "Post Transaction Collection" page is shown
    And user presses "Pickup Collection" button
    And "Scan Customer Collection Transaction" page is shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button
    And "Enter Package Count" page is shown
    And user enters "1" into "Package Count" field
    And user presses "OK" button
    And "Confirm Pickup Details" page is shown
    And "Transaction ID" field displays the text "${retrieveTransaction(1)}"
    And "No of Packages" field displays the text "1"
    And "Current Status" field displays the text "Await Collection"
    And user presses "OK" button
    And "Posting Successful" page is shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
