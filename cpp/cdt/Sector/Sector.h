/*
 * Sector.h
 *
 *  Created on: 2013?8?25?
 *      Author: plter
 */

#ifndef SECTOR_H_
#define SECTOR_H_


#include "EventListenerList.h"


namespace plter {

class Sector :private EventListenerList{
public:
	Sector();
	virtual ~Sector();
};

} /* namespace plter */
#endif /* SECTOR_H_ */
