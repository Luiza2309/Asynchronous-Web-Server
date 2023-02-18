CFLAGS = -DDEBUG -DLOG_LEVEL=LOG_DEBUG -Wall -g -laio -fPIC

.PHONY: all clean

all: build

build: aws

aws: aws.o sock_util.o http_parser.o
	$(CC) $^ -o $@ $(CFLAGS)

aws.o: aws.c sock_util.h debug.h util.h

sock_util.o: sock_util.c sock_util.h debug.h util.h

http_parser.o: http_parser.c http_parser.h
	make -C http_parser.o

clean:
	-rm -f *~
	-rm -f sock_util.o
	-rm -f aws
