INCLUDE=-I./include -I$(ISE_EIFFEL)/studio/spec/linux-x86-64/include -I/usr/include/GL
CFLAGS=$(INCLUDE)

all: libeglut.a

libeglut.a: eglut.o
	ar -cvq libeglut.a eglut.o

eglut.o: eglut.c
	cc -Wall -c $(CFLAGS) eglut.c

clean:
	rm -f libeglut.a eglut.o
