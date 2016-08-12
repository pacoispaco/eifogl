all: light

light: EIFGENs
	cd EIFGENs/light/F_code; finish_freezing; cp light ../../../light; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f light; rm -rf EIFGENs
