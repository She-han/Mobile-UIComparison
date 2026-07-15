package com.enactor.pos.mobile.web;

import org.openqa.selenium.WebElement;

/**
 * This interface provides access to the underlying Selenium {@link WebElement}
 * for scenarios where extended functionality is added through custom wrappers
 * but direct interaction with the original element is still required.
 * 
 * @author Preminda.Bandara
 */
public interface IWrappedElement {
	
    /**
     * This allows direct access to the raw Selenium element, enabling operations
     * that may not be covered by the wrapper interface.
     * 
     */
    WebElement getWrappedElement();
}