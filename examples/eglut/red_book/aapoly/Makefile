all: aapoly

aapoly: EIFGENs
	cd EIFGENs/aapoly/F_code; finish_freezing; cp aapoly ../../../aapoly; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f aapoly; rm -rf EIFGENs
