package com.enactor.maintenance;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import com.enactor.core.utilities.Logger;
import com.enactor.core.utilities.StringUtils;
import com.enactor.coreUI.selenium.SeleniumConfig;

/**
 * Configuration for the EM test data - read the property file and get the property values.
 * 
 * @author Charith Gunathilaka
 *
 */

public class TestDataConfig {
	
	/** Instance. */
	private static TestDataConfig instance = null;
	
	/** Resource bundle. */
	private final Map<String, String> configProperties = new HashMap<>();
	
	/** Properties file name constant. */
	private static final String PROPERTIES_FILE_NAME = "TestData";
	
	private static Logger logger = Logger.getLogger(TestDataConfig.class.getName());

	/**
	 * Returns the current instance of the TestDataConfig.
	 *
	 * @return
	 */
	public static TestDataConfig getInstance() {
		if(instance == null){
			instance = new TestDataConfig();
		}
	    return instance;
	}

	/**
	 * Default constructor.
	 */
	private TestDataConfig() {
		String[] fileNames = StringUtils.splitCommaDelimitedString(getPropertiesFileNames());
		logger.log(Logger.LOG_INFORMATION,
				String.format("Reading Test Data properties from : %s files", Arrays.toString(fileNames)));
		for (String fileName : fileNames) {
			ResourceBundle resourceBundle = ResourceBundle.getBundle(fileName);
			for (String key : resourceBundle.keySet()) {
				configProperties.put(key, resourceBundle.getString(key));
			}
		}
	}
	
	/**
	 * Returns an item from the test data config.
	 *
	 * @param key
	 * @param defaultVal
	 * @return
	 */
	public String get(String key, String defaultVal) {
		// First try and retrieve system property
		String value = System.getProperty(key);
	    try {
	    	if (StringUtils.isEmpty(value)) {
	    		value = configProperties.get(key);
	    	}
	    } catch (MissingResourceException e) {
	    	// Ignore
	    }
	    if (StringUtils.isEmpty(value)) {
	    	return defaultVal;
	    }
	    return value;
	}
	
	public int getInt(String key, int defaultVal) {
		return Integer.valueOf(get(key,String.valueOf(defaultVal)));
	}
	
	/**
	 * Returns the string value for the given key.
	 * 
	 * @param key
	 * @return
	 */
	public String getString(String key) {
		return get(key, null);
	}
	
	/**
	 * Returns the int value for the given key.
	 * 
	 * @param key
	 * @return
	 */
	public int getInt(String key) {
		return getInt(key, 0);
	}
	
	/**
	 * Returns the properties file names.
	 *
	 * @return
	 */
	private String getPropertiesFileNames() {
		String fileNames = SeleniumConfig.getInstance().get("testDataPropertyFileNames", "");
		return StringUtils.isEmpty(fileNames) ? SeleniumConfig.getInstance().get("testDataPropertyFileName", PROPERTIES_FILE_NAME)
				: fileNames;
	}

}
