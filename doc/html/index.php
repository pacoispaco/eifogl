<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
   <META NAME="Author" CONTENT="Paul Cohen">
   <TITLE>EiffelOpenGL - Home page</TITLE>
</HEAD>
<BODY BACKGROUND="images/background_test.gif">

<!-- Create the main table for the page -->
<TABLE BORDER=0 CELLSPACING=3 CELLPADDING=3 COLS=1 WIDTH="600">

<!-- Top row begins here -->
<TR>

<!-- Top left dark blue square -->
<TD WIDTH="100" ALIGN=CENTER VALIGN=CENTER>
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#FFFFFF">
<BR><BR>
</FONT>
<FONT SIZE="4" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#FFFFFF">
<B>EiffelOpenGL</B>
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#FFFFFF">
<P>
Current release 0.2.0 <BR> January 1, 2002
</P>
</FONT>
</TD>

<!-- Central top title square -->
<TD WIDTH="400" ALIGN=CENTER VALIGN=CENTER>
<FONT SIZE="4" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#FFFFFF">
<B>Welcome to the EiffelOpenGL Home page!</B>
</TD>

<!-- Top right square with various icons -->
<TD WIDTH="100" ALIGN=CENTER VALIGN=CENTER>
<A HREF="http://sourceforge.net"><IMG SRC="http://sourceforge.net/sflogo.php?group_id=10172" WIDTH="88" HEIGHT="31" BORDER="0" ALT="sourceforge.net"></A>
<A HREF="http://www.opengl.org"><IMG SRC="images/OGL_sm.gif" WIDTH="68" HEIGHT="32" BORDER="0" ALT="www.opengl.org"></A>
</TD>

</TR>
<!-- End of top row! -->

<TR>
<TD WIDTH="100" ALIGN=LEFT VALIGN=TOP>

<!-- Add a table for the table of contents on the left side of the page -->
<TABLE BORDER=0 CELLSPACING=3 CELLPADDING=3 COLS=1 WIDTH="160" NOSAVE>

<BR><BR>

<TR><TD><B><A HREF="index.php">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#000000">
<IMG SRC="images/blue_ball.gif" WIDTH="16" HEIGHT="16" BORDER=0 ALT="->">
Home
</A></B></TD></TR>

<TR><TD><B><A HREF="faq.html">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#000000">
<IMG SRC="images/blue_ball.gif" WIDTH="16" HEIGHT="16" BORDER=0 ALT="->">
FAQ
</A></B></TD></TR>

<TR><TD><B><A HREF="documentation.html">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#000000">
<IMG SRC="images/blue_ball.gif" WIDTH="16" HEIGHT="16" BORDER=0 ALT="->">
Documentation
</A></B></TD></TR>

<TR><TD><B><A HREF="download.html">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#000000">
<IMG SRC="images/blue_ball.gif" WIDTH="16" HEIGHT="16" BORDER=0 ALT="->">
Download
</A></B></TD></TR>

<TR><TD><B><A HREF="examples.html">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#000000">
<IMG SRC="images/blue_ball.gif" WIDTH="16" HEIGHT="16" BORDER=0 ALT="->">
Examples
</A></B></TD></TR>

<TR><TD><B><A HREF="https://sourceforge.net/projects/eifogl/">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#000000">
<IMG SRC="images/blue_ball.gif" WIDTH="16" HEIGHT="16" BORDER=0 ALT="->">
Project page
</A></B></TD></TR>

<TR><TD><B><A HREF="links.html">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#000000">
<IMG SRC="images/blue_ball.gif" WIDTH="16" HEIGHT="16" BORDER=0 ALT="->">
Links
</A></B></TD></TR>

<TR><TD><B>
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#000000">
<BR><BR>
Contact:<A href="mailto:paco@ieee.org"><BR>paco@ieee.org</A>
</B></TD></TR>

</TABLE>
</TD>

<!-- Main contents starts here! -->
<TD WIDTH="400" ALIGN=LEFT VALIGN=TOP COLSPAN=2>
<TABLE BORDER=0 CELLSPACING=3 CELLPADDING=3 COLS=1 WIDTH="400">

<BR>
<TR><TD BGCOLOR="#BBBBBB">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#330088">
<b>General information</b>
</TD></TR>

<TR><TD>
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#330088">
<BR>
EiffelOpenGL is an open source project that aims to develop a complete
Eiffel binding for OpenGL. The binding is implemented as an Eiffel wrapping
of the OpenGL C API.
<P>
The aim of the project is to devlop a wrapping that:
<UL>
<LI> Is a complete wrapping of the OpenGL and GLUT libraries. </LI>
<LI> Runs on different platforms (primarily Win32 and X Window). </LI>
<LI> Can be used with any Eiffel compiler (primarily ISE and SmallEiffel). </LI>
<LI> Works with Mesa. </LI>
<LI> Can be used with ISEs Eiffel Vision library. </LI>
</UL>
The project is hosted on the excellent SourceForge website. At the moment 
there is only one person working on this project and that is me, Paul Cohen. 
But, if you're interested and want to help out please feel free to contact me!
<P>
Okay, but why did I start this project? There are three simple answers 
to that:
<UL>
<LI>I have long wanted to try my skills at graphics programming.</LI>
<LI>I wanted to do it using OpenGL.</LI>
<LI>I wanted to do it using Eiffel.</LI>
</UL>
OpenGL, the Eiffel way, means design-by-contract, garbage collection 
multiple inheritance, generic types and readable syntax among other things. 
EiffelOpenGL attempts to use all the benefits of Eiffel's support for 
design-by-contract. This enables a lot of obscure or implicit conditions 
in the OpenGL and GLUT API to be implemented in formal contracts and class 
invariants and thus to be checked in runtime. <P>
Of course, as you've already guessed, the small 3D balls to the left were 
created with EiffelOpenGL! 
<BR><BR>
</TD></TR>

<TR><TD BGCOLOR="#BBBBBB">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#330088">
<b>News</b>
</TD></TR>

<TR><TD>
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#330088">
<BR>
EiffelOpenGL 0.2.0 finally released! The important features of the new release are:
<UL>
<LI>A large number of OpenGL functions have been added to the main wrapper class EGL. </LI>
<LI>More OpenGL GLU functions have been added to the GLU wrapper class EGLU. </LI>
<LI>Support for NURBS has been added. </LI>
<LI>Wrapper classes for all the OpenGL primitives has been added. </LI>
<LI>Support for stippling patterns has been added. </LI>
<LI>An example program for testing the OpenGL primitives and stippling patterns. </LI>
<LI>7 example programs in C from the Red Book that have been translated to Eiffel. </LI>
<LI>A few bugs have been fixed. </LI>
<LI>A lot of code has been tidied up. </LI>
<LI>I have stopped working on EGLAUX in order to focus on the wrappings of GLUT and OpenGL proper. </LI>
<LI>No updated documentation. I intend to do a supplementary release to this 0.2.0 release containing documentation as soon as I have the time. </LI>
</UL>
<BR>
</TD></TR>

<TR><TD BGCOLOR="#BBBBBB">
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#330088">
<BR>
</TD></TR>

<TR><TD>
<FONT SIZE="1" FACE="verdana, verdana, arial, tahoma, helvetica" COLOR="#999999">
<BR>
Author: Paul Cohen <BR>
"$Date: 2002/01/07 23:03:29 $" <BR>
"$Revision: 1.5 $"
</FONT>
</TD></TR>

</TABLE>

</TD>
</TR>

</TABLE>

</BODY>

</HTML>


