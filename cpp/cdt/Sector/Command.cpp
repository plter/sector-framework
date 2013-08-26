/*
 * Command.cpp
 *
 *  Created on: 2013年8月25日
 *      Author: plter
 */

#include "Command.h"

namespace plter {

Command::Command() :Event(){
}

Command::Command(string type):Event(type) {
}

Command::Command(string type, Object* data):Event(type,data) {
}

Command::~Command() {
}

} /* namespace plter */
