indexing
	description: "Raw wrapper class for the OpenGL GLU library."
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "ISE 4.3, ISE 4.5"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:48:13 $"
	revision: "$Revision: 1.2 $"

class GLU
	
feature -- OpenGL glu API.
	
	glu_ortho_2d (left, right, bottom, top: DOUBLE) is
		external
			"C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
		alias
			"gluOrtho2D"
		end
		
	glu_new_quadric: POINTER is
		external
			"C [macro <glu.h>] (): GLUquadricObj *"
		alias
			"gluNewQuadric()"
		end
		
	glu_quadric_draw_style (qobj: POINTER; draw_style: INTEGER) is
		external
			"C [macro <glu.h>] (GLUquadric *, GLenum)"
		alias
			"gluQuadricDrawStyle"		
		end
	
	glu_quadric_orientation (qobj: POINTER; orientation: INTEGER) is
		external
			"C [macro <glu.h>] (GLUquadric *, GLenum)"
		alias
			"gluQuadricOrientation"		
		end
	
	glu_quadric_normals (qobj: POINTER; normals: INTEGER) is
		external
			"C [macro <glu.h>] (GLUquadric *, GLenum)"
		alias
			"gluQuadricNormals"		
		end
	
	glu_delete_quadric (qobj: POINTER)is
		external
			"C [macro <glu.h>] (GLUquadric *)"
		alias
			"gluDeleteQuadric"
		end
		
	glu_cylinder (qobj: POINTER; base_radius, top_radius, height: DOUBLE; slices, stacks: INTEGER) is
		external
			"C [macro <glu.h>] (GLUquadric *, GLdouble, GLdouble, GLdouble, GLint, GLint)"
		alias
			"gluCylinder"
		end
		
	glu_sphere (qobj: POINTER; radius: DOUBLE; slices, stacks: INTEGER) is
		external
			"C [macro <glu.h>] (GLUquadric *, GLdouble, GLint, GLint)"
		alias
			"gluSphere"
		end

	glu_perspective (fov_y, aspect, z_near, z_far: DOUBLE) is
		external
			"C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
		alias
			"gluPerspective"
		end
	
	glu_look_at (eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz: DOUBLE) is
		external
			"C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble)"
		alias
			"gluLookAt"
		end
		
	glu_error_string (i: INTEGER): POINTER is
		external
			"C [macro <glu.h>] (int): static char *"
		alias
			"gluErrorString"
		end
	
	glu_new_nurbs_renderer: POINTER is
		external
			"C [macro <glu.h>] (): GLUnurbsObj *"
		alias
			"gluNewNurbsRenderer()"
		end
	
	glu_nurbs_property (nurb: POINTER; property: INTEGER; value: DOUBLE) is
		external
			"C [macro <glu.h>] (GLUnurbsObj *, GLenum, GLfloat)"
		alias
			"gluNurbsProperty"
		end
	
	glu_begin_surface (nurb: POINTER) is
		external
			"C [macro <glu.h>] (GLUnurbsObj *)"
		alias
			"gluBeginSurface"
		end
	
	glu_end_surface (nurb: POINTER) is
		external
			"C [macro <glu.h>] (GLUnurbsObj *)"
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
			"C [macro <glu.h>] (GLUnurbsObj *, GLint, GLfloat *, GLint, GLfloat *, GLint, GLint, GLfloat *, GLint, GLint, GLenum)"
		alias
			"gluNurbsSurface"
		end
	
end -- class GLU

-- begin dictionary
--| There is currently a problem with the ISE 4.3 and 4.5
--| versions of bench. If external features are declared
--| as proper external C functions the application will
--| not behave well when run in bench. It will compile  
--| and run nicely in finalized mode but it is difficult 
--| to debug and test if one cannot run the application
--| in frozen bench mode! :-( Therefore all external C 
--| function calls are temporarily changed to external 
--| C macros, which seems to work fine in both frozen
--| and finalized mode.
-- end dictionary
