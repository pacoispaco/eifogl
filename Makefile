ELIBS = egl eglut utility
CLIBS = egl/clib \
		eglut/clib
EXAMPLES = examples/eglut/simple \
		   examples/eglut/edragnet \
		   examples/eglut/egl_primitives \
		   examples/eglut/single_sphere \
		   examples/eglut/multi_sphere \
		   examples/eglut/nehe/lesson7 \
		   examples/eglut/red_book/aacanti \
		   examples/eglut/red_book/aaindex \
		   examples/eglut/red_book/aapoly \
		   examples/eglut/red_book/aargb \
		   examples/eglut/red_book/alpha \
		   examples/eglut/red_book/alpha3d \
		   examples/eglut/red_book/bezcurve \
		   examples/eglut/red_book/cube \
		   examples/eglut/red_book/drawf \
		   examples/eglut/red_book/font \
		   examples/eglut/red_book/light \
		   examples/eglut/red_book/lines \
		   examples/eglut/red_book/planet \
		   examples/eglut/red_book/surface \
		   examples/eglut/red_book/teapots\
		   examples/eglut/red_book/torus

.PHONY: clean all elibs $(ELIBS) clibs $(CLIBS) examples $(EXAMPLES)

all: elibs clibs

clibs: $(CLIBS)

$(CLIBS):
	$(MAKE) -C $@

elibs: $(ELIBS)

$(ELIBS):
	$(MAKE) -C $@

clean:
	-for d in $(ELIBS) $(CLIBS); do $(MAKE) clean -C $$d; done

examples: $(EXAMPLES)

$(EXAMPLES):
	$(MAKE) -C $@

cleanexamples:
	-for d in $(EXAMPLES); do $(MAKE) clean -C $$d; done
