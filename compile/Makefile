CC=g++
CFLAGS=-pthread -std=c++11

SRCS=bind_ref.cpp cv_notify.cpp future_demo.cpp move_rvalue.cpp promise_demo.cpp tmp.cpp


#%.o:%.cpp
#	$(CC) $(CFLAGS) -o $@ -c $<
#OBJS=$(SRCS:.cpp=.o)

%:%.cpp
	$(CC) $(CFLAGS) -o $@ $<
TARGETS=$(SRCS:.cpp= )

all:$(TARGETS)




.PHONY: list
list:
	echo $(TARGETS)

.PHONY: clean
clean:
	rm $(TARGETS) > /dev/null
