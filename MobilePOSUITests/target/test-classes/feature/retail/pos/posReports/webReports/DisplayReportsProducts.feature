Feature: Display Product Web Reports

  @PT-7608 @ProductReports @POS @AUTOMATED @WebReports @BestWorstSellersByUnitsReport
  Scenario: Generate Best/Worst Sellers by Units Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    And user presses "Best / Worst Sellers" button
    When user presses "Best / Worst Sellers by Units" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Sellers Region}" from "Best Worst Sellers by Units Region" combobox
    And user selects "${Web Report Sellers Location}" from "Best Worst Sellers by Units Location" combobox
    And user selects "${Web Report Sellers Terminal}" from "Best Worst Sellers by Units Terminal" combobox
    And user selects "${Web Report Sellers Mm Group}" from "Best Worst Sellers by Units MM Group" combobox
    And user enters "${Web Report Sellers Top}" into "Best Worst Sellers by Units Top" field
    And user enters "${Web Report Sellers Bottom}" into "Best Worst Sellers by Units Bottom" field
    And user selects "Date Range" from "Best Worst Sellers by Units Date Range" combobox
    And user enters "#{today-2}" into "Best Worst Sellers by Units Date From" field
    And user enters "#{today}" into "Best Worst Sellers by Units Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title            | Best / Worst Selling SKUs By Units |
      | Region                  | ${Web Report Sellers Region}       |
      | Location                | ${Web Report Sellers Location}     |
      | Terminal                | ${Web Report Sellers Terminal}     |
      | MM Group                | ${Web Report Sellers Mm Group}     |
      | Number of best sellers  | ${Web Report Sellers Top}          |
      | Number of worst sellers | ${Web Report Sellers Bottom}       |
      | Date From               | #{today-2}                         |
      | Date To                 | #{today}                           |
      | Generated on            | #{today}                           |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7609 @ProductReports @POS @AUTOMATED @WebReports @BestWorstSellersByValueReport 
  Scenario: Generate Best/Worst Sellers by Value Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    And user presses "Best / Worst Sellers" button
    When user presses "Best / Worst Sellers by Value" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Sellers Region}" from "Best Worst Sellers by Units Region" combobox
    And user selects "${Web Report Sellers Location}" from "Best Worst Sellers by Units Location" combobox
    And user selects "${Web Report Sellers Terminal}" from "Best Worst Sellers by Units Terminal" combobox
    And user selects "${Web Report Sellers Mm Group}" from "Best Worst Sellers by Units MM Group" combobox
    And user enters "${Web Report Sellers Top}" into "Best Worst Sellers by Units Top" field
    And user enters "${Web Report Sellers Bottom}" into "Best Worst Sellers by Units Bottom" field
    And user selects "Date Range" from "Best Worst Sellers by Value Date Range" combobox
    And user enters "#{today-2}" into "Best Worst Sellers by Value Date From" field
    And user enters "#{today}" into "Best Worst Sellers by Value Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title            | Best / Worst Selling SKUs By Value |
      | Region                  | ${Web Report Sellers Region}       |
      | Location                | ${Web Report Sellers Location}     |
      | Terminal                | ${Web Report Sellers Terminal}     |
      | MM Group                | ${Web Report Sellers Mm Group}     |
      | Number of best sellers  | ${Web Report Sellers Top}          |
      | Number of worst sellers | ${Web Report Sellers Bottom}       |
      | Date From               | #{today-2}                         |
      | Date To                 | #{today}                           |
      | Generated on            | #{today}                           |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7610 @ProductReports @POS @AUTOMATED @WebReports @BestWorstSellersStylesByUnitsReport 
  Scenario: Generate Best/Worst Sellers Styles by Units - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    And user presses "Best / Worst Sellers" button
    When user presses "Best / Worst Sellers Styles by Units" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Sellers Region}" from "Best Worst Sellers by Units Region" combobox
    And user selects "${Web Report Sellers Location}" from "Best Worst Sellers by Units Location" combobox
    And user selects "${Web Report Sellers Terminal}" from "Best Worst Sellers by Units Terminal" combobox
    And user selects "${Web Report Sellers Mm Group}" from "Best Worst Sellers by Units MM Group" combobox
    And user enters "${Web Report Sellers Top}" into "Best Worst Sellers by Units Top" field
    And user enters "${Web Report Sellers Bottom}" into "Best Worst Sellers by Units Bottom" field
    And user selects "Date Range" from "Best Worst Sellers Styles by Units Date Range" combobox
    And user enters "#{today-2}" into "Best Worst Sellers Styles by Units Date From" field
    And user enters "#{today}" into "Best Worst Sellers Styles by Units Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title            | Best / Worst Selling Styles By Units |
      | Region                  | ${Web Report Sellers Region}         |
      | Location                | ${Web Report Sellers Location}       |
      | Terminal                | ${Web Report Sellers Terminal}       |
      | MM Group                | ${Web Report Sellers Mm Group}       |
      | Number of best sellers  | ${Web Report Sellers Top}            |
      | Number of worst sellers | ${Web Report Sellers Bottom}         |
      | Date From               | #{today-2}                           |
      | Date To                 | #{today}                             |
      | Generated on            | #{today}                             |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7611 @ProductReports @POS @AUTOMATED @WebReports @BestWorstSellingStylesByValueReport
  Scenario: Generate Best/Worst Selling Styles by Value - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    And user presses "Best / Worst Sellers" button
    When user presses "Best / Worst Selling Styles by Value" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Sellers Region}" from "Best Worst Sellers by Units Region" combobox
    And user selects "${Web Report Sellers Location}" from "Best Worst Sellers by Units Location" combobox
    And user selects "${Web Report Sellers Terminal}" from "Best Worst Sellers by Units Terminal" combobox
    And user selects "${Web Report Sellers Mm Group}" from "Best Worst Sellers by Units MM Group" combobox
    And user enters "${Web Report Sellers Top}" into "Best Worst Sellers by Units Top" field
    And user enters "${Web Report Sellers Bottom}" into "Best Worst Sellers by Units Bottom" field
    And user selects "Date Range" from "Best Worst Selling Styles by Value Date Range" combobox
    And user enters "#{today-2}" into "Best Worst Selling Styles by Value Date From" field
    And user enters "#{today}" into "Best Worst Selling Styles by Value Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title            | Best / Worst Selling Styles By Value |
      | Region                  | ${Web Report Sellers Region}         |
      | Location                | ${Web Report Sellers Location}       |
      | Terminal                | ${Web Report Sellers Terminal}       |
      | MM Group                | ${Web Report Sellers Mm Group}       |
      | Number of best sellers  | ${Web Report Sellers Top}            |
      | Number of worst sellers | ${Web Report Sellers Bottom}         |
      | Date From               | #{today-2}                           |
      | Date To                 | #{today}                             |
      | Generated on            | #{today}                             |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7590 @ProductReports @POS @AUTOMATED @WebReports @MMGSummaryPieChart
  Scenario: Generate MMG Summary Pie Chart Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    When user presses "MMG Summary Pie Chart" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Mmg Summary Pie Location}" from "MMG Summary Pie Location" combobox
    And user selects "${Web Report Mmg Summary Pie Terminal}" from "MMG Summary Pie Terminal" combobox
    And user selects "${Web Report Mmg Summary Pie Mmg Level}" from "MMG Summary Pie MMG Level" combobox
    And user selects "Date Range" from "MMG Summary Pie Date Range" combobox
    And user enters "#{today-2}" into "MMG Summary Pie Date From" field
    And user enters "#{today}" into "MMG Summary Pie Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | MMG Summary Pie Chart                   |
      | Location     | ${Web Report Mmg Summary Pie Location}  |
      | Terminal     | ${Web Report Mmg Summary Pie Terminal}  |
      | Level        | ${Web Report Mmg Summary Pie Mmg Level} |
      | Date From    | #{today-2}                              |
      | Date To      | #{today}                                |
      | Generated on | #{today}                                |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-7595 @ProductReports @POS @AUTOMATED @WebReports @MMGSummary
  Scenario: Generate MMG Summary Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    When user presses "MMG Summary" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Mmg Summary Location}" from "MMG Summary Location" combobox
    And user selects "${Web Report Mmg Summary Terminal}" from "MMG Summary Terminal" combobox
    And user selects "${Web Report Mmg Summary Mmg Level}" from "MMG Summary MMG Level" combobox
    And user selects "Date Range" from "MMG Summary Date Range" combobox
    And user enters "#{today-2}" into "MMG Summary Date From" field
    And user enters "#{today}" into "MMG Summary Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | MMG Summary                         |
      | Location     | ${Web Report Mmg Summary Location}  |
      | Terminal     | ${Web Report Mmg Summary Terminal}  |
      | Level        | ${Web Report Mmg Summary Mmg Level} |
      | Date From    | #{today-2}                          |
      | Date To      | #{today}                            |
      | Generated on | #{today}                            |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7598 @ProductReports @POS @AUTOMATED @WebReports @ProductSales 
  Scenario: Generate Product Sales Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    When user presses "Product Sales" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Product Sales Location}" from "Product Sales Location" combobox
    And user selects "${Web Report Product Sales Terminal}" from "Product Sales Terminal" combobox
    And user selects "${Web Report Product Sales Mm Group}" from "Product Sales MM Group" combobox
    And user selects "Date Range" from "Product Sales Date Range" combobox
    And user enters "#{today-2}" into "Product Sales Date From" field
    And user enters "#{today}" into "Product Sales Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Product Sales                        |
      | Location     | ${Web Report Product Sales Location} |
      | Terminal     | ${Web Report Product Sales Terminal} |
      | MM Group     | ${Web Report Product Sales Mm Group} |
      | Date From    | #{today-2}                           |
      | Date To      | #{today}                             |
      | Generated on | #{today}                             |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10630  @ProductReports @POS @AUTOMATED @WebReports @ProductSales @Spint40-Week3 @NotForRC1
  Scenario: Verify whether the pagination works for Web reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    When user presses "Product Sales" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Product Sales Location}" from "Product Sales Location" combobox
    And user selects "Date Range" from "Product Sales Date Range" combobox
    And user enters "#{today-5}" into "Product Sales Date From" field
    And user enters "#{today}" into "Product Sales Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Product Sales    |
    And user presses "Next Page" button   
    And user presses "Previous Page" button
    And user waits "2" seconds
    And Following report details display in Web Report
      | Report Title | Product Sales    |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10474 @ProductReports @POS @AUTOMATED @WebReports @ProductReturns @Spint40-Week3 @NotForRC1
  Scenario: Generate Product Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    When user presses "Returns" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Product Return Location}" from "Product Return Location" combobox
    And user selects "${Web Report Product Return Terminal}" from "Product Return Terminal" combobox
    And user selects "${Web Report Product Return Mm Group}" from "Product Return MM Group" combobox
    And user selects "Date Range" from "Product Return Date Range" combobox
    And user enters "#{today-2}" into "Product Return Date From" field
    And user enters "#{today}" into "Product Return Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Returns                               |
      | Location     | ${Web Report Product Return Location} |
      | Terminal     | ${Web Report Product Return Terminal} |
      | MM Group     | ${Web Report Product Return Mm Group} |
      | Date From    | #{today-2}                            |
      | Date To      | #{today}                              |
      | Generated on | #{today}                              |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown  
    
 @PT-7600 @ProductReports @POS @AUTOMATED @WebReports @Replenishment 
 Scenario: Generate Replenishment Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    And user presses "More Product Reports" button
    When user presses "Replenishment" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Replenishment Location}" from "Replenishment Location" combobox
    And user selects "${Web Report Replenishment Mm Group}" from "Replenishment MM Group" combobox
    And user selects "Date Range" from "Replenishment Date Range" combobox
    And user enters "#{today-2}" into "Replenishment Date From" field
    And user enters "#{today}" into "Replenishment Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Replenishment                        |
      | Location     | ${Web Report Replenishment Location} |
      | MM Group     | ${Web Report Replenishment Mm Group} |
      | Date From    | #{today-2}                           |
      | Date To      | #{today}                             |
      | Generated on | #{today}                             |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-7602 @PreSales @ProductReports @POS @AUTOMATED @WebReports @RollingReplenishment @NotForRC1
  Scenario: Generate Rolling Replenishment Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    And user presses "More Product Reports" button
    When user presses "Rolling Replenishment" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Rolling Replenishment Location}" from "Rolling Replenishment Location" combobox
    And user selects "${Web Report Rolling Replenishment Mm Group}" from "Replenishment MM Group" combobox
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Rolling Replenishment                        |
      | Location     | ${Web Report Rolling Replenishment Location} |
      | MM Group     | ${Web Report Rolling Replenishment Mm Group} |
      | Generated on | #{today}                                     |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-7603 @ProductReports @POS @AUTOMATED @WebReports @SalesTransactions 
  Scenario: Generate Sales Transactions Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    And user presses "More Product Reports" button
    When user presses "Sales Transactions" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Sales Transaction Region}" from "Sales Transactions Region" combobox
    And user selects "${Web Report Sales Transaction Location}" from "Sales Transactions Location" combobox
    And user selects "${Web Report Sales Transaction Terminal}" from "Sales Transactions Terminal" combobox
    And user selects "${Web Report Sales Transaction Mm Group}" from "Sales Transactions MM Group" combobox
    And user selects "${Web Report Sales Transaction User}" from "Sales Transactions User" combobox
    And user selects "${Web Report Sales Transaction Sales Person}" from "Sales Transactions Salesperson" combobox
    And user selects "${Web Report Sales Transaction Tender}" from "Sales Transactions Tender" combobox
    And user selects "${Web Report Sales Transaction Group By}" from "Sales Transactions Group By" combobox
    And user selects "Date Range" from "Sales Transactions Date Range" combobox
    And user enters "#{today-2}" into "Sales Transactions Date From" field
    And user enters "#{today}" into "Sales Transactions Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Sales Transactions                              |
      | Region       | ${Web Report Sales Transaction Region}          |
      | Location     | ${Web Report Sales Transaction Location}        |
      | Terminal     | ${Web Report Sales Transaction Terminal}        |
      | MM Group     | ${Web Report Sales Transaction Mm Group}        |
      | User         | ${Web Report Sales Tran User In Report}         |
      | Salesperson  | ${Web Report Sales Tran Sales Person In Report} |
      | Tender       | ${Web Report Sales Transaction Tender}          |
      | Group By     | ${Web Report Sales Transaction Group By}        |
      | Date From    | #{today-2}                                      |
      | Date To      | #{today}                                        |
      | Generated on | #{today}                                        |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-7604 @ProductReports @POS @AUTOMATED @WebReports @TradingSummary
  Scenario: Generate Trading Summary Report - Product Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    And user presses "More Product Reports" button
    When user presses "Trading Summary" button
    And "Web Report Criteria Form" page is shown
    And user selects "${Web Report Trading Summary Location}" from "Trading Summary Location" combobox
    And user selects "Date Range" from "Trading Summary Date Range" combobox
    And user enters "#{today-2}" into "Trading Summary Date From" field
    And user enters "#{today}" into "Trading Summary Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Trading Summary                        |
      | Location     | ${Web Report Trading Summary Location} |
      | Date From    | #{today-2}                             |
      | Date To      | #{today}                               |
      | Generated on | #{today}                               |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
