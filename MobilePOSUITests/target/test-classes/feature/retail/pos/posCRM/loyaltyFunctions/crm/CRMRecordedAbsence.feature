Feature: CRM Recorded Absence

  @PT-17433 @Regression @POSCRMRecordedAbsence @POS
  Scenario: CRM Record Absence - Verify that the Record Absence functionality works properly
    Given user signs on as "Manager 2"
    And user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Manager" icon button
    When "CRM Manager Overview" page is shown
    Then user presses "CRM Manager Overview Record Absence Tab" icon button
    And "CRM Manager Overview Record Absence" page is shown
    And user selects "Sales Assistant - UK, Tom" from "CRM Manager Overview Associate Dropdown" combobox
    And user waits "2" seconds
    And user selects "Annual Leave" from "CRM Manager Overview Reason Dropdown" combobox
    And user enters "20/12/2025" into "CRM Record Absence From Date" date field
    And user enters "31/12/2025" into "CRM Record Absence To Date" date field
    And user selects "Fernando, Michael" from "CRM Manager Overview Reassign To Dropdown" combobox
    When user presses "CRM Manager Overview Record Absence OK Button" icon button
    And user waits "2" seconds
    Then "CRM Manager Overview" page is shown
    And "CRM Manager Overview Record Absence Summary" field contains the text "20/12/25 to 31/12/25"
    When user presses "CRM Manager Overview Record Absence Amend/Cancel Absence Button" icon button
    And user waits "2" seconds
    Then "CRM Manager Overview Record Absence" page is shown
    And user presses "CRM Manager Overview Record Absence Cancel Button" icon button
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-15764 @Regression @POSCRMRecordedAbsence @POS
  Scenario: CRM Record Absence - Verify that Reason field drop down contains Annual Leave, Casual Leave and Sick records in the Record Absence tab
    Given user signs on as "Manager 2"
    And user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Manager" icon button
    When "CRM Manager Overview" page is shown
    Then user presses "CRM Manager Overview Record Absence Tab" icon button
    And "CRM Manager Overview Record Absence" page is shown
    And user selects "Annual Leave" from "CRM Manager Overview Reason Dropdown" combobox
    And "Annual Leave" is selected in "CRM Manager Overview Reason Dropdown" combobox
    And user selects "Casual Leave" from "CRM Manager Overview Reason Dropdown" combobox
    And "Casual Leave" is selected in "CRM Manager Overview Reason Dropdown" combobox
    And user selects "Sick" from "CRM Manager Overview Reason Dropdown" combobox
    And "Sick" is selected in "CRM Manager Overview Reason Dropdown" combobox
    And user presses "CRM Manager Overview Record Absence Cancel Button" icon button
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9944 @Regression @POSCRMRecordedAbsence @POS
  Scenario: CRM Record Absence - Verifying the cancel button in the Record absence button
    Given user signs on as "Manager 2"
    And user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Manager" icon button
    When "CRM Manager Overview" page is shown
    Then user presses "CRM Manager Overview Record Absence Tab" icon button
    And "CRM Manager Overview Record Absence" page is shown
    When user presses "CRM Manager Overview Record Absence Cancel Button" icon button
    Then "CRM Manager Overview" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
