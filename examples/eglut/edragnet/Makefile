all: edragnet

edragnet: EIFGENs
	cd EIFGENs/edragnet/F_code; finish_freezing; cp edragnet ../../..; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f edragnet; rm -rf EIFGENs
