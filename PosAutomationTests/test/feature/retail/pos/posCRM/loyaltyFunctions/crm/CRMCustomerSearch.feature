Feature: CRM - Customer Search

  @PT-8565 @PreSales @POS @AUTOMATED
  Scenario: CRM - Search customer by Email
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "wrongInput" into "CRM Customer Search Page Email Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM No Matching Records Popup" page is shown
    And user presses "OK" button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 3 Email}" into "CRM Customer Search Page Email Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And "${Customer 3 Full Name}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-8564 @PreSales @POS @AUTOMATED
  Scenario: CRM - Search customer by Postcode
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "T1H3C9" into "CRM Customer Search Page Postcode Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM No Matching Records Popup" page is shown
    And user presses "OK" button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 3 Address Postcode}" into "CRM Customer Search Page Postcode Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And "${Customer 3 Full Name}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-8563 @PreSales @POS @AUTOMATED
  Scenario: CRM - Search Customer by Address
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 3 Address}" into "CRM Customer Search Page Address Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And "${Customer 3 Full Name}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-8561 @PreSales @POS @AUTOMATED
  Scenario: CRM - Search Customer by Phone number
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "3219977239" into "CRM Customer Search Page Phone Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM No Matching Records Popup" page is shown
    And user presses "OK" button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 3 Phone No}" into "CRM Customer Search Page Phone Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And "${Customer 3 Full Name}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-208 @PreSales @SET2 @POS @CRM @Harrods @MVP @Support @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: CRM - Search Customer by Loyalty Card
    Given user signs on as "manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Loyalty No}" into "CRM Customer Search Page Loyalty No Text" field
    Then "CRM Customer Search Page Loyalty No Text" field displays the text "${Customer 1 Loyalty No}"
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And "${Customer 1 Full Name}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    And "${Customer 1 Loyalty No}" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-209 @PreSales @SET2 @POS @CRM @MVP @Mobile @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: CRM - Search Customer by Name
    Given user signs on as "manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    Then "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And "${Customer 1 Full Name}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
