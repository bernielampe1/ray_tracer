CC = g++

SRCS = $(wildcard *.cpp)

CPPFLAGS = $(INCLUDES) -Wall -g -O3
LIBS = -lpng

.PHONY: all
all : rt

rt : $(SRCS)
	$(CC) $(CPPFLAGS) $(LIBS) $^ -o $@

.PHONY: clean
clean : 
	rm -f rt

