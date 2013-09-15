package com.plter.java.sector;

import com.plter.lib.java.event.Event;

public class Command extends Event {

	public Command(String name, Object data) {
		super(name, data);
	}
}
