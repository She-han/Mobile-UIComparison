package com.enactor.pos.mobile.visual;

import org.openqa.selenium.WebDriver;

/**
 * Thread-scoped registry that publishes the currently active {@link WebDriver} so that out-of-band
 * collaborators (such as the Cucumber per-step screenshot plugin) can reach the live session without
 * being coupled to the controller or step-provider instances that own it.
 *
 * <p>The type is deliberately {@link WebDriver} - the common super-type of every driver used in this
 * project (the thin-client {@code AppiumDriver<MobileElement>} and the React web
 * {@code AppiumDriver<WebElement>} drivers alike). This keeps the visual tooling decoupled from the
 * Appium element generics and lets a single seam serve all controller families.</p>
 *
 * <p>Using a {@link ThreadLocal} keeps the design safe if the suite is ever switched to parallel
 * scenario execution, where each worker thread owns its own driver. Registration and lookup are
 * best-effort and never throw, so a problem in the visual tooling can never influence functional
 * test behaviour.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class VisualRegressionDriverRegistry {

	private static final ThreadLocal<WebDriver> ACTIVE_DRIVER = new ThreadLocal<>();

	private VisualRegressionDriverRegistry() {
		// Utility holder - not instantiable.
	}

	/**
	 * Publishes the driver for the current thread. A {@code null} driver is ignored.
	 *
	 * @param driver the freshly created driver for the current test thread
	 */
	public static void register(WebDriver driver) {
		if (driver != null) {
			ACTIVE_DRIVER.set(driver);
		}
	}

	/**
	 * Returns the driver registered for the current thread, or {@code null} if none has been
	 * published yet (for example, before the application under test has been launched).
	 *
	 * @return the active driver, or {@code null}
	 */
	public static WebDriver getActiveDriver() {
		return ACTIVE_DRIVER.get();
	}

	/**
	 * @return {@code true} if a driver is currently registered for this thread
	 */
	public static boolean hasActiveDriver() {
		return ACTIVE_DRIVER.get() != null;
	}

	/**
	 * Detaches the driver from the current thread. Should be called once the driver has been quit to
	 * avoid retaining a stale, unusable session reference.
	 */
	public static void clear() {
		ACTIVE_DRIVER.remove();
	}
}
