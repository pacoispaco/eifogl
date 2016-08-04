all: multi_sphere

multi_sphere: EIFGENs
	cd EIFGENs/multi_sphere/F_code; finish_freezing; cp multi_sphere ../../..; cd ../../..

EIFGENs: project.ecf application.e main_window.e top_level_window_2.e sub_window.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f multi_sphere; rm -rf EIFGENs
