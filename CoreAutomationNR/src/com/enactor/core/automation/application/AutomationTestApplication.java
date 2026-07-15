package com.enactor.core.automation.application;

import java.io.File;

import com.enactor.core.application.process.ApplicationProcessData;
import com.enactor.core.application.process.ApplicationProcessDataType;
import com.enactor.core.application.process.ApplicationProcessException;
import com.enactor.core.application.process.IApplicationProcessData;
import com.enactor.core.application.process.IApplicationProcessOutcome;
import com.enactor.core.classloader.ApplicationClassLoader;
import com.enactor.core.database.DataAccessContext;
import com.enactor.core.entities.dynamic.factories.DynamicEntityClassFactory;
import com.enactor.core.jndi.InMemoryJNDIInitialiser;
import com.enactor.core.persistence.FileEntityPersister;
import com.enactor.core.utilities.CorePropertyConfigs;
import com.enactor.core.utilities.Logger;
import com.enactor.core.utilities.PackageDeployerUtil;
import com.enactor.core.utilities.PropertyRegistry;
import com.enactor.core.utilities.StringUtils;
import com.enactor.coreUI.console.ConsoleApplication;
import com.enactor.coreUI.deployment.CoreUIPackageDeploymentContext;
import com.enactor.coreUI.processes.IUIProcessRunner;
import com.enactor.coreUI.processes.UIProcessContext;
import com.enactor.coreUI.processes.UIProcessException;
import com.enactor.coreUI.processes.UIProcessRunner;
import com.enactor.coreUI.prompts.IPromptView;
import com.enactor.coreUI.swing.ISwingView;
import com.enactor.coreUI.swing.SwingTemplateView;
import com.enactor.coreUI.views.ViewException;

public class AutomationTestApplication extends ConsoleApplication {


	/** Application name */
	public static final String APPLICATION_NAME = "Automation Test Application";

	/** Deployment Context Name */
	private static final String DEPLOYMENT_CONTEXT_NAME = "Automation Test Application";
	
	/** ID of the main view */
	public static final String MAIN_VIEW_ID = "Automation";

	/** Startup Process ID */
	private static final String START_UP_PROCESS_ID = "Automation/StartAUT";

	private static final Logger logger = Logger.getLogger(AutomationTestApplication.class);
	
	/**
	 * The process under test.
	 */
	private static String testProcessId = START_UP_PROCESS_ID;

	/**
	 * The process under test.
	 */
	private static String autLaunchCommand = null;

	/**
	 * The Host Name of the AUT Controller server
	 */
	private static String autHostName = null;

	/**
	 * The RMI Port of the AUT Controller server
	 */
	private static String autRMIPort = null;

	/**
	 * 
	 */
	private static String deploymentContext = DEPLOYMENT_CONTEXT_NAME;
	
	
	private IApplicationProcessOutcome outcome = null;
	
	
	/***************************************************************************
	 * Main
	 **************************************************************************/

	/**
	 * Main
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

		//Help ?
		if (testHelp(args)){
			System.out.println("Automation Application");		
			System.out.println("Usage: -testProcessId={Test Process Id} -autLaunchCommand={AUT Launch Command}");
			printAutomationParams();
			System.exit(0);
		}
		
		System.out.println("Starting Automation Application with the following paramters: " + args);		
		
		
		//Make an application instance
		AutomationTestApplication application = new AutomationTestApplication();
		
		//Set Test parameters
		processTestParamters(args, application);

		//Force single step
		//application.setSingleStep(true);

		//Don't use DB
		application.setUseDatabase(false);
		
		// Run the application
		application.run();

	}

	

	private static void processTestParamters(String[] args,
			AutomationTestApplication application) {
		
		for (int i = 0; i < args.length; i++) {

			String arg = args[i];
			if (arg.startsWith("-")) {

				String value = null;

				if (arg.indexOf("=") != -1) {
					arg = arg.substring(0, arg.indexOf("="));
					value = args[i].substring(args[i].indexOf("=") + 1);
				}
				
				
				if (arg.equals("-testProcessId") && value != null){
					testProcessId  = value;
				}
				
				if (arg.equals("-autLaunchCommand") && value != null){
					autLaunchCommand  = value;
				}
				
				if (arg.equals("-autHostName") && value != null){
					autHostName  = value;
				}
				
				if (arg.equals("-autRMIPort") && value != null){
					autRMIPort  = value;
				}
			}
		}
		
	}

	/**
	 * Run the application
	 */
	@Override
	public void run() {

		try {
			// Initialise the logger
			Logger.initialise(getDeploymentContextName());

			//Initialise JNDI
			InMemoryJNDIInitialiser.init();
			
			// Set the context's data directory property
			PropertyRegistry.getCoreConfigs().setProperty(CorePropertyConfigs.COMMON_APPLICATION_DATA_HOME, PropertyRegistry.getApplicationHome() + File.separatorChar + FileEntityPersister.DATA_DIR + File.separatorChar + getDeploymentContextName());
			
			final ApplicationClassLoader appClassLoader = new ApplicationClassLoader(DynamicEntityClassFactory.getDefaultOutputFolder(true), Thread.currentThread().getContextClassLoader());
			Thread.currentThread().setContextClassLoader(appClassLoader);

			//This stops these managers from trying to use the database behind the scenes...
			DataAccessContext.setDatabaseAvailable(false);

			// Code to update packages...
			start(new Runnable() {
				@Override
				public void run() {

					/**
					 * Ensure that the context class loader is set on the thread.
					 * 
					 * This is required as some times the thread context loader isn't passed
					 * through to the new thread.
					 * 
					 */
					ApplicationClassLoader.setContextClassLoader();
					
					String deployerContextName = getDeploymentContextName();
					// This sets up the necessary entity factories and config and saves our packages to the database
					try {
						Class.forName(PropertyRegistry.getCoreConfigs().getProperty("ExecutorFactory", "com.enactor.core.executor.DefaultExecutorFactory"));

						PackageDeployerUtil.processPackages(deployerContextName, new CoreUIPackageDeploymentContext(deployerContextName, getClass().getClassLoader()), true, true);

						
					} catch (Exception e) {
						logger.log(Logger.LOG_ERROR, "Error deploying packages.", e);
						System.exit(1);
					}

				}
			});

			// Code to run the application
			start(new Runnable() {
				@Override
				public void run() {
					try {

						// Run the application
						runApp();

					} catch (UIProcessException e) {
						logger.log(Logger.LOG_ERROR, "Error running application.", e);
						System.exit(1);
					} catch (ViewException e) {
						logger.log(Logger.LOG_ERROR, "Error running application.", e);
						System.exit(1);
					}
				}
			});

		} catch (Exception e) {
			logger.log(Logger.LOG_ERROR, "Error starting POS application.", e);
			System.exit(1);
		}

	}


	/***************************************************************************
	 * Protected
	 **************************************************************************/

	
	private static void printAutomationParams() {
		System.out.println("    -testProcessId                   Test process to execute");
	}



	@Override
	protected void runApp() throws UIProcessException, ViewException {

		// Create the main view
		IAutomationTestView mainView = new AutomationTestView(testProcessId);
		mainView.addViewListener(AutomationTestApplication.this);
	
		// Make a new process runner and context...
		IUIProcessRunner processRunner = new UIProcessRunner(mainView);

		mainView.setProcessRunner(processRunner);

		// Make sure there is a context available during the view initialise
		UIProcessContext.makeContext(mainView.getProcessRunner(), mainView.getPrivilegeManager());
		mainView.initialise();
		
		IApplicationProcessData processData = initialiseProcessData();
		
		outcome = mainView.startTestProcess(testProcessId, processData);
	
	}
	
	
	/**
	 * @return
	 * @throws UIProcessException
	 */
	private IApplicationProcessData initialiseProcessData() throws UIProcessException{
		IApplicationProcessData processData = new ApplicationProcessData();
		try {
			if (StringUtils.notEmpty(autLaunchCommand)){
				processData.setData(new ApplicationProcessDataType("enactor.automation.AUTLaunchCommand", "java.lang.String"), autLaunchCommand);
			}
			
			if (StringUtils.notEmpty(autHostName)){
				processData.setData(new ApplicationProcessDataType("enactor.automation.AUTHostName", "java.lang.String"), autHostName);
			}
			
			if (StringUtils.notEmpty(autRMIPort)){
				processData.setData(new ApplicationProcessDataType("enactor.automation.AUTRMIPort", "java.lang.String"), autRMIPort);
			}
		} catch (ApplicationProcessException e) {
			throw new UIProcessException(e, "Failed to set process data.");
		}
		
		return processData;
	}



	@Override
	protected IPromptView createNewView(String viewId) throws ViewException {

		ISwingView view = null;

		if (viewId.equals(MAIN_VIEW_ID)) {			
			//view = new BasicSwingView();
			view = new SwingTemplateView(MAIN_VIEW_ID, null);
			view.setAllowMinimize(true);
		}

		return view;
	}

	@Override
	protected String getDeploymentContextName() {
		return deploymentContext;
	}
	
	public void setTestProcessId(String testProcessId) {
		AutomationTestApplication.testProcessId = testProcessId;
	}

	public void setAUTLaunchCommand(String autLaunchCommand) {
		AutomationTestApplication.autLaunchCommand = autLaunchCommand;
	}
	
	public void setAUTHostName(String autHostName) {
		AutomationTestApplication.autHostName = autHostName;
	}
	
	public void setAUTRMIPort(String autRMIPort) {
		AutomationTestApplication.autRMIPort = autRMIPort;
	}

	public IApplicationProcessOutcome getTestProcessOutcome() {
		return outcome;
	}

}
