/* 
 * EGLAUX.H
 *
 * desciption: "Header file for EGLAUX.C"
 * library: "EGLAUX - Eiffel wrapping of the OpenGL Auxillary library"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
 * date: "$Date: 2001/01/14 14:23:38 $"
 * revision: "$Revision: 1.1 $"
 */

#ifndef __EGLAUX__
#define __EGLAUX__

#ifndef _eif_eiffel_h_
#	include <eif_eiffel.h>
#endif

#ifndef __glaux_h__
#include <glaux.h>
#endif

/* Callback event constants */
#define EGLAUX_MAIN_LOOP_EVENT 1
#define EGLAUX_EXPOSE_EVENT 2
#define EGLAUX_RESHAPE_EVENT 3
#define EGLAUX_IDLE_EVENT 4
#define EGLAUX_MOUSE_EVENT 5
#define EGLAUX_KEY_EVENT 6

/* Set macros for the callback functions */
#define eglaux_set_main_loop_proc auxMainLoop(aux_main_proc)
#define eglaux_set_main_loop_proc_to_null auxMainLoop(NULL)
#define eglaux_set_expose_proc auxExposeFunc(aux_expose_proc)
#define eglaux_set_expose_proc_to_null auxExposeFunc(NULL)
#define eglaux_set_reshape_proc auxReshapeFunc(aux_reshape_proc)
#define eglaux_set_reshape_proc_to_null auxReshapeFunc(NULL)
#define eglaux_set_idle_proc auxIdleFunc(aux_idle_proc)
#define eglaux_set_idle_proc_to_null auxIdleFunc(NULL)
#define eglaux_set_mouse_proc auxMouseFunc(0, 0, aux_mouse_proc)
#define eglaux_set_mouse_proc_to_null auxMouseFunc(0, 0, NULL)

/* Set macro for the EGLAUX_APPLICATION object */
#define eglaux_set_application_object(_addr_) (eglaux_app=(EIF_OBJ)_addr_)

extern EIF_OBJ eglaux_app;
/* Address of the Eiffel object EGLAUX_WINDOW created for each application. */

/* EGLAUX global function prototypes */
void subscribe_to_key_events (int);
void unsubscribe_to_key_events (int);
void CALLBACK aux_main_proc (void);
void CALLBACK aux_expose_proc (int, int);
void CALLBACK aux_reshape_proc (GLsizei, GLsizei);
void CALLBACK aux_idle_proc (void);
void CALLBACK aux_mouse_proc (AUX_EVENTREC *p);
void CALLBACK aux_key_proc_return (void);
void CALLBACK aux_key_proc_escape (void);
void CALLBACK aux_key_proc_space (void);
void CALLBACK aux_key_proc_left (void);
void CALLBACK aux_key_proc_up (void);
void CALLBACK aux_key_proc_right (void);
void CALLBACK aux_key_proc_down (void);

#endif

