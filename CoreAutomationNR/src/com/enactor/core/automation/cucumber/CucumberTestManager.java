package com.enactor.core.automation.cucumber;

import javax.xml.namespace.QName;

import com.enactor.core.entities.IEntity;
import com.enactor.core.entities.IEntityKey;
import com.enactor.core.entities.IKeyedEntity;
import com.enactor.core.factories.EntityFactory;
import com.enactor.core.factories.UnknownEntityException;
import com.enactor.core.factories.UnknownServerException;
import com.enactor.core.integration.IntegrationTestHelper;
import com.enactor.core.servers.EntityServerProxy;
import com.enactor.core.servers.IServer;

/**
 * A manager class to share data among step files
 * 
 * @author Hirantha Bandara
 *
 */
public class CucumberTestManager {

	private static CucumberTestManager instance;

	private CucumberTestManager() throws Exception {
		IntegrationTestHelper.createConfig(CucumberTestManager.class.getSimpleName());
		IntegrationTestHelper.initialise(CucumberTestManager.class.getClassLoader(), "CoreAutomation");
	}

	/**
	 * Returns an instance
	 * 
	 * @return
	 * @throws Exception
	 */
	public static CucumberTestManager getInstance() throws Exception {
		if (instance == null) {
			instance = new CucumberTestManager();
		}
		return instance;
	}

	/**
	 * Register the given package
	 * 
	 * @param packageId
	 * @throws Exception
	 */
	public void registerPackage(String packageId) throws Exception {
		IntegrationTestHelper.initialise(CucumberTestManager.class.getClassLoader(), packageId);
	}

	/**
	 * Returns a server instance
	 * 
	 * @param entityName
	 * @return
	 * @throws UnknownServerException
	 */
	public IServer<IEntityKey, IKeyedEntity<IEntityKey>> getServer(QName entityName) throws UnknownServerException {
		return EntityServerProxy.getServer(entityName);
	}

	/**
	 * Returns an entity instance
	 * 
	 * @param entityName
	 * @return
	 * @throws UnknownEntityException
	 */
	public IEntity getEntity(QName entityName) throws UnknownEntityException {
		return EntityFactory.getInstance().getEntityByName(entityName);
	}

}
