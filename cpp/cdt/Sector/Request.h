/*
 * Request.h
 *
 *  Created on: 2013年8月25日
 *      Author: plter
 */

#ifndef REQUEST_H_
#define REQUEST_H_

#include "Event.h"

namespace plter {

class Request: public plter::Event {
public:
	Request();
	Request(string type);
	Request(string type,Object* data);
	virtual ~Request();
};

} /* namespace plter */
#endif /* REQUEST_H_ */
