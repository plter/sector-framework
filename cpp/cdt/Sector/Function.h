/*
 * Function.h
 *
 *  Created on: 2013年8月25日
 *      Author: plter
 */

#ifndef FUNCTION_H_
#define FUNCTION_H_

#include "EventListener.h"

namespace plter {

class Function: public plter::EventListener {
public:
	Function();
	virtual ~Function();
};

} /* namespace plter */
#endif /* FUNCTION_H_ */
