
## compiler
CC=g++
CFLAGS=-pthread -std=c++11

TARGETS=example
## source files
SRCS=source.cpp and.cpp\
	 so_on.cpp
## INC indicates the header file path
INC=-I ./

## dependant on corresponding cpp and all header files
%.o:%.cpp ./*.h
	$(CC) $(INC) $(CFLAGS) -o $@ -c $<

OBJS=$(SRCS:.cpp=.o)
## link CMD and some others
$(TARGETS):$(OBJS)
	$(CC) -o $(TARGETS) $(OBJS) 
	rm -rf *.o
#$(CC) -o $@ $^


.PHONY: list
list:
	echo $(TARGETS)

.PHONY: clean
clean:
	rm -rf $(TARGETS) $(OBJS)
