package com.enactor.pos.mobile.web.android;

import java.lang.reflect.Proxy;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.enactor.pos.mobile.web.IWrappedElement;
import com.enactor.pos.mobile.web.WebElementWrapper;

/**
 * Provides an Android-specific implementation of {@link WebElementWrapper}.
 * <p>
 * This class enhances standard {@link WebElement} behavior for Android automation
 * by wrapping it with a dynamic proxy that allows custom interaction handling.
 * </p>
 * 
 * @author Preminda.Bandara
 */
public class AndroidWebElementWrapper extends WebElementWrapper {
	
	public AndroidWebElementWrapper(WebElement originalElement, WebDriver driver) {
		super(originalElement, driver);
	}

	/**
     * Wraps a {@link WebElement} with a dynamic proxy, enhancing its behavior
     * while preserving standard WebElement functionality.
     * 
     */
    public static WebElement wrap(WebElement element, WebDriver driver) {
        if (element == null || driver == null) {
            return element;
        }

        try {
            return (WebElement) Proxy.newProxyInstance(
                    element.getClass().getClassLoader(),
                    new Class[] { WebElement.class, IWrappedElement.class },
                    new AndroidWebElementWrapper(element, driver));
        } catch (Exception e) {
            System.out.println("Failed to wrap element: " + e.getMessage());
            return element;
        }
    }
}