all: teapots

teapots: EIFGENs
	cd EIFGENs/teapots/F_code; finish_freezing; cp teapots ../../../teapots; cd ../../..

EIFGENs: project.ecf application.e main_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f teapots; rm -rf EIFGENs
