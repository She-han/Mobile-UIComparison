Feature: CRM - View Contact History

  @PT-216 @CRMContactHistory @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Check that the Contact History screen is displayed with relevant information
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Contact History Button" icon button
    Then "CRM Contact History" page is shown
    And "${Customer 1 Id}" is displayed in "CRM Customer Contact History Panel" panel
    ## TODO: Need to add support to verify the text from table record
    When user presses "CRM Customer Contact History My Contacts Only Checkbox" icon button
    And user waits "5" seconds
    When user presses "Back Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
   @PT-14139 @CRMContactHistory @POS @CRM @AUTOMATED
   Scenario: Check that Contact History details are displayed for customer without a Loyalty Scheme
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 2 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 2 Name}"
    And user enters "${Customer 2 Email}" into "CRM Customer Search Page Email Text" field
    When user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Call Client Button" icon button
    Then "CRM Call Client" page is shown
    And user enters "Test Call Subject" into "CRM Call Client Page Subject Input" field
    And user enters "Test Customer Response" into "CRM Call Client Page Customer Response Input" field
    And user presses "CRM Save Button" icon button
    When user presses "CRM Call Client Page Client Details Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Contact History Button" icon button
    Then "CRM Contact History" page is shown
    And "${Customer 2 Id}" is displayed in "CRM Customer Contact History Panel" panel
    And "CRM Customer Contact History Contact Subject Text" label displays the text "Test Call Subject"
    And "CRM Customer Contact History Contact Type Text" label displays the text "Appointment"
    #ContactDate is not checked here as it points to the current date
    And "CRM Customer Contact History Contact User Text" label displays the text "Tim Manager - UK"
    When user presses "Back Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Call Client" page is shown
    When user presses "CRM Complete panel" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
   @PT-17633 @CRMContactHistory @POS @CRM @AUTOMATED
   Scenario: Check that Contact History details are displayed for customer with a Loyalty Scheme
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    When user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Call Client Button" icon button
    Then "CRM Call Client" page is shown
    And user enters "Test Call Subject 2" into "CRM Call Client Page Subject Input" field
    And user enters "Test Customer Response 2" into "CRM Call Client Page Customer Response Input" field
    And user presses "CRM Save Button" icon button
    When user presses "CRM Call Client Page Client Details Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Contact History Button" icon button
    Then "CRM Contact History" page is shown
    And "${Customer 1 Id}" is displayed in "CRM Customer Contact History Panel" panel
    And "CRM Customer Contact History Contact Subject Text" label displays the text "Test Call Subject 2"
    And "CRM Customer Contact History Contact Type Text" label displays the text "Appointment"
    #ContactDate is not checked here as it points to the current date
    And "CRM Customer Contact History Contact User Text" label displays the text "Tim Manager - UK"
    When user presses "Back Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Call Client" page is shown
    When user presses "CRM Complete panel" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
