/* 
 * EGLAUX.C
 *
 * Eiffel GLAUX callback functions
 *
 * desciption: "The Eiffel GLAUX encapsulation needs to define
 *              the callback functions that will be registered
 *              with GLAUX for each EGLAUX window."
 * library: "EGLAUX - Eiffel wrapping of the OpenGL Auxillary library"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
 * date: "$Date: 2001/01/14 14:23:38 $"
 * revision: "$Revision: 1.1 $"
 */

#ifndef __EGLAUX__
#include "eglaux.h"
#endif

EIF_OBJ eglaux_app = NULL;
/* Address of the Eiffel object EGLAUX_WINDOW created for each application. */

void subscribe_to_key_events (int key) {
  /* Register subscription to events for the given key. */
  switch (key) {
  case AUX_RETURN: auxKeyFunc(1, aux_key_proc_return);
  case AUX_ESCAPE: auxKeyFunc(AUX_ESCAPE, aux_key_proc_escape);
  case AUX_SPACE: auxKeyFunc(AUX_SPACE, aux_key_proc_space);
  case AUX_LEFT: auxKeyFunc(AUX_LEFT, aux_key_proc_left);
  case AUX_UP: auxKeyFunc(AUX_UP, aux_key_proc_up);
  case AUX_RIGHT: auxKeyFunc(AUX_RIGHT, aux_key_proc_right);
  case AUX_DOWN: auxKeyFunc(AUX_DOWN, aux_key_proc_down);
    /* 64 more case statements go here, one for every key ... puh! */
  }
}

void unsubscribe_to_key_events (int key) {
  /* Unregister subscription to events for the given key. */
  switch (key) {
  case AUX_RETURN: auxKeyFunc(AUX_RETURN, NULL);
  case AUX_ESCAPE: auxKeyFunc(AUX_ESCAPE, NULL);
  case AUX_SPACE: auxKeyFunc(AUX_SPACE, NULL);
  case AUX_LEFT: auxKeyFunc(AUX_LEFT, NULL);
  case AUX_UP: auxKeyFunc(AUX_UP, NULL);
  case AUX_RIGHT: auxKeyFunc(AUX_RIGHT, NULL);
  case AUX_DOWN: auxKeyFunc(AUX_DOWN, NULL);
    /* 64 more case statements go here, one for every key ... puh! */
  }
}

void CALLBACK aux_main_proc (void) {
  /* Main loop callback function. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_MAIN_LOOP_EVENT, 0, 0);
}

void CALLBACK aux_expose_proc (int i1, int i2) {
  /* Expose callback function. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_EXPOSE_EVENT, i1, i2);
}

void CALLBACK aux_reshape_proc (GLsizei width, GLsizei height) {
  /* Keyboard callback function. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_RESHAPE_EVENT, width, height);
}

void CALLBACK aux_idle_proc (void) {
  /* Motion callback function. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_IDLE_EVENT, 0, 0);
}

void CALLBACK aux_mouse_proc (AUX_EVENTREC *p) {
  /* Mouse callback function. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_MOUSE_EVENT, p, 0);
}

/* 69 individual key callback functions, one for every key. */

void CALLBACK aux_key_proc_return (void) {
  /* Key event callback function for key <Return>. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_KEY_EVENT, AUX_RETURN, 0);
}

void CALLBACK aux_key_proc_escape (void) {
  /* Key event callback function for key <Esc>. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_KEY_EVENT, AUX_ESCAPE, 0);
}

void CALLBACK aux_key_proc_space (void) {
  /* Key event callback function for key <Space>. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_KEY_EVENT, AUX_SPACE, 0);
}

void CALLBACK aux_key_proc_left (void) {
  /* Key event callback function for key <Left>. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_KEY_EVENT, AUX_LEFT, 0);
}

void CALLBACK aux_key_proc_up (void) {
  /* Key event callback function for key <Up>. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_KEY_EVENT, AUX_UP, 0);
}

void CALLBACK aux_key_proc_right (void) {
  /* Key event callback function for key <Right>. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_KEY_EVENT, AUX_RIGHT, 0);
}

void CALLBACK aux_key_proc_down (void) {
  /* Key event callback function for key <Down>. */
  EIF_PROC ep;
  EIF_TYPE_ID eti;

  eti = eif_type_id("EGLAUX_WINDOW");
  ep = eif_proc("main_application_callback", eti);
  (ep)(eif_access(eglaux_app), EGLAUX_KEY_EVENT, AUX_DOWN, 0);
}

/* 64 more aux_key_func_*** functions to go here ... puh! */




