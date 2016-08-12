all: lines

lines: EIFGENs
	cd EIFGENs/lines/F_code; finish_freezing; cp lines ../../../lines; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f lines; rm -rf EIFGENs
