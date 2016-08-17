/*
 * EGLUT.C
 *
 * Eiffel GLUT callback functions
 *
 * desciption: "The Eiffel GLUT encapsulation needs to define
 *              the callback functions that will be registered
 *              with GLUT for each GLUT window. Note that the
 *              same event callback function is used for every
 *              window! It is simply registered for the window
 *              that currently is the current GLUT window!"
 * library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"
 */

#ifndef __EGLUT__
#include "eglut.h"
#endif

EIF_OBJECT eglut_app = NULL;
/* Address of the Eiffel object EGLUT_APP created for each application. */
EIF_PROCEDURE eglut_ep;
/* Peference to the main_application_callback feature. */

void eglut_initialize_library (EIF_OBJ an_eglut_app) {
  EIF_TYPE_ID eti;

  eglut_app = an_eglut_app;
  /* Since the same feature is called by all callbacks (and the code does
     not move) we should be able to do this. */
  eti = eif_type_id ("EGLUT_APPLICATION");

  if (eti == EIF_NO_TYPE) {
     eif_panic ("Not a type");
  }

  eglut_ep = eif_procedure ("main_application_callback", eti);

  if (eglut_ep == NULL) {
     eif_panic ("eglut_ep == NULL!");
  }
}

void eglut_display_function (void) {
  /* Display callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_DISPLAY_EVENT, 0, 0, 0, 0, '/0');
}

void eglut_reshape_function (int w, int h) {
  /* Reshape callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_RESHAPE_EVENT, w, h, 0, 0, '/0');
}

void eglut_keyboard_function (unsigned char key, int x, int y) {
  /* Keyboard callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_KEYBOARD_EVENT, x, y, 0, 0, key);
}

void eglut_motion_function (int x, int y) {
  /* Motion callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_MOTION_EVENT, x, y, 0, 0, '/0');
}

void eglut_passive_motion_function (int x, int y) {
  /* PAssive motion callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_PASSIVE_MOTION_EVENT, x, y, 0, 0, '/0');
}

void eglut_mouse_function (int button, int state, int x, int y) {
  /* Mouse callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_MOUSE_EVENT, button, state, x, y, '/0');
}

void eglut_visibility_function (int state) {
  /* PAssive motion callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_VISIBILITY_EVENT, state, 0, 0, 0, '/0');
}

void eglut_entry_function (int state) {
  /* PAssive motion callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_ENTRY_EVENT, state, 0, 0, 0, '/0');
}

void eglut_special_function (int key, int x, int y) {
  /* Passive motion callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_SPECIAL_EVENT, key, x, y, 0, '/0');
}

void eglut_idle_function (void) {
  /* Idle callback function. */
  (eglut_ep) (eif_access (eglut_app), EGLUT_IDLE_EVENT, 0, 0, 0, 0, '/0');
}
