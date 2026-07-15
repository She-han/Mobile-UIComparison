package com.enactor.core.automation.cucumber.conetxt;

import java.util.HashMap;
import java.util.Map;

/**
 * Holds Contextual Objects in Scenario Context
 * Will be DI to Step Defintion Classes via Pico Container
 *
 * @author Gayan Kavirathne
 *
 */
public class ScenarioContext {
	private  Map<String, Object> scenarioContext;

    public ScenarioContext(){
        scenarioContext = new HashMap<>();
        setContext(Context.KEY_STORE, new HashMap<String, Object>());
    }

    public void setContext(Context key, Object value) {
        scenarioContext.put(key.toString(), value);
    }

    public Object getContext(Context key){
        return scenarioContext.get(key.toString());
    }

    public Boolean isContains(Context key){
        return scenarioContext.containsKey(key.toString());
    }
}
