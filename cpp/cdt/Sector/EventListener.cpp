/*
 * EventListener.cpp
 *
 *  Created on: 2013年8月25日
 *      Author: plter
 */

#include "EventListener.h"

namespace plter {

EventListener::EventListener():Object() {
}

EventListener::EventListener(string name):Object(){
	_name = name;
}

bool EventListener::execute(Event* e,void* target){
	return true;
}

string EventListener::getName(){
	return _name;
}


EventListener::~EventListener() {
	// TODO Auto-generated destructor stub
}

} /* namespace plter */
