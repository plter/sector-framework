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



/**
 * 命令
 * @author xtiqin
 *
 */
public class Command extends Message implements ICommand{

	/**
	 * 构建一个命令
	 * @param name		命令的名称
	 * @param content	命令的内容
	 * @param level		命令的级别
	 */
	public function Command(name:String, content:Object=null, level:int=0) {
		super(name, content, level);
	}
}
}
