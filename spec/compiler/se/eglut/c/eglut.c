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
 * copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
 * date: "$Date: 2002/11/25 16:07:21 $"
 * version: "$Revision: 1.1 $"
 */

#ifndef __EGLUT__
#include "eglut.h"
#endif

void eglut_display_function (void) {
  /* Display callback function. */
  mac (eglut_app, EGLUT_DISPLAY_EVENT, 0, 0, 0, 0, '\0');
}

void eglut_reshape_function (int w, int h) {
  /* Reshape callback function. */
  mac (eglut_app, EGLUT_RESHAPE_EVENT, w, h, 0, 0, '\0');
}

void eglut_keyboard_function (unsigned char key, int x, int y) {
  /* Keyboard callback function. */
  mac (eglut_app, EGLUT_KEYBOARD_EVENT, x, y, 0, 0, key);
}

void eglut_motion_function (int x, int y) {
  /* Motion callback function. */
  mac (eglut_app, EGLUT_MOTION_EVENT, x, y, 0, 0, '\0');
}

void eglut_passive_motion_function (int x, int y) {
  /* Passive motion callback function. */
  mac (eglut_app, EGLUT_PASSIVE_MOTION_EVENT, x, y, 0, 0, '\0');
}

void eglut_mouse_function (int button, int state, int x, int y) {
  /* Mouse callback function. */
  mac (eglut_app, EGLUT_MOUSE_EVENT, button, state, x, y, '\0');
}

void eglut_visibility_function (int state) {
  /* Passive motion callback function. */
  mac (eglut_app, EGLUT_VISIBILITY_EVENT, state, 0, 0, 0, '\0');
}

void eglut_entry_function (int state) {
  /* Passive motion callback function. */
  mac (eglut_app, EGLUT_ENTRY_EVENT, state, 0, 0, 0, '\0');
}

void eglut_special_function (int key, int x, int y) {
  /* Passive motion callback function. */
  mac (eglut_app, EGLUT_SPECIAL_EVENT, key, x, y, 0, '\0');
}

void eglut_idle_function (void) {
  /* Idle callback function. */
  mac (eglut_app, EGLUT_IDLE_EVENT, 0, 0, 0, 0, '\0');
}

