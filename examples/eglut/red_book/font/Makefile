all: font

font: EIFGENs
	cd EIFGENs/font/F_code; finish_freezing; cp font ../../../font; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f font; rm -rf EIFGENs
