package com.plter.java.sector;

import com.plter.lib.java.event.EventListenerList;
import com.plter.lib.java.lang.Array;
import com.plter.lib.java.lang.ArrayItem;
import com.plter.lib.java.lang.ArrayLoopCallback;
import com.plter.lib.java.lang.ObjectPool;

public class Sector {

	public Sector(String name,Manager manager) {
		this.name = name;
		setManager(manager);;
	}

	public String getName() {
		return name;
	}

	public void addSector(Sector s){
		sectors.push(s);
		s.setSuperior(this);
	}

	public void removeSector(Sector s){
		sectors.remove(s);
		s.setSuperior(null);
	}

	public void removeSector(final String name){
		sectors.each(new ArrayLoopCallback<Sector>() {

			@Override
			public void onRead(Sector currentValue, ArrayItem<Sector> currentItem) {
				if (currentValue.getName()!=null&&currentValue.getName().equals(name)) {
					sectors.removeItem(currentItem);
					currentValue.setSuperior(null);
					break_();
				}
			}
		});
	}
	
	
	public void sendCommand(Command cmd){
		_sendCommandExcept(cmd, null);
	}
	
	public void sendRequest(Request req){
		_handleRequestExceptCommandListener(req, null);
	}
	

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public Manager getManager() {
		return manager;
	}
	
	private void _handleRequestExceptCommandListener(final Request req,final Sector sector){
		if (getManager()==null||getManager().handleRequest(req)) {
			Command cmd = ObjectPool.get(Command.class);
			cmd.init(req.getName(), req.getData());
			
			sendCommand(cmd);
			
			if (getManager()==null||getManager().reportToSuperior()) {
				if (getSuperior()!=null) {
					getSuperior()._handleRequestExceptCommandListener(req, this);
				}
			}
			
			cmd.recycle();
		}
	}
	
	private void _sendCommandExcept(final Command cmd,final Sector sector){
		
		commandAdapter.dispatch(cmd);
		
		sectors.each(new ArrayLoopCallback<Sector>() {
			
			@Override
			public void onRead(Sector currentValue, ArrayItem<Sector> currentItem) {
				if (currentValue!=sector) {
					sector.sendCommand(cmd);
				}
			}
		});
	}
	
	private void _sendResultExcept(final Result result,final Sector sector){
		resultAdapter.dispatch(result);
		
		sectors.each(new ArrayLoopCallback<Sector>() {
			
			@Override
			public void onRead(Sector currentValue, ArrayItem<Sector> currentItem) {
				currentValue.resultAdapter.dispatch(result);
			}
		});
	}

	public Sector getSuperior() {
		return superior;
	}
	
	private void setSuperior(Sector superior) {
		this.superior = superior;
	}
	

	private String name = null;
	private Manager manager = null;
	private Sector superior = null;

	private final Array<Sector> sectors = new Array<Sector>();
	private final EventListenerList<Command> commandAdapter = new EventListenerList<Command>();
	private final EventListenerList<Result> resultAdapter = new EventListenerList<Result>();
}
