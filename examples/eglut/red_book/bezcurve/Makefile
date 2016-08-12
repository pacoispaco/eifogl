all: bezcurve

bezcurve: EIFGENs
	cd EIFGENs/bezcurve/F_code; finish_freezing; cp bezcurve ../../../bezcurve; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f bezcurve; rm -rf EIFGENs
