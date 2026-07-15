package org.openqa.selenium.opera;

import java.io.File;

import com.enactor.coreUI.selenium.SeleniumConfig;
import com.google.common.collect.ImmutableMap;

/**
 * Headless (Blink-based) Opera driver using Xvfb.
 * 
 * Xvfb needs to be started first, e.g. 'Xvfb :1 -screen 0 1024x768x24 &'
 * 
 * The property driver.exec.path must be set to your Opera driver's executable path.
 *
 * @author David Hall
 */
public class HeadlessOperaDriver extends OperaDriver {

	/** The chrome binary. */
	private static OperaDriverService bin = new OperaDriverService.Builder()
			.usingDriverExecutable(new File(SeleniumConfig.getInstance().getRequired(SeleniumConfig.PROPERTY_DRIVER_EXEC_PATH)))
		    .usingAnyFreePort()
		    .withEnvironment(ImmutableMap.of("DISPLAY", SeleniumConfig.getInstance().get("Lmportal.xvfb.id", SeleniumConfig.DEFAULT_XVFB_SCREEN)))
		    .build();
	
	/**
	 * Default constructor.
	 */
	public HeadlessOperaDriver() {
		super(bin);
	}
}
