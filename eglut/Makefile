# We only do an Eiffel compile and no C compile since we're only interested in
# verifying that the .ecf file is ok and that the Eiffel code compiles.

all: EIFGENs

clean: 
	rm -rf EIFGENs

EIFGENs: library.ecf
	ec -clean -config library.ecf
