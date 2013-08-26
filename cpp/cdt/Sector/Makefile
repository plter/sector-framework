CXXFLAGS =	-O2 -g -Wall -fmessage-length=0

OBJS =	Command.o \
		Event.o \
		EventListener.o \
		EventListenerList.o \
		Function.o \
		Request.o \
		Result.o \
		Sector.o \
		Manager.o \
		Object.o \
		Callback.o  

LIBS =

TARGET =	./bin/libSector.a

$(TARGET):	$(OBJS)
	ar -crv $(TARGET) $(OBJS) 

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
