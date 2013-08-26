/*
 * Result.h
 *
 *  Created on: 2013年8月25日
 *      Author: plter
 */

#ifndef RESULT_H_
#define RESULT_H_

#include "Event.h"

namespace plter {

class Result: public plter::Event {
public:
	Result();
	Result(string type);
	Result(string type,Object* data);
	virtual ~Result();
};

} /* namespace plter */
#endif /* RESULT_H_ */
