Feature: Cancelling an Order

  @PT-17396 @Fiscalisation @France @FiscalFranceOrder @No_Printer @AUTOMATED
  Scenario: Cancelling an Order
    Given user signs on as "France Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Cancel Order" button and "Enter Authorising User" page shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    When user presses "Sign On" button and "Enter Authorising Pin" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    When user presses "OK" button and "France Order Cancel" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown