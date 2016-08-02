all: libeglu.a libeglut.a

libeglu.a:
	$(MAKE) -C spec/compiler/ise/egl

libeglut.a:
	$(MAKE) -C spec/compiler/ise/eglut

libraries:
	$(MAKE) -C egl
	$(MAKE) -C eglut
	$(MAKE) -C utility

clean:
	rm -rf egl/EIFGENs
	rm -rf eglut/EIFGENs
	rm -rf utility/EIFGENs
