/*
 * Request.cpp
 *
 *  Created on: 2013年8月25日
 *      Author: plter
 */

#include "Request.h"

namespace plter {

Request::Request():Event() {
}

Request::Request(string type) :Event(type){
}

Request::Request(string type, Object* data):Event(type,data) {
}

Request::~Request() {
}

} /* namespace plter */
