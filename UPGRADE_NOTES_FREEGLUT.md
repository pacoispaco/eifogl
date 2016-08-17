Notes on the upgrade to FreeGLUT
================================

These are development notes on upgrading EiffelOpenGL to using FreeGLUT and the latest Mesa implementation of OpenGL on Linux.

Notes:

 1. I'm working on Ubuntu 15.05/16.04 machines.

 2. You have to make sure that the environment variable EIFOGL points to the root directory of the EiffelOpenGL source code tree.

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

Compiling the EGL and EGLUT C wrapper files
-------------------------------------------

Using EGL requires a static library that handles callbacks for GLU NURBS. This static library is part of EGL and the source code is located here:

```
$EIFOGL/clib            # C code
$EIFOGL/clib/include    # C headers
```

To compile the libeglu.a library go to the directory 'eifogl/egl/clib' and run:

```
$ make
```

Using EGLUT requires a static library that handles callbacks for GLUT (FreeGLUT). This static library is part of EGLUT and the source code is located here:

```
$EIFOGL/eglut/clib      # C code
$EIFOGL/eglut/include   # C headers
```

To compile the libeglut.a library go to the directory 'eifogl/eglut/clib' and run:

```
$ make
```

Both the above libraries can be built by running 'make' with the Makefile in the top-level $EIFOGL directory

Upgrade status for libraries and EGLUT programs
-----------------------------------------------

Here you can see the status of the ongoing upgrade to EiffelStudio 16.05, FreeGLUT and the Mesa OpenGL libraries on Linux.

Status can be one of **completed** (compiles and no warnings), **working** (compiles but has warnings), **ongoing**, **todo** and **wontfix**.

| *Library* | *Status* | *Eiffel conformance* | *Comment* |
| --------- | -------- | -------------------- | --------- |
| egl     | **working** | Not Void-safe. Uses old routine declaration for agents in EGL_PRIMITIVES. | Uses 11 obsolete calls and 2 unused locals. Check how much of current OpenGL API is covered. |
| eglaux  | **wontfix** |  | The GLAUX library is very old and should not be used any more. |
| eglut   | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| ewgl    | **wontfix** |  | WGL or Wiggle is an API between OpenGL and the windowing system interface of Windows. |
| utility | **ongoing** | Not Void-safe. | The Eiffel clusters 'cwrap', 'mixins' and 'structures' are working. |

| *Program* | *Status* | *Eiffel conformance* | *Comment* |
| --------- | -------- | -------------------- | --------- |
| examples/eglut/simple | **completed** | Not Void-safe. |  |
| examples/eglut/edragnet | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| examples/eglut/egl_primitives | **working** | Not Void-safe. | 11 obsolete calls and 2 unused locals. Needs some cleaning up and minor redesign. |
| examples/eglut/multi_sphere | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| examples/eglut/single_sphere | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| examples/eglut/simple_model_displayer | **ongoing** | Not Void-safe. | Needs rewriting. |
| examples/eglut/nehe/lesson7 | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| examples/eglut/nehe/red_book | **working** | Not Void-safe. | 16 example programs from The Red Book. On average 10 obsolete calls per program. Needs some cleaning up. On program does not run due to lack of support for FB/Index in my OpenGL implementations. |

TODO list for tidying up
------------------------

 1. Make sure there are README.md files for all directories that need it.
 2. Review doc cluster and update documentation.
 3. Delete obsolete code.
 4. Move spec code to respective top level directory for that library. This mean we get:
    * **egl/spec** with **ise** and **se** subdirectories.
    * **eglaux/spec** with **ise** and **se** subdirectories. This should be marked as obsolete but not deleted.
    * **eglut/spec** with **ise** and **se** subdirectories.
    * **ewgl/spec** with **ise** and **se** subdirectories. This should be marked as not maintained.
    * **ewglwel/spec** with **ise** and **se** subdirectories. This should be marked as not maintained.
 5. Tag everything as release 0.4.0!

References
----------

 a) https://www.opengl.org/wiki/Related_toolkits_and_APIs
