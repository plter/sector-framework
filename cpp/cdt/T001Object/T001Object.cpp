//============================================================================
// Name        : T001Object.cpp
// Author      : plter
// Version     :
// Copyright   : plter.com
// Description : Hello World in C, Ansi-style
//============================================================================

#include <stdio.h>
#include <stdlib.h>
#include <Event.h>
#include <Function.h>

using namespace plter;


int main(void) {

	Event * e = new Event();
	printf("count:%d\n",e->retainCount());
	e->release();

	Function* f = new Function("func");
	printf("%s\n",f->getName().c_str());
	return EXIT_SUCCESS;
}
