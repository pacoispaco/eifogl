all: planet

planet: EIFGENs
	cd EIFGENs/planet/F_code; finish_freezing; cp planet ../../../planet; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f planet; rm -rf EIFGENs
