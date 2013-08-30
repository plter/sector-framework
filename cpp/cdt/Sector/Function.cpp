/*
 * Function.cpp
 *
 *      Author: plter
 */

#include "Function.h"

namespace plter {
    
    Function::Function(string name,Sector* sector):EventListener(name) {
        _sector = sector;
        _sector->retain();
    }

	bool Function::execute(Event* e,Object* target){
		return execute(e);
	}

	bool Function::execute(Event* e){
		return true;
	}
    
    Function::~Function() {
        _sector->release();
    }
    
    Sector* Function::getSector(){
        return _sector;
    }
    
} /* namespace plter */
