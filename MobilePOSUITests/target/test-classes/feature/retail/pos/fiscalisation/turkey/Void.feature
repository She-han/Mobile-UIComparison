@TurkeyFIscalVoid @AUTOMATED @Turkey @Fiscalisation
Feature: Item and Transaction Void

  @PT-10616 @TurkeyFIscalItemVoid @AUTOMATED @Turkey @Fiscalisation @ManualVerification
  Scenario: Verify Void Item receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal TR 2}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal TR 3}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Item" button and "Scan Item Void" page shown
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10617 @TurkeyFIscalTransactionVoid @AUTOMATED @Turkey @Fiscalisation @ManualVerification
  Scenario: Verify Void Transaction receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal TR 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    And "Enter User" page is shown