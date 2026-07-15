package com.enactor.pos.mobile.capabilities;

/**
 * Capability Types for iOS POS test automation
 * 
 * @author Preminda.Bandara
 */
public interface IOSMobileCapabilityType extends ThickMobileCapabilityType {

    String BUNDLE_ID = PREFIX+"bundleId";
    String CONNECT_HARDWARE_KEYBOARD = PREFIX+"connectHardwareKeyboard";
    String INCLUDE_SAFARI_IN_WEBVIEWS = PREFIX+"includeSafariInWebviews";
    String IGNORE_HIDDEN_API_POLICY_ERROR = PREFIX+"ignoreHiddenApiPolicyError";
    String MAX_TYPEING_FREQUENCY = PREFIX+"maxTypingFrequency";
    String SEND_KEY_STRATEGY = PREFIX+"sendKeyStrategy";
    String USE_NEW_WDA = PREFIX+"useNewWDA";
    String WDA_STARTUP_RETRIES = PREFIX+"wdaStartupRetries";
    String WDA_STARTUP_RETRY_INTERVAL = PREFIX+"wdaStartupRetryInterval";
    String WDA_LAUNCH_TIMEOUT = PREFIX+"wdaLaunchTimeout";
    String WDA_CONNECTION_TIMEOUT = PREFIX+"wdaConnectionTimeout";
    String WAIT_FOR_QUIESCENCE = PREFIX+"waitForQuiescence";
    String AUTO_DISMISS_ALERTS = PREFIX+"autoDismissAlerts";
    String AUTO_ACCEPT_ALERTS = PREFIX+"autoAcceptAlerts";
    String COMMAND_TIMEOUTS = PREFIX+"commandTimeouts";
}