/*
 * EventListenerList.cpp
 *
 *  Created on: 2013年8月25日
 *      Author: plter
 */

#include "EventListenerList.h"

namespace plter {

EventListenerList::EventListenerList():Object() {
}


EventListener* EventListenerList::addListener(EventListener* el){
	_els.push_back(el);
	return el;
}

EventListener* EventListenerList::removeListener(string name) {
	for(vector<EventListener*>::iterator it = _els.begin();it!=_els.end();++it){
		if (((EventListener*)(*it))->getName().compare(name)==0) {
			_els.erase(it);
			return *it;
		}
	}
	return NULL;
}

EventListener* EventListenerList::removeListener(EventListener* el){
	for(vector<EventListener*>::iterator it = _els.begin();it!=_els.end();++it){
		if (el==*it) {
			_els.erase(it);
			return el;
		}
	}
	return NULL;
}

bool EventListenerList::dispatch(Event* e,Object* target){
	bool suc = true;
	for(vector<EventListener*>::iterator it = _els.begin();it!=_els.end();++it){
		if (!((EventListener*)(*it))->execute(e,target)) {
			suc = false;
		}
	}
	return suc;
}

bool EventListenerList::dispatch(Event* e){
	return dispatch(e,NULL);
}


EventListenerList::~EventListenerList() {
	// TODO Auto-generated destructor stub
}

} /* namespace plter */
