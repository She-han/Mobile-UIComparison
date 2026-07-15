package com.enactor.core.automation.application;

import com.enactor.core.application.process.IApplicationProcessData;
import com.enactor.core.application.process.IApplicationProcessOutcome;
import com.enactor.coreUI.console.IConsoleView;
import com.enactor.coreUI.processes.UIProcessException;

/**
 * View for the automation test runner.
 * 
 * @author andy
 *
 */
public interface IAutomationTestView extends IConsoleView{

	public IApplicationProcessOutcome startTestProcess(String processId, IApplicationProcessData processData) throws UIProcessException ;
	
}
