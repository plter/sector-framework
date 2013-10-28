//
//  main.cpp
//  T001Object
//
//  Created by plter on 13-10-28.
//  Copyright (c) 2013年 plter. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <Event.h>
#include <Function.h>
#include <iostream>

using namespace plter;


int main(void) {
    
	Event * e = new Event();
	printf("count:%d\n",e->retainCount());
	e->release();
    
//	Function* f = new Function("func",NULL);
    //	printf("%s\n",f->getName().c_str());
//	std::cout<<f->getName()<<"\n";
	return EXIT_SUCCESS;
}

