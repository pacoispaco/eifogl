all: libeglu.a libeglut.a

libeglu.a:
	$(MAKE) -C spec/compiler/ise/egl

libeglut.a:
	$(MAKE) -C spec/compiler/ise/eglut
