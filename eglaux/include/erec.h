 /*
 * EREC.H
 *
 * description: "C header file for the Eiffel class AUX_EVENTREC"
 * library: "EGLAUX - Eiffel wrapping of the OpenGL Auxillary library"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
 * date: "$Date: 2001/01/14 14:23:38 $"
 * revision: "$Revision: 1.1 $"
 *
 */

#ifndef __EREC__
#define __EREC__

/* Get macros */
#define eglaux_erec_get_event(_ptr_) (((AUX_EVENTREC *) _ptr_)->event)
#define	eglaux_erec_get_data_1(_ptr_) (((AUX_EVENTREC *) _ptr_)->data[0])
#define eglaux_erec_get_data_2(_ptr_) (((AUX_EVENTREC *) _ptr_)->data[1])
#define eglaux_erec_get_data_3(_ptr_) (((AUX_EVENTREC *) _ptr_)->data[2])
#define eglaux_erec_get_data_4(_ptr_) (((AUX_EVENTREC *) _ptr_)->data[3])

/* Set macros */ 
#define eglaux_erec_set_event(_ptr_, _value_) (((AUX_EVENTREC *) _ptr_)->event = (GLint) (_value_))
#define eglaux_erec_set_data_1(_ptr_, _value_) (((AUX_EVENTREC *) _ptr_)->data[0] = (GLint) (_value_))
#define eglaux_erec_set_data_2(_ptr_, _value_) (((AUX_EVENTREC *) _ptr_)->data[1] = (GLint) (_value_))
#define eglaux_erec_set_data_3(_ptr_, _value_) (((AUX_EVENTREC *) _ptr_)->data[2] = (GLint) (_value_))
#define eglaux_erec_set_data_4(_ptr_, _value_) (((AUX_EVENTREC *) _ptr_)->data[3] = (GLint) (_value_))

#endif /* __EREC__ */

