all: cube

cube: EIFGENs
	cd EIFGENs/cube/F_code; finish_freezing; cp cube ../../../cube; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f cube; rm -rf EIFGENs
