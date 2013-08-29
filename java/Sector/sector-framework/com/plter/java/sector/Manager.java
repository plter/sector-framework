package com.plter.java.sector;

public class Manager {
	
	public Manager(String name) {
		this.name = name;
	}

	public boolean handleRequest(Request req){
		return true;
	}
	
	public boolean reportToSuperior(){
		return true;
	}
	
	
	public void sendCommand(Command cmd){
		if (getSector()!=null) {
			getSector().sendCommand(cmd);
		}
	}
	
	public void sendResult(Result result){
		if (getSector()!=null) {
			getSector().sendResult(result);
		}
	}
	
	public void sendRequest(Request req){
		if (getSector()!=null) {
			getSector().sendRequest(req);
		}
	}
	
	
	public String getName() {
		return name;
	}
	
	void setSector(Sector sector) {
		this.sector = sector;
	}
	
	public Sector getSector() {
		return sector;
	}
	
	private String name = null;
	private Sector sector = null;
}
