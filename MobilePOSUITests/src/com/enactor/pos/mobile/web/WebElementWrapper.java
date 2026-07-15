package com.enactor.pos.mobile.web;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.time.Duration;
import java.util.Arrays;

import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.openqa.selenium.remote.RemoteWebDriver;

import com.enactor.pos.mobile.utils.MobilePosTestUtils;

/**
 * A dynamic proxy-based wrapper for Selenium {@link WebElement} instances.
 * <p>
 * This wrapper intercepts method calls on {@link WebElement} objects and
 * provides custom behaviors while preserving the standard WebElement contract.
 * </p>
 * 
 * @author Preminda.Bandara
 */
public class WebElementWrapper implements InvocationHandler {

    // ==============================
    // Constants
    // ==============================
    private static final String METHOD_GET_WRAPPED_ELEMENT = "getWrappedElement";
    private static final String METHOD_CLICK = "click";
    private static final String POINTER_NAME = "finger";
    private static final Duration TAP_HOLD_DURATION = Duration.ofMillis(100);

    private final WebElement originalElement;
    private final WebDriver driver;

    /**
     * Creates a new {@code WebElementWrapper}.
     * 
     * @param originalElement the raw {@link WebElement} to wrap
     * @param driver          the associated {@link WebDriver} instance
     */
    public WebElementWrapper(WebElement originalElement, WebDriver driver) {
        this.originalElement = originalElement;
        this.driver = driver;
    }

    /**
     * Intercepts method calls on the proxy instance.
     * <p>
     * - Returns the underlying element when {@code getWrappedElement()} is invoked. <br>
     * - Applies a custom iOS tap when {@code click()} is invoked. <br>
     * - Delegates all other calls to the original element.
     * </p>
     */
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        String methodName = method.getName();

        if (METHOD_GET_WRAPPED_ELEMENT.equals(methodName)) {
            return originalElement;
        }

        if (METHOD_CLICK.equals(methodName) && (args == null || args.length == 0)) {
            customClick();
            return null;
        }

        return method.invoke(originalElement, args);
    }

    /**
     * Performs a custom click action on the wrapped element.
     */
    private void customClick() {
        try {
            JavascriptExecutor js = (JavascriptExecutor) driver;
            js.executeScript("arguments[0].focus();", originalElement);

            Point location = originalElement.getRect().getPoint();
            Dimension size = originalElement.getRect().getDimension();
            int centerX = (int) (location.getX() + (size.getWidth() * MobilePosTestUtils.getxOffsetMutiplier()));
            int centerY = (int) (location.getY() + (size.getHeight() * MobilePosTestUtils.getyOffsetMutiplier()));

            PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, POINTER_NAME);
            Sequence tap = new Sequence(finger, 1);
            tap.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), centerX, centerY));
            tap.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
            tap.addAction(finger.createPointerMove(TAP_HOLD_DURATION, PointerInput.Origin.viewport(), centerX, centerY));
            tap.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

            ((RemoteWebDriver) driver).perform(Arrays.asList(tap));

        } catch (Exception e) {
            System.out.println("Custom click failed, falling back to regular click: " + e.getMessage());
            originalElement.click();
        }
    }
}