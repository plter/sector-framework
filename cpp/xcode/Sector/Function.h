/*
 * Function.h
 *
 *      Author: plter
 */

#ifndef FUNCTION_H_
#define FUNCTION_H_

#include "EventListener.h"
#include "Sector.h"
#include "Event.h"


namespace plter {
    class Sector;
    
    class Function: public plter::EventListener {
    public:
        Function(string name,Sector* sector);
        virtual ~Function();
        virtual bool execute(Event* e,Object* target);
		virtual bool execute(Event* e);
        virtual Sector* getSector();
        
    private:
        Sector* _sector;
    };
    
} /* namespace plter */
#endif /* FUNCTION_H_ */
