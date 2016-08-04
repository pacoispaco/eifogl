ELIBS = egl eglut utility
CLIBS = spec/compiler/ise/egl \
		spec/compiler/ise/eglut
EXAMPLES = examples/eglut/simple \
		   examples/eglut/edragnet \
		   examples/eglut/egl_primitives \
		   examples/eglut/single_sphere

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
