Feature: Display Trading Exceptions Report

  @PT-1212 @Display_Single_Date_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Trading Exceptions Report for a given date
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Single Date" button and "Select Single Date Form" page shown
    When user enters "#{today-2}" into "Report Date Field" field
    And user presses "OK" button and "Report Select Exception Type" page shown
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TRADING EXCEPTIONS REPORT |
      | TERMINAL     | ${Terminal Number}        |
      | LOCATION     | ${Location}               |
      | PERIOD FROM  | #{today-2}                |
      | PERIOD TO    | #{today-2}                |
      | REPORT DATE  | #{today}                  |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10877 @Display_Single_Date_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Trading Exceptions Report for a current date
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Single Date" button and "Select Single Date Form" page shown
    And user presses "OK" button and "Report Select Exception Type" page shown
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TRADING EXCEPTIONS REPORT |
      | TERMINAL     | ${Terminal Number}        |
      | LOCATION     | ${Location}               |
      | PERIOD FROM  | #{today}                  |
      | PERIOD TO    | #{today}                  |
      | REPORT DATE  | #{today}                  |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1213 @Display_Date_Range_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Trading Exceptions Report for range of dates
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Date Range" button and "Select Date Range Form" page shown
    And user enters "#{today-3}" into "Report Date Range Start Date" field
    And user enters "#{today-5}" into "Report Date Range End Date" field
    And user presses "OK" button and "Report Select Exception Type" page shown
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TRADING EXCEPTIONS REPORT |
      | TERMINAL     | ${Terminal Number}        |
      | LOCATION     | ${Location}               |
      | PERIOD FROM  | #{today-3}                |
      | PERIOD TO    | #{today-5}                |
      | REPORT DATE  | #{today}                  |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1214 @Display_Today_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Trading Exceptions Report for today
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Today" button and "Report Select Exception Type" page shown
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TRADING EXCEPTIONS REPORT |
      | TERMINAL     | ${Terminal Number}        |
      | LOCATION     | ${Location}               |
      | PERIOD FROM  | #{today}                  |
      | PERIOD TO    | #{today}                  |
      | REPORT DATE  | #{today}                  |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1215 @Display_Yesterday_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Trading Exceptions Report for yesterday
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Yesterday" button and "Report Select Exception Type" page shown
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TRADING EXCEPTIONS REPORT |
      | TERMINAL     | ${Terminal Number}        |
      | LOCATION     | ${Location}               |
      | PERIOD FROM  | #{today-1}                |
      | PERIOD TO    | #{today-1}                |
      | REPORT DATE  | #{today}                  |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
  @PT-1216 @Display_This_Week_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Trading Exceptions Report for this week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "This Week" button and "Report Select Exception Type" page shown
    And user presses "OK" button and "Display Document" page shown
 
    Then Following report details display in Basket
      | REPORT TITLE | TRADING EXCEPTIONS REPORT |
      | TERMINAL     | ${Terminal Number}        |
      | LOCATION     | ${Location}               |
      | PERIOD FROM  | #{Sunday}                 |
      | PERIOD TO    | #{Sunday+6}               |
      | REPORT DATE  | #{today}                  |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1217 @Display_Last_Week_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Trading Exceptions Report for last week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Last Week" button and "Report Select Exception Type" page shown
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TRADING EXCEPTIONS REPORT |
      | TERMINAL     | ${Terminal Number}        |
      | LOCATION     | ${Location}               |
      | PERIOD FROM  | #{Sunday-7}               |
      | PERIOD TO    | #{Sunday-1}               |
      | REPORT DATE  | #{today}                  |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1218 @Display_Month_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Trading Exceptions Report for Month
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Month" button and "Select Year For Month" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Month" page shown
    And user selects "${Month Report}" from "Selection List" list
    And user presses "OK" button and "Report Select Exception Type" page shown
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TRADING EXCEPTIONS REPORT |
      | TERMINAL     | ${Terminal Number}        |
      | LOCATION     | ${Location}               |
      | REPORT DATE  | #{today}                  |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1219 @Display_Period_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Display_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Generate Trading Exceptions Report for Period
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Period" button and "Select Year For Period" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Period" page shown
    And user selects "${Period Report}" from "Selection List" list
    And user presses "OK" button and "Report Select Exception Type" page shown
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TRADING EXCEPTIONS REPORT |
      | TERMINAL     | ${Terminal Number}        |
      | LOCATION     | ${Location}               |
      | REPORT DATE  | #{today}                  |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
