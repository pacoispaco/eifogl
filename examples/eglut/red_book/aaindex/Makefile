all: aaindex

aaindex: EIFGENs
	cd EIFGENs/aaindex/F_code; finish_freezing; cp aaindex ../../../aaindex; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f aaindex; rm -rf EIFGENs
