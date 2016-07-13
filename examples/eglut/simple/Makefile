all: simple

simple: EIFGENs
		cd EIFGENs/simple_eglut/F_code; finish_freezing; cp simple_eglut ../../../simple; cd ../../..

EIFGENs: project.ecf application.e main_window.e
		ec -clean -finalize -config project.ecf
     
clean:
		rm simple; rm -rf EIFGENs
