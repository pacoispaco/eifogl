Readme file for EGL
===================

**EGL** is an Eiffel library that wraps the OpenGL API and makes it possible to write OpenGL programs in Eiffel.

In order to write OpenGL programs you need to use a *OpenGL rendering context* that is specific for the windowing system you are using. How these rendering contexts work is not specified by the OpenGL specification. They are instead provided as an extension for the windowing system in question, by the provider of that windowing system. For the X Windows system there is the *GLX extension* and for MS Windows there is the *WGL extension*. Note that writing OpenGL programs for the Web using WebGL is done in JavaScript and is based on the *OpenGL ES*specification which is a subset of the full OpenGL specification.

Apart from using windowing specific rendering contexts you can also write OpenGL programs using GLUT, or rather the current incarnation of it; FreeGLUT. GLUT provides a simple event-driven windowing system that works on both X Windows and MS Windows. It is useful for learning about OpenGL and for writing simpler OpenGL programs that work on both those windowing systems.

So to sum up, in order to use **EGL** you will need to decide if you want to use it with GLUT, in which case you must also use the **EGLUT** library, or if you want to write a native OpenGL application for X Window or MS Windows. Of course you can write a portable OpenGL application but you will have to handle using XGL or WGL in your application yourself.

Using the library
-----------------

Apart from the Eiffel classes that wrap the OpenGL C API and provide Eiffel-level abstractions of some OpenGL features, there is also a small C library *libeglu* that handles callbacks for GLU Nurbs. This C library needs to be compiled as a static library and linked into your Eiffel application. The code for this library is in the directory *clib* and there is also a Makefile for building that library.

There is a *library.ecf* file for EGL that you can use in your Eiffel application.

Note that the library currently is not Void-safe.
