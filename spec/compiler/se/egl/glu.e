indexing
	description: "Raw wrapper class for the OpenGL GLU library."
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "SmallEiffel -0.74 beta #17 (lcc-win32 3.7)"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2003/04/27 06:44:29 $"
	revision: "$Revision: 1.5 $"

class GLU
	
feature -- OpenGL glu API.
	
	glu_ortho_2d (left, right, bottom, top: DOUBLE) is
		external
--			"C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
			"C use <glu.h>"		
		alias
			"gluOrtho2D"
		end
		
	c_glu_build_2D_mipmaps (target, internal_format, width, height, format, type: INTEGER; data: POINTER) is
		external
--			"C [macro <glu.h>] (GLenum, GLint, GLsizei, GLsizei, GLenum, GLenum, const void *)"
			"C use <glu.h>"		
		alias
			"gluBuild2DMipmaps"
		end
		
	c_glu_build_2D_mipmaps_data: PIXEL_DATA_MAP
			-- We need to keep a reference to the Pixel Data Map so
			-- that it and its memory segment aren't garbage collected!
	
	glu_build_2D_mipmaps (target, internal_format, width, height, format, type: INTEGER; data: PIXEL_DATA_MAP) is
		do
			c_glu_build_2D_mipmaps_data := data
			c_glu_build_2D_mipmaps (target, internal_format, width, height, format, type, data.pointer)
		end
	
	glu_new_quadric: POINTER is
		external
--			"C [macro <glu.h>] (): GLUquadricObj *"
			"C use <glu.h>"		
		alias
			"gluNewQuadric()"
		end
		
	glu_quadric_draw_style (qobj: POINTER; draw_style: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLenum)"
			"C use <glu.h>"		
		alias
			"gluQuadricDrawStyle"		
		end
	
	glu_quadric_orientation (qobj: POINTER; orientation: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLenum)"
			"C use <glu.h>"		
		alias
			"gluQuadricOrientation"		
		end
	
	glu_quadric_normals (qobj: POINTER; normals: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLenum)"
			"C use <glu.h>"		
		alias
			"gluQuadricNormals"		
		end
	
	glu_delete_quadric (qobj: POINTER)is
		external
--			"C [macro <glu.h>] (GLUquadric *)"
			"C use <glu.h>"		
		alias
			"gluDeleteQuadric"
		end
		
	glu_cylinder (qobj: POINTER; base_radius, top_radius, height: DOUBLE; slices, stacks: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLdouble, GLdouble, GLdouble, GLint, GLint)"
			"C use <glu.h>"		
		alias
			"gluCylinder"
		end
		
	glu_sphere (qobj: POINTER; radius: DOUBLE; slices, stacks: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLdouble, GLint, GLint)"
			"C use <glu.h>"		
		alias
			"gluSphere"
		end

	glu_perspective (fov_y, aspect, z_near, z_far: DOUBLE) is
		external
--			"C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
			"C use <glu.h>"		
		alias
			"gluPerspective"
		end
	
	glu_look_at (eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz: DOUBLE) is
		external
--			"C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble)"
			"C use <glu.h>"		
		alias
			"gluLookAt"
		end
		
	glu_error_string (i: INTEGER): POINTER is
		external
--			"C [macro <glu.h>] (int): static char *"
			"C use <glu.h>"		
		alias
			"gluErrorString"
		end
	
	glu_new_nurbs_renderer: POINTER is
		external
--			"C [macro <glu.h>] (): GLUnurbsObj *"
			"C use <glu.h>"		
		alias
			"gluNewNurbsRenderer"
		end
	
	glu_nurbs_property (nurb: POINTER; property: INTEGER; value: DOUBLE) is
		external
--			"C [macro <glu.h>] (GLUnurbsObj *, GLenum, GLfloat)"
			"C use <glu.h>"		
		alias
			"gluNurbsProperty"
		end
	
	glu_begin_surface (nurb: POINTER) is
		external
--			"C [macro <glu.h>] (GLUnurbsObj *)"
			"C use <glu.h>"		
		alias
			"gluBeginSurface"
		end
	
	glu_end_surface (nurb: POINTER) is
		external
--			"C [macro <glu.h>] (GLUnurbsObj *)"
			"C use <glu.h>"		
		alias
			"gluEndSurface"
		end
	
	glu_nurbs_surface (nurb: POINTER; 
			    u_knot_count: INTEGER; u_knot: POINTER;
			    v_knot_count: INTEGER; v_knot: POINTER; 
			    u_knot_stride, v_knot_stride: INTEGER; 
			    ctl_array: POINTER; 
			    u_order, v_order: INTEGER; 
			    type: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUnurbsObj *, GLint, GLfloat *, GLint, GLfloat *, GLint, GLint, GLfloat *, GLint, GLint, GLenum)"
			"C use <glu.h>"		
		alias
			"gluNurbsSurface"
		end
	
feature {EGLU} -- EGLU NURBS C interface	
	
	eglu_init_nurbs_api (eglu: EGLU) is
			-- Initialize the GLU NURBS C API. The Eiffel object
			-- `eglu' is needed to pass over to the C interface so
			-- that it can make qualified calls back to Eiffel. 
		require
			eglu_not_void: eglu /= Void
		do
			eglu_set_nurbs_object (eglu)
		end
	
	frozen eglu_set_nurbs_object (p: EGLU) is
			-- Set the EGLU_NURBS object in the EGLU NURBS C
			-- interface.
		external
			"C macro use <eglu_nurbs.h>"
		end	
	
	eglu_set_nurbs_error_callback_function (nurb: POINTER) is
			-- Set the the GLU NURBS error callback function
		external
			"C macro use <eglu_nurbs.h>"
		alias
			"eglu_set_nurbs_error_callback_function"
		end
	
	eglu_set_nurbs_error_callback_function_to_null (nurb: POINTER) is
			-- Set the the GLU NURBS error callback function
		external
			"C macro use <eglu_nurbs.h>"
		alias
			"eglu_set_nurbs_error_callback_function_to_null"
		end
	
end -- class GLU

-- begin dictionary
-- end dictionary
