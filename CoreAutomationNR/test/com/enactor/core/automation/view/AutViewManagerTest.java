package com.enactor.core.automation.view;


import com.enactor.core.application.process.ApplicationProcessException;
import com.enactor.core.automation.AUT.AUTLauncher;
import com.enactor.core.automation.testEvent.ITestEventListener;
import com.enactor.core.automation.view.AutViewManager.AutViewManagerType;
import com.enactor.core.automation.view.remote.factories.AutViewManagerFactory;
import com.enactor.coreUI.processes.CoreUIDataTypes;
import com.enactor.coreUI.prompts.IPromptView;
import com.enactor.coreUI.swing.BasicSwingView;
import com.enactor.coreUI.views.ViewException;
import com.enactor.mfc.user.IUser;
import com.enactor.mfc.user.User;

import org.mockito.Mockito;

import java.util.HashSet;
import java.util.Set;


/** Abstract class to be used by child test classes. Do not run this test class
 * 
 * @author Hishan Indrajith
 * 
 **/


public abstract class AutViewManagerTest {
    
	// Test user id
    private static final String TEST_USER_ID = "1010";

    /**  Setup test data and return the AutViewManager */
    protected IAutViewManager setUpDataForScenario() throws ViewException, ApplicationProcessException {
    	AUTLauncher mockAutLauncher = Mockito.mock(AUTLauncher.class);
        IPromptView mockView = new BasicSwingView();
        
        // Add signed on user to the mock view
        IUser signedOnUser = new User();
        signedOnUser.setUserId(TEST_USER_ID);
        mockView.getProcessData().setData(CoreUIDataTypes.USER_DATA, signedOnUser);

        setupTestSpecificData(mockView);

        // mock the get view method of mockAutLauncher
    	Mockito.when(mockAutLauncher.getPromptView()).thenReturn(mockView);
    	
    	// prepare event listeners of Aut controller
        Set<ITestEventListener> eventListeners = new HashSet<>();
        eventListeners.add(mockAutLauncher);
        
        // Get the Aut privilege manager instance
        return (IAutViewPrivilegeManager)AutViewManagerFactory.getInstance().getAutViewManager(getAutViewManagerType(), eventListeners);

    }
    
    /** implement this method to return the relevant aut view manager type for the test class */
    protected abstract AutViewManagerType getAutViewManagerType();
    
    /** implement this method to add any relevant test specific data for the test class to be added at the initialization stage */
    protected abstract void setupTestSpecificData(IPromptView mockView) throws ViewException;
    
}
