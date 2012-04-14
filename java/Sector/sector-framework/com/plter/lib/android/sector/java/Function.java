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

package com.plter.lib.android.sector.java;

import com.plter.lib.android.sector.java.protocols.ICommand;
import com.plter.lib.android.sector.java.protocols.IFunction;
import com.plter.lib.android.sector.java.protocols.ISector;


/**
 * 职能
 * @author xtiqin
 *
 */
public class Function implements IFunction {
	
	/**
	 * 创建一个职能对象
	 * @param name			职能名称
	 * @param messageName	该职能接受的消息的名称
	 */
	public Function(String name,String messageName) {
		this.name=name;
		this.messageName=messageName;
	}
	
	
	/**
	 * 创建一个职能对象
	 * @param messageName	该职能所接受的消息的名称
	 */
	public Function(String messageName) {
		this.messageName=messageName;
	}
	

	@Override
	public String getName() {
		return name;
	}

	@Override
	public String getMessageName() {
		return messageName;
	}

	@Override
	public boolean execute(ICommand command) {
		return true;
	}

	@Override
	public ISector getSector() {
		return sector;
	}
	
	
	void setSector(ISector sector){
		this.sector=sector;
	}
	
	
	private String name=null;
	private String messageName=null;
	private ISector sector=null;

}
