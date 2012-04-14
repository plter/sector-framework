package com.plter.lib.as3.sector{
	
	import com.plter.lib.as3.sector.protocols.IEvent;
	
	
	/**
	 * 事件类
	 * @author xtiqin
	 *
	 */
	public class Event extends Message implements IEvent{
		
		
		/**
		 * 构建一个事件
		 * @param name		事件的名称
		 * @param content	事件的内容
		 * @param level		事件的级别 
		 */
		public function Event(name:String,content:Object=null,level:int=0) {
			super(name, content, level);
		}
		
	}
}
