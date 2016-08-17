Readme file for EGLUT
=====================

**EGLUT** is an Eiffel library that wraps the GLUT API, or rather the currently supported implementation of GLUT; FreeGLUT.

Writing EGLUT based EiffelOpenGL programs
-----------------------------------------

There are a number of example programs in the directory examples/eglut. To use EGLUT you need to implement at the least, two classes and do it according to the following constraints:

 * One of the classes must inherit from the EGLUT_APPLICATION class. In all the example programs this class is simply called APPLICATION. This is the root class of your EGLUT application. You must list the feature "make" as a creation procedure and you must specify it as the root class creation procedure in your applications .ecf file. You should not redefine this "make" feature unless you *really* understand the EGLUT library, since this feature sets up the wrapping of the GLUT C library and makes sure the neccessary callbacks from the C GLUT library will work. In all the example programs this class is simply called APPLICATION. **NOTE:** In order for the C callback (GLUT events) from the GLUT library to the feature *main_application_callback* i EGLUT_APPLICATION to work, this class is specified as visible in the eglut/library.ecf file.

 * The other class must inherit from the EGLUT_TOP_LEVEL_WINDOW class. In all the example programs this class is simply called MAIN_WINDOW. In this class you implement your GLUT-based OpenGL program and there are two parts to this. First you need to specifiy which GLUT window events you want to subscribe to and then what you want to happen when those events occur. Secondly you of course want to write your OpenGL program using all the OpenGL features available.

It is possible to have more than one window in GLUT-based applications, and you can write such programs using EGLUT. Se the example program example/eglut/multi_sphere to see how that can be done.
