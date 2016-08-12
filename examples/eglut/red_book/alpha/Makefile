all: alpha

alpha: EIFGENs
	cd EIFGENs/alpha/F_code; finish_freezing; cp alpha ../../../alpha; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f alpha; rm -rf EIFGENs
