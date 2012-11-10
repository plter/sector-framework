

package com.plter.lib.as3.sector{
	
	import com.plter.lib.as3.sector.protocols.ICommand;
	import com.plter.lib.as3.sector.protocols.IEvent;
	import com.plter.lib.as3.sector.protocols.IFunc;
	import com.plter.lib.as3.sector.protocols.IManager;
	import com.plter.lib.as3.sector.protocols.IMessage;
	import com.plter.lib.as3.sector.protocols.ISector;
	
	
	
	/**
	 * 部门
	 * @author xtiqin
	 */
	public class Sector implements ISector {
		
		/**
		 * 构造一个部门
		 * @param	name 部门的名称
		 */
		public function Sector(name:String) {
			this.name=name;
		}
		
		
		
		public function getName():String {
			return name;
		}
		
		
		public function addSector(sector:ISector):void {
			sectors.push(sector);
			
			Sector(sector).setSuperior(this);
		}
		
		
		public function removeSector(sector:ISector):void {
			for (var i:int = 0; i < sectors.length; i++) 
			{
				if (sector==sectors[i]) 
				{
					sectors.splice(i,1);
					break;
				}
			}
			
			
			Sector(sector).setSuperior(null);
		}
		
		
		public function removeSector1(name:String):void {
			var s:Sector=null;
			for (var i:int = 0; i < sectors.length; i++) {
				s=sectors[i] as Sector;
				if (s.getName()==name) {
					sectors.splice(i,1);
					s.setSuperior(null);
					break;
				}
			}
		}
		
		
		
		public function getSector(name:String):ISector {
			var s:ISector=null;
			for (var i:int = 0; i < sectors.length; i++) {
				s=sectors[i];
				if (s.getName()==name) {
					return s;
				}
			}
			return null;
		}
		
		
		
		public function getSectors():Array {
			return sectors;
		}
		
		
		public function addFunction(func:IFunc):void {
			functions.push(func);
			com.plter.lib.as3.sector.Func(func).setSector(this);
		}
		
		
		public function removeFunction(func:IFunc):void {
			
			for (var i:int = 0; i < functions.length; i++) 
			{
				if (func==functions[i]) 
				{
					functions.splice(i,1);
				}
			}
			
			
			com.plter.lib.as3.sector.Func(func).setSector(null);
		}
		
		
		public function removeFunction1(name:String):void {
			var f:com.plter.lib.as3.sector.Func=null;
			for (var i:int = 0; i < functions.length; i++) {
				f=functions[i] as com.plter.lib.as3.sector.Func;
				if (f.getName()==name) {
					functions.splice(i,1);
					f.setSector(null);
					break;
				}
			}
		}
		
		
		
		public function getFunction(name:String):IFunc {
			var f:com.plter.lib.as3.sector.Func=null;
			for (var i:int = 0; i < functions.length; i++) {
				f=functions[i];
				if (f.getName()==name) {
					return f;
				}
			}
			return null;
		}
		
		
		
		public function getFunctions():Array {
			return functions;
		}
		
		
		
		public final function sendCommand(command:ICommand):Boolean {
			return sendMessage(command);
		}
		
		
		public final function dispatchEvent(event:IEvent):Boolean {
			return sendMessage(event);
		}
		
		
		public final function sendMessage(message:IMessage):Boolean {
			
			var f:IFunc=null;
			
			//如果不存在经理，则部门默认允许的命令都会下发，如果存在经理，则经理有权决定是否要下发命令
			if (handleMessage(message)&&
				getManager()!=null?getManager().handleMessage(message):true) {
				
				var suc:Boolean=true;
				
				//向当前部门发送指令
				if (message is ICommand) {
					for (var i:int = 0; i < getFunctions().length; i++) {
						f=getFunctions()[i];
						if (message.getName()==f.getCommandName()) {
							if (!f.execute(message as ICommand)) {
								suc=false;
							}
						}
					}
				}
				
				
				for (var j:int = 0; j < getSectors().length; j++) {
					if(!getSectors()[j].sendMessage(message)){
						suc=false;
					}
				}
				
				
				return suc;
			}else{
				return false;
			}		
		}
		
		
		public function sendCommand1(commandName:String, content:Object=null, level:int=0):Boolean {
			return sendCommand(new Command(commandName, content, level));
		}
		
		
		public function dispatchEvent1(eventName:String, content:Object=null, level:int=0):Boolean {
			return dispatchEvent(new Event(eventName, content, level));
		}
		
		
		public function getSuperior():ISector {
			return superior;
		}
		
		//internal
		internal function setSuperior(superior:ISector):void {
			this.superior = superior;
		}
		
		
		
		public function getRoot():ISector {
			if (getSuperior()!=null) {
				return getSuperior().getRoot();
			}
			return this;
		}
		
		
		
		public function getManager():IManager {
			return manager;
		}
		
		
		
		public function setManager(manager:IManager):void {
			if (this.manager!=null) {
				//如果当前已经有经理人，则该经理人的管理权力取消
				Manager(this.manager).setSector(null);
			}
			
			this.manager=manager;
			Manager(this.manager).setSector(this);
		}
		
		/**
		 * 处理命令，如果该方法返回值为false，则命令不会发送
		 * @param command
		 * @return
		 */
		public function handleCommand(command:ICommand):Boolean{
			return true;
		}
		
		/**
		 * 处理事件，如果该方法返回值为false，则事件不会发送
		 * @param event
		 * @return
		 */
		public function handleEvent(event:IEvent):Boolean{
			return true;
		}
		
		
		/**
		 * 处理消息，如果该方法返回值为false，则消息不会发送
		 * @param message
		 * @return
		 */
		public function handleMessage(message:IMessage):Boolean{
			if (message is ICommand) {
				return handleCommand(message as ICommand);
			}
			if (message is IEvent) {
				return handleEvent(message as IEvent);
			}
			return true;
		}
		
		private var manager:IManager=null;
		private var superior:ISector=null;
		private var name:String=null;
		private const sectors:Array=new Array;
		private const functions:Array=new Array;
	}
	
}
