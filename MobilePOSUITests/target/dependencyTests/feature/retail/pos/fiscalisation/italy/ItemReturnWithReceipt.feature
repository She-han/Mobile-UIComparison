Feature: Complete Receipt return on Italy Fiscal POS and Validate the fiscal Receipt

  @PT-5746 @Fiscalisation @Italy @FiscalItalyItemReturn @AUTOMATED
  Scenario: Complete Receipt return on Italy Fiscal POS and Validate the fiscal Receipt
    Given user signs on as "Italy Fiscal Sales Assistant"
    And user enters "${Product Fiscal IT 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Fiscal IT 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | item | ${Product Fiscal IT 1 Description},${Product Fiscal IT 1 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    When user signs on as "Italy Fiscal Sales Assistant"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Select" button
    When user presses "Finish" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user selects "Cash IT" from "Selection List" list
    And user presses "OK" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product Fiscal IT 1 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product Fiscal IT 1 Description},-${Product Fiscal IT 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
