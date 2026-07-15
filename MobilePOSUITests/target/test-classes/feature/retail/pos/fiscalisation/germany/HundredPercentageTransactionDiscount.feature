Feature: 100% discount On A Transaction on German Fiscal POS

  @PT-2176 @Fiscalisation @Germany @AUTOMATED @ManualVerification
  Scenario: 100% discount On A Transaction And Verify the Fiscal Receipt on German Fiscal POS 
    Given user signs on as "Germany Fiscal Sales Assistant"
    And user enters "${Product Fiscal DE 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "100 % Transaction Discount" from "Selection List" list    
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Transaction Discount (100 % Transaction Discount 100%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    And receipt display with following details
      | text | Discount (100 % Transaction   Discount) |
      | item | ${Product Fiscal DE 1 Description},${Product Fiscal DE 1 Price} |    