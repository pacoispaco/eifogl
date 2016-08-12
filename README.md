eifogl (EiffelOpenGL)
=====================

EiffelOpenGL is an Eiffel wrapping of OpenGL. It consists of incomplete but working wrappings of the GL and GLU libraries, as well as the GLUT library. It is licensed under EFL - The Eiffel Forum License.

A little history
----------------

This library was written in 1998-2002 in my spare time as a hobby project. I simply wanted to learn about graphics programming using OpenGL and I wanted to do it in Eiffel.

At that time I was working professionally on Windows and the main Eiffel development environment and compiler (ISE Eiffel - today Eiffel Software) was investing heavily in a presence on the Windows platform. Therefore it seemed natural for me to start working on EiffelOpenGL on Windows.

Between 2002 and the summer of 2016 didn't do any work on the library.

Current status
--------------

In june 2016, after many years, I started working on upgrading the library to the latest release of EiffelStudio and in getting it working on Linux (Ubuntu 15.05 & 16.04) with the Mesa OpenGL and FreeGLUT libraries.

Short term goals:

 1. Ignore support for Eiffel OpenGL on Windows.
 2. Upgrade GLUT Eiffel binding to FreeGLUT.
 3. Update all GLUT example programs.

Long term and low prio goals:

 1. Remove obsolete stuff.
 2. Upgrade GLX binding.
 3. See if it is easy to make it work with LibertyEiffel.

You can check the status of ongoing work [here](https://github.com/pacoispaco/eifogl/blob/master/UPGRADE_NOTES_FREEGLUT.md).

Installing and setting up a development environment
---------------------------------------------------

 1. Install EiffelStudio Enterprise or the GPL licensed version from https://www.eiffel.org/downloads
 2. Make sure the ISE_EIFFEL environment variable is set.
 3. Install Mesa OpenGL and FreeGLUT.
```
$ sudo apt-get install freeglut3 freeglut3-dev libglew-dev
```
 4. Install the Mesa utilities which include **glxinfo** tool that displays info on your OpenGL installation, i.e. capabilities of the OpenGL implementation.
```
$ sudo apt-get install mesa-utils
```
 5. Clone this git repo.
```
$ git clone https://github.com/pacoispaco/eifogl.git
```
 6. Make sure the EIFOGL environment variable is set to point to the root directory where you cloned your local copy of eifogl; typically something like this:
```
$ export EIFOGL=~/myprojects/eifogl
```
You should of course put the environment variables you need to have set in your .bashrc or other appropriate dotfile.
 7. Compile the C wrapper libraries in EiffelOpenGL. Run make in the root directory.
```
$ make clibs
```

Writing EGLUT based EiffelOpenGL programs
-----------------------------------------

There are a number of example programs in the directory examples/eglut. To use EGLUT you need to implement at the least, two classes and do it according to the following constraints:

 * One of the classes must inherit from the EGLUT_APPLICATION class. In all the example programs this class is simply called APPLICATION. This is the root class of your EGLUT application. You must list the feature "make" as a creation procedure and you must specify it as the root class creation procedure in your applications .ecf file. You should not redefine this "make" feature unless you *really* understand the EGLUT library, since this feature sets up the wrapping of the GLUT C library and makes sure the neccessary callbacks from the C GLUT library will work. In all the example programs this class is simply called APPLICATION. **NOTE:** In order for the C callback (GLUT events) from the GLUT library to the feature *main_application_callback* i EGLUT_APPLICATION to work, this class is specified as visible in the eglut/library.ecf file.

 * The other class must inherit from the EGLUT_TOP_LEVEL_WINDOW class. In all the example programs this class is simply called MAIN_WINDOW. In this class you implement your GLUT-based OpenGL program and there are two parts to this. First you need to specifiy which GLUT window events you want to subscribe to and then what you want to happen when those events occur. Secondly you of course want to write your OpenGL program using all the OpenGL features available.

It is possible to have more than one window in GLUT-based applications, and you can write such programs using EGLUT. Se the example program example/eglut/multi_sphere to see how that can be done.
