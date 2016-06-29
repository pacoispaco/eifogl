Notes for upgrading to FreeGLUT
===============================

These are development notes on upgrading Eifolg to using FreeGLUT.

Note: I'm working on Ubuntu 15.05/16.04 machines.

General
-------

Short term goals:

 1. Ignore support for Eifogl on Windows.
 2. Upgrade GLUT Eiffel binding to FreeGLUT.
 3. Update all GLUT example programs.

Long term and low prio goals:

 1. Remove obsolete stuff.
 2. Upgrade GLX binding.

Setting up development environment with FreeGLUT
------------------------------------------------

Install the following packages for development with FreeGLUT:

 $ apt-get install freeglut3 freeglut3-dev libglew-dev

Those packages will pull in the following packages:

 libgl1 (freeglut3)            # Virtual package representing the OpenGL API runtime
 libgl1-mesa-glx (freeglut3)   # Free implementation of the OpenGL API -- GLX runtime (provides libgl1)

 libgl-dev (freeglut3-dev)     # Virtual package representing the OpenGL API development files
 libglu-dev                    # Virtual package representing the OpenGL GLU API development files
 libgl1-mesa-dev               # Free implementation of the OpenGL API -- GLX development files (provides libgl-dev)
 libglu1-mesa-dev              # Mesa OpenGL utility library -- development files (provides libglu-dev)

 libglew1.6-dev                # Virtual package representing OpenGl Extension Wrangler
 libglew1.10                   # OpenGL Extension Wrangler - runtime environment (provides libglew1.6-dev)

Other useful tools
------------------

Install the following package:

 $ apt-get install mesa-utils

to get the command line toll 'glxinfo' that displays info on your OpenGL installation, i.e. capabilities of the OpenGL implementation.

Compiling the EGLUT C wrapper files
-----------------------------------

Using EGLUT requires a static library that handles callbacks. This static library is part of EGLUT and the source code is located here:

 $EIFOGL/spec/compiler/ise/eglut/c    # C code
 $EIFOGL/spec/compiler/ise/eglut/h    # C headers
 $EIFOGL/spec/compiler/ise/eglut/lib  # Makefile and static library 

 $ gcc -c ../c/eglut.c -I/usr/local/Eiffel_16.05/studio/spec/linux-x86-64/include -I/usr/include/GL -I/home/paco/proj/eifogl/spec/compiler/ise/eglut/include -o eglut.o
 $ ar rcs libeglut.a eglut.o


