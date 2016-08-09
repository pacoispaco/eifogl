all: aacanti

aacanti: EIFGENs
	cd EIFGENs/aacanti/F_code; finish_freezing; cp aacanti ../../../aacanti; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f aacanti; rm -rf EIFGENs
