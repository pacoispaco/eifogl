/* 
 * EGLUT.H
 *
 * desciption: "Header file for EGLUT.C"
 * library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 1999, 2002 Paul Cohen, see file forum.txt"
 * date: "$Date: 2002/11/13 16:49:47 $"
 * revision: "$Revision: 1.6 $"
 */

#ifndef __EGLUT__
#define __EGLUT__

#ifndef _eif_eiffel_h_
#	include <eif_eiffel.h>
#endif

#ifndef __glut_h__
#include <glut.h>
#endif

/* Callback event constants */
#define EGLUT_DISPLAY_EVENT 1
#define EGLUT_RESHAPE_EVENT 2
#define EGLUT_KEYBOARD_EVENT 3
#define EGLUT_MOUSE_EVENT 4
#define EGLUT_MOTION_EVENT 5
#define EGLUT_PASSIVE_MOTION_EVENT 6
#define EGLUT_VISIBILITY_EVENT 7
#define EGLUT_ENTRY_EVENT 8
#define EGLUT_SPECIAL_EVENT 9
#define EGLUT_IDLE_EVENT 10

/* Set macros for the callback functions */
/* glutDisplayFunc(NULL) is illegal! */
#define eglut_set_display_func glutDisplayFunc(eglut_display_function)
#define eglut_set_reshape_func_to_null glutReshapeFunc(NULL)
#define eglut_set_reshape_func glutReshapeFunc(eglut_reshape_function)
#define eglut_set_keyboard_func_to_null glutKeyboardFunc(NULL)
#define eglut_set_keyboard_func glutKeyboardFunc(eglut_keyboard_function)
#define eglut_set_motion_func_to_null glutMotionFunc(NULL)
#define eglut_set_motion_func glutMotionFunc(eglut_motion_function)
#define eglut_set_passive_motion_func_to_null glutPassiveMotionFunc(NULL)
#define eglut_set_passive_motion_func glutPassiveMotionFunc(eglut_passive_motion_function)
#define eglut_set_mouse_func_to_null glutMouseFunc(NULL)
#define eglut_set_mouse_func glutMouseFunc(eglut_mouse_function)
#define eglut_set_visibility_func_to_null glutVisibilityFunc(NULL)
#define eglut_set_visibility_func glutVisibilityFunc(eglut_visibility_function)
#define eglut_set_entry_func_to_null glutEntryFunc(NULL)
#define eglut_set_entry_func glutEntryFunc(eglut_entry_function)
#define eglut_set_special_func_to_null glutSpecialFunc(NULL)
#define eglut_set_special_func glutSpecialFunc(eglut_special_function)
#define eglut_set_idle_func_to_null glutIdleFunc(NULL)
#define eglut_set_idle_func glutIdleFunc(eglut_idle_function)

/* Set macro for the EGLUT_APPLICATION object */
#define eglut_set_application_object(_addr_) (eglut_app=(EIF_OBJ)_addr_)

/* Macro for quitting the application */
#define eglut_quit(_exitcode_) exit(_exitcode_)

extern EIF_OBJ eglut_app;
/* Address of the Eiffel object EGLUT_APPLICATION created for each application. */

/* EGLUT global function prototypes */
void eglut_display_function (void);
void eglut_reshape_function (int, int);
void eglut_keyboard_function (unsigned char, int, int);
void eglut_motion_function (int, int);
void eglut_passive_motion_function (int, int);
void eglut_mouse_function (int, int, int, int);
void eglut_visibility_function (int);
void eglut_entry_function (int);
void eglut_special_function (int, int, int);
void eglut_idle_function (void);

#endif

