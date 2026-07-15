Feature: Discount Overlap Restrictions

  @PT-2574 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario Outline: Verify that Transaction Amount Discount with Overlap enabled, allows overlap with Amount Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "Trans. Disc. - Overlap Restriction Amount 2" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans. Disc. - Overlap Restriction Amount 2)" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 2" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 2),-£1.00 |
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 1),-£1.00 |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                            |
      | item      | Cash UK,-£15.60                                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                               |
      | "Trans. Disc. - Overlap Restriction Amount 1" |

  @PT-2618 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario Outline: Verify that Transaction Amount Discount with Overlap enabled, allows overlap with Percentage Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Overlap Restriction Amount 2}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Transaction Discount Overlap Restriction Amount 2}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 2" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                                                        |
      | telephone | Tel: ${Store Phone 1}                                                                                                        |
      | text      | Sale                                                                                                                         |
      | item      | ${Product 1 Description},${Product 1 Price}                                                                                  |
      #2.6 version - Original Discount Text verification step:
      #| item     | Disc (Trans. Disc. - Overlap   Restriction Amount 2),-£1.00     |
      #| item     | Disc (10% Trans. Disc. - Overlap   Restriction % 2),-£1.70      |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 2),${Amount Of Transaction Discount Overlap Restriction Amount 2 2618} |
      | item      | Discount (10% Trans. Disc. -   Overlap Restriction % 2), ${Amount Of 10% Transaction Discount Overlap Restriction % 2 2618}  |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                                                                         |
      | item      | Cash UK,${Tender After Allows Overlap With Percentage Transaction Discount 2618}                                                   |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                                              |
      | "${Reason 10% Transaction Discount Overlap Restriction % 2}" |

  @PT-2528 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario Outline: Verify that Transaction Amount Discount with Overlap enabled, allows overlap with Amount Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Overlap Restriction Amount 2}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Transaction Discount Overlap Restriction Amount 2}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      #2.6 version - Original Discount Text verification step:
      #| item     | Disc (Trans. Disc. - Overlap   Restriction Amount 2),-£1.00     |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 2),${Amount Of Transaction Discount Overlap Restriction Amount 2 2618} |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),${Amount Of Item Discount 2528}                 |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00                      |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                            |
      | item      | Cash UK,${Tender After Allows Overlap With Amount Item Discount 2528}                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "${Reason Item Discount Overlap Restriction Amount 1}" |

  @PT-2616 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario Outline: Verify that Transaction Amount Discount with Overlap enabled, allows overlap with Percentage Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Overlap Restriction Amount 2}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Transaction Discount Overlap Restriction Amount 2}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      #2.6 version - Original Discount Text verification step:
      #| item     | Disc (Trans. Disc. - Overlap   Restriction Amount 2),-£1.00     |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 2),${Amount Of Transaction Discount Overlap Restriction Amount 2 2616} |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),${Amount Of Item Discount 2616}                |
      #| item      | Item Discount (20% Item. Disc. - Ove,-£3.60                     |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                             |
      | item      | Cash UK,${Tender After Allows Overlap With Percentage Item Discounts 2616}                                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "{Reason 20% Item Discount Overlap Restriction % 1}" |

  @PT-2575 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario Outline: Verify that Transaction Amount Discount with Overlap enabled, disallows overlap with Amount Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Overlap Restriction Amount 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Transaction Discount Overlap Restriction Amount 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    Then user presses "OK" button and "Discount Not Allowed" page shown
    Then "Discount Not Allowed" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      #2.6 version - Original Discount Text verification step:
      #| item     | Disc (Trans. Disc. - Overlap   Restriction Amount 1),-£1.00     |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 1),${Amount Of Transaction Discount Overlap Restriction Amount 1 2575} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                            |
      | item      | Cash UK,${Tender After Disallows Overlap With Amount Transaction Discounts 2575}                                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                               |
      | "${Reason Transaction Discount Overlap Restriction Amount 3}" |

  @PT-2619 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario Outline: Verify that Transaction Amount Discount with Overlap enabled, disallows overlap with Percentage Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Overlap Restriction Amount 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Transaction Discount Overlap Restriction Amount 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    Then user presses "OK" button and "Discount Not Allowed" page shown
    Then "Discount Not Allowed" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      #2.6 version - Original Discount Text verification step:
      #| item     | Disc (Trans. Disc. - Overlap   Restriction Amount 1),-£1.00     |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 1),${Amount Of Transaction Discount Overlap Restriction Amount 1 2619} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                             |
      | item      | Cash UK,${Tender After Disallows Overlap With Percentage Transaction Discounts 2619}                                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                              |
      | "${Reason Transaction Discount Overlap Restriction Amount 3}" |

  @PT-2531 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario Outline: Verify that Transaction Amount Discount with Overlap enabled, disallows overlap with Amount Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Overlap Restriction Amount 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Transaction Discount Overlap Restriction Amount 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    Then user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Item Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      #2.6 version - Original Discount Text verification step:
      #| item     | Disc (Trans. Disc. - Overlap   Restriction Amount 1),-£1.00     |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 1),${Amount Of Transaction Discount Overlap Restriction Amount 1 2531} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                              |
      | item      | Cash UK,${Tender After Disallows Overlap With Amount Item Discounts 2531}                                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "${Reason Item Discount Overlap Restriction Amount 3}" |

  @PT-2617 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario Outline: Verify that Transaction Amount Discount with Overlap enabled, disallows overlap with Percentage Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Overlap Restriction Amount 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Transaction Discount Overlap Restriction Amount 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    Then user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Item Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      #2.6 version - Original Discount Text verification step:
      #| item     | Disc (Trans. Disc. - Overlap   Restriction Amount 1),-£1.00     |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 1),${Amount Of Transaction Discount Overlap Restriction Amount 1 2617} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                                |
      | item      | Cash UK,${Tender After Disallows Overlap With Percentage Item Discounts 2617}                                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "{Reason 10% Item Discount Overlap Restriction % 3}" |

  @PT-2371 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario Outline: Verify that Transaction Percentage Discount with Overlap enabled, allows overlap with Amount Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 20% Transaction Discount Overlap Restriction % 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Transaction Discount Overlap Restriction % 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 2" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£3.60  |
      #| item      | Disc (Trans. Disc. - Overlap   Restriction Amount 1),-£1.00 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),${Amount Of 20% Transaction Discount Overlap Restriction % 1 2371}  |
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 1),${Amount Of Transaction Discount Overlap Restriction Amount 1 2371} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                             |
      | item      | Cash UK,${Tender After Allows Overlap With Amount Transaction Discounts 2371}                                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                               |
      | "${Reason Transaction Discount Overlap Restriction Amount 1}" |

  @PT-2612 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Transaction Percentage Discount with Overlap enabled, allows overlap with Percentage Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 20% Transaction Discount Overlap Restriction % 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Transaction Discount Overlap Restriction % 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 2" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                    |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£3.60 |
      #| item      | Disc (10% Trans. Disc. - Overlap   Restriction % 2),-£1.44 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),${Amount Of 20% Transaction Discount Overlap Restriction % 1 2612} |
      | item      | Discount (10% Trans. Disc. -   Overlap Restriction % 2),${Amount Of 10% Transaction Discount Overlap Restriction % 1 2612} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                           |
      | item      | Cash UK,${Tender After Allows Overlap With Percentage Transaction Discounts 2612}                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                              |
      | "${Reason 10% Transaction Discount Overlap Restriction % 2}" |

  @PT-2568 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Transaction Percentage Discount with Overlap enabled, allows overlap with Amount Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 20% Transaction Discount Overlap Restriction % 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Transaction Discount Overlap Restriction % 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                    |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£3.40 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),${Amount Of 20% Transaction Discount Overlap Restriction % 1 2568}|
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),${Amount Of Item Discount 2568}                |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00                     |
      | item      | Cash UK,${Tender After Allows Overlap With Amount Item Discounts 2568}                                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "${Reason Item Discount Overlap Restriction Amount 1}" |

  @PT-2614 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Transaction Percentage Discount with Overlap enabled, allows overlap with Percentage Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 20% Transaction Discount Overlap Restriction % 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Transaction Discount Overlap Restriction % 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                    |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£2.88 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),${Amount Of 20% Transaction Discount Overlap Restriction % 1 2614} |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),${Amount Of Item Discount 2614}                 |
      #| item      | Item Discount (20% Item. Disc. - Ove,-£3.60                    |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                            |
      | item      | Cash UK,${Tender After Allows Overlap With Percentage Item Discounts 2614}                                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "${Reason 20% Item Discount Overlap Restriction % 1}" |

  @PT-2373 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Transaction Percentage Discount with Overlap enabled, disallows overlap with Amount Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 20% Transaction Discount Overlap Restriction % 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Transaction Discount Overlap Restriction % 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    Then user presses "OK" button and "Discount Not Allowed" page shown
    And "Discount Not Allowed" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                    |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£3.60 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),${Amount Of 20% Transaction Discount Overlap Restriction % 1 2373} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                             |
      | item      | Cash UK,${Tender After Disallows Overlap With Amount Transaction Discounts 2373}                                                |
    And following details are not displayed on the receipt
      | item | Trans. Disc. - Overlap Restriction Amount 3,${Amount Of Transaction Discount Overlap Restriction Amount 3 2373} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                               |
      | "${Reason Transaction Discount Overlap Restriction Amount 3}" |

  @PT-2613 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Transaction Percentage Discount with Overlap enabled, disallows overlap with Percentage Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 20% Transaction Discount Overlap Restriction % 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Transaction Discount Overlap Restriction % 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    Then user presses "OK" button and "Discount Not Allowed" page shown
    And "Discount Not Allowed" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                    |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£3.60 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),${Amount Of 20% Transaction Discount Overlap Restriction % 1 2613} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                          |
      | item      | Cash UK,${Tender After Disallows Overlap With Percentage Transaction Discounts 2613}                                                |
    And following details are not displayed on the receipt
      | item | 10% Trans. Disc. - Overlap Restriction % 3,${Amount Of 10% Transaction Discount Overlap Restriction % 3 2613} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                              |
      | "${Reason 10% Transaction Discount Overlap Restriction % 3}" |

  @PT-2569 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Transaction Percentage Discount with Overlap enabled, disallows overlap with Amount Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 20% Transaction Discount Overlap Restriction % 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Transaction Discount Overlap Restriction % 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    Then user presses "OK" button and "Item Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                    |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£3.60 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),${Amount Of 20% Transaction Discount Overlap Restriction % 1 2569} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                           |
      | item      | Cash UK,${Tender After Disallows Overlap With Amount Item Discounts 2569}                                                |
    And following details are not displayed on the receipt
      | item | Item Disc. - Overlap Restriction Amount 3,${Amount Of 10% Transaction Discount Overlap Restriction % 3 2569} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "${Reason Item Discount Overlap Restriction Amount 3}" |

  @PT-2615 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Transaction Percentage Discount with Overlap enabled, disallows overlap with Percentage Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 20% Transaction Discount Overlap Restriction % 1}" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Transaction Discount Overlap Restriction % 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    Then user presses "OK" button and "Item Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                    |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£3.60 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),${Amount Of 20% Transaction Discount Overlap Restriction % 1 2615} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                            |
      | item      | Cash UK,${Tender After Disallows Overlap With Percentage Item Discounts 2615}                                                |
    And following details are not displayed on the receipt
      | item | 10% Item. Disc. - Overlap Restriction % 3,{Amount of 10% Item Discount Overlap Restriction % 3 2615} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "${Reason 10% Item Discount Overlap Restriction % 3}" |

  @PT-2576 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Percentage Discount with Overlap enabled, allows overlap with Amount Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "${Reason 20% Item Discount Overlap Restriction % 1}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Item Discount Overlap Restriction % 1}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 2" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),${Amount Of Item Discount 2576}                |
      #| item      | Item Discount (20% Item. Disc. - Ove,-£3.60                     |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (Trans. Disc. - Overlap   Restriction Amount 1),-£1.00 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 1),${Amount Of Transaction Discount Overlap Restriction Amount 1 2576} |
      | item      | ${Product 1 Promotion},${Product 1 Promotion Amount}                            |
      | item      | Cash UK,${Tender After Allows Overlap With Amount Transaction Discounts 2576}                                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                               |
      | "${Reason Transaction Discount Overlap Restriction Amount 1}" |

  @PT-2620 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Percentage Discount with Overlap enabled, allows overlap with Percentage Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item. Disc. - Overlap Restriction % 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item. Disc. - Overlap Restriction % 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 2" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                    |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£3.60                |
      #| item      | Item Discount (20% Item. Disc. - Ove,-£3.60                    |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£2.88 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),-£2.88 |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                           |
      | item      | Cash UK,-£10.22                                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                              |
      | "20% Trans. Disc. - Overlap Restriction % 1" |

  @PT-2529 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Percentage Discount with Overlap enabled, allows overlap with Amount Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item. Disc. - Overlap Restriction % 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item. Disc. - Overlap Restriction % 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£3.60       |
      | item      | Item Discount (${Product 1 Description}),-£1.00       |
      #| item      | Item Discount (20% Item. Disc. - Ove,-£3.60           |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00            |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                  |
      | item      | Cash UK,-£12.48                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "Item Disc. - Overlap Restriction Amount 1" |

  @PT-2577 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Percentage Discount with Overlap enabled, disallows overlap with Amount Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item. Disc. - Overlap Restriction % 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item. Disc. - Overlap Restriction % 1 20%" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    Then user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£3.60       |
      #| item      | Item Discount (20% Item. Disc. - Ove,-£3.60           |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                  |
      | item      | Cash UK,-£13.68                                       |
    And following details are not displayed on the receipt
      | item | £12.00 Trans. Discount - Active Date,-£12.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                        |
      | "£12.00 Trans. Discount - Active Date" |

  @PT-2621 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Percentage Discount with Overlap enabled, disallows overlap with Percentage Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item. Disc. - Overlap Restriction % 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item. Disc. - Overlap Restriction % 1 20%" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    Then user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£3.60       |
      #| item      | Item Discount (20% Item. Disc. - Ove,-£3.60           |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                  |
      | item      | Cash UK,-£13.68                                       |
    And following details are not displayed on the receipt
      | item | 10% Trans. Disc. - Overlap Restriction % 3,-£1.14 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                              |
      | "10% Trans. Disc. - Overlap Restriction % 3" |

  @PT-2532 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Percentage Discount with Overlap enabled, disallows overlap with Amount Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item. Disc. - Overlap Restriction % 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item. Disc. - Overlap Restriction % 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    Then user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Item Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£3.60       |
      #| item      | Item Discount (20% Item. Disc. - Ove,-£3.60           |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                  |
      | item      | Cash UK,-£13.68                                       |
    And following details are not displayed on the receipt
      | item | Item Disc. - Overlap Restriction Amount 3,-£1.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "Item Disc. - Overlap Restriction Amount 3" |

  @PT-2578 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Amount Discount with Overlap enabled, allows overlap with Amount Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Disc. - Overlap Restriction Amount 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Item Disc. - Overlap Restriction Amount 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 2" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Sale                                                            |
      | item      | ${Product 1 Description},${Product 1 Price}                     |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£1.00                 |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00                      |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (Trans. Disc. - Overlap   Restriction Amount 1),-£1.00 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (Trans. Disc. - Overlap   Restriction Amount 1),-£1.00 |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                            |
      | item      | Cash UK,-£15.60                                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                               |
      | "Trans. Disc. - Overlap Restriction Amount 1" |

  @PT-2624 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Amount Discount with Overlap enabled, allows overlap with Percentage Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Disc. - Overlap Restriction Amount 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Item Disc. - Overlap Restriction Amount 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 2" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                    |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£1.00                |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00                     |
      #2.6 version - Original Discount Text verification step:
      #| item      | Disc (20% Trans. Disc. - Overlap   Restriction % 1),-£3.40 |
      #2.7 version - Updated Discount Text verification step:
      | item      | Discount (20% Trans. Disc. -   Overlap Restriction % 1),-£3.40 |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                           |
      | item      | Cash UK,-£12.72                                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                              |
      | "20% Trans. Disc. - Overlap Restriction % 1" |

  @PT-2530 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Amount Discount with Overlap enabled, allows overlap with Amount Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Disc. - Overlap Restriction Amount 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Item Disc. - Overlap Restriction Amount 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£1.00       |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00            |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                  |
      | item      | Cash UK,-£15.60                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "Item Disc. - Overlap Restriction Amount 2" |

  @PT-2622 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Amount Discount with Overlap enabled, allows overlap with Percentage Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Disc. - Overlap Restriction Amount 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Item Disc. - Overlap Restriction Amount 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then <Discount Reason> is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£1.00       |
      | item      | Item Discount (${Product 1 Description}),-£3.40       |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00            |
      #| item      | Item Discount (20% Item. Disc. - Ove,-£3.40           |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                  |
      | item      | Cash UK,-£12.72                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "20% Item. Disc. - Overlap Restriction % 1" |

  @PT-2533 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Amount Discount with Overlap enabled, disallows overlap with Percentage Item Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Disc. - Overlap Restriction Amount 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Item Disc. - Overlap Restriction Amount 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    Then user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Item Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£1.00       |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00            |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                  |
      | item      | Cash UK,-£16.80                                       |
    And following details are not displayed on the receipt
      | item | 10% Item. Disc. - Overlap Restriction % 3,-£1.80 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                             |
      | "10% Item. Disc. - Overlap Restriction % 3" |

  @PT-2579 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Amount Discount with Overlap enabled, disallows overlap with Amount Trasaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Disc. - Overlap Restriction Amount 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Item Disc. - Overlap Restriction Amount 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    Then user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£1.00       |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00            |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                  |
      | item      | Cash UK,-£16.80                                       |
    And following details are not displayed on the receipt
      | item | £10.00 Trans. Disc. - Disallow Promo,-£10.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                        |
      | "£10.00 Trans. Disc. - Disallow Promo" |

  @PT-2625 @DiscountOverlapRestrictions @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario Outline: Verify that Item Amount Discount with Overlap enabled, disallows overlap with Percentage Transaction Discounts
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Disc. - Overlap Restriction Amount 1" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Item Disc. - Overlap Restriction Amount 1" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    Then user selects <Discount Reason> from "Selection List" list
    And user presses "OK" button and "Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And <Discount Reason> is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 1 Description}),-£1.00       |
      #| item      | Item Discount (Item Disc. - Overlap,-£1.00            |
      | item      | £3 off of KAT VON D Eye Liner,-£3.00                  |
      | item      | Cash UK,-£16.80                                       |
    And following details are not displayed on the receipt
      | item | 10% Trans. Disc. - Overlap Restriction % 3,-£1.40 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    Examples: 
      | Discount Reason                              |
      | "10% Trans. Disc. - Overlap Restriction % 3" |
