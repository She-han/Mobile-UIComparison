package com.enactor.core.automation.test;

import static org.testng.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import com.enactor.core.TestGroups;
import com.enactor.core.automation.AUT.IAUTWebController;
import com.enactor.core.automation.selenium.SeleniumWebController;
import org.openqa.selenium.By;

@Test(groups = { TestGroups.CONTINUOUS })
public class SeleniumWebControllerTest {

	IAUTWebController webController;
	Class webControllerClass;

	@BeforeClass
	protected void setUp() throws Exception {
		this.webControllerClass = SeleniumWebController.class;
		this.webController = (SeleniumWebController) webControllerClass.newInstance();

	}

	public void testGetTextLocatorByClassAndText() throws IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		// Allowing access to private method through reflection
		Method getTextLocatorByClassAndText = this.webControllerClass.getDeclaredMethod("getTextLocatorByClassAndText",
				String.class, String.class, String.class);
		getTextLocatorByClassAndText.setAccessible(true);

		String tagName = "a";
		String className = "span";

		String text = "Quick Brown Fo\"x Jump' over[ Lazy] Dog";

		String expected = "//a[contains(@class, 'span') and text() = concat(\"Quick Brown Fo\",'\"',\"x Jump' over[ Lazy] Dog\")]";

		By by = (By) getTextLocatorByClassAndText.invoke(webController, tagName, className, text);
		String actual = by.toString().split(":")[1].trim();
		assertEquals(actual, expected);

	}

	public void testGetTextLocator() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException,
			NoSuchMethodException, SecurityException {

		// Allowing access to private method through reflection
		Method getTextLocator = this.webControllerClass.getDeclaredMethod("getTextLocator", String.class, String.class);
		getTextLocator.setAccessible(true);

		String tagName = "a";

		String text = "Quick Brown Fo\"x Jump' over[ Lazy] Dog";

		String expected = "//a [text() = concat(\"Quick Brown Fo\",'\"',\"x Jump' over[ Lazy] Dog\")]";

		By by = (By) getTextLocator.invoke(webController, tagName, text);
		String actual = by.toString().split(":")[1].trim();
		assertEquals(actual, expected);

	}

}
