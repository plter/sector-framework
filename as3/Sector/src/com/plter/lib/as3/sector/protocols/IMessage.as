

package com.plter.lib.as3.sector.protocols{
	
	
	/**
	 * 消息
	 * @author xtiqin
	 *
	 */
	public interface IMessage {
		
		/**
		 * 取得消息的名称
		 * @return
		 */
		function getName():String;
		
		
		/**
		 * 取得消息附加的的内容
		 * @return
		 */
		function getContent():Object;
		
		
		/**
		 * 取得消息的级别，部门(Sector)可以在handleCommand方法中根据级别选择性的允许消息通过
		 * @return
		 */
		function getLevel():int;
	}
	
}
