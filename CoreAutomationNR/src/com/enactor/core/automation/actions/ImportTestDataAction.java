package com.enactor.core.automation.actions;

import java.io.InputStream;

import com.enactor.core.application.process.ApplicationProcessException;
import com.enactor.core.application.process.IApplicationProcessData;
import com.enactor.core.application.process.IApplicationProcessOutcome;
import com.enactor.core.data.importer.DataImportException;
import com.enactor.core.data.importer.IImportProcessor;
import com.enactor.core.data.importer.ImportProcessorFactory;
import com.enactor.core.utilities.Logger;
import com.enactor.coreUI.actions.IUIAction;
import com.enactor.coreUI.annotations.Input;
import com.enactor.coreUI.annotations.Inputs;
import com.enactor.coreUI.annotations.Outcomes;
import com.enactor.coreUI.annotations.Outputs;
import com.enactor.coreUI.processes.CoreUIOutcomes;
import com.enactor.coreUI.processes.UIProcessException;

@Inputs({ @Input(name = "enactor.automation.TestDataList", type = java.lang.String.class, required = true) })
@Outputs({})
@Outcomes({ "Success", "Fail" })
public class ImportTestDataAction implements IUIAction {

	/*******************************************************
	 * Constants
	 ******************************************************/

	/** Default Serial Version */
	private static final long serialVersionUID = 1L;
	private static final String TEST_DATA_HOME = "TestData";
	
	/*******************************************************
	 * Properties
	 ******************************************************/

	/** Logger */
	@SuppressWarnings("unused")
	private static Logger logger = Logger.getLogger(ImportTestDataAction.class
			.getName());

	/*******************************************************
	 * IUIAction Interface
	 ******************************************************/

	@Override
	public IApplicationProcessOutcome execute(
			IApplicationProcessData inputData,
			IApplicationProcessData outputData) throws UIProcessException,
			ApplicationProcessException {

		// Test Data List
		String testDataList = null;
		if (inputData.containsNotNullData("enactor.automation.TestDataList")) {
			testDataList = (String) inputData
					.getData("enactor.automation.TestDataList");
		} else {
			throw new UIProcessException(UIProcessException.MISSING_DATA,
					"The variable 'enactor.automation.TestDataList' is required as an input");
		}

		
		String[] testDataItems = testDataList.split(",");

		try {
			
			for (String testDataItem : testDataItems){
				
				InputStream is = this.getClass().getClassLoader().getResourceAsStream(TEST_DATA_HOME + "/" + testDataItem);
				
				if (is!=null){
					IImportProcessor processor = ImportProcessorFactory.getInstance().getImportProcessor("XML");
					
					processor.process(is, testDataItem, true, true, true);
				}
				
			}

		} catch (DataImportException e) {
			throw new ApplicationProcessException(e, "Failed to import test data.");
		}
		
		return CoreUIOutcomes.SUCCESS_OUTCOME;

	}

}
