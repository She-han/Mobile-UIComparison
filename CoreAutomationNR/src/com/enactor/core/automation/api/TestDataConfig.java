package com.enactor.core.automation.api;

import java.util.Enumeration;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import com.enactor.core.utilities.StringUtils;

public class TestDataConfig {
	/** Instance. */
	private static TestDataConfig instance = null;
	
	/** Resource bundle. */
	private ResourceBundle configProperties = null;
	
	/** POS Configuration Directory*/
	private String posConfigDirectory = null;
	
	private final String POS_CONFIG_DIRECTORY = "autClient.configFolder";
		
	/**
	 * Returns the current instance of the AUTClientConfig.
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
		configProperties = ResourceBundle.getBundle(getPropertiesFileName());
		posConfigDirectory = this.getConfigDirectoryPath();
	}
	
	public Enumeration<String> getKeys (){
		return configProperties.getKeys();
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
	    		value = configProperties.getString(key);
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
	 * Returns the properties file name.
	 * 
	 * @return
	 */
	private String getPropertiesFileName(){
		return System.getProperty("testDataPropertyFileName", "TestDataConfig");
	}
	
	/**
	 * Returns the POS Configuration directory path.
	 * 
	 * @return
	 */
	public String getConfigDirectoryPath(){
		return System.getProperty(POS_CONFIG_DIRECTORY);
	}
}
