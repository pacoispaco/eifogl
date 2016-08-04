INCLUDE=-I./include -I$(ISE_EIFFEL)/studio/spec/linux-x86-64/include -I/usr/include/GL
CFLAGS=$(INCLUDE)

all: libeglu.a
	mv libeglu.a lib
    
libeglu.a: eglu.o
	ar -cvq libeglu.a eglu_nurbs.o 

eglu.o: c/eglu_nurbs.c
	cc -Wall -c $(CFLAGS) c/eglu_nurbs.c
     
clean:
	rm -f lib/libeglu.a
