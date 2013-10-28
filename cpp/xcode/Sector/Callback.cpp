/*
 * Callback.cpp
 *
 *      Author: plter
 */

#include "Callback.h"

namespace plter {

Callback::Callback(string name):EventListener(name) {
	// TODO Auto-generated constructor stub

}

bool Callback::execute(Event* e,Object* target){
	return execute(e);
}

bool Callback::execute(Event* e){
	return true;
}

Callback::~Callback() {
	// TODO Auto-generated destructor stub
}

} /* namespace plter */
