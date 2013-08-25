CXXFLAGS =	-O2 -g -Wall -fmessage-length=0

OBJS =	Command.o \
		Event.o \
		EventListener.o \
		EventListenerList.o \
		Function.o \
		Request.o \
		Result.o \
		Sector.o 

LIBS =

TARGET =	libSector.a

$(TARGET):	$(OBJS)
	ar -crv ./bin/$(TARGET) $(OBJS) 

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
