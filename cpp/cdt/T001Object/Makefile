CXXFLAGS =	-O2 -g -Wall -fmessage-length=0 -I ../Sector

OBJS =		T001Object.o

LIBS =../Sector/bin/libSector.a

TARGET =	Object

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
