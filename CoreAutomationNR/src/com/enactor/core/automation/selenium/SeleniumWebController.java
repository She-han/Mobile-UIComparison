package com.enactor.core.automation.selenium;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.FluentWait;

import com.enactor.core.automation.controller.BaseWebController;
import com.enactor.coreUI.selenium.AutomationMode;
import com.enactor.coreUI.selenium.SeleniumConfig;
import com.enactor.coreUI.selenium.WebDriverPool;

/**
 * Selenium AUT Web Controller
 *
 * @author Hirantha Bandara
 *
 */
public class SeleniumWebController extends BaseWebController<WebDriver> {
	

	@Override
	public void init() {
		String url = SeleniumConfig.getInstance().getPageUrl();
		driver = WebDriverPool.getInstance().getWebDriver();
		// Load URL
		if (!SeleniumConfig.getInstance().getSkipNavigationOnInit()
				|| SeleniumConfig.getInstance().getMode() == AutomationMode.EM) {
			driver.get(url);
			driver.manage().window().maximize();
		}

		wait = new FluentWait<WebDriver>(driver).withTimeout(120, TimeUnit.SECONDS).pollingEvery(1, TimeUnit.SECONDS)
				.ignoring(Exception.class);
	}

}