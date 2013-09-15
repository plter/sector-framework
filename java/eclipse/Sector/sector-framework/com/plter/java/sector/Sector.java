package com.plter.java.sector;

import com.plter.lib.java.event.EventListener;
import com.plter.lib.java.event.EventListenerList;
import com.plter.lib.java.lang.Array;
import com.plter.lib.java.lang.ArrayItem;
import com.plter.lib.java.lang.ArrayLoopCallback;

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
	
	public void addFunction(EventListener<Command> func){
		commandAdapter.add(func);
	}
	
	public void removeFunction(EventListener<Command> func){
		commandAdapter.remove(func);
	}
	
	public void removeFunction(String funcName){
		commandAdapter.remove(funcName);
	}

	public void addCallback(EventListener<Result> cb){
		resultAdapter.add(cb);
	}
	
	public void removeCallback(EventListener<Result> cb){
		resultAdapter.remove(cb);
	}
	
	public void removeCallback(String cbName){
		resultAdapter.remove(cbName);
	}
	
	public void sendResult(Result result){
		_sendResult(result, null, true);
	}

	public void sendCommand(Command cmd){
		_sendCommandExcept(cmd, null);
	}

	public void sendRequest(Request req){
		_handleRequestExceptCommandListener(req, null);
	}


	public void setManager(Manager manager) {
		if (this.manager!=null) {
			this.manager.setSector(null);
		}
		
		this.manager = manager;
		
		if (this.manager!=null) {
			this.manager.setSector(this);
		}
	}

	public Manager getManager() {
		return manager;
	}

	private void _handleRequestExceptCommandListener(final Request req,final Sector sector){
		if (getManager()==null||getManager().handleRequest(req)) {
			Command cmd = new Command(req.getName(), req.getData());

			sendCommand(cmd);

			if (getManager()==null||getManager().reportToSuperior()) {
				if (getSuperior()!=null) {
					getSuperior()._handleRequestExceptCommandListener(req, this);
				}
			}
		}
	}

	private void _sendCommandExcept(final Command cmd,final Sector sector){

		commandAdapter.dispatch(cmd);

		sectors.each(new ArrayLoopCallback<Sector>() {

			@Override
			public void onRead(Sector currentValue, ArrayItem<Sector> currentItem) {
				if (currentValue!=sector) {
					currentValue.sendCommand(cmd);
				}
			}
		});
	}

	private void _sendResult(final Result result,final Sector exceptedChild,boolean sendToSuperior){
		resultAdapter.dispatch(result);

		sectors.each(new ArrayLoopCallback<Sector>() {

			@Override
			public void onRead(Sector currentValue, ArrayItem<Sector> currentItem) {
				if (currentValue!=exceptedChild) {
					currentValue._sendResult(result, null, false);
				}
			}
		});

		if (sendToSuperior) {
			if (getSuperior()!=null) {
				getSuperior()._sendResult(result, this, true);
			}
		}
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
