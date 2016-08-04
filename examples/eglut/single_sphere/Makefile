all: single_sphere

single_sphere: EIFGENs
	cd EIFGENs/single_sphere/F_code; finish_freezing; cp single_sphere ../../..; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f single_sphere; rm -rf EIFGENs
