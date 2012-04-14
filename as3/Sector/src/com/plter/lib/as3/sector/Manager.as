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

package com.plter.lib.as3.sector{

import com.plter.lib.as3.sector.protocols.ICommand;
import com.plter.lib.as3.sector.protocols.IEvent;
import com.plter.lib.as3.sector.protocols.IManager;
import com.plter.lib.as3.sector.protocols.IMessage;
import com.plter.lib.as3.sector.protocols.ISector;


/**
 * 部门经理
 * @author xtiqin
 *
 */
public class Manager implements IManager {
	
	/**
	 * 创建一个部门经理，并指定该部门经理所管理的组件及名称
	 * @param component	所管理的组件
	 * @param name		经理的名称
	 */
	public function Manager(component:Object,name:String) {
		this.component=component;
		this.name=name;
	}
	

	
	public function getName():String {
		return name;
	}

	
	public function getSector():ISector {
		return sector;
	}

	
	public function sendMessage(message:IMessage):Boolean {
		if (getSector()!=null) {
			return getSector().sendMessage(message);
		}
		return false;
	}
	
	
	public function sendCommand(command:ICommand):Boolean {
		return sendMessage(command);
	}


	
	public function dispatchEvent(event:IEvent):Boolean {
		return sendMessage(event);
	}

	
	public function sendCommand1(commandName:String, content:Object=null, level:int=0):Boolean {
		return sendCommand(new Command(commandName, content, level));
	}
	
	
	public function dispatchEvent1(eventName:String, content:Object=null, level:int=0):Boolean {
		return dispatchEvent(new Event(eventName, content, level));
	}
	
	
	public function handleMessage(message:IMessage):Boolean {
		if (message is ICommand) {
			return handleCommand(message as ICommand);
		}
		if (message is IEvent) {
			return handleEvent(message as IEvent);
		}
		return true;
	}
	
	
	public function handleCommand(command:ICommand):Boolean {
		return true;
	}


	
	public function handleEvent(event:IEvent):Boolean {
		return true;
	}
	

	
	public function getComponent():Object {
		return component;
	}
	
	
	internal function setSector(sector:ISector):void{
		this.sector=sector;
	}
	
	
	private var component:Object=null;
	private var sector:ISector=null;
	private var name:String=null;

}
}
