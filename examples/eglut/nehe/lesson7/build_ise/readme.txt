Author:	Paul Cohen
Copyright: Copyright (c) 2001 Paul Cohen
Date: $Date: 2002/03/23 19:31:18 $
Revision: $Revision: 1.1 $

README file for eifogl/examples/eglut/nehe/lesson7
==================================================

This example program is based on the "lesson07" tutorial program that can be found here:
  
  http://nehe.gamedev.net/tutorials/lesson07.asp

However my Eiffel program makes use of one additional texturing filter (Gl_linear_mipmap_linear)
and also uses a completely different library for loading the TGA file. The library used is
called libtga and is devloped by Matthias Brückner. The home page for libtga is

  http://sourceforge.net/projects/tgalib/

Note that my Eiffel program uses a small wrapping of libtga-0.1.0. The full libtga-0.1.0 release
is included in EiffelOpenGL. However the latest version of libtga is 0.1.6. Feel free to update 
the Eiffel wrapping to that version!

I've also added some benchmarking code (frames per second measurement) in my Eiffel program.

In order to build this program you must:

1. Unzip the "libtga-0.1.0.tar.gz" tarball in the directory:
     eifogl/utility/libtga
   so that its root is:
     eifogl/utility/libtga/libtga-0.1.0

2. Compile libtga and make the compiled library accessible via the Ace-file.
   The Ace-file in build_ise assumes that the libtga library is in:
     eifogl/utility/libtga/lib/msc
   The libtga.lib file there is compiled with MSCV++ 6.0.

In order to run this program you must:

1. Ensure that you copy the file 
     eifogl/examples/eglut/nehe/lesson7/data/crate_bgr.tga
   to same directory that you run the example7.exe program from.

   That file contains an image in TGA format that is textured onto the cube in the program.

Finally note that TGA by default stores and loads files in BGR(A) format - and not RGB(A).
Therefore if you want to use libtga-0.1.0 and my Eiffel wrapping to read TGA files you
should convert your RGB(A) images to BGR(A) to make them display as expected! Newer versions
of libtga and the Eiffel wrapping will allow you to load images as either either BGR(A) or 
RGB(A) images.