package com.enactor.core.automation.scenario;

/**
 * Interface for defining tear down operation for step definition classes. 
 * Should be implemented by step definition classes that need a scenario specific teardown method 
 * See ViewManagerSteps for example
 * 
 * @author Hishan Indrajith
 */
public interface IScenarioTearDownHandler {
	
    /**
     * Method to be called to perform tear down operations after a scenario.
     */
    void tearDown();
}
