all: alpha3d

alpha3d: EIFGENs
	cd EIFGENs/alpha3d/F_code; finish_freezing; cp alpha3d ../../../alpha3d; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f alpha3d; rm -rf EIFGENs
