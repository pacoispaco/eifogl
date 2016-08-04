INCLUDE=-I./include -I$(ISE_EIFFEL)/studio/spec/linux-x86-64/include -I/usr/include/GL
CFLAGS=$(INCLUDE)

all: libeglut.a
	mv libeglut.a lib
    
libeglut.a: eglut.o
	ar -cvq libeglut.a eglut.o 

eglut.o: c/eglut.c
	cc -Wall -c $(CFLAGS) c/eglut.c
     
clean:
	rm -f lib/libeglut.a
