package com.enactor.pos.mobile.web;

import java.util.ArrayList;
import java.util.List;


/**
 * Utility class providing common helper methods for Appium web automation tasks.
 * 
 *  @author Preminda.Bandara
 */
public class WebDriverUtils {
	
	 /**
     * Unwraps arguments before passing them to the underlying Appium driver.
     * Handles individual wrapped elements, lists, and arrays recursively.
     * 
     */
    public static Object[] unwrapArguments(Object... args) {
        if (args == null)
            return null;

        Object[] result = new Object[args.length];
        for (int i = 0; i < args.length; i++) {
            result[i] = resolveWrappedElement(args[i]);
        }
        return result;
    }

    /**
     * Helper method that unwraps objects if they are wrapped elements,
     * lists of elements, or arrays.
     * 
     */
    private static Object resolveWrappedElement(Object obj) {
        if (obj instanceof IWrappedElement) {
            return ((IWrappedElement) obj).getWrappedElement();
        } else if (obj instanceof List) {
            // Handle lists of elements
            @SuppressWarnings("unchecked")
            List<Object> list = (List<Object>) obj;
            List<Object> unwrappedList = new ArrayList<Object>(list.size());
            for (Object item : list) {
                unwrappedList.add(resolveWrappedElement(item));
            }
            return unwrappedList;
        } else if (obj instanceof Object[]) {
            // Handle arrays
            Object[] array = (Object[]) obj;
            Object[] unwrappedArray = new Object[array.length];
            for (int i = 0; i < array.length; i++) {
                unwrappedArray[i] = resolveWrappedElement(array[i]);
            }
            return unwrappedArray;
        }
        return obj;
    }
}