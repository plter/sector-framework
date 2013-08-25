/*
 * Command.h
 *
 *  Created on: 2013年8月25日
 *      Author: plter
 */

#ifndef COMMAND_H_
#define COMMAND_H_

#include "Event.h"

namespace plter {

class Command: public plter::Event {
public:
	Command();
	virtual ~Command();
};

} /* namespace plter */
#endif /* COMMAND_H_ */
