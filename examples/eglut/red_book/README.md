The Red Book example programs
=============================

The book *The OpenGL Programming Guide:  The Official Guide to Learning OpenGL, Version 4.3 (8th Edition)* is known as *The Red Book*. It was first published in 1996 and has since then been updated a number of times since then. It contains a number of OpenGL example programs. They were originally written in C but later editions use C++. I have translated a number of the programs to Eiffel so they can be compiled with EiffelOpenGL and EGLUT.

All these Eiffel programs were originally written around 2000. Currently I'm working on adapting them to work with EiffelStudio 16.05 and making sure EGLUT works with FreeGLUT.

Status can be one of **completed** (compiles and no warnings), **working** (compiles but has warnings), **ongoing**, **todo** and **wontfix**.

| *Program* | *Screenshot* | *Status* | *Eiffel conformance* | *Comment* |
| --------- | ------------ | -------- | -------------------- | --------- |
| aacanti   | ![Screenshot](./aacanti/aacanti.png) | **working** | Not Void-safe. | 9 obsolete calls. |
| aaindex   |  | **working (maybe!)** | Not Void-safe. | Does not work on any of my machines due to the lack of support for FB/index in my OpenGL implementation. 9 obsolete calls. |
| aapoly    |  | **todo** |  |  |
| aargb     |  | **todo** |  |  |
| alpha     |  | **todo** |  |  |
| alpha3d   |  | **todo** |  |  |
| bezcurve  |  | **todo** |  |  |
| cube      | ![Screenshot](./cube/cube.png) | **working** | Not Void-safe. | 6 obsolete calls. |
| drawf     |  | **todo** |  |  |
| font      |  | **todo** |  |  |
| light     |  | **todo** |  |  |
| lines     |  | **todo** |  |  |
| planet    |  | **todo** |  |  |
| surface   |  | **todo** |  |  |
| teapots   |  | **todo** |  |  |
| torus     |  | **todo** |  |  |
