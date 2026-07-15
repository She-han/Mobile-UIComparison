Feature: Display Department Sales - Advanced Report

  @PT-1188 @Display_Single_Date_Department_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Department_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Department Sales - Advanced Report for a given date
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Advanced" button and "Select Date Type Form" page shown
    And user presses "Single Date" button and "Select Single Date Form" page shown
    When user enters "#{today-2}" into "Report Date Field" field
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | DEPARTMENT SALES REPORT |
      | TERMINAL     | ${Terminal Number}      |
      | LOCATION     | ${Location}             |
      | PERIOD FROM  | #{today-2}              |
      | PERIOD TO    | #{today-2}              |
      | REPORT DATE  | #{today}                |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10879 @Display_Single_Date_Department_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Department_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Department Sales - Advanced Report for a current date
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Advanced" button and "Select Date Type Form" page shown
    And user presses "Single Date" button and "Select Single Date Form" page shown
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | DEPARTMENT SALES REPORT |
      | TERMINAL     | ${Terminal Number}      |
      | LOCATION     | ${Location}             |
      | PERIOD FROM  | #{today}                |
      | PERIOD TO    | #{today}                |
      | REPORT DATE  | #{today}                |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1189 @Display_Date_Range_Department_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Department_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Department Sales - Advanced Report for range of dates
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Advanced" button and "Select Date Type Form" page shown
    And user presses "Date Range" button and "Select Date Range Form" page shown
    And user enters "#{today-3}" into "Report Date Range Start Date" field
    And user enters "#{today-5}" into "Report Date Range End Date" field
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | DEPARTMENT SALES REPORT |
      | TERMINAL     | ${Terminal Number}      |
      | LOCATION     | ${Location}             |
      | PERIOD FROM  | #{today-3}              |
      | PERIOD TO    | #{today-5}              |
      | REPORT DATE  | #{today}                |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1190 @Display_Today_Department_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Department_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Department Sales - Advanced Report for today
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Advanced" button and "Select Date Type Form" page shown
    And user presses "Today" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | DEPARTMENT SALES REPORT |
      | TERMINAL     | ${Terminal Number}      |
      | LOCATION     | ${Location}             |
      | PERIOD FROM  | #{today}                |
      | PERIOD TO    | #{today}                |
      | REPORT DATE  | #{today}                |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1191 @Display_Yesterday_Department_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Department_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Department Sales - Advanced Report for yesterday
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Advanced" button and "Select Date Type Form" page shown
    And user presses "Yesterday" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | DEPARTMENT SALES REPORT |
      | TERMINAL     | ${Terminal Number}      |
      | LOCATION     | ${Location}             |
      | PERIOD FROM  | #{today-1}              |
      | PERIOD TO    | #{today-1}              |
      | REPORT DATE  | #{today}                |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1192 @Display_This_Week_Department_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Department_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Department Sales - Advanced Report for this week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Advanced" button and "Select Date Type Form" page shown
    And user presses "This Week" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | DEPARTMENT SALES REPORT |
      | TERMINAL     | ${Terminal Number}      |
      | LOCATION     | ${Location}             |
      | PERIOD FROM  | #{Sunday}               |
      | PERIOD TO    | #{Sunday+6}             |
      | REPORT DATE  | #{today}                |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1193 @Display_Last_Week_Department_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Department_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Department Sales - Advanced Report for last week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Advanced" button and "Select Date Type Form" page shown
    And user presses "Last Week" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | DEPARTMENT SALES REPORT |
      | TERMINAL     | ${Terminal Number}      |
      | LOCATION     | ${Location}             |
      | PERIOD FROM  | #{Sunday-7}             |
      | PERIOD TO    | #{Sunday-1}             |
      | REPORT DATE  | #{today}                |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1194 @Display_Month_Department_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Department_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Department Sales - Advanced Report for Month
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Advanced" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Month" button and "Select Year For Month" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Month" page shown
    And user selects "${Month Report}" from "Selection List" list
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | DEPARTMENT SALES REPORT |
      | TERMINAL     | ${Terminal Number}      |
      | LOCATION     | ${Location}             |
      | REPORT DATE  | #{today}                |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1195 @Display_Period_Department_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Department_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Department Sales - Advanced Report for Period
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Advanced" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Period" button and "Select Year For Period" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Period" page shown
    And user selects "${Period Report}" from "Selection List" list
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | DEPARTMENT SALES REPORT |
      | TERMINAL     | ${Terminal Number}      |
      | LOCATION     | ${Location}             |
      | REPORT DATE  | #{today}                |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10875 @Display_Last_Week_Department_Sales_Simple_Report @POS @AUTOMATED @Display_Department_Sales_Simple_Report @Reports @Regression
  Scenario: Generate Department Sales - Simple Report for last week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Simple" button and "Select Date Type Form" page shown
    And user presses "Last Week" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | SALES REPORT BY DEPARTMENT |
      | REPORT DATE  | #{today}                   |
    And user presses "Print" button
    And receipt display with following details
      | text | SALES REPORT BY DEPARTMENT |
      | item | #{today}                   |
    Then "Display Document" page is shown
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-19970 @POS @AUTOMATED
  Scenario: Generate Department Sales - Simple Report for This week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Department Sales" button
    And user presses "Simple" button and "Select Date Type Form" page shown
    And user presses "This Week" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | SALES REPORT BY DEPARTMENT |
      | REPORT DATE  | #{today}                   |
    And user presses "Print" button
    And receipt display with following details
      | text | SALES REPORT BY DEPARTMENT |
      | item | #{today}                   |
    Then "Display Document" page is shown
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown