package com.enactor.core.automation.api;

import static org.testng.Assert.assertTrue;

import org.apache.commons.httpclient.HttpStatus;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseFactory;
import org.apache.http.ProtocolVersion;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.DefaultHttpResponseFactory;
import org.apache.http.message.BasicStatusLine;
import org.mockito.Mockito;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import com.enactor.core.TestGroups;
import com.enactor.core.automation.AUT.AutomationException;

/**
 * API Automation common steps.
 *
 * @author gayan kavirathne
 */
@Test(groups = { TestGroups.CONTINUOUS })
public class CommonApitStepsTest extends Mockito{
	CommonApiSteps commonApiSteps;
	HttpResponse  originalResponse;
	
	
	private class NoConfigCommonApisSteps extends CommonApiSteps{
		
		@Override
		protected void setupConfig() {
			
		}
		
	}
	
	@BeforeMethod
	public void setUp() {
		commonApiSteps =  new NoConfigCommonApisSteps();
		
		HttpResponseFactory factory = new DefaultHttpResponseFactory();
		originalResponse = factory.newHttpResponse(new BasicStatusLine(new ProtocolVersion("HTTP", 1, 1), HttpStatus.SC_OK, "OK"), null);
		
		originalResponse.setHeader(HttpHeaders.CONTENT_TYPE,"application/json");
		
		commonApiSteps.setOriginalResponse(originalResponse);
	}
	
	public void testResponseIsSupersetOf() throws Exception {
		
		String originalContent = "{\n"
				+ "    \"basket\": {\n"
				+ "        \"balance\": 0,\n"
				+ "        \"currencyId\": \"GBP\",\n"
				+ "        \"currencyDescription\": \"Pounds Sterling\",\n"
				+ "        \"taxInclusive\": false,\n"
				+ "        \"itemCount\": 0,\n"
				+ "        \"effectiveSaleValue\": 0\n"
				+ "    },\n"
				+ "    \"basketReference\": \"5L7KMSCI4BGN3BB2BUGBQJDKDE\",\n"
				+ "    \"basketType\": \"BASKET\",\n"
				+ "    \"basketDescription\": \"test basket\",\n"
				+ "    \"basketStatus\": \"NEW\",\n"
				+ "    \"basketCreatedDate\": \"2022-06-01T07:03:34.000+01:00\"\n"
				+ "}";
		
		originalResponse.setEntity(new StringEntity(originalContent));
		
		// Test with Valid Comparing Content
		// This example does not include the basketStatus element, But is istill a superset
		String validComparingContent = "{\n"
				+ "    \"basket\": {\n"
				+ "        \"balance\": 0,\n"
				+ "        \"currencyId\": \"GBP\",\n"
				+ "        \"currencyDescription\": \"Pounds Sterling\",\n"
				+ "        \"taxInclusive\": false,\n"
				+ "        \"itemCount\": 0,\n"
				+ "        \"effectiveSaleValue\": 0\n"
				+ "    },\n"
				+ "    \"basketReference\": \"5L7KMSCI4BGN3BB2BUGBQJDKDE\",\n"
				+ "    \"basketType\": \"BASKET\",\n"
				+ "    \"basketDescription\": \"test basket\",\n"
				+ "    \"basketCreatedDate\": \"2022-06-01T07:03:34.000+01:00\"\n"
				+ "}";
		
		commonApiSteps.responseIsSupersetOf(validComparingContent);
		
		// Test with Invalid Comparing Content
		// This example includes an additional element 'basketColor', So response is not a Superset
		
		String invalidComparingContent = "{\n"
				+ "    \"basket\": {\n"
				+ "        \"balance\": 0,\n"
				+ "        \"currencyId\": \"GBP\",\n"
				+ "        \"currencyDescription\": \"Pounds Sterling\",\n"
				+ "        \"taxInclusive\": false,\n"
				+ "        \"itemCount\": 0,\n"
				+ "        \"effectiveSaleValue\": 0\n"
				+ "    },\n"
				+ "    \"basketReference\": \"5L7KMSCI4BGN3BB2BUGBQJDKDE\",\n"
				+ "    \"basketType\": \"BASKET\",\n"
				+ " 	\"basketColor\": \"Black\",\n"
				+ "    \"basketDescription\": \"test basket\",\n"
				+ "    \"basketCreatedDate\": \"2022-06-01T07:03:34.000+01:00\"\n"
				+ "}";
		try {
			commonApiSteps.responseIsSupersetOf(invalidComparingContent);
		} catch (AutomationException e) {
			assertTrue(e.getMessage().contains("not a superset of the comparing json"));
		}

		
	}
}
