/* 
 * ETGA.H
 *
 * desciption: "Header file for the Eiffel wrapping of libtga"
 * library: "ETGA - Eiffel wrapping of the libtga library"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
 * date: "$Date: 2002/03/23 17:57:52 $"
 * revision: "$Revision: 1.1 $"
 */

#ifndef __ETGA__
#define __ETGA__
#include "tga.h"

/* Reading and writing the tga_info struct */

#define c_id_len(_ptr_) (((tga_info_ptr) _ptr_)->id_len)
#define c_set_id_len(_ptr_,_i_) (((tga_info_ptr) _ptr_)->id_len = (tga_uint_8) _i_)
#define c_map_t(_ptr_) (((tga_info_ptr) _ptr_)->map_t)	
#define	c_set_map_t(_ptr_,_i_) (((tga_info_ptr) _ptr_)->map_t = (tga_uint_8) _i_)
#define	c_img_t(_ptr_) (((tga_info_ptr) _ptr_)->img_t)
#define	c_set_img_t(_ptr_,_i_) (((tga_info_ptr) _ptr_)->img_t = (tga_uint_8) _i_)
#define	c_map_first_entry(_ptr_) (((tga_info_ptr) _ptr_)->map_first_entry)
#define c_set_map_first_entry(_ptr_,_i_) (((tga_info_ptr) _ptr_)->map_first_entry = (tga_uint_16) _i_)
#define	c_map_len(_ptr_) (((tga_info_ptr) _ptr_)->map_len)
#define	c_set_map_len(_ptr_,_i_) (((tga_info_ptr) _ptr_)->map_len = (tga_uint_16) _i_)
#define	c_map_entry_size(_ptr_) (((tga_info_ptr) _ptr_)->map_entry_size)
#define	c_set_map_entry_size(_ptr_,_i_) (((tga_info_ptr) _ptr_)->map_entry_size = (tga_uint_8) _i_)
#define	c_x(_ptr_) (((tga_info_ptr) _ptr_)->x)
#define	c_set_x(_ptr_,_i_) (((tga_info_ptr) _ptr_)->x = (tga_uint_16) _i_)
#define	c_y(_ptr_) (((tga_info_ptr) _ptr_)->y)
#define	c_set_y(_ptr_,_i_) (((tga_info_ptr) _ptr_)->y = (tga_uint_16) _i_)
#define	c_width(_ptr_) (((tga_info_ptr) _ptr_)->width)
#define	c_set_width(_ptr_,_i_) (((tga_info_ptr) _ptr_)->width = (tga_uint_16) _i_)
#define	c_height(_ptr_) (((tga_info_ptr) _ptr_)->height)
#define	c_set_height(_ptr_,_i_) (((tga_info_ptr) _ptr_)->height = (tga_uint_16) _i_)
#define	c_depth(_ptr_) (((tga_info_ptr) _ptr_)->depth)
#define	c_set_depth(_ptr_,_i_) (((tga_info_ptr) _ptr_)->depth = (tga_uint_8) _i_)
#define	c_desc(_ptr_) (((tga_info_ptr) _ptr_)->desc)
#define	c_set_desc(_ptr_,_i_) (((tga_info_ptr) _ptr_)->desc = (tga_uint_8) _i_)

/* Reading and writing the tga struct */

#define	c_img_id(_ptr_) (((tga_ptr) _ptr_)->img_id)
#define	c_set_img_id(_ptr_,_ptri_) (((tga_ptr) _ptr_)->img_id = (tga_uint_8 *) _ptri_)
#define	c_img_data(_ptr_) (((tga_ptr) _ptr_)->img_data)
#define	c_set_img_data(_ptr_,_ptri_) (((tga_ptr) _ptr_)->img_data = (tga_uint_8 *) _ptri_)
#define	c_color_map(_ptr_) (((tga_ptr) _ptr_)->color_map)
#define	c_set_color_map(_ptr_,_ptri_) (((tga_ptr) _ptr_)->color_map = (tga_uint_8 *) _ptri_)
#define	c_flags(_ptr_) (((tga_ptr) _ptr_)->flags)
#define	c_set_flags(_ptr_,_ptri_) (((tga_ptr) _ptr_)->flags = (tga_uint_32) _ptri_)
#define	c_sig(_ptr_) (((tga_ptr) _ptr_)->sig)
#define	c_set_sig(_ptr_,_ptri_) (((tga_ptr) _ptr_)->sig = (tga_byte *) _ptri_)
#define	c_io_ptr(_ptr_) (((tga_ptr) _ptr_)->io_ptr)
#define	c_set_io_ptr(_ptr_,_ptri_) (((tga_ptr) _ptr_)->io_ptr = (tga_byte *) _ptri_)

#endif
