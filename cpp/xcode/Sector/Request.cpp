/*
 * Request.cpp
 *
 *      Author: plter
 */

#include "Request.h"

namespace plter {

Request::Request(string type) :Event(type){
	_level = 0;
}

Request::Request(string type, Object* data):Event(type,data) {
	_level = 0;
}

Request::Request(string type,Object* data ,int level):Event(type,data){
	_level = 0;
}

Request::~Request() {
}

int Request::getLevel() {
	return _level;
}

} /* namespace plter */
