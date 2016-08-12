all: torus

torus: EIFGENs
	cd EIFGENs/torus/F_code; finish_freezing; cp torus ../../../torus; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f torus; rm -rf EIFGENs
