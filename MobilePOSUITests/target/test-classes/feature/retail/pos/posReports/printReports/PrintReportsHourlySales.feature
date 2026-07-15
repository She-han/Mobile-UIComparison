Feature: Print Hourly Sales Report

  @PT-1244 @Print_Single_Date_Hourly_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Hourly_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Print Hourly Sales Report for a given date
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Single Date" button and "Select Single Date Form" page shown
    When user enters "#{today-2}" into "Report Date Field" field
    And user presses "OK" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | HOURLY SALES REPORT          |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{today-2}             |
      | item | To:,#{today-2}               |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1245 @Print_Date_Range_Hourly_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Hourly_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Print Hourly Sales Report for range of dates
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Date Range" button and "Select Date Range Form" page shown
    And user enters "#{today-3}" into "Report Date Range Start Date" field
    And user enters "#{today-5}" into "Report Date Range End Date" field
    And user presses "OK" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | HOURLY SALES REPORT          |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{today-5}             |
      | item | To:,#{today-3}               |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1246 @Print_Today_Hourly_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Hourly_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Print Hourly Sales Report for today
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Today" button
    And receipt display with following details
      | text | HOURLY SALES REPORT          |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{today}               |
      | item | To:,#{today}                 |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1247 @Print_Yesterday_Hourly_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Hourly_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Print Hourly Sales Report for yesterday
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Yesterday" button
    And receipt display with following details
      | text | HOURLY SALES REPORT          |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{today-1}             |
      | item | To:,#{today-1}               |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1248 @Print_This_Week_Hourly_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Hourly_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Print Hourly Sales Report for this week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "This Week" button
    And receipt display with following details
      | text | HOURLY SALES REPORT          |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{Sunday}              |
      | item | To:,#{Sunday+6}              |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1249 @Print_Last_Week_Hourly_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Hourly_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Print Hourly Sales Report for last week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Last Week" button
    And receipt display with following details
      | text | HOURLY SALES REPORT          |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{Sunday-7}            |
      | item | To:,#{Sunday-1}              |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1250 @Print_Month_Hourly_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Hourly_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Print Hourly Sales Report for a given month
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Month" button and "Select Year For Month" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Month" page shown
    And user selects "${Month Report}" from "Selection List" list
    And user presses "OK" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | HOURLY SALES REPORT          |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1251 @Print_Period_Hourly_Sales_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Hourly_Sales_Report @Reports @POSValidatedTest @POSSet1
  Scenario: Print Hourly Sales Report for a given period
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Period" button and "Select Year For Period" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Period" page shown
    And user selects "${Period Report}" from "Selection List" list
    And user presses "OK" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | HOURLY SALES REPORT          |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
