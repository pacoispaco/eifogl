all: simple_model_displayer

simple_model_displayer: EIFGENs
	cd EIFGENs/simple_model_displayer/F_code; finish_freezing; cp simple_model_displayer ../../..; cd ../../..

EIFGENs: project.ecf application.e main_window.e tuple_based_vector.e a_3d_object.e
	ec -clean -finalize -config project.ecf

clean:
	rm -f simple_model_displayer; rm -rf EIFGENs
