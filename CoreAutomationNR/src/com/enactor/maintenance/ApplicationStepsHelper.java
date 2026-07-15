package com.enactor.maintenance;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.cucumber.conetxt.ScenarioContext;
import com.enactor.core.processConnections.HttpQueueProviderEndpointReference;
import com.enactor.core.processConnections.IHttpQueueProviderEndpointReference;
import com.enactor.core.queues.QueueException;
import com.enactor.core.queues.connection.IQueueConnectionFactory;
import com.enactor.core.utilities.FileUtils;
import com.enactor.core.utilities.StringUtils;
import com.enactor.coreUI.processes.UIProcessException;
import com.enactor.coreUI.selenium.SeleniumConfig;
import com.enactor.messageService.AcknowledgementMethod;
import com.enactor.messageService.IMessageServiceConnection;
import com.enactor.messageService.IMessageServiceSession;
import com.enactor.messageService.IMessageWriter;
import com.enactor.messageService.HTTP.HTTPMessageServiceConnectionFactory;
import com.enactor.messageService.message.ITextMessage;

/**
 * Application Specific Steps
 * @author Gayan Kavirathne
 *
 */
public class ApplicationStepsHelper extends BaseWebSteps{
	
	public ApplicationStepsHelper(ScenarioContext scenarioContext) {
		super(scenarioContext);
	}

	private static final String COOKIE_DEVICE_ID = "clientID";
	private static final String TRANSACTION_ID_PROPERTY = "transactionId";

	/**
	 * Add device Id cookie to web maintenance
	 *
	 * @throws AutomationException
	 */
	public void addCookies() throws AutomationException {
		getController().addCookie(COOKIE_DEVICE_ID, SeleniumConfig.getInstance().get("valid.device.id"));
		getController().reloadPage(SeleniumConfig.getInstance().getPageUrl());
	}
	
	/**
	 * write xml to queue
	 * 
	 * @param filepath
	 * @param queueName
	 * @param serviceUrl
	 * @param clientId
	 * @throws AutomationException
	 * @throws UIProcessException 
	 */
	public void writeXmlToQueue(String filepath, String queueName, String clientId)
			throws AutomationException, UIProcessException {
		IMessageServiceConnection connection = null;
		IMessageServiceSession session = null;
		boolean success = false;
		
		try {
			IQueueConnectionFactory factory = new HTTPMessageServiceConnectionFactory();
			IHttpQueueProviderEndpointReference reference = new HttpQueueProviderEndpointReference();
			reference.setUrl(SeleniumConfig.getInstance().get("Server.WebCore.URL.Base") + "/WebCore/HTTPMessageServiceServlet");
			connection = (IMessageServiceConnection) factory.createConnection(clientId,
					reference);
			session = (IMessageServiceSession) connection.getSession(AcknowledgementMethod.AUTO_ACKNOWLEDGE);
			connection.open();

			String xmlMessage = null;
			try {
				xmlMessage = new String(FileUtils.getBytes(new File(filepath)));
				xmlMessage = StringUtils.resolvePlaceholdersWithMap(xmlMessage, propertyMap);
			} catch (IOException e) {
				throw new AutomationException("Error reading the file " + e);
			}
			ITextMessage textMessage = session.createTextMessage();
			textMessage.setText(xmlMessage);
			textMessage.setDestination(queueName);
			textMessage.setSender(resolveData(clientId));
			IMessageWriter writer = (IMessageWriter) session.getQueueWriter(queueName);
			writer.write(textMessage);
			success = true;

		} catch (Exception e) {
			throw new AutomationException("An error occured " + e);
		} finally {
			try {
				if (session != null) {
					if (success) {
						session.commit();
					} else {
						session.rollback();
					}
				}
			} catch (QueueException e) {
				throw new UIProcessException(e, UIProcessException.ERROR_RUNNING_ACTION,
						"Failed to commit queue session.");
			}

			if (connection != null) {
				try {
					connection.close();
				} catch (QueueException e) {
					throw new UIProcessException(e, UIProcessException.ERROR_RUNNING_ACTION,
							"Failed to close queue connection.");
				}
			}
		}

	}	
}
