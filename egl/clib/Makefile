INCLUDE=-I./include -I$(ISE_EIFFEL)/studio/spec/linux-x86-64/include -I/usr/include/GL
CFLAGS=$(INCLUDE)

all: libeglu.a
    
libeglu.a: eglu.o
	ar -cvq libeglu.a eglu_nurbs.o 

eglu.o: eglu_nurbs.c
	cc -Wall -c $(CFLAGS) eglu_nurbs.c
     
clean:
	rm -f libeglu.a eglu_nurbs.o
