package com.enactor.core.automation.scenario;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import com.enactor.core.utilities.Logger;

/**
 * Manages the teardown operations for classes implementing 
 * {@link IScenarioTearDownHandler}. It ensures that
 * teardown logic is executed for registered handlers.
 * 
 * @author Hishan Indrajith
 */
public class ScenarioTearDownManager {
    
    private static final ScenarioTearDownManager instance = new ScenarioTearDownManager();
    
    // ThreadLocal to store a List of Scenario Tear Down Handlers for each thread to make sure this work when test is run in threads
    private static final ThreadLocal<List<IScenarioTearDownHandler>> handlers = new ThreadLocal<List<IScenarioTearDownHandler>>() {
        @Override
        protected List<IScenarioTearDownHandler> initialValue() {
            return new ArrayList<>();
        }
    };
    
    private Logger logger = Logger.getLogger(ScenarioTearDownManager.class.getName());

    private ScenarioTearDownManager() {}

    public static ScenarioTearDownManager getInstance() {
		return instance;
    }

    /**
     * Registers a handler for setup and teardown operations. 
     * Should be called at the constructors of the needed step definition classes. See ViewManagerSteps
     * 
     * @param handler the handler to be registered
     */
    public void registerHandler(IScenarioTearDownHandler handler) {
    	handlers.get().add(handler);
    }

    /**
     * Executes the teardown method on all registered handlers.
     */
    public void handleTearDown() {
    	List<IScenarioTearDownHandler> currentHandlers = handlers.get();
        Iterator<IScenarioTearDownHandler> iterator = currentHandlers.iterator();
        
        while (iterator.hasNext()) {
            IScenarioTearDownHandler handler = iterator.next();
            try {
                iterator.remove();
                handler.tearDown();
            } catch (Exception e) {
                logger.log(Logger.LOG_ERROR, "Handling the teardown for step definition class " + handler.getClass().getName() + " failed", e);
            }
        }
    }
}
