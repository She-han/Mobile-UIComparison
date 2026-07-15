package com.enactor.core.automation.api;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.xml.XMLConstants;
import javax.xml.namespace.QName;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Validator;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import com.enactor.core.json.rest.EnactorRestMediaTypes;
import com.enactor.core.utilities.Logger;
import com.enactor.core.utilities.XMLUtils;

import org.apache.http.Header;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.entity.ContentType;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.ls.DOMImplementationLS;
import org.w3c.dom.ls.LSSerializer;
import org.xml.sax.SAXException;

/**
 * API Automation common utilities.
 *
 * @author harsha
 */
public class CommonApiUtils {

	private static final Logger logger = Logger.getLogger(CommonApiUtils.class.getName());

	/**
	 * Get the type of response whether XML or JSON based on content types
	 * Default to XML if response is not found.
	 * Return Invalid type if response is found but type is not either JSON or XML
	 *
	 * @param originalResponse
	 * @return String type of response (XML or JSON)
	 */
	public static String getContentType(HttpResponse originalResponse) {
		if (originalResponse != null) {
			Header[] headers = originalResponse.getHeaders(HttpHeaders.CONTENT_TYPE);
			if (headers.length > 0) {
				String type = headers[0].getValue();
				if (type.contains(ContentType.APPLICATION_XML.getMimeType())) {
					return ApiConstants.InputTypes.XML.name();
				}
				if (type.contains(ContentType.APPLICATION_JSON.getMimeType())
						|| type.contains(EnactorRestMediaTypes.APPLICATION_TYPED_JSON) || type.contains(EnactorRestMediaTypes.APPLICATION_ENTITY_JSON)) {
					return ApiConstants.InputTypes.JSON.name();
				}
			}
			return ApiConstants.InputTypes.INVALID.name();
		}
		return ApiConstants.InputTypes.XML.name();

	}

	/**
	 * Get the XPath value
	 * 
	 * @param property XPath expression
	 * @param qName Xpath Type
	 * @param node Node if we get XPath from Node, else null
	 * @param response response body
	 * @return Object output
	 */
	public static Object getXpathValue(String property, QName qName, Node node, String response)
			throws Exception {

		XPathFactory xpathfactory = XPathFactory.newInstance();
		XPath xpath = xpathfactory.newXPath();

		XPathExpression expr = xpath.compile(property);
		Object result = null;
		if (node == null) {

			DocumentBuilderFactory factory = XMLUtils.createDocumentBuilderFactory();
			DocumentBuilder builder = factory.newDocumentBuilder();

			Document doc = builder.parse(new ByteArrayInputStream(response.getBytes()));
			result = expr.evaluate(doc, qName);
		} else {
			result = expr.evaluate(node, qName);
		}

		return result;
	}

	/**
	 * Validate XML schema
	 *
	 * @param xml input to verify
	 * @param xsd comparing xsd
	 * @return boolean validate or not
	 */
	public static boolean validateXMLSchema(InputStream xml, InputStream xsd) {
		try {
			Validator validator = XMLUtils.createSchemaValidator(XMLConstants.W3C_XML_SCHEMA_NS_URI, xsd);
			validator.validate(new StreamSource(xml));
		} catch (IOException e) {
			logger.log(Logger.LOG_ERROR, "Exception: " + e.getMessage());
			return false;
		} catch (SAXException ex) {
			logger.log(Logger.LOG_ERROR, "SAX Exception: " + ex.getMessage());
			return false;
		}

		return true;

	}

	/**
	 * Remove namespaces from xml
	 *
	 * @param xmlString
	 * @return String namespace removed output
	 */
	public static String removeXmlStringNamespaceAndPreamble(String xmlString) {
		return xmlString.replaceAll("(<\\?[^<]*\\?>)?", "") /* remove preamble */
				.replaceAll("xmlns.*?(\"|\').*?(\"|\')", "") /* remove xmlns declaration */
				.replaceAll("(<)(\\w+:)(.*?>)", "$1$3") /* remove opening tag prefix */
				.replaceAll("(</)(\\w+:)(.*?>)", "$1$3"); /* remove closing tags prefix */
	}

	/**
	 * Get String xml from the Node object
	 *
	 * @param input Node object
	 * @return String xml string
	 */
	public static String getStringFromNodes(Object input) throws Exception {
		DocumentBuilderFactory factory = XMLUtils.createDocumentBuilderFactory();	
		factory.setNamespaceAware(false);
		Document newXmlDocument = factory.newDocumentBuilder().newDocument();

		if (input instanceof Node) {
			Node node = (Node) input;
			Node copyNode = (Node) newXmlDocument.importNode(node, true);
			newXmlDocument.appendChild(copyNode);
		}

		DOMImplementationLS domImplementationLS = (DOMImplementationLS) newXmlDocument
				.getImplementation();
		LSSerializer lsSerializer = domImplementationLS.createLSSerializer();
		String string = lsSerializer.writeToString(newXmlDocument);

		return string;
	}

}
