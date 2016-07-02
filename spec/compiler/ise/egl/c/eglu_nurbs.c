/*
 * EGLU_NURBS.C
 *
 * Eiffel EGLU_NURBS callback functions
 *
 * desciption: "The Eiffel GLU NURBS encapsulation needs to define
 *              the callback functions that can be registered
 *              with GLU for each NURBS object.
 * library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"
 */

#ifndef __EGLU_NURBS__
#include "eglu_nurbs.h"
#endif

EIF_OBJ eglu_nurbs = NULL;
/* Address of the Eiffel object EGLU_NURBS. */

GLvoid eglu_error_callback (GLenum errorCode) {
  /* Error callback function. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLU_NURBS");
  ep = eif_proc("main_nurbs_callback", eti);
  (ep)(eif_access(eglu_nurbs), EGLU_NURBS_ERROR, errorCode, 0.0, NULL);
}

