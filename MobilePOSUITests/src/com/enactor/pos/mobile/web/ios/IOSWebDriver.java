package com.enactor.pos.mobile.web.ios;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;

import com.enactor.pos.mobile.web.WebDriverUtils;

import io.appium.java_client.ios.IOSDriver;

/**
 * A customized extension of {@link IOSDriver} that wraps iOS {@link WebElement}s
 * with enhanced functionality for test automation.
 * <p>
 * This driver ensures that all elements retrieved via {@code findElement} and
 * {@code findElements} are wrapped using {@link WebElementWrapper}, allowing
 * additional behaviors (such as custom click handling) while maintaining full
 * compatibility with the standard Appium {@link IOSDriver}.
 * </p>
 * <p>
 * It also overrides script execution methods to automatically unwrap wrapped
 * elements before passing them to the underlying Appium engine.
 * </p>
 * 
 * @author Preminda.Bandara
 */
public class IOSWebDriver extends IOSDriver<WebElement> {

    /**
     * Constructs a new instance of {@code CustomIOSDriver}.
     * 
     */
    public IOSWebDriver(URL remoteAddress, DesiredCapabilities capabilities) {
        super(remoteAddress, capabilities);
    }

    /**
     * Finds a single element and wraps it in a {@link WebElementWrapper}.
     * 
     */
    @Override
    public WebElement findElement(By by) {
        WebElement element = super.findElement(by);
        return IOSWebElementWrapper.wrap(element, this);
    }

    /**
     * Finds multiple elements and wraps each one in a {@link WebElementWrapper}.
     * 
     */
    @Override
    public List<WebElement> findElements(By by) {
        List<WebElement> elements = super.findElements(by);
        List<WebElement> wrappedElements = new ArrayList<WebElement>();

        for (WebElement element : elements) {
            wrappedElements.add(IOSWebElementWrapper.wrap(element, this));
        }

        return wrappedElements;
    }

    /**
     * Executes a JavaScript script after unwrapping any wrapped elements
     * in the arguments list.
     * 
     */
    @Override
    public Object executeScript(String script, Object... args) {
        return super.executeScript(script, WebDriverUtils.unwrapArguments(args));
    }
}