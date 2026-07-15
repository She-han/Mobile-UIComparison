package com.enactor.core.automation.cucumber;

import java.util.ArrayList;
import java.util.List;

import io.cucumber.plugin.ConcurrentEventListener;
import io.cucumber.plugin.event.Event;
import io.cucumber.plugin.event.EventPublisher;
import io.cucumber.plugin.event.TestRunFinished;
import io.cucumber.plugin.event.TestRunStarted;

public class Plugin implements ConcurrentEventListener {

	static List<Event> events = new ArrayList<>();

	@Override
	public void setEventPublisher(EventPublisher publisher) {
		publisher.registerHandlerFor(TestRunStarted.class, event -> events.add(event));
		publisher.registerHandlerFor(TestRunFinished.class, event -> events.add(event));
	}

}
