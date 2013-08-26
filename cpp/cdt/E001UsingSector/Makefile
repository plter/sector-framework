CXXFLAGS =	-O2 -g -Wall -fmessage-length=0 -I ../Sector

OBJS =		E001UsingSector.o

LIBS =../Sector/bin/libSector.a

TARGET =	E001UsingSector

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
