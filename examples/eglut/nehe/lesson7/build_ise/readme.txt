Author:	Paul Cohen
Copyright: Copyright (c) 2001 Paul Cohen
Date: $Date: 2003/04/26 21:47:06 $
Revision: $Revision: 1.2 $

README file for eifogl/examples/eglut/nehe/lesson7
==================================================

This example program is based on the "lesson07" tutorial program that can be found here:
  
  http://nehe.gamedev.net/tutorials/lesson07.asp

However my Eiffel program makes use of one additional texturing filter (Gl_linear_mipmap_linear).

My program also uses a different library for loading the TGA file than what is used in the
original NeHe program. Actually I just use just a single Eiffel class I wrote called TGA_FILE 
that has functionality for reading TGA files.

I've also added some benchmarking code (frames per second measurement) in my Eiffel program.

In order to run this program you must:

1. Ensure that you copy the file 
     eifogl/examples/eglut/nehe/lesson7/data/crate_bgr.tga
   to same directory that you run the example7.exe program from.

   That file contains an image in TGA format that is textured onto the cube in the program.

Note that TGA by default stores and loads files in BGR(A) format - and not RGB(A)!
