Notes for upgrading to FreeGLUT
===============================

These are development notes on upgrading Eifolg to using FreeGLUT.

Note: I'm working on Ubuntu 15.05/16.04 machines.

Setting up development environment with FreeGLUT
------------------------------------------------

Install the following packages for development with FreeGLUT:

```
 $ apt-get install freeglut3 freeglut3-dev libglew-dev
```

Those packages will pull in the following packages:

```
libgl1 (freeglut3)            # Virtual package representing the OpenGL API runtime
libgl1-mesa-glx (freeglut3)   # Free implementation of the OpenGL API -- GLX runtime (provides libgl1)

libgl-dev (freeglut3-dev)     # Virtual package representing the OpenGL API development files
libglu-dev                    # Virtual package representing the OpenGL GLU API development files
libgl1-mesa-dev               # Free implementation of the OpenGL API -- GLX development files (provides libgl-dev)
libglu1-mesa-dev              # Mesa OpenGL utility library -- development files (provides libglu-dev)

libglew1.6-dev                # Virtual package representing OpenGl Extension Wrangler
libglew1.10                   # OpenGL Extension Wrangler - runtime environment (provides libglew1.6-dev)
```

Compiling the EGLUT C wrapper files
-----------------------------------

Using EGLUT requires a static library that handles callbacks. This static library is part of EGLUT and the source code is located here:

```
$EIFOGL/spec/compiler/ise/eglut/c    # C code
$EIFOGL/spec/compiler/ise/eglut/h    # C headers
$EIFOGL/spec/compiler/ise/eglut/lib  # Makefile and static library
```

To compile the eglut.a library:

```
$EIFOGL/spec/compiler/ise/eglut/lib$ gcc -c ../c/eglut.c -I$ISE_EIFFEL/studio/spec/linux-x86-64/include -I/usr/include/GL -I$EIFOGL/spec/compiler/ise/eglut/include -o eglut.o
$EIFOGL/spec/compiler/ise/eglut/lib$ ar rcs libeglut.a eglut.o
```

