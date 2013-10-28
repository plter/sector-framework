/*
 * Callback.h
 *
 *      Author: plter
 */

#ifndef CALLBACK_H_
#define CALLBACK_H_

#include <string>
#include "EventListener.h"
#include "Event.h"
#include "Object.h"

using namespace std;


namespace plter {

class Callback :public EventListener{
public:
	Callback(string name);
	virtual bool execute(Event* e,Object* target);
	virtual bool execute(Event* e);
	virtual ~Callback();
};

} /* namespace plter */
#endif /* CALLBACK_H_ */
