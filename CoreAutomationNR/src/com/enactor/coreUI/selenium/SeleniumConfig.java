package com.enactor.coreUI.selenium;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeDriverService;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.chrome.HeadlessParallelChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.firefox.GeckoDriverService;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.ie.InternetExplorerDriverService;
import org.openqa.selenium.opera.OperaDriver;
import org.openqa.selenium.opera.OperaDriverService;
import org.openqa.selenium.phantomjs.PhantomJSDriver;
import org.openqa.selenium.phantomjs.PhantomJSDriverService;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.safari.SafariDriver;

import com.enactor.core.automation.testEvent.SystemOutTestEventListener;
import com.enactor.core.utilities.Logger;

/**
 * Singleton that allows you to load configuration for Selenium tests.
 *
 * @author David Hall
 */
public final class SeleniumConfig {

	/** Public defaults. */
	public static final String DEFAULT_XVFB_SCREEN = ":1";

	/** Properties file name constant. */
	private static final String PROPERTIES_FILE_NAME = "enactorSelenium";
	private static final String LAUNCHER_PROPERTY_FILE_NAME = "launcher";

	private static final String PROPERTY_FILE_DELIMETER = ",";
	
	/** Properties constants. */
	public static final String PROPERTY_PAGE_URL = "page.url";
	public static final String PROPERTY_DRIVER_TYPE = "driver.type";	
	public static final String PROPERTY_DRIVER_TIMEOUT_IMPLICIT = "driver.timeout.implicit";
	public static final String PROPERTY_DRIVER_TIMEOUT_SCRIPT = "driver.timeout.script";
	public static final String PROPERTY_DRIVER_TIMEOUT_PAGELOAD = "driver.timeout.pageload";
	public static final String PROPERTY_DRIVER_EXEC_PATH = "driver.exec.path";
	public static final String PROPERTY_DRIVER_REMOTE_DEBUGGING_PORT = "driver.remote.debugging.port";
	public static final String PROPERTY_CLOSE_BROWSER_ON_ERROR = "close.browser.onerror";
	public static final String PROPERTY_SCREENSHOTS_DIR = "screenshots.directory";
	public static final String PROPERTY_DEBUG = "debug.enabled";
	public static final String PROPERTY_PAGE_TITLE_REQUIRED = "page.title.required";
	public static final String PROPERTY_SCREENSHOTS_WEB_DIR = "screenshots.web.directory";
	public static final String PROPERTY_FIREFOX_PROFILE_DIR = "firefox.profile.directory";
	public static final String PROPERTY_DRIVER_SKIP_NAVIGATION_ON_INIT = "driver.skip.navigation.onInit";
	public static final String PROPERTY_DRIVER_INSTANCES_COUNT = "driver.instance.count";
	public static final String PROPERTY_CHROME_IMAGE_DISABLED = "chrome.image.disabled";
	public static final String PROPERTY_AUT_CONFIG_FILE_NAMES = "autConfigPropertyFileNames";
	public static final String PROPERTY_AUT_CONFIG_FILE_NAME = "autConfigPropertyFileName";
	public static final String PROPERTY_LAUNCHER_PROPERTY_FILE_NAME = "launcher.properties";
	public static final String PROPERTY_SUREFIRE_TEST_PARAMETER = "surefire.test.class.path";
	public static final String PROPERTY_MIX_MODE= "run.mix.mode";
	public static final String PROPERTY_DRIVER_EXEC_PATH_EM = "driver.exec.path.em";

	/** Defaults constants. */
	private static final String DEFAULT_DRIVER_TYPE = FirefoxDriver.class.getName();
	private static final String DEFAULT_DRIVER_TIMEOUT_IMPLICIT = "1";
	private static final String DEFAULT_SCREENSHOTS_DIR = "./target";
	private static final String DEFAULT_SCREENSHOST_WEB_DIR = "..";
	private static final String DEFAULT_CLOSE_BROWSER_ON_ERROR = "true";
	private static final String DEFAULT_DEBUG = "false";
	private static final String DEFAULT_PAGE_TITLE_REQUIRED = "true";
	private static final String DEFAULT_CHROME_IMAGE_DISABLED = "false";
	
	private static Logger logger = Logger.getLogger(SeleniumConfig.class.getName());


	/** Instance. */
	private static SeleniumConfig instance = new SeleniumConfig();
	
	/** Resource bundle. */
    private final Map<String, String> configProperties = new HashMap<>();
	
    /** Automation Mode */
    private AutomationMode mode = null;
    
	/** Cached values. */
	private Long driverTimeoutImplicit = null;
	private Long driverTimeoutScript = null;
	private Long driverTimeoutPageLoad = null;
	private String screenshotsDir = null;
	private String screenshotsWebDir = null;
	private String pageUrl = null;
	private Boolean closeBrowserOnError = null;
	private Boolean debug = null;
	private Boolean pageTitleRequired = null;
	private Boolean skipNavigationOnInit = null;
	private Boolean imageDisabled = null;

	/**
	 * Returns the current instance of the SeleniumConfig.
	 *
	 * @return
	 */
	public static SeleniumConfig getInstance() {
	    return instance;
	}

	/**
	 * Default constructor.
	 */
	private SeleniumConfig() {
		
		loadLauncherProperties();
		
		String[] fileNames = StringUtils.split(getPropertiesFileNames(), PROPERTY_FILE_DELIMETER);
		logger.log(Logger.LOG_INFORMATION, String.format("Reading Selenium properties from : %s files", Arrays.toString(fileNames)));
		for (String fileName : fileNames) {
			ResourceBundle resourceBundle = ResourceBundle.getBundle(fileName);
			for (String key : resourceBundle.keySet()) {
				configProperties.put(key, resourceBundle.getString(key));
			}
		}
	}
	
	/**
	 * Returns the page URL.
	 *
	 * @return
	 */
	public String getPageUrl() {
		if (null == pageUrl) {
			pageUrl = get(PROPERTY_PAGE_URL);
		}
		return pageUrl;
	}
	
	/**
	 * Returns the screenshots directory.
	 *
	 * @return
	 */
	public String getScreenshotsDirectory() {
		if (null == screenshotsDir) {
			screenshotsDir = get(PROPERTY_SCREENSHOTS_DIR, DEFAULT_SCREENSHOTS_DIR);
		}
		return screenshotsDir;
	}
	
	/**
	 * Returns the screenshots web directory.
	 *
	 * @return
	 */
	public String getScreenshotsWebDirectory() {
		if (null == screenshotsWebDir) {
			screenshotsWebDir = get(PROPERTY_SCREENSHOTS_WEB_DIR, DEFAULT_SCREENSHOST_WEB_DIR);
		}
		return screenshotsWebDir;
	}
	
	/**
	 * Returns the driver implicit timeout.
	 *
	 * @return
	 */
	public Long getDriverTimeoutImplicit() {
		if (null == driverTimeoutImplicit) {
			driverTimeoutImplicit = getLong(PROPERTY_DRIVER_TIMEOUT_IMPLICIT, DEFAULT_DRIVER_TIMEOUT_IMPLICIT);
		}
		return driverTimeoutImplicit;
	}
	
	/**
	 * Returns the driver script timeout.
	 *
	 * @return
	 */
	public Long getDriverTimeoutScript() {
		if (null == driverTimeoutScript) {
			driverTimeoutScript = getLong(PROPERTY_DRIVER_TIMEOUT_SCRIPT);
		}
		return driverTimeoutScript;
	}
	
	/**
	 * Returns the driver page load timeout.
	 *
	 * @return
	 */
	public Long getDriverTimeoutPageLoad() {
		if (null == driverTimeoutPageLoad) {
			driverTimeoutPageLoad = getLong(PROPERTY_DRIVER_TIMEOUT_PAGELOAD);
		}
		return driverTimeoutPageLoad;
	}
	
	/**
	 * Returns whether or not to close the browser on encountering an error.
	 *
	 * @return
	 */
	public Boolean getCloseBrowserOnError() {
		if (null == closeBrowserOnError) {
			closeBrowserOnError = getBoolean(PROPERTY_CLOSE_BROWSER_ON_ERROR, DEFAULT_CLOSE_BROWSER_ON_ERROR);
		}
		return closeBrowserOnError;
	}
	
	/**
	 * Returns whether or not debug is enabled.
	 *
	 * @return
	 */
	public Boolean getDebug() {
		if (null == debug) {
			debug = getBoolean(PROPERTY_DEBUG, DEFAULT_DEBUG);
		}
		return debug;
	}
	
	/**
	 * Returns whether or not a page title is expected on a loaded test page.
	 *
	 * @return
	 */
	public Boolean getPageTitleRequired() {
		if (null == pageTitleRequired) {
			pageTitleRequired = getBoolean(PROPERTY_PAGE_TITLE_REQUIRED, DEFAULT_PAGE_TITLE_REQUIRED);
		}
		return pageTitleRequired;
	}
	
	/**
	 * Returns the configured no of WebDriver instances ( Browser instances )
	 */
	public int getNoOfDriverInstances() {
		return Integer.valueOf(get(PROPERTY_DRIVER_INSTANCES_COUNT, "1"));
	}
	
	/**
	 * Returns whether or not images are disabled.
	 *
	 * @return
	 */
	public Boolean getImagesDisabled() {
		if (null == imageDisabled) {
			imageDisabled = getBoolean(PROPERTY_CHROME_IMAGE_DISABLED, DEFAULT_CHROME_IMAGE_DISABLED);
		}
		return imageDisabled;
	}
	
	/**
	 * Returns the configured WebDriver to use.
	 *
	 * @return	The driver, or FirefoxDriver if provided value not found or couldn't be instantiated.
	 */
	public WebDriver getDriver() {
		String className = get(PROPERTY_DRIVER_TYPE, DEFAULT_DRIVER_TYPE);
		WebDriver driver = null;
	
		if (PhantomJSDriver.class.getName().equals(className)) {
			// If phantom JS driver selected, use helper method to construct it
			driver = getPhantomJSDriver();
		} else if (ChromeDriver.class.getName().equals(className)) {
			// If chrome driver selected, use helper method to construct it
			driver = getChromeDriver();
		} else if (InternetExplorerDriver.class.getName().equals(className)) {
			// If IE driver selected, use helper method to construct it
			driver = getIEDriver();
		} else if (SafariDriver.class.getName().equals(className)) {
			// If Safari driver selected, use helper method to construct it
			driver = getSafariDriver();
		} else if (OperaDriver.class.getName().equals(className)) {
			// If (Blink-based) Opera driver selected, use helper method to construct it
			driver = getOperaDriver();
		} else if (FirefoxDriver.class.getName().equals(className)) {
			// If Firefox driver selected, use helper method to construct it
			driver = getFirefoxDriver();
		} else if (HeadlessParallelChromeDriver.class.getName().equals(className)) {
			// If HeadlessParallelChromeDriver driver selected, use helper method to construct it
			try {
				driver = HeadlessParallelChromeDriver.getDriver();
			} catch (IOException e) {
				// In this case driver will be null
				throw new IllegalStateException("Error instantiating driver class '" + className + "'", e);
			}			
		}
		else {
			// Else try to instantiate a new class
			try {
				Class<?> clazz = Class.forName(className);
				driver = (WebDriver) clazz.newInstance();
			} catch (Exception e) {
				throw new IllegalStateException("Error instantiating driver class '" + className + "'", e);
			}
		}
		
		// Configure timeouts
		if (null != getDriverTimeoutImplicit()) {
			driver.manage().timeouts().implicitlyWait(getDriverTimeoutImplicit(), TimeUnit.SECONDS);
		}
		if (null != getDriverTimeoutScript()) {
			driver.manage().timeouts().setScriptTimeout(getDriverTimeoutScript(), TimeUnit.SECONDS);
		}
		if (null != getDriverTimeoutPageLoad()) {
			driver.manage().timeouts().pageLoadTimeout(getDriverTimeoutPageLoad(), TimeUnit.SECONDS);
		}
		
		return driver;
	}
	
	/**
	 * Gets an item from the Selenium config.
	 *
	 * @param key
	 * @return
	 */
	public String get(String key) {
		return get(key, "");
	}
	
	/**
	 * Gets a Long item from the Selenium config.
	 *
	 * @param key
	 * @return
	 */
	public Long getLong(String key) {
		return getLong(key, null);
	}
	
	/**
	 * Gets a Long item from the Selenium config.
	 *
	 * @param key
	 * @param defaultVal	 
	 * @return
	 */
	public Long getLong(String key, String defaultVal) {
		String strVal = get(key, defaultVal);
		if (null != strVal) {
			return Long.parseLong(strVal);
		} else {
			return null;
		}
	}
	
	/**
	 * Gets a Boolean item from the Selenium config.
	 *
	 * @param key
	 * @return
	 */
	public Boolean getBoolean(String key) {
		return getBoolean(key, null);
	}
	
	/**
	 * Gets a Boolean item from the Selenium config.
	 *
	 * @param key
	 * @param defaultVal	 
	 * @return
	 */
	public Boolean getBoolean(String key, String defaultVal) {
		String strVal = get(key, defaultVal);
		if (null != strVal) {
			return Boolean.parseBoolean(strVal);
		} else {
			return null;
		}
	}
	
	/**
	 * Gets an item from the Selenium config.
	 *
	 * @param key
	 * @param defaultVal
	 * @return
	 */
	public String get(String key, String defaultVal) {
		// First try and retrieve system property
		String value = System.getProperty(key);
	    try {
	    	if (StringUtils.isBlank(value)) {
	    		value = configProperties.get(key);
	    	}
	    } catch (MissingResourceException e) {
	    	// Ignore
	    }
	    if (StringUtils.isBlank(value)) {
	    	//System.out.println("Value of property '" + key + "' is '" + defaultVal + "' (default)");
	    	return defaultVal;
	    }
	    //System.out.println("Value of property '" + key + "' is '" + value + "'");
	    return value;
	}
	
	/**
	 * Gets a required item from the Selenium config. Throws an IllegalStateException if the
	 * item does not exist.
	 * 
	 * @param key
	 * @return
	 * @throws IllegalStateException	if the item does not exist.
	 */
	public String getRequired(String key) throws IllegalStateException {
		String value = get(key);
		if (StringUtils.isBlank(value)) {
			throw new IllegalStateException("Required property '" + key + "' not found");
		}
		return value;
	}
	
	/**
	 * Creates a new PhantomJSDriver
	 *
	 * @return
	 */
	private PhantomJSDriver getPhantomJSDriver() {
		DesiredCapabilities caps = new DesiredCapabilities();
		caps.setCapability(PhantomJSDriverService.PHANTOMJS_EXECUTABLE_PATH_PROPERTY, getRequired(PROPERTY_DRIVER_EXEC_PATH));                  
		return new PhantomJSDriver(caps);
	}
	
	/**
	 * Creates a new ChromeDriver
	 *
	 * @return
	 */
	private ChromeDriver getChromeDriver() {
		File driverPath;
		if (getMode() == AutomationMode.EM) {
			driverPath = new File(getRequired(PROPERTY_DRIVER_EXEC_PATH_EM));
		} else {
			driverPath = new File(getRequired(PROPERTY_DRIVER_EXEC_PATH));
		}
		if (!driverPath.exists()) {
			throw new IllegalStateException("Could not find the Chrome driver at defined path " + driverPath.getAbsolutePath() + "");
		}
		System.setProperty(ChromeDriverService.CHROME_DRIVER_EXE_PROPERTY, driverPath.getAbsolutePath());
		ChromeOptions options = new ChromeOptions();
		
		// Disable images in Chrome Driver
		if (getBoolean(PROPERTY_CHROME_IMAGE_DISABLED, DEFAULT_CHROME_IMAGE_DISABLED)) {
			options.addArguments("--blink-settings=imagesEnabled=false");
		}

		if (StringUtils.isNotEmpty(get(PROPERTY_DRIVER_REMOTE_DEBUGGING_PORT)) && !(getMode() == AutomationMode.EM)) {
			options.setExperimentalOption("debuggerAddress", get(PROPERTY_DRIVER_REMOTE_DEBUGGING_PORT));
		}
		return new ChromeDriver(options);
	}
	
	/**
	 * Creates a new Internet Explorer driver.
	 *
	 * @return
	 */
	private InternetExplorerDriver getIEDriver() {
		File driverPath = new File(getRequired(PROPERTY_DRIVER_EXEC_PATH));
		if (!driverPath.exists()) {
			throw new IllegalStateException("Could not find the IE driver at defined path " + driverPath.getAbsolutePath() + "");
		}
		System.setProperty(InternetExplorerDriverService.IE_DRIVER_EXE_PROPERTY, driverPath.getAbsolutePath());
		DesiredCapabilities caps = DesiredCapabilities.internetExplorer();
		caps.setCapability(InternetExplorerDriver.IE_ENSURE_CLEAN_SESSION, true);
		return new InternetExplorerDriver(caps);
	}
	
	/**
	 * Creates a new Safari driver.
	 *
	 * @return
	 */
	private SafariDriver getSafariDriver() {
		Platform current = Platform.getCurrent();
		if (!Platform.MAC.is(current) && !Platform.WINDOWS.is(current)) {
			throw new IllegalStateException("The Safari driver does not support the current platform " + current.name());
		}
		File driverPath = new File(getRequired(PROPERTY_DRIVER_EXEC_PATH));
		if (!driverPath.exists()) {
			throw new IllegalStateException("Could not find the Safari driver at defined path " + driverPath.getAbsolutePath() + "");
		}
		System.setProperty("webdriver.safari.driver", driverPath.getAbsolutePath());
		return new SafariDriver();
	}
	
	/**
	 * Creates a new (Blink-based) Opera driver.
	 *
	 * @return
	 */
	private OperaDriver getOperaDriver() {
		File driverPath = new File(getRequired(PROPERTY_DRIVER_EXEC_PATH));
		if (!driverPath.exists()) {
			throw new IllegalStateException("Could not find the Opera driver at defined path " + driverPath.getAbsolutePath() + "");
		}
		System.setProperty(OperaDriverService.OPERA_DRIVER_EXE_PROPERTY, driverPath.getAbsolutePath());
		return new OperaDriver();
	}
	
	/**
	 * Creates a new Firefox driver.
	 * 
	 * @return
	 */
	private FirefoxDriver getFirefoxDriver() {
		
		File driverPath = new File(getRequired(PROPERTY_DRIVER_EXEC_PATH));
		if (!driverPath.exists()) {
			throw new IllegalStateException("Could not find the firefox driver at defined path " + driverPath.getAbsolutePath() + "");
		}
		System.setProperty(GeckoDriverService.GECKO_DRIVER_EXE_PROPERTY, driverPath.getAbsolutePath());
		
		FirefoxProfile firefoxProfile = getFirefoxProfile();
		if (firefoxProfile != null) {
			FirefoxOptions firefoxOptions = new FirefoxOptions();
			firefoxOptions.setProfile(firefoxProfile);
			return new FirefoxDriver(firefoxOptions);
		}
		return new FirefoxDriver();
	}
	
	/**
	 * Creates a new Firefox profile
	 * 
	 * @return
	 */
	private FirefoxProfile getFirefoxProfile() {
		String profilePath = get(PROPERTY_FIREFOX_PROFILE_DIR, null);
		FirefoxProfile profile = null;
		
		if (profilePath != null) {
			File profileDir = new File(profilePath);
			if (!profileDir.exists()) {
				throw new IllegalStateException("Could not find the Firefox profile directory at defined path " + profileDir.getAbsolutePath() + "");
			} else {
				profile = new FirefoxProfile(profileDir);
			}
		}
		
		if (profile == null) {
			profile = new FirefoxProfile();
			profile.setPreference("app.update.auto", false);
			profile.setPreference("app.update.enabled", false);
			profile.setPreference("general.autoScroll", false);
			profile.setPreference("general.smoothScroll", false);
		}
		
		return profile;
	}

	/**
	 * Return whether navigation to page url is needed on controller initialisation
	 *
	 * @return false as the default config
	 */
	public Boolean getSkipNavigationOnInit() {
		if (skipNavigationOnInit == null) {
			skipNavigationOnInit = getBoolean(PROPERTY_DRIVER_SKIP_NAVIGATION_ON_INIT, "false");
		}
		return skipNavigationOnInit;
	}
	
	public void setMode(AutomationMode mode) {
		this.mode = mode;
	}

	public AutomationMode getMode() {
		return mode;
	}
	
	/**
	 * Returns the properties file name.
	 *
	 * @return
	 */
	private String getPropertiesFileNames() {
		String fileNames = System.getProperty(PROPERTY_AUT_CONFIG_FILE_NAMES);
		return StringUtils.isEmpty(fileNames) ? System.getProperty(PROPERTY_AUT_CONFIG_FILE_NAME, PROPERTIES_FILE_NAME)
				: fileNames;
	}
	
	/**
	 * Loads properties from launcher configuration file to environment file if they were not set in system properties
	 * System Property priority is
	 * 1. Launcher parameters
	 * 2. System Properties
	 * 3. LAUNCHER_PROPERTY_FILE_NAME file
	 * 
	 */
	private void loadLauncherProperties() {
		String launcherFileBaseName = get(PROPERTY_LAUNCHER_PROPERTY_FILE_NAME, LAUNCHER_PROPERTY_FILE_NAME);
		ResourceBundle resourceBundle = ResourceBundle.getBundle(launcherFileBaseName);
		Properties systemProperties = System.getProperties();
		if(systemProperties.containsKey(PROPERTY_SUREFIRE_TEST_PARAMETER)) {
			// Not attempting to load launcher properties since the tests are run via surefire
			logger.log(Logger.LOG_INFORMATION, String.format("Tests are executed via surefire. Ignoring the launcher properties at: %s", launcherFileBaseName));
			return;
		}
		logger.log(Logger.LOG_INFORMATION, String.format("Loading properties from Launcher file: %s", launcherFileBaseName));
		for (String key : resourceBundle.keySet()) {
			if(!systemProperties.containsKey(key)) {
				systemProperties.put(key, resourceBundle.getString(key));
			}
		}
		System.setProperties(systemProperties);
	}

}
