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
$EIFOGL/spec/compiler/ise/egl/c    # C code
$EIFOGL/spec/compiler/ise/egl/h    # C headers
$EIFOGL/spec/compiler/ise/egl/lib  # This is were the static library is put when compiled
```

To compile the libeglu.a library go to the directory 'eifogl/spec/compiler/ise/egl' and run:

```
$ make
```

Using EGLUT requires a static library that handles callbacks for GLUT (FreeGLUT). This static library is part of EGLUT and the source code is located here:

```
$EIFOGL/spec/compiler/ise/eglut/c    # C code
$EIFOGL/spec/compiler/ise/eglut/h    # C headers
$EIFOGL/spec/compiler/ise/eglut/lib  # This is were the static library is put when compiled
```

To compile the libeglut.a library go to the directory 'eifogl/spec/compiler/ise/eglut' and run:

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
| spec/compiler/ise/egl | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| eglaux  | **wontfix** |  | The GLAUX library is very old and should not be used any more. |
| eglut   | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| ewgl    | **wontfix** |  | WGL or Wiggle is an API between OpenGL and the windowing system interface of Windows. |
| utility | **ongoing** | Not Void-safe. | The Eiffel clusters 'cwrap', 'mixins' and 'structures' are working. |
| spec/compiler/ise/egl | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| spec/compiler/ise/eglaux | **wontfix** |  | See comment on eglaux above. |
| spec/compiler/ise/eglut | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| spec/compiler/ise/ewgl | **wontfix** |  | See comment on ewgl above. |
| spec/compiler/se/ | **todo** |  | Need to look up the status on the SmartEiffel and LibertyEiffel compilers first. |
| spec/platform | **wontfix** |  | See comment on ewgl above. |


| *Program* | *Status* | *Eiffel conformance* | *Comment* |
| --------- | -------- | -------------------- | --------- |
| examples/eglut/simple | **completed** | Not Void-safe. |  |
| examples/eglut/edragnet | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| examples/eglut/egl_primitives | **working** | Not Void-safe. | 11 obsolete calls and 2 unused locals. Needs some cleaning up and minor redesign. |
| examples/eglut/multi_sphere | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| examples/eglut/single_sphere | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| examples/eglut/simple_model_displayer | **ongoing** | Not Void-safe. | Needs rewriting. |
| examples/eglut/nehe/lesson7 | **working** | Not Void-safe. | Needs some cleaning up and possibly minor redesign. |
| examples/eglut/nehe/red_book | **todo** |  | 16 more tutorial programs! |

References
----------

 a) https://www.opengl.org/wiki/Related_toolkits_and_APIs
