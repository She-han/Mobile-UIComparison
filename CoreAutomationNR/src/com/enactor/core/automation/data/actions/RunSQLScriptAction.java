package com.enactor.core.automation.data.actions;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Statement;

import com.enactor.commonUI.CommonUIDataTypes;
import com.enactor.core.application.process.ApplicationProcessException;
import com.enactor.core.application.process.IApplicationProcessData;
import com.enactor.core.application.process.IApplicationProcessOutcome;
import com.enactor.core.automation.AutomationConstants;
import com.enactor.core.database.DataAccessContext;
import com.enactor.core.database.DatabaseUtils;
import com.enactor.core.database.DatasourceDataAccessSessionFactory;
import com.enactor.core.database.IDBConnection;
import com.enactor.core.database.IDataAccessSession;
import com.enactor.core.database.IDataAccessTransaction;
import com.enactor.core.factories.ISessionFactory;
import com.enactor.core.utilities.Logger;
import com.enactor.core.utilities.StringUtils;
import com.enactor.coreUI.actions.IUIAction;
import com.enactor.coreUI.actions.UIActionFunctions;
import com.enactor.coreUI.annotations.Input;
import com.enactor.coreUI.annotations.Inputs;
import com.enactor.coreUI.annotations.Outcomes;
import com.enactor.coreUI.annotations.Outputs;
import com.enactor.coreUI.processes.CoreUIOutcomes;
import com.enactor.coreUI.processes.UIProcessException;

/**
 * @author andy
 *
 */
@Inputs({
	@Input(name = CommonUIDataTypes.DATA_SOURCE_NAME_DATA_NAME, type = java.lang.String.class, required = true),
	@Input(name = "enactor.coreUI.JNDIName", type = java.lang.String.class)
})
@Outputs({
	})
@Outcomes({
	"Success"
})
public class RunSQLScriptAction implements IUIAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final Logger logger = Logger.getLogger(RunSQLScriptAction.class);
	
	private static final String SQL_SCRIPT_FOLDER = "/META-INF/deployments/SQL";
	
	/** 
	 * @see com.enactor.coreUI.actions.IUIAction#execute(com.enactor.core.application.process.IApplicationProcessData, com.enactor.core.application.process.IApplicationProcessData)
	 */
	@Override
	public IApplicationProcessOutcome execute(IApplicationProcessData inputData,IApplicationProcessData outputData) throws UIProcessException,ApplicationProcessException {
		
		String sqlFileName = (String)UIActionFunctions.getRequiredDataItem(inputData, AutomationConstants.SQL_SCRIPT_FILE_NAME_DATA);
		String dataSource = (String)UIActionFunctions.getOptionalDataItem(inputData, CommonUIDataTypes.DATA_SOURCE_NAME_DATA_NAME);
		
		BufferedReader bis = null;
		
		try{
			InputStreamReader sqlReader = resolveSQLReader(sqlFileName);

			bis = new BufferedReader(sqlReader);
		} catch (Exception e){
			logger.log(Logger.LOG_ERROR,"Failed to open sql file " + sqlFileName, e);
			throw new ApplicationProcessException(e, "Failed to open sql file " + sqlFileName);	
		}
		
		IDataAccessTransaction transaction = null;
		Statement stmt = null;
		boolean success = true;
		IDataAccessSession session = null;
		
		try {
			
			if (dataSource!=null){
				ISessionFactory dataAccessSessionFactory = new DatasourceDataAccessSessionFactory(dataSource);
				session = dataAccessSessionFactory.getDataAccessSession();
			}else{
				session = DataAccessContext.openSession();
			}
			
			transaction = session.beginTransaction();
			
			IDBConnection connection = (IDBConnection) session.getConnection();
			
			stmt = connection.createStatement();
			
			String sqlLine = null;
			while ((sqlLine = bis.readLine()) != null) {
				
				if (StringUtils.notEmpty(sqlLine.trim())){
					stmt.execute(sqlLine);
				}
			}
			
		} catch (Exception e) {
			success = false;
			logger.log(Logger.LOG_ERROR,"Error run sql file " + sqlFileName, e);
			throw new ApplicationProcessException(e, "Error run sql file " + sqlFileName);
		} finally {
			
			DatabaseUtils.safeCloseStatement(stmt);
			
			try{
				if (success){
					transaction.commit();
				}else{
					transaction.rollback();
				}
				
				
			}catch(Exception e){
				logger.log(Logger.LOG_ERROR,"Failed to commit/rollback transaction.", e);
			}
			DatabaseUtils.safeClose(session);
			
		}
		
		
		return CoreUIOutcomes.SUCCESS_OUTCOME;
		
	}

	private InputStreamReader resolveSQLReader(String sqlFileName) throws IOException{
		
		InputStream is = null;
		
		is = this.getClass().getResourceAsStream(SQL_SCRIPT_FOLDER + File.separatorChar + sqlFileName);			
		
		if (is == null) {
			is = new FileInputStream(sqlFileName);
		}
		return new InputStreamReader(is);
	}

}
