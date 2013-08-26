//============================================================================
// Name        : E001UsingSector.cpp
// Author      : plter
// Version     :
// Copyright   : plter.com
// Description : Hello World in C, Ansi-style
//============================================================================

#include <stdio.h>
#include <stdlib.h>
#include <Sector.h>
#include <Function.h>
#include <iostream>
#include <Object.h>
#include <string>
#include <Command.h>
#include <Manager.h>
#include <Request.h>

using namespace plter;
using namespace std;



class MyManager:public Manager{
public:
	MyManager():Manager("mgr",NULL){

	};

	virtual bool handleRequest(Request* req){
		cout<<"Handle Request"<<endl;
		return true;
	};
};


class MyFunc:public Function{

public:
	MyFunc(string name):Function(name){
	};

	virtual bool execute(Event* cmd,Object* data){
		cout<<"MyFunc execute"<<endl;
		return true;
	};
};


int main(void) {

	MyManager * mgr = new MyManager();

	Sector* s = new Sector("root",mgr);
	MyFunc* f = new MyFunc("MyFunc");
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
