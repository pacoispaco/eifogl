/* 
 * EGL.H
 *
 * desciption: "Header file for EGL"
 * library: "EGL - Eiffel wrapping of the OpenGL library"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
 * date: "$Date: 2002/01/27 18:48:56 $"
 * revision: "$Revision: 1.2 $"
 */

#ifndef __EGL__
#define __EGL__
#include <gl.h>

#define c_put_double_in_gldouble_array(p, i, n) (((GLdouble*)p)[i]=(GLdouble)n)
#define c_double_in_gldouble_array(p, i) (((GLdouble*)p)[i])
#define c_put_real_in_glfloat_array(p, i, n) (((GLfloat*)p)[i]=(GLfloat)n)
#define c_real_in_glfloat_array(p, i) (((GLfloat*)p)[i])
#define c_put_integer_in_glint_array(p, i, n) (((GLint*)p)[i]=(GLint)n)
#define c_integer_in_glint_array(p, i) (((GLint*)p)[i])
#define c_put_integer_in_gluint_array(p, i, n) (((GLuint*)p)[i]=(GLuint)n)
#define c_integer_in_gluint_array(p, i) (((GLuint*)p)[i])
#define c_put_integer_in_glubyte_array(p, i, n) (((GLubyte*)p)[i]=(GLubyte)n)
#define c_integer_in_glubyte_array(p, i) (((GLubyte*)p)[i])

#endif
