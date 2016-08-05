all: lesson7

lesson7: EIFGENs
	cd EIFGENs/lesson7/F_code; finish_freezing; cp lesson7 ../../..; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f lesson7; rm -rf EIFGENs
