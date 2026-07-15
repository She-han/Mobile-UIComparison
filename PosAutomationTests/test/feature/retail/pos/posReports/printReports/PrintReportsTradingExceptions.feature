Feature: Print Trading Exceptions Report

  @PT-1260 @PreSales @Print_Single_Date_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1 
  Scenario: Print Trading Exceptions Report for a given date
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Single Date" button and "Select Single Date Form" page shown
    When user enters "#{today-2}" into "Report Date Field" field
    And user presses "OK" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | TRADING EXCEPTIONS REPORT    |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{today-2}             |
      | item | To:,#{today-2}               |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1261 @PreSales @Print_Date_Range_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1 
  Scenario: Print Trading Exceptions Report for range of dates
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Date Range" button and "Select Date Range Form" page shown
    And user enters "#{today-3}" into "Report Date Range Start Date" field
    And user enters "#{today-5}" into "Report Date Range End Date" field
    And user presses "OK" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | TRADING EXCEPTIONS REPORT    |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{today-5}             |
      | item | To:,#{today-3}               |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown      
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1262 @PreSales @Print_Today_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1 
  Scenario: Print Trading Exceptions Report for today
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Today" button
    And receipt display with following details
      | text | TRADING EXCEPTIONS REPORT    |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{today}               |
      | item | To:,#{today}                 |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1263 @PreSales @Print_Yesterday_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1 
  Scenario: Print Trading Exceptions Report for yesterday
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Yesterday" button
    And receipt display with following details
      | text | TRADING EXCEPTIONS REPORT    |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{today-1}             |
      | item | To:,#{today-1}               |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1264 @PreSales @Print_This_Week_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1 
  Scenario: Print Trading Exceptions Report for this week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "This Week" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | TRADING EXCEPTIONS REPORT    |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{Sunday}              |
      | item | To:,#{Sunday+6}              |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1265 @PreSales @Print_Last_Week_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1 
  Scenario: Print Trading Exceptions Report for last week
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Last Week" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | TRADING EXCEPTIONS REPORT    |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | From:,#{Sunday-7}            |
      | item | To:,#{Sunday-1}              |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1266 @PreSales @Print_Month_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1 
  Scenario: Print Trading Exceptions Report for a given month
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Month" button and "Select Year For Month" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Month" page shown
    And user selects "${Month Report}" from "Selection List" list
    And user presses "OK" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | TRADING EXCEPTIONS REPORT    |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1267 @PreSales @Print_Period_Trading_Exceptions_Report @POS @AUTOMATED @Dune @Harrods @Support @Print_Trading_Exceptions_Report @Reports @POSValidatedTest @POSSet1 
  Scenario: Print Trading Exceptions Report for a given period
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Print Reports" button and "Print Reports Select" page shown
    And user presses "Trading Exceptions" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Period" button and "Select Year For Period" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Period" page shown
    And user selects "${Period Report}" from "Selection List" list
    And user presses "OK" button and "Select Date Type Form" page shown
    And receipt display with following details
      | text | TRADING EXCEPTIONS REPORT    |
      | item | Terminal:,${Terminal Number} |
      | item | Location:,${Location}        |
      | item | Report run at,#{today}       |
    And user presses "Back" button and "Print Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
