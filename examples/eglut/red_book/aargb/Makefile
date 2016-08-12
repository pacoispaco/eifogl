all: aargb

aargb: EIFGENs
	cd EIFGENs/aargb/F_code; finish_freezing; cp aargb ../../../aargb; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f aargb; rm -rf EIFGENs
