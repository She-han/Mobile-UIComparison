Feature: Digital Payment Tender

  @PT-7342 @Automated @DigitalPaymentServicesAutomation @KlarnaQRCode
  Scenario: Verify Klarna POS Payments with QR Token
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Digital Payment" button
    And user presses "Pay with Klarna QR" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Enter Digital Payment QR Code" page shown
    When user enters "${Digital Payment QR Code}" into "Input Box" field
    And user presses "OK" button
    Then "Confirm Continue Payment" page is shown
    And user presses "${Product 1 Price}" button and "Send Digital Payment Request" page shown
    And user waits "10" seconds
    And "Get Payment Completion" page is shown

  @PT-7343 @Automated @DigitalPaymentServicesAutomation @PaymentServicesRegression @KlarnaPaymentLink
  Scenario: Verify Klarna POS Payments with Payment Link
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Digital Payment" button
    And user presses "Klarna Pay By Link" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Contact Preference" page shown
    When user presses "Digital Payment Contact Preference Email Button" icon button
    When user selects "${Digital Payment Country Code}" from "Digital Payment Country Code" combobox
    When user enters "${Digital Payment Subscriber}" into "Digital Payment Subscriber" field
    When user enters "${Digital Payment Email Address}" into "Digital Payment Email Address" field
    And user presses "OK" button
    Then "Confirm Continue Payment" page is shown
    And user presses "OK" button and "Send Digital Payment Request" page shown
    And user waits "10" seconds
    And "Get Payment Completion" page is shown

  @PT-7344 @Automated @DigitalPaymentServicesAutomation @PaymentServicesRegression @KlarnaSMS
  Scenario: Verify Klarna POS Payments with SMS
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Digital Payment" button
    And user presses "Klarna Pay By Link" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Contact Preference" page shown
    When user presses "Digital Payment Contact Preference SMS Button" icon button
    When user selects "${Digital Payment Country Code}" from "Digital Payment Country Code" combobox
    When user enters "${Digital Payment Subscriber}" into "Digital Payment Subscriber" field
    When user enters "${Digital Payment Email Address}" into "Digital Payment Email Address" field
    And user presses "OK" button
    Then "Confirm Continue Payment" page is shown
    And user presses "OK" button and "Send Digital Payment Request" page shown
    And user waits "10" seconds
    And "Get Payment Completion" page is shown

  @PT-7486 @Automated @DigitalPaymentServicesAutomation @PaymentServicesRegression @EPBLEmail
  Scenario: Verify Pay By Link POS Payments with Payment Link
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Digital Payment" button
    And user presses "Enactor Pay By Link" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Contact Preference" page shown
    When user presses "Digital Payment Contact Preference Email Button" icon button
    When user selects "${Digital Payment Country Code}" from "Digital Payment Country Code" combobox
    When user enters "${Digital Payment Subscriber}" into "Digital Payment Subscriber" field
    When user enters "${Digital Payment Email Address}" into "Digital Payment Email Address" field
    And user presses "OK" button
    Then "Confirm Continue Payment" page is shown
    And user presses "OK" button and "Send Digital Payment Request" page shown
    And user waits "10" seconds
    And "Get Payment Completion" page is shown

  @PT-7327 @Automated @DigitalPaymentServicesAutomation @PaymentServicesRegression @EPBLSMS
  Scenario: Verify Pay By Link POS Payments with SMS
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Digital Payment" button
    And user presses "Enactor Pay By Link" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Contact Preference" page shown
    When user presses "Digital Payment Contact Preference SMS Button" icon button
    When user selects "${Digital Payment Country Code}" from "Digital Payment Country Code" combobox
    When user enters "${Digital Payment Subscriber}" into "Digital Payment Subscriber" field
    When user enters "${Digital Payment Email Address}" into "Digital Payment Email Address" field
    And user presses "OK" button
    Then "Confirm Continue Payment" page is shown
    And user presses "OK" button and "Send Digital Payment Request" page shown
    And user waits "10" seconds
    And "Get Payment Completion" page is shown