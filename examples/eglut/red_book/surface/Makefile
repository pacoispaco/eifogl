all: surface

surface: EIFGENs
	cd EIFGENs/surface/F_code; finish_freezing; cp surface ../../../surface; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f surface; rm -rf EIFGENs
