Feature: Load the Employee Maintenance screen in the pos application

  @PT-12504 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify the UI when there are no records listed
    Given user signs on as "Manager 2"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen Employee Maintenance Button" icon button
    And "Select Employee Screen" page is shown
    And user presses "Filters" button
    Then "Enter Criteria Screen" page is shown
    When user selects "Enactor Store Austria" from "Working Location Drop Down" combobox
    And user presses "OK" button
    Then "Select Employee Screen" page is shown
    And button with label "View" is not displayed
    And button with label "Up" is not displayed
    Then user presses "Other Options" button
    And button with label "Edit" is not displayed
    And button with label "Copy" is not displayed
    And button with label "Remove" is not displayed
    And button with label "Down" is not displayed
    And user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-5603 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify whether the Select Employee Screen is loaded and the employees are listed
    Given user signs on as "Manager 2"
    When user presses "Management" button
    Then "Transaction Basket" page is shown
    When user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen Employee Maintenance Button" icon button
    Then "Select Employee Screen" page is shown
    When user selects "${Employee 1 Id}" from "List Box" list
    And user presses "View" button
    And user waits "2" seconds   
    Then "View Employee Screen" page is shown
    When user presses "Back" button
    Then "Select Employee Screen" page is shown
    When user presses "Back" button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5604 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify the ability to view Employee Details for a specific employee
    Given user signs on as "Manager 2"
    When user presses "Management" button
    Then "Transaction Basket" page is shown
    When user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen Employee Maintenance Button" icon button
    Then "Select Employee Screen" page is shown
    When user selects "${Employee 1 Id}" from "List Box" list
    And user presses "View" button
    Then "View Employee Screen" page is shown
    And "Employee Name View Field" field displays the text "${Employee 1 Name}"
    And "Employee Name DOB View Field" field displays the text "${Employee 1 Dob}"
    And "Employee Discount View Field" field displays the text "20%"
    When user presses "Back" button
    Then "Select Employee Screen" page is shown
    When user presses "Back" button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5605 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify that the Filter is working in Employee Maintenance
    Given user signs on as "Manager 2"
    When user presses "Management" button
    Then "Transaction Basket" page is shown
    When user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen Employee Maintenance Button" icon button
    Then "Select Employee Screen" page is shown
    And user presses "Filters" button
    Then "Enter Criteria Screen" page is shown
    When user selects "-" from "Working Location Drop Down" combobox
    And user enters "3" into "Employee ID Field" field
    And user presses "OK" button
    Then "Select Employee Screen" page is shown
    And "Wood" is displayed in "List Box" list
    And "Maria" is displayed in "List Box" list
    When user presses "Back" button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5606 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify the ability to Create an Employee from the Employee Maintenance
    Given user signs on as "Manager 2"
    When user presses "Management" button
    Then "Transaction Basket" page is shown
    When user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen Employee Maintenance Button" icon button
    Then "Select Employee Screen" page is shown
    And user presses "Other Options" button
    And user presses "New" button and "Enter Employee ID" page shown
    And user enters "${Employee 911 Id}" into "New Employee Id Field" field
    And user presses "OK" button and "Edit Employee Screen" page shown
    And user enters "Mr" into "Employee Name Title Field" field
    And user enters "White" into "Employee Name Surname Field" field
    And user enters "Tom" into "Employee Name Forename Field" field
    And user selects "Male" from "Employee Name Sex Field" combobox
    And user enters "10" into "Employee Discount Field" field
    And user selects "Enactor Store" from "Employee Normal Working Location Key Field" combobox
    When user presses "Save" button
    And user waits "5" seconds
    Then "Select Employee Screen" page is shown
    And "${Employee 911 Id}" is displayed in "List Box" list
    And user selects "${Employee 911 Id}" from "List Box" list
    And user presses "Other Options" button
    And user presses "View" button and "View Employee Screen" page shown
    And user waits "1" seconds
    And "Employee Name View Field" field displays the text "${Employee 911 Unedited Name}"
    And "Employee Discount View Field" field displays the text "10%"
    Then user presses "Back" button and "Select Employee Screen" page shown
    When user presses "Back" button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5607 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify that the user can Edit an existing Employee
    Given user signs on as "Manager 2"
    When user presses "Management" button
    Then "Transaction Basket" page is shown
    When user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen Employee Maintenance Button" icon button
    Then "Select Employee Screen" page is shown
    And user presses "Filters" button
    Then "Enter Criteria Screen" page is shown
    When user selects "-" from "Working Location Drop Down" combobox
    And user presses "OK" button
    Then "Select Employee Screen" page is shown
    When user selects "${Employee 911 Id}" from "List Box" list
    And user presses "Other Options" button
    And user presses "Edit" button
    Then "Edit Employee Screen" page is shown
    And user enters "Thompson" into "Employee Name Forename Field" field
    And user enters "31/08/91" into "Employee Name DOB Field" field
    And user enters "15" into "Employee Allowance Discount Field" field
    And user enters "20.00" into "Employee Discount Allowance Field" field
    And user presses "Save" button
    And user waits "2" seconds
    Then "Select Employee Screen" page is shown
    #View the edited employee
    And user selects "${Employee 911 Id}" from "List Box" list
    And user presses "Other Options" button
    And user presses "View" button and "View Employee Screen" page shown
    And user waits "1" seconds
    And "Employee Name View Field" field displays the text "${Employee 911 edited Name}"
    And "Employee Name DOB View Field" field displays the text "31/08/91"
    And "Employee Allowance Discount View Field" field displays the text "15%"
    And "Employee Discount Allowance View Field" field displays the text "£20.00"
    Then user presses "Back" button and "Select Employee Screen" page shown
    When user presses "Back" button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5608 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify that a new Employee can be created using Copy option
    Given user signs on as "Manager 2"
    When user presses "Management" button
    Then "Transaction Basket" page is shown
    When user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen Employee Maintenance Button" icon button
    Then "Select Employee Screen" page is shown
    When user selects "${Employee 911 Id}" from "List Box" list
    And user presses "Other Options" button
    And user presses "Copy" button
    Then "Enter Employee ID" page is shown
    And user enters "${Employee 987 Id}" into "New Employee Id Field" field
    And user presses "OK" button
    Then "Edit Employee Screen" page is shown
    And "Employee Name Surname Field" field displays the text "White"
    And user enters "Mrs" into "Employee Name Title Field" field
    And user enters "F" into "Employee Initials Field" field
    And user enters "Sheryll" into "Employee Name Forename Field" field
    And user enters "Jones" into "Employee Name Surname Field" field
    And user selects "Female" from "Employee Name Sex Field" combobox
    And user enters "07/11/93" into "Employee Name DOB Field" field
    When user presses "Save" button
    Then "Select Employee Screen" page is shown
    And "${Employee 987 Id}" is displayed in "List Box" list
    #View the copied employee
    And user selects "${Employee 987 Id}" from "List Box" list
    And user presses "Other Options" button
    And user presses "View" button and "View Employee Screen" page shown
    And user waits "1" seconds
    And "Employee Name View Field" field displays the text "${Employee 987 Name}"
    And "Employee Name DOB View Field" field displays the text "07/11/93"
    Then user presses "Back" button and "Select Employee Screen" page shown
    When user presses "Back" button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-13504 @POS @AUTOMATED @POSEmployeeMaintenance
  Scenario Outline: POS - Employee Maintenance - Delete an Employee
    Given user signs on as "Manager 2"
    When user presses "Management" button
    Then "Transaction Basket" page is shown
    When user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen Employee Maintenance Button" icon button
    Then "Select Employee Screen" page is shown
    And "<Employee ID>" is displayed in "List Box" list
    And user selects "<Employee ID>" from "List Box" list
    And user presses "Other Options" button
    And user presses "Remove" button and "Employee Maintenance Remove Employee Confirm Screen" page shown
    And user presses "OK" button and "Select Employee Screen" page shown
    And user waits "1" seconds
    And "<Employee ID>" is not displayed in "List Box" list
    When user presses "Back" button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Employee ID        |
      | ${Employee 911 Id} |
      | ${Employee 987 Id} |


