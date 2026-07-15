Feature: Regional Warranty slip

  @PT-1980 @DevelopmentInProgress 
  Scenario: Verify the warranty text is printed in the default locale of the region
    Given user signs on as "Sales Assistant"
    When user enters "00000" into "Input Box" field
    Then user presses "ENT" button
    And "transaction basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Select locale" page shown
    And user presses "Cancel" button and "transaction basket" page shown
    And receipt display with following details
      | Warranty Period in default locale | ${year},${months} |
      | Warranty Text  in default locale  | ${text}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1981 @DevelopmentInProgress
  Scenario: Verify the warranty text is translated based on the locale selection based on customer selection
    Given user signs on as "Sales Assistant"
    When user enters "00000" into "Input Box" field
    Then user presses "ENT" button
    And "transaction basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Select locale" page shown
    And "German" is displayed in "Selection List" list
    And user selects "German" from "Selection List" list
    And user presses "OK" button
    And receipt display with following details
      | Warranty Period in German locale | ${year},${months} |
      | Warranty Text  in German locale  | ${text}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1982 @DevelopmentInProgress
  Scenario: Verify the warranty period is printed on the sale receipt
    Given user signs on as "Sales Assistant"
    When user enters "00000" into "Input Box" field
    Then user presses "ENT" button
    And "transaction basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Select locale" page shown
    And user presses "Cancel" button and "transaction basket" page shown
    And receipt display with following details
      | Warranty Period | ${year},${months} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-1983 @DevelopmentInProgress @ManualVerification
  Scenario: Verify the warranty is printed as a separate receipt slip
    Given user signs on as "Sales Assistant"
    When user enters "00000" into "Input Box" field
    Then user presses "ENT" button
    And "transaction basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "transaction basket" page shown
    And receipt display with following details
      | Warranty Period | ${year},${months} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-1984 @DevelopmentInProgress
  Scenario: Verify the warranty is printed only once when the same product is sold
    Given user signs on as "Sales Assistant"
    When user enters "2" into "Input Box" field
    Then user presses "ENT" button
    When user enters "00000" into "Input Box" field
    Then user presses "ENT" button
    When user enters "2" into "Input Box" field
    Then user presses "ENT" button
    And "transaction basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "transaction basket" page shown
    And receipt display with following details
      | Warranty Period | ${year},${months} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-1985 @DevelopmentInProgress
  Scenario: Verify the warranty information text is printed on the sale receipts
    Given user signs on as "Sales Assistant"
    When user enters "2" into "Input Box" field
    Then user presses "ENT" button
    When user enters "00000" into "Input Box" field
    Then user presses "ENT" button
    When user enters "2" into "Input Box" field
    Then user presses "ENT" button
    And "transaction basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "transaction basket" page shown
    And receipt display with following details
      | Warranty text | ${text} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-1986 @DevelopmentInProgress
  Scenario: Verify the regional product warranty value on the receipt is printed as years and months
    Given user signs on as "Sales Assistant"
    When user enters "2" into "Input Box" field
    Then user presses "ENT" button
    When user enters "00000" into "Input Box" field
    Then user presses "ENT" button
    When user enters "2" into "Input Box" field
    Then user presses "ENT" button
    And "transaction basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "transaction basket" page shown
    And receipt display with following details
      | Warranty Period in default locale | ${year},${months} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
