package com.plter.lib.as3.sector{
	import com.plter.lib.as3.sector.protocols.IMessage;
	
	
	
	/**
	 * 消息类
	 * @author xtiqin
	 *
	 */
	public class Message implements IMessage {
		
		/**
		 * 构建一个消息
		 * @param name		消息的名称
		 * @param content	消息的内容
		 * @param level		消息的级别
		 */
		public function Message(name:String,content:Object=null,level:int=0) {
			this.name=name;
			this.content=content;
			this.level=level;
		}
		
		
		public function getName():String {
			return name;
		}
		
		
		public function getContent():Object {
			return content;
		}
		
		
		public function getLevel():int {
			return level;
		}
		
		private var name:String=null;
		private var content:Object=null;
		private var level:int=0;
	}
}
