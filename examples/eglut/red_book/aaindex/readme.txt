author: "Paul Cohen"
date: "$Date: 2003/04/26 21:27:07 $"
revision: "$Revision: 1.1 $"

Readme file for EiffelOpenGL example program aaindex
====================================================

The example program compiles with ISE Eiffel 5.2.116 + MSVC++ 6.0 and runs on
Windows 2000. The example program also compiles with SmallEiffel -0.74 + lcc 3.8.
But the window is simply black. I have also compiled and run the original (Red 
Book) C program with the same name with the same result.

The answer to my problem is of course answered in the GLUT for Win32 README
file:

"GLUT for Win32 supports color index mode ONLY in a paletted display mode
(i.e., 256 or 16 color mode)."

If you change the number of colors on your screen to 256 the aaindex program works
fine. I doubt I'll be using color index mode on Win32.

