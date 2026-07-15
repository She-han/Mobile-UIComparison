package com.enactor.core.automation.test;


import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import com.enactor.core.TestGroups;
import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.application.AutomationTestApplication;
import com.enactor.coreUI.processes.CoreUIOutcomes;

/**
 * Implementation of a TestNG based Test Case for launching the supplied test process Id.
 * 
 * 
 * @author andy
 *
 */
public class AutomationProcessTestCase{

	@BeforeClass
	public void setUp() throws Exception {
		
	}
	
	@AfterClass
	public void tearDown() throws Exception {
		
	}
	
	
	@Test(groups={TestGroups.NIGHTLY})
	@Parameters({"testProcessId", "autLaunchCommand", "autHostName", "autRMIPort"})
	public void test(String testProcessId, String autLaunchCommand, String autHostName, String autRMIPort) throws AutomationException {
		
		//Make an application instance
		AutomationTestApplication application = new AutomationTestApplication();
		
		application.setTestProcessId(testProcessId);
		application.setAUTLaunchCommand(autLaunchCommand);
		application.setAUTHostName(autHostName);
		application.setAUTRMIPort(autRMIPort);

		//Don't use DB
		application.setUseDatabase(false);
		
		// Run the application
		application.run();
		
		if (application.getTestProcessOutcome()!=CoreUIOutcomes.SUCCESS_OUTCOME){
			throw new AutomationException("Failed to run test process ID " + testProcessId);
		}
		
	}

}
