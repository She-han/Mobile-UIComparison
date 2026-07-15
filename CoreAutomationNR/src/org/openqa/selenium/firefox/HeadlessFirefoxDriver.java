package org.openqa.selenium.firefox;

import java.io.File;

import com.enactor.coreUI.selenium.SeleniumConfig;

/**
 * Headless Firefox driver using Xvfb.
 * 
 * Xvfb needs to be started first, e.g. 'Xvfb :1 -screen 0 1024x768x24 &'
 *
 * @author David Hall
 */
public class HeadlessFirefoxDriver extends FirefoxDriver {
	
	/** The firefox binary. */
	private static String firefoxBinaryPath = System.getProperty(FirefoxDriver.SystemProperty.BROWSER_BINARY);
	private static FirefoxBinary bin = new FirefoxBinary(new File(firefoxBinaryPath));
	private static FirefoxOptions options = new FirefoxOptions();
	/**
	 * Set the display to use.
	 */
	static {
		// Defining the geckodriver system property via default argument
		File driverPath = new File(SeleniumConfig.getInstance().getRequired(SeleniumConfig.PROPERTY_DRIVER_EXEC_PATH));
		if (!driverPath.exists()) {
			throw new IllegalStateException("Could not find the firefox driver at defined path " + driverPath.getAbsolutePath() + "");
		}
		System.setProperty(GeckoDriverService.GECKO_DRIVER_EXE_PROPERTY, driverPath.getAbsolutePath());
		
		/* Disabling various types of cache used in the new instance */
		FirefoxProfile profile = new FirefoxProfile();
		profile.setPreference("browser.cache.disk.enable", false);
		profile.setPreference("browser.cache.memory.enable", false);
		profile.setPreference("browser.cache.offline.enable", false);
		
		options.setProfile(profile);
		options.setLogLevel(FirefoxDriverLogLevel.FATAL);
		options.setAcceptInsecureCerts(true);
		options.setBinary(bin);
		options.setHeadless(true);
	}

	/**
	 * Default constructor.
	 */
	public HeadlessFirefoxDriver() {
		super(options);
	}
}
