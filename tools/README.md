README file for eifogl/tools
============================

The directory eifogl/tools contains python code for compiling all the example
programs in EiffelOpenGL.

The tools consist of:
1. The python module "ebuild.py".
2. The python script "build_eifogl.py"

The python module "ebuild.py" contains general functionality for batch 
compilation of ISE Eiffel systems. The main function in the module accepts
a Eiffel project definition file in the form of a simple ASCII text file that
contains information on what projects to build, what Ace files to use etc.

The python script "build_eifogl.py" uses the module "ebuild.py" to build all
the example programs. Which programs to build and how to build them are 
specified in the file "eifogl_targets.txt".

To start compiling, open a command window and go to the directory "eifogl/tools"
and use the follwing command:

> python build_eifogl.py eifogl_targets.txt

The script "build_eifogl.py" checks some environment variables and then relies
on "ebuild.py" to build the targets as defined in "eifogl_targets.txt".

