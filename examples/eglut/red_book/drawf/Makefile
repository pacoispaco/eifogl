all: drawf

drawf: EIFGENs
	cd EIFGENs/drawf/F_code; finish_freezing; cp drawf ../../../drawf; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f drawf; rm -rf EIFGENs
