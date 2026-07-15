Feature: Return With Receipt
 
  @PT-15918 @AUTOMATED @ReturnOneItemFromMultipleItemsReceipt @POS @ReceiptReturn @POSValidatedTest @POSSet4
  Scenario: Return only one item from multiple items receipt in training mode
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    When user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Display Transaction With Msg Config" page shown
    And user presses "Continue" button and "Extended Return Details" page shown
    And user selects "${Product 2 Description}" from "Selection List" list
    And user presses "Select" button
    Then "R ${Product 2 Description}" is displayed in "Selection List" list
    When user presses "Finish" button and "Select Reason" page shown
    And user selects "Not Wanted (10 Days)" from "Selection List" list
    And user presses "OK" button and "Capture Customer Name" page shown
    When user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "M" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    When user selects "Mark" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    When user presses "Confirm" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Customer: Mr Mark Harrison" is displayed in "Receipt" list
    And "Return ${Product 2 Description}" is displayed in "Receipt" list
    And "-${Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button
    And receipt display with following details
      | text | Refund                                         |
      | text | Customer: Mark Harrison                        |
      | item | R,${Product 2 Description},-${Product 2 Price} |
      | item | Refund Cash UK                                 |
    Then "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown