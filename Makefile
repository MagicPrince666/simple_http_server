CPP = g++

TARGET	= server 

DIR		= . 
INC		= -I.
CFLAGS	= -std=c++11 -O3 -g -Wall
LDFLAGS = -lboost_filesystem -lboost_system -lboost_thread -lpthread -ldl -lz -lm

OBJPATH	= ./objs

FILES	= $(foreach dir,$(DIR),$(wildcard $(dir)/*.cpp))

OBJS	= $(patsubst %.cpp,%.o,$(FILES))

all:$(OBJS) $(TARGET)

$(OBJS):%.o:%.cpp
	$(CPP) $(CFLAGS) $(INC) -c -o $(OBJPATH)/$(notdir $@) $< 

$(TARGET):$(OBJPATH)
	$(CPP) -o $@ $(OBJPATH)/*.o $(LDFLAGS)

$(OBJPATH):
	mkdir -p $(OBJPATH)

clean:
	-rm $(OBJPATH)/*.o
	-rm $(TARGET)