package org.openqa.selenium.chrome;

import java.io.File;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.SocketException;

import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.remote.UnreachableBrowserException;

import com.enactor.core.os.command.OSUtils;
import com.enactor.coreUI.selenium.SeleniumConfig;
import com.google.common.collect.ImmutableMap;

/**
 * Creates precisely M Chrome services for N no of drivers, where M < N by a large margin. 
 * Stops the services only when all drivers have quit.
 * 
 * The M services ideally should not be needed. Just 1 should do fine. However i suspect that 
 * selenium is unable to find some elements in browsers beyond a certain number of tests run with a single 
 * service OR does so inconsistently
 * @author Kusan
 *
 */
public class HeadlessParallelChromeDriver extends ChromeDriver{
	
	private static ChromeOptions options = new ChromeOptions();
	
	
	/* The chrome service binary. */
	private static ChromeDriverService bin = new ChromeDriverService.Builder()
			.usingDriverExecutable(new File(SeleniumConfig.getInstance().getRequired(SeleniumConfig.PROPERTY_DRIVER_EXEC_PATH)))
		    .usingAnyFreePort()
		   // .withEnvironment(ImmutableMap.of("DISPLAY", SeleniumConfig.getInstance().get("Lmportal.xvfb.id", SeleniumConfig.DEFAULT_XVFB_SCREEN)))
		    .build();
	
	
	static {
		/* Bypass OS security model, MUST BE THE VERY FIRST OPTION */
		options.addArguments("--no-sandbox"); 
        options.addArguments("--headless");        
        options.addArguments("--window-size=1920,1200");       
       
        /* disabling extensions */
        options.addArguments("--disable-extensions"); 
        /* applicable to windows os only */
        options.addArguments("--disable-gpu"); 
        /* overcome limited resource problems */
        options.addArguments("--disable-dev-shm-usage");
        /* disabling images */
        if (!SeleniumConfig.getInstance().getImagesDisabled()) {
        	options.addArguments("--blink-settings=imagesEnabled=false");
        }

        /* Do not remove. This Strategy causes selenium to wait for the complete html page to load and be passed into DOM
         * prior to returning on a call to get. It will not wait for images, css or JS to load. Typically this should 
         * eliminate timeouts happening due to chrome renderer.
         */
        //options.setPageLoadStrategy(PageLoadStrategy.EAGER);
	}
	
	
	private HeadlessParallelChromeDriver(ChromeDriverService bin,ChromeOptions options ) {		
		super(bin,options);
	}
	
	
	/**
	 * Returns a RemotewebDriver driving a Chrome browser
	 */	
	public static synchronized RemoteWebDriver getDriver() throws IOException {
		return new HeadlessParallelChromeDriver( bin,options);
	}
	
}
