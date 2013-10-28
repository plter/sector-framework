//
//  main.cpp
//  E001UsingSector
//
//  Created by plter on 13-10-28.
//  Copyright (c) 2013年 plter. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <SectorFramework.h>

using namespace plter;
using namespace std;

class MyManager:public Manager{
public:
	MyManager():Manager("mgr"){
	};
    
	virtual bool handleRequest(Request* req){
		cout<<"Handle Request"<<endl;
		return true;
	};
};


class MyFunc:public Function{
    
public:
	MyFunc(Sector* s):Function("MyFunc",s){
	};
    
	virtual bool execute(Event* cmd,Object* data){
		cout<<"MyFunc execute"<<endl;
		return true;
	};
};


int main(void) {
    
	MyManager * mgr = new MyManager();
    
	Sector* s = new Sector("root",mgr);
	MyFunc* f = new MyFunc(s);
	s->addFunction(f);
    
	Command* cmd = new Command("MyFunc");
	s->sendCommand(cmd);
	cmd->release();
    
	Request* req = new Request("");
	s->sendRequest(req);
	req->release();
    
	cout<<s->getName()<<endl;
    
	f->release();
	s->release();
	mgr->release();
    
	return EXIT_SUCCESS;
}

