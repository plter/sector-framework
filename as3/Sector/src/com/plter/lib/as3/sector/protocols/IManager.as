/**
   Copyright [plter] [xtiqin]
   http://plter.sinaapp.com

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

   This is a part of PlterAndroidLib on 
   http://plter.sinaapp.com/?cat=14 
	https://github.com/xtiqin/plter-android-lib
 */

package com.plter.lib.as3.sector.protocols{
	

/**
 * 部门经理
 * @author xtiqin
 *
 */
public interface IManager {
	
	
	/**
	 * 取得经理的名称
	 * @return
	 */
	function getName():String;

	
	/**
	 * 取得所代理的部门
	 * @return
	 */
	function getSector():ISector;
	
	
	/**
	 * 发送消息
	 * @param message 消息
	 * @return 如果消息成功发送(所有职能部门都成功执行了消息)，则返回true,否则返回false
	 */
	function sendMessage(message:IMessage):Boolean;
	
	
	/**
	 * 发送命令
	 * @param command	命令
	 * @return	如果命令成功发送(所有职能部门都成功执行了命令)，则返回true,否则返回false
	 */
	function sendCommand(command:ICommand):Boolean;
	function sendCommand1(commandName:String,content:Object=null,level:int=0):Boolean;
	
	
	/**
	 * 派发事件
	 * @param event	事件
	 * @return	如果事件成功派发，返回true，否则返回false
	 */
	function dispatchEvent(event:IEvent):Boolean;
	function dispatchEvent1(eventName:String,content:Object=null,level:int=0):Boolean;
	
	
	/**
	 * 处理命令，如果该方法返回值为false，则命令不会发送
	 * @param command
	 * @return
	 */
	function handleCommand(command:ICommand):Boolean;
	
	/**
	 * 处理事件，如果该方法返回值为false，则事件不会发送
	 * @param event
	 * @return
	 */
	function handleEvent(event:IEvent):Boolean;
	
	
	/**
	 * 处理消息，如果该方法返回值为false，则消息不会发送
	 * @param message
	 * @return
	 */
	function handleMessage(message:IMessage):Boolean;
	
	
	/**
	 * 取得所管理的组件对象
	 * @return
	 */
	function getComponent():Object;
	
}

}
