package com.enactor.coreUI.selenium;

import java.util.concurrent.ConcurrentLinkedQueue;

import org.openqa.selenium.WebDriver;

import com.enactor.core.utilities.Logger;

public class WebDriverPool {

	private static Logger logger = Logger.getLogger(WebDriverPool.class);

	private static ConcurrentLinkedQueue<WebDriver> availableDrivers, inUseDrivers;
	private static WebDriverPool instance = new WebDriverPool();

	private WebDriverPool() {
		availableDrivers = new ConcurrentLinkedQueue<>();
		inUseDrivers = new ConcurrentLinkedQueue<>();
		createBrowserPool();
	}

	public static WebDriverPool getInstance() {
		return instance;
	}

	public synchronized void returnDriver(WebDriver webDriver) {
		try {
			webDriver.manage().deleteAllCookies();
			availableDrivers.add(webDriver);
		} catch (Exception ex) {
			System.out.println("Failed to return Driver properly: " + ex.getMessage());
			logger.log(Logger.LOG_ERROR, "Failed to return Driver properly: " + ex.getMessage());
			// Previous driver might be in an unusable state
			availableDrivers.add(SeleniumConfig.getInstance().getDriver());
			webDriver.quit();
		} finally {
			inUseDrivers.remove(webDriver);
		}
	}

	public synchronized WebDriver getWebDriver() {
		
		if (isPoolEmpty()) {
			createBrowserPool();
		} else if (SeleniumConfig.getInstance().getMode() == AutomationMode.EM) {
			System.setProperty(SeleniumConfig.PROPERTY_DRIVER_INSTANCES_COUNT, "2");
			createBrowserPool();
		}
		WebDriver webDriver = availableDrivers.remove();
		inUseDrivers.add(webDriver);
		return webDriver;
	}


	public synchronized void resetBrowserPool() {

		destroyBrowserPool();

		createBrowserPool();
	}

	private synchronized void createBrowserPool() {
		int driverInstances = SeleniumConfig.getInstance().getNoOfDriverInstances();
		
		// Since method is synchronized it's enough to check the available driver count once
		int availableInstances = availableDrivers.size() + inUseDrivers.size();
		
		for (int i = availableInstances; i < driverInstances; i++) {
			availableDrivers.add(SeleniumConfig.getInstance().getDriver());
		}
		logger.log(Logger.LOG_INFORMATION, "Created a driver pool of size: " + driverInstances);
	}

	/**
	 * Invoke only after completing all the test suits.
	 * Will destroy the browser driver pool.
	 */
	public synchronized void destroyBrowserPool() {
		for (WebDriver webDriver : availableDrivers) {
			webDriver.quit();
		}

		for (WebDriver webDriver : inUseDrivers) {
			webDriver.quit();
		}

		availableDrivers.clear();
		inUseDrivers.clear();
		logger.log(Logger.LOG_INFORMATION, "Destroyed WebDriverPool");

	}
	
	public boolean isPoolEmpty() {
		return (inUseDrivers.size() + availableDrivers.size()) == 0;
	}

}
