package com.enactor.core.automation.api;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.StringReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonPatch;
import javax.json.JsonValue;
import javax.xml.namespace.QName;
import javax.xml.xpath.XPathConstants;

import com.enactor.core.utilities.FileUtils;
import com.enactor.core.utilities.Logger;
import com.enactor.core.utilities.MapUtils;
import com.jayway.jsonpath.DocumentContext;
import org.apache.http.HttpResponse;
import org.apache.http.client.utils.URIBuilder;
import org.json.JSONObject;
import org.json.XML;
import org.w3c.dom.Node;
import org.xmlunit.builder.DiffBuilder;
import org.xmlunit.diff.ComparisonControllers;
import org.xmlunit.diff.DefaultNodeMatcher;
import org.xmlunit.diff.Diff;
import org.xmlunit.diff.Difference;
import org.xmlunit.diff.ElementSelectors;


import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.utilities.StringUtils;
import com.enactor.core.webService.epr.IHttpServiceEndpointReference.HTTPMethod;
import com.enactor.core.webService.epr.IRestEndpoint;
import com.enactor.core.webService.epr.RestEndpoint;
import com.enactor.core.webService.rest.ApiAutomationRestServiceInvoker;
import com.enactor.core.webService.rest.AutomationResponseOutput;
import com.enactor.core.webService.rest.IRestAuthenticationHandler;
import com.enactor.core.webService.rest.IRestServiceInvoker;
import com.enactor.core.webService.rest.RestBasicAuthenticationHandler;
import com.enactor.core.webService.rest.RestRawMessageHandler;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.fge.jsonschema.main.JsonSchema;
import com.github.fge.jsonschema.main.JsonSchemaFactory;
import com.jayway.jsonpath.JsonPath;

import io.cucumber.datatable.DataTable;

import java.nio.charset.StandardCharsets;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;
import javax.xml.bind.DatatypeConverter;

/**
 * API Automation common steps.
 *
 * @author harsha
 */
public abstract class CommonApiSteps {

	private static String response = null;
	private static HttpResponse originalResponse = null;
	private static IRestEndpoint restEndpoint = null;
	private static String baseUrl = null;
	private static String filePath = null;
	private static Map<String, String> propertyMap = new HashMap<>();
	private static Map<String, Object> mapNodes = new HashMap<>();
	private static IRestAuthenticationHandler authenticationHandler = null;
	private static String accessToken = null; 

	public static final String GRANT_TYPE_QUERY_NAME = "grant_type";
	public static final String GRANT_TYPE_QUERY_VALUE_CLIENT_CREDS = "client_credentials";
	public static final String ACCESS_TOKEN_JSON_KEY = "access_token";
	
	private static final Logger logger = Logger.getLogger(CommonApiSteps.class);

	
	public CommonApiSteps() {
		setupConfig();
	}

	protected void setupConfig() {
		Enumeration<String> keys = TestDataConfig.getInstance().getKeys();
		while (keys.hasMoreElements()) {
			String key = keys.nextElement();
			getPropertyMap().put(key, getTestDataValue(key));
		}
	}
	
	protected String getResponse() {
		return response;
	}

	public static void setResponse(String apiResponse) {
		response = apiResponse;
	}

	protected HttpResponse getOriginalResponse() {
		return originalResponse;
	}

	protected void setOriginalResponse(HttpResponse apiOriginalResponse) {
		originalResponse = apiOriginalResponse;
	}

	protected IRestEndpoint getRestEndpoint() {
		return restEndpoint;
	}

	protected void setRestEndpoint(IRestEndpoint endpoint) {
		restEndpoint = endpoint;
	}

	protected String getBaseUrl() {
		return baseUrl;
	}

	protected void setBaseUrl(String url) {
		baseUrl = url;
	}

	protected String getAccessToken() {
		return accessToken;
	}

	protected void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	protected String getFilePath() {
		return filePath;
	}

	protected void setFilePath(String filepath) {
		filePath = filepath;
	}

	protected Map<String, String> getPropertyMap() {
		return propertyMap;
	}

	protected void setMap(Map<String, String> variableMap) {
		propertyMap = variableMap;
	}

	protected Map<String, Object> getMapNodes() {
		return mapNodes;
	}

	protected void setMapNodes(Map<String, Object> variableNodes) {
		mapNodes = variableNodes;
	}

	protected IRestAuthenticationHandler getAuthenticationHandler() {
		return authenticationHandler;
	}

	protected void setAuthenticationHandler(IRestAuthenticationHandler handler) {
		authenticationHandler = handler;
	}

	/**
	 * set the baseUrl to a variable called baseUrl. can be later refer it as
	 * {baseUrl}
	 *
	 * @param baseUri
	 * @throws AutomationException
	 */
	public void setupBaseUrl(String baseUrl) throws AutomationException {
		String resolvedBaseUrl = StringUtils.resolvePlaceholdersWithMap(baseUrl, propertyMap);
		setBaseUrl(resolvedBaseUrl);
		getPropertyMap().put(ApiConstants.BASE_URL, resolvedBaseUrl);
	}
	
	public void setupAccessToken(String acccessToken) throws AutomationException {
		setAccessToken(acccessToken);
		getPropertyMap().put("accessToken", acccessToken);
	}
	/**
	 * set the api endpoint
	 *
	 * @param endpoint
	 * @throws AutomationException
	 */
	public void userSetApiEndpoint(String endpoint) throws AutomationException {
		restEndpoint = new RestEndpoint();

		String resolvedEndpoint = StringUtils.resolvePlaceholdersWithMap(endpoint, propertyMap);
		restEndpoint.setUrl(resolvedEndpoint);
	}

	/**
	 * set the query parameters to endpoint
	 *
	 * @param table
	 * @throws Exception
	 */
	public void userSetQueryParamsToEndpoint(DataTable table) throws Exception {

		String uri = restEndpoint.getUrl();
		URIBuilder uriBuilder = new URIBuilder(uri);

		for (List<String> items : table.asLists()) {

			if (items.size() > 1) {
				String key = items.get(0);
				String value = items.get(1);

				String resolvedValue = StringUtils.resolvePlaceholdersWithMap(value, propertyMap);
				uriBuilder.addParameter(key, resolvedValue);
			}
		}
		uri = uriBuilder.toString();
		restEndpoint.setUrl(uri);
	}

	/**
	 * set the headers to endpoint
	 *
	 * @param table
	 * @throws AutomationException
	 */
	public void userSetHeadersToEndpoint(DataTable table) throws AutomationException {

		Map<String, String> headers = new HashMap<>();
		for (List<String> items : table.asLists()) {
			if (items.size() > 1) {
				String key = items.get(0);
				String value = items.get(1);

				String resolvedValue = StringUtils.resolvePlaceholdersWithMap(value, propertyMap);
				MapUtils.putIfAbsent(headers, key, resolvedValue);
			}
		}
		restEndpoint.setHeaders(headers);
	}

	/**
	 * send request to the end point in given format
	 *
	 * @param type
	 * @param body
	 * @throws Exception
	 */
	public void sendHttpRequestWithRequestBody(String type, String body) throws Exception {

		body = StringUtils.resolvePlaceholdersWithMap(body, propertyMap);
		
		Object requestObject = null;
		if (type.equalsIgnoreCase(HTTPMethod.GET.toString())) {
			restEndpoint.setHttpMethod(HTTPMethod.GET);
			// if get even if body is passed, it will omitted
		} else if (type.equalsIgnoreCase(HTTPMethod.POST.toString())) {
			restEndpoint.setHttpMethod(HTTPMethod.POST);
			requestObject = body;
		} else if (type.equalsIgnoreCase(HTTPMethod.PATCH.toString())) {
			restEndpoint.setHttpMethod(HTTPMethod.PATCH);
			requestObject = body;
		} else if (type.equalsIgnoreCase(HTTPMethod.PUT.toString())) {
			restEndpoint.setHttpMethod(HTTPMethod.PUT);
			requestObject = body;
		}else if (type.equalsIgnoreCase(HTTPMethod.DELETE.toString())) {
			restEndpoint.setHttpMethod(HTTPMethod.DELETE);
			requestObject = body;
		} else {
			throw new AutomationException("Invalid request type");
		}

		IRestServiceInvoker invoker = new ApiAutomationRestServiceInvoker();
		invoker.setMessageHandler(new RestRawMessageHandler());
		if (authenticationHandler != null) {
			invoker.setAuthenticationHandler(authenticationHandler);
		}

		AutomationResponseOutput responseObject = (AutomationResponseOutput) invoker.invoke(
				restEndpoint,
				requestObject);
		originalResponse = responseObject.getHttpResponse();
		response = (String) responseObject.getResponseBody();
	}

	/**
	 * send request to the end point in given format
	 *
	 * @param type
	 * @param filename
	 * @throws Exception
	 */
	public void sendHttpRequestWithRequestBodyFromFile(String type, String filename)
			throws Exception {

		String url = filePath + filename;
		String body = new String(FileUtils.getBytes(new File(url)));

		sendHttpRequestWithRequestBody(type, body);
	}

	/**
	 * save property to a variable using XPath if it s josn then it will convert
	 * into XML and use XPath
	 *
	 * @param property
	 * @param variable
	 * @throws Exception
	 */
	public void propertyExtractedToVariable(String property, String variable) throws Exception {

		// exact based on JsonPath and Xpath
		if (CommonApiUtils.getContentType(originalResponse)
				.contentEquals(ApiConstants.InputTypes.XML.name())) {
			Object value = CommonApiUtils.getXpathValue(property, XPathConstants.STRING, null,
					response);
			MapUtils.putIfAbsent(propertyMap, variable, (String) value);

		} else if (CommonApiUtils.getContentType(originalResponse)
				.contentEquals(ApiConstants.InputTypes.JSON.name())) {

			JSONObject jsonObject = new JSONObject(response);
			// convert to xml
			response = XML.toString(jsonObject, ApiConstants.ROOT_NODE);
			String orignalResponse = XML.toString(jsonObject);
			try {
				Object value = CommonApiUtils.getXpathValue(property, XPathConstants.STRING, null,
						response);
				MapUtils.putIfAbsent(propertyMap, variable, (String) value);
			} finally {
				JSONObject xmlJSONObj = XML.toJSONObject(orignalResponse);
				String jsonPrettyPrintString = xmlJSONObj.toString(4);
				response = jsonPrettyPrintString;
			}
		} else {
			throw new AutomationException(String.format("Invalid content type"));
		}
	}
	
	
	/**
	 * save property to a variable using XPath if it s json then it will convert
	 * into XML and use XPath
	 * 
	 * Update the the value if its already there.
	 *
	 * @param property
	 * @param variable
	 * @throws Exception
	 */
	public void propertyExtractedToVariableUpdateIfExists(String property, String variable) throws Exception {

		// exact based on JsonPath and Xpath
		if (CommonApiUtils.getContentType(originalResponse)
				.contentEquals(ApiConstants.InputTypes.XML.name())) {
			Object value = CommonApiUtils.getXpathValue(property, XPathConstants.STRING, null,
					response);
			propertyMap.put(variable, (String) value);

		} else if (CommonApiUtils.getContentType(originalResponse)
				.contentEquals(ApiConstants.InputTypes.JSON.name())) {

			JSONObject jsonObject = new JSONObject(response);
			// convert to xml
			response = XML.toString(jsonObject, ApiConstants.ROOT_NODE);
			String orignalResponse = XML.toString(jsonObject);
			try {
				Object value = CommonApiUtils.getXpathValue(property, XPathConstants.STRING, null,
						response);
				propertyMap.put(variable, (String) value);
			} finally {
				JSONObject xmlJSONObj = XML.toJSONObject(orignalResponse);
				String jsonPrettyPrintString = xmlJSONObj.toString(4);
				response = jsonPrettyPrintString;
			}
		} else {
			throw new AutomationException(String.format("Invalid content type"));
		}
	}

	/**
	 * Extract the Node to the variable If extracting object type is string do not
	 * use this.
	 *
	 * @param property
	 * @param variable
	 * @param type
	 * @throws Exception
	 */
	public void propertyExtractedToVariableOfType(String property, String variable, String type)
			throws Exception {

		String orignalResponse = "";
		try {

			if (CommonApiUtils.getContentType(originalResponse)
					.contentEquals(ApiConstants.InputTypes.JSON.name())) {
				JSONObject jsonObject = new JSONObject(response);
				// convert to xml
				response = XML.toString(jsonObject, ApiConstants.ROOT_NODE);
				orignalResponse = XML.toString(jsonObject);
			}
			QName qname = XPathConstants.STRING;
			if (type != null && type.equalsIgnoreCase("node")) {
				qname = XPathConstants.NODE;
			}

			Object value = CommonApiUtils.getXpathValue(property, qname, null, response);
			if (type.equalsIgnoreCase("String") || type.isEmpty()) {
				MapUtils.putIfAbsent(propertyMap, variable, (String) value);
			} else {
				// remove and add
				MapUtils.putIfAbsent(mapNodes, variable, value);
			}
		} finally {
			if (CommonApiUtils.getContentType(originalResponse)
					.contentEquals(ApiConstants.InputTypes.JSON.name())) {
				JSONObject xmlJSONObj = XML.toJSONObject(orignalResponse);
				String jsonPrettyPrintString = xmlJSONObj.toString(4);
				response = jsonPrettyPrintString;
			}
		}

	}

	/**
	 * Extract the value from header into a variable.
	 *
	 * @param headerKey
	 * @param variable
	 * @throws Exception
	 */
	public void propertyExtractedToVariableFromHeader(String headerKey, String variable)
			throws Exception {

		if (originalResponse.getHeaders(headerKey).length > 1) {
			throw new AutomationException("response header is missing with key:" + headerKey);
		}
		MapUtils.putIfAbsent(propertyMap, variable, originalResponse.getHeaders(headerKey)[0].getValue());
	}

	 /**
	 * Extract the value from url into a variable.
	 *
	 * @param variable
	 * @throws Exception
	 */
	protected void propertyExtractedToVariableFromUrl(String variable) throws Exception {

		String url = "";
		url = originalResponse.getHeaders("location")[0].getValue();
		url = url.substring(url.lastIndexOf("/"));
		url = url.replace("/", "");

		MapUtils.putIfAbsent(propertyMap, variable, url);
	}
	
	/**
	 * Extract the value from between two strings.
	 *
	 * @param headerKey
	 * @param propery
	 * @param open
	 * @param close
	 */
	public void extractVariableFromText(String property, String variable, String open, String close) {
		String resolvedProperty = StringUtils.resolvePlaceholdersWithMap(property, propertyMap);
		String resolvedOpen = StringUtils.resolvePlaceholdersWithMap(open, propertyMap);
		String resolvedClose = StringUtils.resolvePlaceholdersWithMap(close, propertyMap);
		String value = "";
        if (resolvedProperty == null || resolvedProperty.isEmpty()) {
        } else if (resolvedOpen != null && !resolvedOpen.isEmpty() && resolvedClose != null && !resolvedClose.isEmpty()) {
            int start = resolvedProperty.indexOf(open);
            if (start != -1) {
                int end = resolvedProperty.indexOf(resolvedClose, start + resolvedOpen.length());
                if (end != -1) {
                	value = resolvedProperty.substring(start + resolvedOpen.length(), end);
                }
            }
        } else if (resolvedOpen != null && !resolvedOpen.isEmpty()) {
        	int start = resolvedProperty.indexOf(resolvedOpen);
        	value = resolvedProperty.substring(start + resolvedOpen.length(), resolvedProperty.length());
        } else if (resolvedClose != null && !resolvedClose.isEmpty()){
        	int end = resolvedProperty.indexOf(resolvedClose);
        	value = resolvedProperty.substring(0, end);
        } 
        getPropertyMap().put(variable, value);
	}
	
	/**
	 * Extract the values from table into propertyMap.
	 *
	 * @param dataTable
	 * @throws AutomationException 
	 */
	public void propertiesExtractedToVariablesFromDatatable(DataTable dataTable) throws AutomationException {
		for (List<String> items : dataTable.cells()) {
			if (items.size() == 2) {
				String key = items.get(0);
				String value = items.get(1);
				propertyMap.put(key, value);
			} else {
				throw new AutomationException("Expected a key value pair but found item with size : " + items.size());
			}
		}
	}
	
	public static String constructKey(String root, String element) {
		StringBuilder xpathKey = new StringBuilder();

		if (element.contains(".")) {
			String[] parts = element.split("\\.");
			for (String part : parts) {
				xpathKey.append(buildNode(part.trim()));
			}
		} else {
			xpathKey.append(buildNode(element.trim()));
		}

		return xpathKey.toString();
	}

	public static String buildNode(String part) {
		if (part.contains("[")) {
			String nodeName = part.substring(0, part.indexOf("["));
			String index = part.substring(part.indexOf("["));
			return "/*[local-name()='" + nodeName + "']" + index;
		} else {
			return "/*[local-name()='" + part + "']";
		}
	}

	/**
	 * Check the response contains given values specified in given XPaths
	 *
	 * @param table
	 * @throws AutomationException
	 */
	public void responseContains(DataTable table) throws AutomationException {

		String orignalResponse = "";
		try {
			for (List<String> items : table.asLists()) {
				if (items.size() > 1) {
					String key = constructKey("", items.get(0));
					String value = StringUtils.resolvePlaceholdersWithMap(items.get(1),
							propertyMap);

					if (CommonApiUtils.getContentType(originalResponse)
							.contentEquals(ApiConstants.InputTypes.XML.name())
							|| CommonApiUtils.getContentType(originalResponse)
							.contentEquals(ApiConstants.InputTypes.JSON.name())) {

						if (CommonApiUtils.getContentType(originalResponse)
								.contentEquals(ApiConstants.InputTypes.JSON.name())) {
							JSONObject jsonObject = new JSONObject(response);

							// convert to xml
							response = XML.toString(jsonObject, ApiConstants.ROOT_NODE);
							orignalResponse = XML.toString(jsonObject);
						}

						String val = "";
						try {
							val = (String) CommonApiUtils.getXpathValue(key, XPathConstants.STRING,
									null, response);
						} catch (Exception e) {
							throw new AutomationException("Xpath is invalid " + e);
						}
						if (!value.equalsIgnoreCase(val)) {
							throw new AutomationException(
									"Xpath value mismatch. Expected one:" + value + " Actual one:"
											+ val);
						}

					} else {
						throw new AutomationException(String.format("Invalid content type"));
					}
				}
			}
		} finally {
			if (!CommonApiUtils.getContentType(originalResponse)
					.contentEquals(ApiConstants.InputTypes.JSON.name())) {
				JSONObject xmlJSONObj = XML.toJSONObject(orignalResponse);
				String jsonPrettyPrintString = xmlJSONObj.toString(4);
				response = jsonPrettyPrintString;
			}

		}
	}
	
	/**
	 * Check the response contains values with given pattern specified in given XPaths
	 *
	 * @param table
	 * @throws AutomationException
	 */
	public void responseContainsValuesInPattern(DataTable table) throws AutomationException {

		String orignalResponse = "";
		try {
			for (List<String> items : table.asLists()) {
				if (items.size() > 1) {
					String key = items.get(0);
					String pattern = items.get(1);

					if (CommonApiUtils.getContentType(originalResponse)
							.contentEquals(ApiConstants.InputTypes.XML.name())
							|| CommonApiUtils.getContentType(originalResponse)
							.contentEquals(ApiConstants.InputTypes.JSON.name())) {

						if (CommonApiUtils.getContentType(originalResponse)
								.contentEquals(ApiConstants.InputTypes.JSON.name())) {
							JSONObject jsonObject = new JSONObject(response);

							// convert to xml
							response = XML.toString(jsonObject, ApiConstants.ROOT_NODE);
							orignalResponse = XML.toString(jsonObject);
						}

						String val = "";
						try {
							val = (String) CommonApiUtils.getXpathValue(key, XPathConstants.STRING,
									null, response);
						} catch (Exception e) {
							throw new AutomationException("Xpath is invalid " + e);
						}
						if (!Pattern.compile(pattern).matcher(val).matches()  ) {
							throw new AutomationException(
									"Xpath value is not in the given pattern. Given pattern:" + pattern + " Found value:"
											+ val);
						}

					} else {
						throw new AutomationException(String.format("Invalid content type"));
					}
				} else {
					throw new AutomationException("Expected a key value pair but found item with size : " + items.size());
				}
			}
		} finally {
			if (CommonApiUtils.getContentType(originalResponse)
					.contentEquals(ApiConstants.InputTypes.JSON.name())) {
				JSONObject xmlJSONObj = XML.toJSONObject(orignalResponse);
				String jsonPrettyPrintString = xmlJSONObj.toString(4);
				response = jsonPrettyPrintString;
			}

		}
	}

	/**
	 * Check the response contains given values specified in given JSONPath
	 *
	 * @param table
	 * @throws AutomationException
	 */
	public void responseContainsWithJsonPath(DataTable table) throws AutomationException {
		DocumentContext context = JsonPath.parse(response);
		for (List<String> items : table.asLists()) {
			if (items.size() > 1) {
				String key = items.get(0);
				String value = items.get(1);

				String val = context.read(key);
				if (!value.equalsIgnoreCase(val)) {
					throw new AutomationException(
							"Xpath value mismatch. Expected one:" + value + " Actual one:" + val);
				}
			}
		}
	}
	
	/** 
	 * Check whether the response matches the given Regular expression specified in the given JSONPath
	 *
	 * @param table
	 * @throws AutomationException
	 */
	public void responseContainsFieldWithJsonPath(DataTable table) throws AutomationException {
		DocumentContext context = JsonPath.parse(response);
		for (List<String> items : table.asLists()) {
			if (items.size() > 1) {
				String key = items.get(0);
				String expectedValue = items.get(1);
				String actualValue = context.read(key);
				if (!Pattern.matches(expectedValue, actualValue)) {
					throw new AutomationException(
							"JSON Path value mismatch. Expected :" + expectedValue + " Actual :"
									+ actualValue);
				}
			} else {
				throw new AutomationException("Expected a key value pair but found item with size : " + items.size());
			}			
		}
	}

	/**
	 * Check the response status code is mattched with given status code
	 *
	 * @param statusCode
	 * @throws AutomationException
	 */
	public void responseStatusCodeIs(String statusCode) throws AutomationException {
		int code = originalResponse.getStatusLine().getStatusCode();
		if (!Integer.toString(code).equalsIgnoreCase(statusCode)) {
			throw new AutomationException(
					"Status code mismatch. Expected one:" + statusCode + " Actual one:" + code,
					response);
		}
	}

	/**
	 * Check the response headers have given values in given header name
	 *
	 * @param table
	 * @throws AutomationException
	 */
	public void responseHeadersHave(DataTable table) throws AutomationException {

		for (List<String> items : table.asLists()) {
			if (items.size() > 1) {
				String key = items.get(0);
				String value = items.get(1);

				if (originalResponse.getHeaders(key).length > 1) {
					throw new AutomationException("response header is missing with key:" + key);
				}
				if (!originalResponse.getHeaders(key)[0].getValue().equalsIgnoreCase(value)) {
					throw new AutomationException(
							"response code is mismatched. Expected " + value + " Actual:"
									+ originalResponse.getHeaders(key)[0].getValue());
				}
			}
		}

	}

	/**
	 * Set Authentication for basic Authentication enactor.auth.Username and
	 * enactor.auth.Password are needed to pass as key values pairs
	 *
	 * @param table
	 * @throws AutomationException
	 */
	public void authorisationTokensSet(DataTable table) throws AutomationException {

		RestBasicAuthenticationHandler authHandler = new RestBasicAuthenticationHandler();
		for (List<String> items : table.asLists()) {
			if (items.size() > 1) {
				String key = items.get(0);
				String value = items.get(1);
				if (key.equalsIgnoreCase(RestBasicAuthenticationHandler.AUTHENTICATION_USERNAME)
						|| key.equalsIgnoreCase(
						RestBasicAuthenticationHandler.AUTHENTICATION_PASSWORD)) {
					restEndpoint.setProperty(key, value);
				}
			}
		}
		authenticationHandler = authHandler;
	}

	/**
	 * Compare the response body with given content
	 *
	 * @param comapringContent
	 * @throws Exception
	 */
	public void responseBodyExactlyMatches(String comparingContent) throws Exception {
		if (CommonApiUtils.getContentType(originalResponse)
				.contentEquals(ApiConstants.InputTypes.XML.name())) {

			Diff myDiff = DiffBuilder.compare(response).withTest(comparingContent)
					.withNodeMatcher(new DefaultNodeMatcher(ElementSelectors.byName))
					.withComparisonController(ComparisonControllers.StopWhenDifferent)
					.ignoreComments()
					.ignoreWhitespace().checkForSimilar().build();

			if (myDiff.hasDifferences()) {
				throw new AutomationException("Xmls are not matching" + myDiff.getDifferences(), response);
			}

		} else if (CommonApiUtils.getContentType(originalResponse)
				.contentEquals(ApiConstants.InputTypes.JSON.name())) {
			// using Jackson compare
			ObjectMapper mapper = new ObjectMapper();
			mapper.enable(JsonParser.Feature.ALLOW_COMMENTS);
			JsonNode responseNode = mapper.readTree(response);
			JsonNode ComparingNode = mapper.readTree(comparingContent);
			if (!responseNode.equals(ComparingNode)) {
				throw new AutomationException(String.format("Json are not matching"), response);
			}

		} else {
			throw new AutomationException(String.format("Invalid content type"));
		}
	}

	/**
	 * Compare the response body with given content given from file content
	 *
	 * @param fileName
	 * @throws Exception
	 */
	public void responseBodyExactlyMatchesFromFile(String filename) throws Exception {

		String url = filePath + filename;
		String comparingContent = new String(FileUtils.getBytes(new File(url)));

		responseBodyExactlyMatches(comparingContent);
	}

	/**
	 * Compare the response body is a superset of given content
	 *
	 * @param comapringContent
	 * @throws Exception
	 */
	public void responseIsSupersetOf(String comparingContent) throws Exception {

		String orignalResponse = "";
		try {
			if (CommonApiUtils.getContentType(originalResponse)
					.contentEquals(ApiConstants.InputTypes.XML.name())) {

				Diff myDiff = DiffBuilder.compare(comparingContent).withTest(response)
						.withNodeMatcher(new DefaultNodeMatcher(ElementSelectors.byName))
						.ignoreComments()
						.ignoreWhitespace().build();
				// try to check whether this can be achieved using NodeFilters

				if (myDiff.hasDifferences()) {
					String finalDiff = "";
					boolean isDiffrence = false;
					for (Difference difference : myDiff.getDifferences()) {
						if (difference.getComparison().toString()
								.contains("Expected child nodelist length")
								|| difference.getComparison().toString()
										.contains("Expected child 'null' but was")
								|| difference.getComparison().toString()
										.contains("Expected child nodelist sequence")) {
							continue;
						}
						isDiffrence = true;
						finalDiff.concat(difference.getComparison().toString() + "/n");
					}

					if (isDiffrence) {
						throw new Exception("Xmls are not matching " + finalDiff);
					}

				}

			} else if (CommonApiUtils.getContentType(originalResponse)
	                   .contentEquals(ApiConstants.InputTypes.JSON.name())) {
	               // If the comparing JSON has additional fields or it has modified values for the existing fields
	               // response is not a superset of the comparing JSON
	               JsonValue responseJson = Json.createReader(originalResponse.getEntity().getContent()).readValue();
	               JsonValue comparingJson = Json.createReader(new StringReader(comparingContent)).readValue();
	 
	               JsonPatch differences = Json.createDiff(responseJson.asJsonObject(), comparingJson.asJsonObject());
	               differences.toJsonArray().forEach(difference -> {
	                   JsonObject diffJson = difference.asJsonObject();
	                   JsonValue diffOperation = diffJson.get("op");
	                   if (diffOperation.toString().equals("\"add\"") || diffOperation.toString().equals("\"replace\"")) {
	                       throw new AutomationException("Response is not a superset of the comparing json " + diffJson);
	                   }
	               });
	           }
	           else {
				throw new AutomationException(String.format("Invalid content type"));
	           }
		} finally {
			if (CommonApiUtils.getContentType(originalResponse)
					.contentEquals(ApiConstants.InputTypes.JSON.name())) {
				JSONObject xmlJSONObj = XML.toJSONObject(orignalResponse);
				String jsonPrettyPrintString = xmlJSONObj.toString(4);
				response = jsonPrettyPrintString;
			}
		}
	}

	/**
	 * Compare the response body is a superset of given content from file
	 *
	 * @param fileName
	 * @throws Exception
	 */
	public void responseIsSupersetOfFile(String filename) throws Exception {

		String url = filePath + filename;
		String comparingContent = new String(FileUtils.getBytes(new File(url)));

		responseIsSupersetOf(comparingContent);
	}

	/**
	 * Compare the response body with given schema file
	 *
	 * @param fileName
	 * @throws Exception
	 */
	public void responseIsValidWithSchema(String filename) throws Exception {

		String url = filePath + filename;
		String content = new String(FileUtils.getBytes(new File(url)));;

		if (CommonApiUtils.getContentType(originalResponse)
				.contentEquals(ApiConstants.InputTypes.XML.name())) {
			InputStream xml = new ByteArrayInputStream(response.getBytes());
			InputStream xsd = new ByteArrayInputStream(content.getBytes());

			boolean isValid = CommonApiUtils.validateXMLSchema(xml, xsd);

			if (!isValid) {
				throw new AutomationException(
						String.format("response does not match with schema file"));
			}
		} else if (CommonApiUtils.getContentType(originalResponse)
				.contentEquals(ApiConstants.InputTypes.JSON.name())) {

			ObjectMapper mapper = new ObjectMapper();

			JsonNode node = mapper.readTree(content);
			JsonNode responseNode = mapper.readTree(response);

			JsonSchemaFactory factory = JsonSchemaFactory.byDefault();
			JsonSchema schema = factory.getJsonSchema(node);

			schema.validate(responseNode);

		} else {
			throw new AutomationException(String.format("Invalid content type"));
		}
	}

	/**
	 * Compare the variable contains given values in given Xpath
	 *
	 * @param variable
	 * @param table
	 * @throws Exception
	 */
	public void variableContains(String variable, DataTable table) throws AutomationException {

		Object obj = null;
		Node node = null;
		if (propertyMap.containsKey(variable)) {
			throw new AutomationException(
					String.format("Sting type object cannot use for checking subset equality"));
		} else if (mapNodes.containsKey(variable)) {
			obj = mapNodes.get(variable);
			node = (Node) obj;
		}

		for (List<String> items : table.asLists()) {
			if (items.size() > 1) {
				String key = items.get(0);
				String value = items.get(1);

				try {
					String val = (String) CommonApiUtils
							.getXpathValue(key, XPathConstants.STRING, node,
									response);
					if (!value.equalsIgnoreCase(val)) {
						throw new AutomationException(
								"Xpath value mismatch. Expected one:" + value + " Actual one:"
										+ val);
					}
				} catch (Exception e) {
					throw new AutomationException("Error occured" + e);
				}
			}
		}
	}

	/**
	 * Compare the variable contains given values in given Xpath
	 *
	 * @param variable
	 * @param filename
	 * @throws Exception
	 */
	public void variableIsSupersetOfFile(String variable, String filename) throws Exception {

		String url = filePath + filename;
		String comparingContent = new String(FileUtils.getBytes(new File(url)));

		Object obj = null;
		String content = "";
		if (propertyMap.containsKey(variable)) {
			throw new AutomationException(
					String.format("Sting type object cannot use for checking subset equality"));
		} else if (mapNodes.containsKey(variable)) {
			obj = mapNodes.get(variable);
			content = CommonApiUtils
					.removeXmlStringNamespaceAndPreamble(CommonApiUtils.getStringFromNodes(obj));

			if (filename.contains(".json")) {
				// convert given json into xml
				JSONObject jsonObject = new JSONObject(comparingContent);
				comparingContent = XML.toString(jsonObject);

			} else if (filename.contains(".xml")) {
				comparingContent = CommonApiUtils
						.removeXmlStringNamespaceAndPreamble(comparingContent);
			} else {
				throw new Exception("Invalid input file type.");
			}

			// superset checkup
			Diff myDiff = DiffBuilder.compare(comparingContent).withTest(content)
					.withNodeMatcher(new DefaultNodeMatcher(ElementSelectors.byName))
					.ignoreComments()
					.ignoreWhitespace().build();
			// try to check whether this can be achieved using NodeFilters

			if (myDiff.hasDifferences()) {
				String finalDiff = "";
				boolean isDiffrence = false;
				for (Difference difference : myDiff.getDifferences()) {
					if (difference.getComparison().toString()
							.contains("Expected child nodelist length")
							|| difference.getComparison().toString()
									.contains("Expected child nodelist sequence")
							|| difference.getComparison().toString()
									.contains("Expected child 'null' but was")) {
						continue;
					}
					isDiffrence = true;
					finalDiff = finalDiff.concat(difference.getComparison().toString() + "\n");
				}

				if (isDiffrence) {
					throw new Exception("Xmls are not matching" + finalDiff);
				}
			}
		}
	}

	/**
	 * Compare the variable is a superset of content Content type is also should
	 * provide
	 *
	 * @param variable
	 * @param ComparingContent
	 * @param type
	 * @throws Exception
	 */
	public void variableIsSupersetOfWithContent(String variable, String comparingContent,
			String type)
			throws Exception {

		// get the variable from map
		Object obj = null;
		String content = "";
		if (propertyMap.containsKey(variable)) {
			throw new AutomationException(
					String.format("Sting type object cannot use for checking subset equality"));
		} else if (mapNodes.containsKey(variable)) {
			obj = mapNodes.get(variable);
			content = CommonApiUtils
					.removeXmlStringNamespaceAndPreamble(CommonApiUtils.getStringFromNodes(obj));

			if (type.equalsIgnoreCase(ApiConstants.InputTypes.XML.name())) {
				comparingContent = CommonApiUtils
						.removeXmlStringNamespaceAndPreamble(comparingContent);
			} else if (type.equalsIgnoreCase(ApiConstants.InputTypes.JSON.name())) {
				// convert given json into xml
				JSONObject jsonObject = new JSONObject(comparingContent);
				comparingContent = XML.toString(jsonObject);
			} else {
				throw new Exception("Invalid input file type.");
			}

			// superset checkup
			Diff myDiff = DiffBuilder.compare(comparingContent).withTest(content)
					.withNodeMatcher(new DefaultNodeMatcher(ElementSelectors.byName))
					.ignoreComments()
					.ignoreWhitespace().build();
			// try to check whether this can be achieved using NodeFilters

			if (myDiff.hasDifferences()) {
				String finalDiff = "";
				boolean isDiffrence = false;
				for (Difference difference : myDiff.getDifferences()) {
					if (difference.getComparison().toString()
							.contains("Expected child nodelist length")
							|| difference.getComparison().toString()
									.contains("Expected child nodelist sequence")
							|| difference.getComparison().toString()
									.contains("Expected child 'null' but was")) {
						continue;
					}
					isDiffrence = true;
					finalDiff = finalDiff.concat(difference.getComparison().toString() + "\n");
				}

				if (isDiffrence) {
					throw new Exception("Xmls are not matching" + finalDiff);
				}
			}
		}
	}

	/**
	 * Check idempotency of JSON -> XML -> JSON
	 *
	 * @param ComparingContent
	 * @throws Exception
	 */
	public void checkIdempotencyOfTheJSONTransaction(String comparingContent) throws Exception {

		JSONObject jsonObject = new JSONObject(comparingContent);
		String xml = XML.toString(jsonObject);

		JSONObject xmlJSONObj = XML.toJSONObject(xml);
		String jsonPrettyPrintString = xmlJSONObj.toString(4);

		// json compare
		// using Jackson compare
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(JsonParser.Feature.ALLOW_COMMENTS);
		JsonNode responseNode = mapper.readTree(jsonPrettyPrintString);
		JsonNode ComparingNode = mapper.readTree(comparingContent);
		if (!responseNode.equals(ComparingNode)) {
			throw new AutomationException(String.format("Json are not matching"));
		}

	}

	/**
	 * Check idempotency of JSON -> XML -> JSON input is given as file content
	 *
	 * @param filename
	 * @throws Exception
	 */
	public void checkIdempotencyOfTheJSONTransactionFromFile(String filename) throws Exception {

		String url = filePath + filename;
		String comparingContent = new String(FileUtils.getBytes(new File(url)));

		/*
		 * Limitations to address 1. cannot compare values when array order is
		 * different.
		 */

		checkIdempotencyOfTheJSONTransaction(comparingContent);
	}

	/**
	 * Check idempotency of XML ->JSON -> XML
	 *
	 * @param ComparingContent
	 * @throws Exception
	 */
	public void checkIdempotencyOfTheXMLTransaction(String comparingContent) throws Exception {

		String formattedContent = CommonApiUtils
				.removeXmlStringNamespaceAndPreamble(comparingContent);
		JSONObject xmlJSONObj = XML.toJSONObject(formattedContent);
		String jsonPrettyPrintString = xmlJSONObj.toString(4);

		JSONObject jsonObject = new JSONObject(jsonPrettyPrintString);
		String xml = XML.toString(jsonObject);

		/*
		 * Limitations to address 1. if Json have values like 2.0 , 0.0 it will be
		 * converted into 2, 0 in converted Json 2. Arrays content 3. <regionId
		 * groupHierarchyId="All" groupTypeId="region">UK</regionId> those kind of tags
		 * are having issues
		 */
		Diff myDiff = DiffBuilder.compare(xml).withTest(formattedContent)
				.withNodeMatcher(new DefaultNodeMatcher(ElementSelectors.byName))
				.withComparisonController(ComparisonControllers.StopWhenDifferent).ignoreComments()
				.ignoreWhitespace()
				.checkForSimilar().build();

		if (myDiff.hasDifferences()) {
			throw new AutomationException("Xmls are not matching" + myDiff.getDifferences());
		}

	}

	/**
	 * Check idempotency of XML ->JSON -> XML input is given as file content
	 *
	 * @param filename
	 * @throws Exception
	 */
	public void checkIdempotencyOfTheXMLTransactionFromFile(String filename) throws Throwable {

		String url = filePath + filename;
		String comparingContent = new String(FileUtils.getBytes(new File(url)));
		checkIdempotencyOfTheXMLTransaction(comparingContent);
	}
	

	/**
	 * Requires a data table including identityServerTokenUrl, clientId and
	 * ClientSecret
	 * 
	 * @param isUrl
	 * @param clientId
	 * @param clientSecret
	 * @throws AutomationException
	 */
	public void getAccessTokenFromIdentityServer(String isUrl, String clientID, String secret)
			throws AutomationException {
		String resolvedBaseUrl = StringUtils.resolvePlaceholdersWithMap(isUrl, propertyMap);
		String identityServerTokenUrl = resolvedBaseUrl != null ? resolvedBaseUrl : isUrl;
		String clientId = StringUtils.resolvePlaceholdersWithMap(clientID, propertyMap);
		String clientSecret = StringUtils.resolvePlaceholdersWithMap(secret, propertyMap);
		String tokenUri = UriBuilder.fromUri(identityServerTokenUrl)
				.queryParam(GRANT_TYPE_QUERY_NAME, GRANT_TYPE_QUERY_VALUE_CLIENT_CREDS).toString();
		Client client = ClientBuilder.newClient();
		String authHeaderValue = DatatypeConverter
				.printBase64Binary((clientId + ":" + clientSecret).getBytes(StandardCharsets.UTF_8));

		Response response = client.target(tokenUri)
				.request(MediaType.APPLICATION_JSON_TYPE.withCharset(StandardCharsets.UTF_8.toString()))
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_FORM_URLENCODED_TYPE)
				.header(HttpHeaders.AUTHORIZATION, "Basic " + authHeaderValue).post(null);

		String accessTokenStr = response.readEntity(String.class);
		JSONObject jsonObject = new JSONObject(accessTokenStr);
		if (StringUtils.contains(identityServerTokenUrl, "login")) {
			try {
				URL url = new URL(jsonObject.getString("redirect"));
				String[] urlParams = url.getQuery().split("&");
				if (StringUtils.contains(urlParams[0], "id_token")) {
					String jwt = urlParams[0].split("=")[1];
					setupAccessToken(jwt);
				}
			} catch (MalformedURLException e) {
				logger.log(Logger.LOG_DEBUG, "Error retrieving jwt token", e);
				throw new AutomationException("Error retrieving jwt token ", e);

			}
		} else {
			setupAccessToken(jsonObject.getString(ACCESS_TOKEN_JSON_KEY));
		}

	}
	

    /**
     * get data from test data file
     *
     * @param name
     * @return string
     */
    public String getTestDataValue(String name) {
    	String key = convertToKeyString(name);
    	return TestDataConfig.getInstance().getString(key);
    }

	/**
	 * Convert a given string to a hyphened upper case word E.g. "My Configurations       Page" = >
	 * "MY_CONFIGURATIONS_PAGE"
	 *
	 * @param label
	 * @return
	 */
	public static String convertToKeyString(String label) {
		return convertToKeyString(label, false);
	}

	/**
	 * Convert a given string to a hyphened upper case word E.g. "My Configurations       Page" = >
	 * "my_configurations_page" if toAllCaps is true then Page" = > "MY_CONFIGURATIONS_PAGE"
	 *
	 * @param label
	 * @param toAllCaps
	 * @return
	 */
	private static String convertToKeyString(String label, boolean toAllCaps) {
		String key = StringUtils.emptyString();
		if (label != null) {
			key = label.replaceAll("\\s+", " ");
			if (toAllCaps) {
				key = key.replaceAll("\\s+", "_");
				key = key.toUpperCase();
			} else {
				key = key.replaceAll("\\s+", "_");
			}
		}
		return key;
	}
    

}
