package com.enactor.core.automation.view;


import com.enactor.core.application.process.ApplicationProcessException;
import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.automation.view.AutViewManager.AutViewManagerType;
import com.enactor.core.signOn.IPrivilegeManager;
import com.enactor.core.signOn.PrivilegeManager;
import com.enactor.core.utilities.StringUtils;
import com.enactor.coreUI.el.PrivilegesFunctionMapper;
import com.enactor.coreUI.processes.IUIProcessRunner;
import com.enactor.coreUI.processes.UIProcessContext;
import com.enactor.coreUI.processes.UIProcessRunner;
import com.enactor.coreUI.prompts.IPromptView;
import com.enactor.coreUI.views.ViewException;
import com.enactor.mfc.role.Privilege;
import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import static org.testng.Assert.assertTrue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
/**
 * Unit test class for aut View Privilege Manager
 * 
 * @author Hishan Indrajith
 */
public class AutViewPrivilegeManagerTest extends AutViewManagerTest {
    
	// Test user id
    private static final String TEST_USER_ID = "1010";
    // Initial privileges that already the context has
    private static final HashMap<String, Object> INITIAL_PRIVILEGES_MAP = new HashMap<>();
    
    // These are initial privileges
    private static final String TEST_PRIVILEGE_1 = "enactor.test.privilege1";
    private static final String TEST_PRIVILEGE_2 = "enactor.test.privilege2";
    private static final String TEST_PRIVILEGE_3 = "enactor.test.privilege3";
    private static final String TEST_PRIVILEGE_4 = "enactor.test.privilege4";
    
    // These are additional privileges
    private static final String TEST_PRIVILEGE_5 = "enactor.test.privilege5";
    private static final String TEST_PRIVILEGE_6 = "enactor.test.privilege6";
    private static final String TEST_PRIVILEGE_7 = "enactor.test.privilege7";
    private static final String TEST_PRIVILEGE_8 = "enactor.test.privilege8";
    private static final String TEST_PRIVILEGE_9 = "enactor.test.privilege9";

	@BeforeClass
    public void setUp() {
		// Privilege map value can be either a string or a privilege object
		INITIAL_PRIVILEGES_MAP.put(TEST_PRIVILEGE_1, TEST_PRIVILEGE_1);
		INITIAL_PRIVILEGES_MAP.put(TEST_PRIVILEGE_2, TEST_PRIVILEGE_2);
		INITIAL_PRIVILEGES_MAP.put(TEST_PRIVILEGE_3, new Privilege(TEST_PRIVILEGE_3));
		INITIAL_PRIVILEGES_MAP.put(TEST_PRIVILEGE_4, new Privilege(TEST_PRIVILEGE_4));
	}
	
	/** AutViewManagerTest */
	
	@Override
	protected void setupTestSpecificData(IPromptView mockView) throws ViewException {
		// Add initial privileges and the privilege manager to the view
        IPrivilegeManager privilegeManager = PrivilegeManager.getInstance();
        privilegeManager.addPrivilegeSet(TEST_USER_ID, INITIAL_PRIVILEGES_MAP);
        
        // Create a context with the created privilege manager and add it to current ProcessContext
        IUIProcessRunner runner = new UIProcessRunner(mockView);
        UIProcessContext.makeContext(runner, privilegeManager);
        // Set the mock privilege manager to the mockView
        mockView.setPrivilegeManager(privilegeManager);
	}
	
	@Override
	protected AutViewManagerType getAutViewManagerType() {
		return AutViewManagerType.PRIVILEGE;
	}
	
	/** TEST CASES */
	
	/** Basic scenario of adding a privilege
     * 1 privilege that doesn't already exists is added
     * 
     * @throws AutomationException
     * @throws ViewException
     * @throws ApplicationProcessException
     */
    @Test
    public void scenario1() throws AutomationException, ViewException, ApplicationProcessException {
    	
    	List<PrivilegeTestOperation> oprationList = new ArrayList<>();
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_5));
    	
    	runScenario(oprationList);
    }
    
    /** Basic scenario of removing a privilege
     * 1 privilege that already exists is removed
     * 
     * @throws AutomationException
     * @throws ViewException
     * @throws ApplicationProcessException
     */
    @Test
    public void scenario2() throws AutomationException, ViewException, ApplicationProcessException {
    	
    	List<PrivilegeTestOperation> oprationList = new ArrayList<>();
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.REMOVE, TEST_PRIVILEGE_1));
    	
    	runScenario(oprationList);
    }
    
    /**
     * 1 privilege that already exists is added again
     * 
     * @throws AutomationException
     * @throws ViewException
     * @throws ApplicationProcessException
     */
    @Test
    public void scenario3() throws AutomationException, ViewException, ApplicationProcessException {
    	
    	List<PrivilegeTestOperation> oprationList = new ArrayList<>();
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_2));
    	
    	runScenario(oprationList);
    }
    
    /**
     * 1 privilege that doesn't already exists is removed
     * Should do nothing
     * 
     * @throws AutomationException
     * @throws ViewException
     * @throws ApplicationProcessException
     */
    @Test
    public void scenario4() throws AutomationException, ViewException, ApplicationProcessException {
    	
    	List<PrivilegeTestOperation> oprationList = new ArrayList<>();
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.REMOVE, TEST_PRIVILEGE_6));
    	
    	runScenario(oprationList);
    }
    
    /**
     * Verify sequence of unique Add/Remove operations
     * 
     * @throws AutomationException
     * @throws ViewException
     * @throws ApplicationProcessException
     */
    @Test
    public void scenario5() throws AutomationException, ViewException, ApplicationProcessException {
    	
    	List<PrivilegeTestOperation> oprationList = new ArrayList<>();
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_5));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.REMOVE, TEST_PRIVILEGE_2));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_6));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_7));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.REMOVE, TEST_PRIVILEGE_3));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_8));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.REMOVE, TEST_PRIVILEGE_1));
    	
    	runScenario(oprationList);
    }
    
    /**
     * New privilege added and removed
     * 
     * @throws AutomationException
     * @throws ViewException
     * @throws ApplicationProcessException
     */
    @Test
    public void scenario6() throws AutomationException, ViewException, ApplicationProcessException {
    	
    	List<PrivilegeTestOperation> oprationList = new ArrayList<>();
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_9));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.REMOVE, TEST_PRIVILEGE_9));
    	runScenario(oprationList);
    }
	
    /**
     * Existing privilege added and removed
     * 
     * @throws AutomationException
     * @throws ViewException
     * @throws ApplicationProcessException
     */
    @Test
    public void scenario7() throws AutomationException, ViewException, ApplicationProcessException {
    	
    	List<PrivilegeTestOperation> oprationList = new ArrayList<>();
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_2));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.REMOVE, TEST_PRIVILEGE_2));
    	runScenario(oprationList);
    }
	
    /**
     * Non Existing privilege removed and added
     * 
     * @throws AutomationException
     * @throws ViewException
     * @throws ApplicationProcessException
     */
    @Test
    public void scenario8() throws AutomationException, ViewException, ApplicationProcessException {
    	
    	List<PrivilegeTestOperation> oprationList = new ArrayList<>();
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.REMOVE, TEST_PRIVILEGE_8));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_8));
    	runScenario(oprationList);
    }
    
    /**
     * Existing privilege removed and added
     * 
     * @throws AutomationException
     * @throws ViewException
     * @throws ApplicationProcessException
     */
    @Test
    public void scenario9() throws AutomationException, ViewException, ApplicationProcessException {
    	
    	List<PrivilegeTestOperation> oprationList = new ArrayList<>();
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.REMOVE, TEST_PRIVILEGE_2));
    	oprationList.add(new PrivilegeTestOperation(PrivilegeTestOperationType.ADD, TEST_PRIVILEGE_2));
    	runScenario(oprationList);
    }
    
    /** TEST UTILITIES */
    
	/** run the scenario for a given operation list and assert privileges*/
    private void runScenario(List<PrivilegeTestOperation> oprationList) throws ViewException, ApplicationProcessException {
    	
    	IAutViewPrivilegeManager autViewPrivilegeManager = (IAutViewPrivilegeManager)setUpDataForScenario();
    	
    	// Verify that the initial privileges set is unchanged
    	verifyInitialPrivilegeUnchaged();
    	
    	// Open Aut View change session
    	autViewPrivilegeManager.initiateAutViewManagerSession();
    	
    	// Add/remove the pivilege using autViewPrivilegeManager and assert it same time
    	for(PrivilegeTestOperation operation : oprationList) {
    		if(operation.getOperationType().equals(PrivilegeTestOperationType.ADD)) {
    			autViewPrivilegeManager.addPrivilege(operation.getPrivilege());
     			Assert.assertTrue(PrivilegesFunctionMapper.checkPrivilege(operation.getPrivilege()));
    		} else if (operation.getOperationType().equals(PrivilegeTestOperationType.REMOVE)) {
    			autViewPrivilegeManager.removePrivilege(operation.getPrivilege());
    			Assert.assertFalse(PrivilegesFunctionMapper.checkPrivilege(operation.getPrivilege()));
    		}
    	}
    	
        // Reset changed privileges using autViewPrivilegeManager
        autViewPrivilegeManager.closeAutViewManagerSession();
        
        // Verify that the initial privileges set is unchanged at the end
        verifyInitialPrivilegeUnchaged();
        
        // Verify that there are no additional privileges remainning at the end
        verifyNoAdditionalPrivileges();
    }
    
    /** verify the initial privileges are still there without difference */
    private void verifyInitialPrivilegeUnchaged() {
    	String[] privilegesArray = INITIAL_PRIVILEGES_MAP.keySet().toArray(new String[0]);
    	String spaceSeparatedPrivilegeList = StringUtils.concatWithSeparator(" ", privilegesArray);
    	assertTrue(PrivilegesFunctionMapper.checkPrivileges(spaceSeparatedPrivilegeList, true));
    }
    
    /** verify the there are no additional privileges except the initial set of privileges */
    private void verifyNoAdditionalPrivileges() {
    	Assert.assertFalse(PrivilegesFunctionMapper.checkPrivilege(TEST_PRIVILEGE_5));
    	Assert.assertFalse(PrivilegesFunctionMapper.checkPrivilege(TEST_PRIVILEGE_6));
    	Assert.assertFalse(PrivilegesFunctionMapper.checkPrivilege(TEST_PRIVILEGE_7));
    	Assert.assertFalse(PrivilegesFunctionMapper.checkPrivilege(TEST_PRIVILEGE_8));
    	Assert.assertFalse(PrivilegesFunctionMapper.checkPrivilege(TEST_PRIVILEGE_9));
    }
    
    /** INNER CLASSES FOR TEST */
    
    private class PrivilegeTestOperation {
    	
    	
    	private PrivilegeTestOperationType operationType;
    	private String privilege;
    	
		public PrivilegeTestOperation(PrivilegeTestOperationType operationType, String privilege) {
			super();
			this.operationType = operationType;
			this.privilege = privilege;
		}

		/**
		 * @return the operationType
		 */
		public PrivilegeTestOperationType getOperationType() {
			return operationType;
		}
		
		/**
		 * @return the privilege
		 */
		public String getPrivilege() {
			return privilege;
		}
    }
    
    /** Enum for Privilege operation types */
    private enum PrivilegeTestOperationType {
		ADD,
		REMOVE
	}
	
}
