eifogl
======

EiffelOpenGL is an Eiffel wrapping of OpenGL. It consists of incomplete but working wrappings of the GL and GLU libraries, as well as the GLUT library. It is licensed under EFL - The Eiffel Forum License.

A little history
----------------

This library was written in 1998-2002 in my spare time as a hobby project. I simply wanted to learn about graphics programming using OpenGL and I wanted to do it in Eiffel.

At that time I was working professionally on Windows and the main Eiffel development environment and compiler (ISE Eiffel - today Eiffel Software) was investing heavily in a presence on the Windows platform. Therefore it seemed natural for me to start working on EiffelOpenGL on Windows.

Since 2002 I haven't touched the library. The current library is thus completely geared towards Windows. This means that the configuration files (Ace-files) for each EiffelOpenGL program in the examples are written for the Windows platform.

Current status
--------------

In june 2016, after many years, I started working on upgrading the library to the latest release of EiffelStudio and in getting it working on Linux with the Mesa OpenGL and FreeGLUT libraries. Note: I'm working on Ubuntu 15.05/16.04 machines.

Short term goals:

 1. Ignore support for Eifogl on Windows.
 2. Upgrade GLUT Eiffel binding to FreeGLUT.
 3. Update all GLUT example programs.

Long term and low prio goals:

 1. Remove obsolete stuff.
 2. Upgrade GLX binding.

I'm currenly working on getting everything to compile with EIffelStudio 16.05 and FreeGLUT. I'm rusty on both but have got the example program 'simple' working. You can find that [here](https://github.com/pacoispaco/eifogl/tree/master/examples/eglut/simple).

Since I haven't yet gone through all code, there's a lot of stuff here that may not work at the moment. I hope to fix that and remove all obsolete stuff in teh coming months.

Installing
----------

 1. Install EiffelStudio Enterprise or the GPL licensed version from https://www.eiffel.org/downloads

 2. Install Mesa OpenGL and FreeGLUT.

```
$ sudo apt-get install freeglut3 freeglut3-dev libglew-dev
```

 3. Install the Mesa utilities which include **glxinfo** tool that displays info on your OpenGL installation, i.e. capabilities of the OpenGL implementation.

```
$ sudo apt-get install mesa-utils
```

 4. Clone this git repo.

```
$ git clone https://github.com/pacoispaco/eifogl.git
```

 5. Make sure the ISE_EIFFEL and EIFOGL environment variables are set. Edit the file 'tools/setupenv.sh' as is appropriate and then source it. You can of course put those environment variables in your .bashrc or other appropriate dotfile.

 6. Compile the C wrapper libraries in EiffelOpenGL. Run make in the root directory.

```
$ make
```

