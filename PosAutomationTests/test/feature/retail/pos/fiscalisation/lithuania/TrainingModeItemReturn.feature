Feature: Print Fiscal Return Receipt in Training Mode - Lithuania
    
  @PT-15078 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @TrainingMode @ReturnReceipt @ManualVerification
  Scenario: Lithuania - Verify training mode - return receipt is printing with the Training Mode label
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Lithuania Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Lithuania Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    And user waits "5" seconds
    Then "Transaction Basket" page is shown
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Lithuania Fiscal Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Lithuania Fiscal Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    And user waits "5" seconds
    Then "Transaction Basket" page is shown
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "More Search Options" button and "Enter Transaction Archive Search Data" page shown
    And user presses "OK" button and "Select Transaction Details" page shown
    And user presses "Select" button and "Display Return Basket Items" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button