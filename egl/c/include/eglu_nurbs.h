/* 
 * EGLU_NURBS.H
 *
 * desciption: "Header file for EGLU_NURBS.C"
 * library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
 * date: "$Date: 2001/10/26 22:38:10 $"
 * revision: "$Revision: 1.1 $"
 */

#ifndef __EGLU_NURBS__
#define __EGLU_NURBS__

#ifndef _eif_eiffel_h_
#	include <eif_eiffel.h>
#endif

#ifndef __glu_h__
#include <glu.h>
#endif

#ifndef CALLBACK
#define CALLBACK
#endif

/* Callback function constants */
#define EGLU_NURBS_ERROR 1
#define EGLU_NURBS_BEGIN 2
#define EGLU_NURBS_BEGIN_DATA 3
#define EGLU_NURBS_TEXTURE_COORD 4
#define EGLU_NURBS_TEXTURE_COORD_DATA 5
#define EGLU_NURBS_COLOR 6
#define EGLU_NURBS_COLOR_DATA 7
#define EGLU_NURBS_NORMAL 8
#define EGLU_NURBS_NORMAL_DATA 9
#define EGLU_NURBS_VERTEX 10 
#define EGLU_NURBS_VERTEX_DATA 11 
#define EGLU_NURBS_END 12 
#define EGLU_NURBS_END_DATA 13

/* Set macros for the callback functions */
#define eglu_set_nurbs_error_callback_function(_nobj_) gluNurbsCallback((GLUnurbsObj *)_nobj_,GLU_ERROR,eglu_error_callback)
#define eglu_set_nurbs_error_callback_function_to_null(_nobj_) gluNurbsCallback((GLUnurbsObj *)_nobj_,GLU_ERROR,NULL)

/* Set macro for the EGLU_NURBS object */
#define eglu_set_nurbs_object(_addr_) (eglu_nurbs=(EIF_OBJ)_addr_)

/* Address of the Eiffel object EGLU_NURBS created for each application. */
extern EIF_OBJ eglu_nurbs;

/* EGLU_NURBS global function prototypes */
void CALLBACK eglu_error_callback (GLenum);

#endif

