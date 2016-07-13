all: egl_primitives

egl_primitives: EIFGENs
	cd EIFGENs/egl_primitives/F_code; finish_freezing; cp egl_primitives ../../..; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f egl_primitives; rm -rf EIFGENs
