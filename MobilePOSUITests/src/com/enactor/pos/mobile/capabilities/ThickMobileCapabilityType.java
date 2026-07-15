package com.enactor.pos.mobile.capabilities;


import com.enactor.pos.mobile.utils.MobilePosTestUtils;

import io.appium.java_client.remote.MobileCapabilityType;


public interface ThickMobileCapabilityType extends MobileCapabilityType {
	String PREFIX = MobilePosTestUtils.getVendorPrefix();
	String NATIVE_WEB_TAP = PREFIX+"nativeWebTap";
	String AUTO_LAUNCH = PREFIX+"autoLaunch";

}
