package com.enactor.pos.mobile;

import org.openqa.selenium.remote.DesiredCapabilities;

import com.enactor.core.utilities.StringUtils;
import com.enactor.pos.mobile.utils.MobilePosTestUtils;

import io.appium.java_client.remote.MobileCapabilityType;

/**
 * MobileControllerUtils is a utility class that provides methods to add common mobile capabilities
 * to the DesiredCapabilities object used for mobile automation tests.
 * @author Preminda.Bandara
 */
public class MobileControllerUtils {

	/**
	 * Adds common mobile capabilities to the provided DesiredCapabilities object.
	 * This includes platform name, version, device name, device UUID (if available), and command
	 * timeout.
	 * 
	 * @param capabilities The DesiredCapabilities object to which the mobile-specific capabilities
	 *            are added.
	 */
	public static void addCapabilities(DesiredCapabilities capabilities) {
		// Set platform name, version, and device name
		capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME,
				MobilePosTestUtils.getMobilePlatformName());
		capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION,
				MobilePosTestUtils.getMobilePlatformVersion());
		capabilities.setCapability(MobileCapabilityType.DEVICE_NAME,
				MobilePosTestUtils.getMobileDeviceName());

		// If device UUID is available, set it as a capability
		if (StringUtils.notEmpty(MobilePosTestUtils.getMobileDeviceUUID())) {
			capabilities.setCapability(MobileCapabilityType.UDID,
					MobilePosTestUtils.getMobileDeviceUUID());
		}

		// Set the new command timeout
		capabilities.setCapability(MobileCapabilityType.NEW_COMMAND_TIMEOUT,
				MobilePosTestUtils.getMobileCommandTimeoutSeconds());
	}
}
