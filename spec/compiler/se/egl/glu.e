indexing
	description: "Raw wrapper class for the OpenGL GLU library."
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "SmallEiffel -0.74 beta #17 (lcc-win32 3.7)"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/03/23 20:33:08 $"
	revision: "$Revision: 1.1 $"

class GLU
	
feature -- OpenGL glu API.
	
	glu_ortho_2d (left, right, bottom, top: DOUBLE) is
		external
--			"C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
			"C use macro <gl.h>"		
		alias
			"gluOrtho2D"
		end
		
	glu_build_2D_mipmaps (target, internal_format, width, height, format, type: INTEGER; data: POINTER) is
		external
--			"C [macro <glu.h>] (GLenum, GLint, GLsizei, GLsizei, GLenum, GLenum, const void *)"
			"C use macro <gl.h>"		
		alias
			"gluBuild2DMipmaps"
		end
		
	glu_new_quadric: POINTER is
		external
--			"C [macro <glu.h>] (): GLUquadricObj *"
			"C use macro <gl.h>"		
		alias
			"gluNewQuadric()"
		end
		
	glu_quadric_draw_style (qobj: POINTER; draw_style: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLenum)"
			"C use macro <gl.h>"		
		alias
			"gluQuadricDrawStyle"		
		end
	
	glu_quadric_orientation (qobj: POINTER; orientation: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLenum)"
			"C use macro <gl.h>"		
		alias
			"gluQuadricOrientation"		
		end
	
	glu_quadric_normals (qobj: POINTER; normals: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLenum)"
			"C use macro <gl.h>"		
		alias
			"gluQuadricNormals"		
		end
	
	glu_delete_quadric (qobj: POINTER)is
		external
--			"C [macro <glu.h>] (GLUquadric *)"
			"C use macro <gl.h>"		
		alias
			"gluDeleteQuadric"
		end
		
	glu_cylinder (qobj: POINTER; base_radius, top_radius, height: DOUBLE; slices, stacks: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLdouble, GLdouble, GLdouble, GLint, GLint)"
			"C use macro <gl.h>"		
		alias
			"gluCylinder"
		end
		
	glu_sphere (qobj: POINTER; radius: DOUBLE; slices, stacks: INTEGER) is
		external
--			"C [macro <glu.h>] (GLUquadric *, GLdouble, GLint, GLint)"
			"C use macro <gl.h>"		
		alias
			"gluSphere"
		end

	glu_perspective (fov_y, aspect, z_near, z_far: DOUBLE) is
		external
--			"C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
			"C use macro <gl.h>"		
		alias
			"gluPerspective"
		end
	
	glu_look_at (eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz: DOUBLE) is
		external
--			"C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble)"
			"C use macro <gl.h>"		
		alias
			"gluLookAt"
		end
		
	glu_error_string (i: INTEGER): POINTER is
		external
--			"C [macro <glu.h>] (int): static char *"
			"C use macro <gl.h>"		
		alias
			"gluErrorString"
		end
	
	glu_new_nurbs_renderer: POINTER is
		external
--			"C [macro <glu.h>] (): GLUnurbsObj *"
			"C use macro <gl.h>"		
		alias
			"gluNewNurbsRenderer()"
		end
	
	glu_nurbs_property (nurb: POINTER; property: INTEGER; value: DOUBLE) is
		external
--			"C [macro <glu.h>] (GLUnurbsObj *, GLenum, GLfloat)"
			"C use macro <gl.h>"		
		alias
			"gluNurbsProperty"
		end
	
	glu_begin_surface (nurb: POINTER) is
		external
--			"C [macro <glu.h>] (GLUnurbsObj *)"
			"C use macro <gl.h>"		
		alias
			"gluBeginSurface"
		end
	
	glu_end_surface (nurb: POINTER) is
		external
--			"C [macro <glu.h>] (GLUnurbsObj *)"
			"C use macro <gl.h>"		
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
			"C use macro <gl.h>"		
		alias
			"gluNurbsSurface"
		end
	
end -- class GLU

-- begin dictionary
-- end dictionary
