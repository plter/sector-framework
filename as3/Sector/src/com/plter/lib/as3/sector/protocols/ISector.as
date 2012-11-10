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
 * 应用程序系统的部门
 * @author xtiqin
 */
public interface ISector {
	
	
	/**
	 * 取得部门名称
	 * @return
	 */
	function getName():String;
	
	
	/**
	 * 添加子部门
	 * @param section
	 */
	function addSector(sector:ISector):void;
	
	
	/**
	 * 移除子部门
	 * @param section
	 */
	function removeSector(sector:ISector):void;
	
	
	/**
	 * 根据子部门名称移除子部门
	 * @param name
	 */
	function removeSector1(name:String):void;
	
	
	/**
	 * 根据名称取得子部门
	 * @param name
	 * @return
	 */
	function getSector(name:String):ISector;
	
	
	/**
	 * 取得所有子部门
	 * @return
	 */
	function getSectors():Array;
	
	
	/**
	 * 为当前部门添加一个职能
	 */
	function addFunction(func:IFunc):void;
	
	
	/**
	 * 从当前的部门中移除一个职能
	 * @param function
	 */
	function removeFunction(func:IFunc):void;
	
	
	/**
	 * 根据名称移除职能
	 * @param name
	 */
	function removeFunction1(name:String):void;
	
	
	/**
	 * 根据名称取得职能
	 * @param name
	 * @return
	 */
	function getFunction(name:String):IFunc;
	
	
	/**
	 * 取得当前部门的所有职能 
	 * @return
	 */
	function getFunctions():Array;
	
	
	/**
	 * 发送消息
	 * @param message 消息，如果消息是命令，则会发给其所对应的职能，如果是事件，则只发送给部门和部门经理，而不发送给职能
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
	 * 取得上级部门
	 * @return
	 */
	function getSuperior():ISector;
	
	
	/**
	 * 取得顶级部门
	 * @return
	 */
	function getRoot():ISector;
	
	/**
	 * 设置部门经理
	 * @param manager
	 */
	function setManager(manager:IManager):void;
	
	
	/**
	 * 取得部门经理
	 * @return
	 */
	function getManager():IManager;
	
}
}
