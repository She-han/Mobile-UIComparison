Feature: PDC Until further Notice
  To ensure that once a PED is allocated with the "Until Further Notice" status, the POS does not prompt for additional confirmation on subsequent payments.

  @PT-18602
  Scenario: Verifying that the PDC Until Further Notice Functionality Does Not Prompt for PED Confirmation on Subsequent Payments
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" icon button
    Then "Sale" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Payment Service" button and "Enter Payment Service Tender Amount" page shown
    And user presses "OK" button and "Payment Service" page shown
    And user presses "Cancel" button
    And user waits "5" seconds
    And "Select Tender" page is shown
  