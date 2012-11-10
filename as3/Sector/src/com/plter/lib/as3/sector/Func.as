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
import com.plter.lib.as3.sector.protocols.IFunc;
import com.plter.lib.as3.sector.protocols.ISector;


/**
 * 职能
 * @author xtiqin
 *
 */
public class Func implements IFunc {
	
	/**
	 * 创建一个职能对象
	 * @param name			该职能接受的消息的名称
	 * @param messageName	职能名称
	 */
	public function Func(commandName:String,funcName:String=null) {
		this.name=funcName;
		this.commandName=commandName;
	}
	

	
	public function getName():String {
		return name;
	}

	
	public function getCommandName():String {
		return commandName;
	}

	
	public function execute(command:ICommand):Boolean {
		return true;
	}

	
	public function getSector():ISector {
		return sector;
	}
	
	
	internal function setSector(sector:ISector):void{
		this.sector=sector;
	}
	
	
	private var name:String=null;
	private var commandName:String=null;
	private var sector:ISector=null;

}
}
