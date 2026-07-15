Feature: Payment Device Status
  To check whether the retry pin is prompted in the ped and the retry pin message is displayed in the pos, when the entered pin is incorrect.

  @PT-17306
  Scenario: Verifying retry pin message is displayed in the pos, when the entered pin is incorrect
    Given user signs on as "Sales Assistant"
    And user enters "${Product 0}" into "Input Box" field
    When user presses "ENT" icon button
    Then "Enter price" page is shown
    And user enters "£10.60" into "Input Box" field
    When user presses "OK" button and "Sale" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Payment Service" button and "Cheque_Tender_Amount" page shown
    And user presses "OK" button and "Payment Service" page shown
    And user waits "5" seconds
    And "Payment Service" page is shown
    And user waits "10" seconds
    And "Payment Service" page is shown
    And user waits "1" seconds
    And "Payment Service" page is shown
    And user presses "Cancel" button and "Payment Service Cancel" page shown
    And user waits "10" seconds
    And "Payment Service Receipt Print" page is shown
    And user waits "1" seconds
    And "Select Tender" page is shown
    And user waits "1" seconds
    And user presses "Back" button and "Sale" page shown
    And user presses "Voids" button and "Sale" page shown
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user presses "OK" button
    Then "Sale" page is shown
