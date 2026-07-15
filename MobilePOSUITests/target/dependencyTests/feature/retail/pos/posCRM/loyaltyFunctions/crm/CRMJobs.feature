Feature: CRM - Jobs

  @PT-233 @PreSales @CRMJobsScreen @CRMJobs @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: CRM Jobs - Check that the CRM Jobs screen and buttons are displayed
    Given user signs on as "Sales Assistant"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Jobs" icon button
    Then "CRM Jobs" page is shown
    And "Active Jobs" is displayed in "CRM Jobs Panel" panel
    And "Finished Jobs" is displayed in "CRM Jobs Panel" panel
    When user presses "CRM Jobs Team Jobs Tab" icon button
    Then "CRM Jobs" page is shown
    And "Active Jobs" is displayed in "CRM Jobs Panel" panel
    And "Finished Jobs" is displayed in "CRM Jobs Panel" panel
    When user presses "CRM Jobs New Job Button" icon button
    Then "CRM Jobs List Business Processes" page is shown
    When user presses "Back button" icon button
    Then "CRM Jobs" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1367 @ToBeFixedAutTest @CRMJobsAffiliationRequest @CRMJobs @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: CRM Jobs - Check that user can submit an Affiliation Request job
    Given user signs on as "Sales Assistant"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Jobs" icon button
    Then "CRM Jobs" page is shown
    When user presses "CRM Jobs New Job Button" icon button
    Then "CRM Jobs List Business Processes" page is shown
    When user presses "CRM Jobs Affiliation Request Start Button" icon button
    Then "CRM Jobs Initiate Affiliation Request" page is shown
    And "Process Name" is displayed in "CRM Jobs Affiliation Request Panel" panel
    And "Affiliation Request" is displayed in "CRM Jobs Affiliation Request Panel" panel
    And "Process Type" is displayed in "CRM Jobs Affiliation Request Panel" panel
    And "Affiliation Request Business Process Type" is displayed in "CRM Jobs Affiliation Request Panel" panel
    And "Process Details" is displayed in "CRM Jobs Affiliation Request Panel" panel
    When user presses "CRM Jobs Affiliation Request Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Jobs Initiate Affiliation Request" page is shown
    And "Name" is displayed in "CRM Jobs Affiliation Request Client Information Panel" panel
    And "${Customer 1 Formatted Name}" is displayed in "CRM Jobs Affiliation Request Client Information Panel" panel
    And "Notes" is displayed in "CRM Jobs Affiliation Request Client Information Panel" panel
    When user presses "CRM Jobs Affiliation Request View Client Button" icon button
    Then "CRM Client Details" page is shown
    And "${Customer 1 Full Name}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    And "${Customer 1 Sex}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    And "${Customer 1 DOB}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    And "${Customer 1 Phone No}" is displayed in "CRM Customer Client Details Page Contact Details Section" panel
    And "${Customer 1 Email}" is displayed in "CRM Customer Client Details Page Contact Details Section" panel
    And "${Customer 1 Loyalty No}" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    And "Account Status" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    And "Redemp. Balance" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    And "As at COB" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    And "Next Appt" is displayed in "CRM Customer Client Details Page Appointments Section" panel
    And "Last Transaction" is displayed in "CRM Customer Client Details Page Appointments Section" panel
    And "Last Contact" is displayed in "CRM Customer Client Details Page Appointments Section" panel
    When user presses "Back Button" icon button
    Then "CRM Jobs Initiate Affiliation Request" page is shown
    When user enters "Request Affiliation Notes" into "CRM Jobs Affiliation Request Notes Input" field
    And user presses "CRM Jobs Request Affiliation Button" icon button
    Then "CRM Jobs Affiliation Request Confirm Popup" page is shown
    When user presses "OK" button
    Then "CRM Jobs List Business Processes" page is shown
    When user presses "Back Button" icon button
    Then "CRM Jobs" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
