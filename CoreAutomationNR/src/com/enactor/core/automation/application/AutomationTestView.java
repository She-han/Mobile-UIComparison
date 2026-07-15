package com.enactor.core.automation.application;

import com.enactor.core.application.process.IApplicationProcessData;
import com.enactor.core.application.process.IApplicationProcessOutcome;
import com.enactor.coreUI.console.ConsoleView;
import com.enactor.coreUI.processes.UIProcessException;

/**
 * 
 * View used by the automation test runner.
 * 
 * @author andy
 *
 */
public class AutomationTestView extends ConsoleView implements IAutomationTestView {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * @param mainViewId
	 */
	public AutomationTestView(String mainViewId) {
		super(mainViewId);
	}


	@Override
	public IApplicationProcessOutcome startTestProcess(String processID, IApplicationProcessData processData) throws UIProcessException {

		return getProcessRunner().startProcess(processID, processData);

	}
	

}
