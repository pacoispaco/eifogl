indexing
	description: "Wrapper class for the OpenGL API"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "SmallEiffel -0.74 beta #17 (lcc-win32 3.7)"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/03/23 20:33:08 $"
	revision: "$Revision: 1.1 $"

class GL
		
feature -- OpenGL API
	
	gl_polygon_offset (factor, units: REAL) is
		external
--			"C (GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glPolygonOffset"
	 	end
	
	gl_edge_flag (flag: BOOLEAN) is
		external
--			"C (GLboolean) | <gl.h> "
--			"C [macro <gl.h>] (GLboolean)"
			"C macro use <gl.h>"
		alias
			"glEdgeFlag"
		end
	
	gl_point_size (size: REAL) is
		external
--			"C (GLfloat) | <gl.h> "
--			"C [macro <gl.h>] (GLfloat)"
			"C macro use <gl.h>"
		alias
			"glPointSize"
		end
			
	gl_line_width (width: REAL) is
		external
--			"C (GLfloat) | <gl.h> "
--			"C [macro <gl.h>] (GLfloat)"
			"C macro use <gl.h>"
		alias
			"glLineWidth"
		end
	
	gl_line_stipple (factor: INTEGER; pattern: INTEGER) is
		external
--			"C (GLint, GLushort) | <gl.h> "
--			"C [macro <gl.h>] (GLint, GLushort)"
			"C macro use <gl.h>"
		alias
			"glLineStipple"
		end
		
	gl_polygon_mode (face, mode: INTEGER) is
		external
--			"C (GLenum, GLenum) | <gl.h> "
--			"C [macro <gl.h>] (GLenum, GLenum)"
			"C macro use <gl.h>"
		alias
			"glPolygonMode"
		end
	
	gl_polygon_stipple (mask: POINTER) is
		external
--			"C (GLubyte *) | <gl.h> "
--			"C [macro <gl.h>] (GLubyte *)"
			"C macro use <gl.h>"
		alias
			"glPolygonStipple"
		end

	gl_get_float_v (pname: INTEGER; params: POINTER) is
		external
--			"C (GLenum, GLfloat *) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLfloat *)"
			"C macro use <gl.h>"
		alias
			"glGetFloatv"
		end
	
	gl_get_double_v (pname: INTEGER; params: POINTER) is
		external
--			"C (GLenum, GLdouble *) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLdouble *)"
			"C macro use <gl.h>"
		alias
			"glGetDoublev"
  		end
	
	gl_get_integer_v (pname: INTEGER; params: POINTER) is
		external
--			"C (GLenum, GLint *) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLint *)"
			"C macro use <gl.h>"
		alias
			"glGetIntegerv"
		end	
	
	gl_clear_color (r, g, b, a: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h> "
--			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glClearColor"
		end
	
	gl_clear (buffer: INTEGER) is
		external
--			"C (GLint) | <gl.h>"
--			"C [macro <gl.h>] (GLint)"
			"C macro use <gl.h>"
		alias
			"glClear"
		end
	
	gl_color_3f (r, g, b: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat) | <gl.h>"
--			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glColor3f"
		end
	
	gl_color_4fv (v: POINTER) is
		external
--			"C (const GLfloat *) | <gl.h>"
--			"C [macro <gl.h>] (const GLfloat *)"
			"C macro use <gl.h>"
		alias
			"glColor4fv"
		end
	
	gl_depth_mask (flag: INTEGER) is
		external
--			"C (GLboolean) | <gl.h>"
--			"C [macro <gl.h>] (GLboolean)"
			"C macro use <gl.h>"
		alias
			"glDepthMask"
		end
		
	gl_flush is
		external
--			"C | <gl.h>"
--			"C [macro <gl.h>] ()"		
			"C macro use <gl.h>"
		alias
			"glFlush"
--			"glFlush()"
		end
	
	gl_hint (target, mode: INTEGER) is
		external
--			"C (GLenum, GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLenum)"
			"C macro use <gl.h>"
		alias
			"glHint"
		end
		
	gl_vertex_2i (x, y: INTEGER) is
		external
--			"C (GLint, GLint) | <gl.h>" 
--			"C [macro <gl.h>] (GLint, GLint)"
			"C macro use <gl.h>"
		alias
			"glVertex2i"
		end
		
	gl_vertex_2s (x, y: INTEGER_16) is
		external
--			"C (GLshort, GLshort) | <gl.h>" 
--			"C [macro <gl.h>] (GLshort, GLshort)"
			"C macro use <gl.h>"
		alias
			"glVertex2s"
		end
		
	gl_vertex_2f (x, y: REAL) is
		external
--			"C (GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glVertex2f"
		end
		
	gl_vertex_2d (x, y: DOUBLE) is
		external
--			"C (GLdouble, GLdouble) | <gl.h>" 
--			"C [macro <gl.h>] (GLdouble, GLdouble)"
			"C macro use <gl.h>"
		alias
			"glVertex2d"
		end
		
	gl_vertex_3i (x, y, z: INTEGER) is
		external
--			"C (GLint, GLint, GLint) | <gl.h>" 
--			"C [macro <gl.h>] (GLint, GLint, GLint)"
			"C macro use <gl.h>"
		alias
			"glVertex3i"
		end
	
	gl_vertex_3s (x, y, z: INTEGER_16) is
		external
--			"C (GLshort, GLshort, GLshort) | <gl.h>" 
--			"C [macro <gl.h>] (GLshort, GLshort, GLshort)"
			"C macro use <gl.h>"
		alias
			"glVertex3s"
		end
	
	gl_vertex_3f (x, y, z: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glVertex3f"
		end
	
	gl_vertex_3d (x, y, z: DOUBLE) is
		external
--			"C (GLdouble, GLdouble, GLdouble) | <gl.h>" 
--			"C [macro <gl.h>] (GLdouble, GLdouble, GLdouble)"
			"C macro use <gl.h>"
		alias
			"glVertex3f"
		end
	
	gl_vertex_4i (x, y, z, w: INTEGER) is
		external
--			"C (GLint, GLint, GLint, GLint) | <gl.h>" 
--			"C [macro <gl.h>] (GLint, GLint, GLint, GLint)"
			"C macro use <gl.h>"
		alias
			"glVertex4i"
		end
	
	gl_vertex_4s (x, y, z, w: INTEGER_16) is
		external
--			"C (GLshort, GLshort, GLshort, GLshort) | <gl.h>" 
--			"C [macro <gl.h>] (GLshort, GLshort, GLshort, GLshort)"
			"C macro use <gl.h>"
		alias
			"glVertex4s"
		end
	
	gl_vertex_4f (x, y, z, w: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glVertex4f"
		end
	
	gl_vertex_4d (x, y, z, w: DOUBLE) is
		external
--			"C (GLdouble, GLdouble, GLdouble, GLdouble) | <gl.h>" 
--			"C [macro <gl.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
			"C macro use <gl.h>"
		alias
			"glVertex4d"
		end
	
	gl_rect_f (x1, y1, x2, y2: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glRectf"
	 	end
	
	gl_front_face (mode: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum)"
			"C macro use <gl.h>"
		alias
			"glFrontFace"
	 	end
	
	gl_cull_face (mode: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum)"
			"C macro use <gl.h>"
		alias
			"glCullFace"
	 	end
	
	gl_viewport (x, y, width, height: INTEGER) is
		external
--			"C (GLint, GLint, GLint, GLint) | <gl.h>" 
--			"C [macro <gl.h>] (GLint, GLint, GLint, GLint)"
			"C macro use <gl.h>"
		alias
			"glViewport"
		end
			
	gl_frustum (left, right, bottom, top, near, far: DOUBLE) is
		external
--			"C (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble,) | <gl.h>" 
--			"C [macro <gl.h>] (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble,)"
			"C macro use <gl.h>"
		alias
			"glFrustum"
		end
	
	gl_load_identity is
		external
--			"C | <gl.h>" 
--			"C [macro <gl.h>] ()"
			"C macro use <gl.h>"
		alias
			"glLoadIdentity"
--			"glLoadIdentity()"
		end
			
	gl_load_matrix_f (m: POINTER) is
		external
--			"C (const GLfloat *) | <gl.h>" 
--			"C [macro <gl.h>] (const GLfloat *)"
			"C macro use <gl.h>"
		alias
			"glLoadMatrixf"
		end
	
	gl_load_matrix_d (m: POINTER) is
		external
--			"C (const GLdouble *) | <gl.h>" 
--			"C [macro <gl.h>] (const GLdouble *)"
			"C macro use <gl.h>"
		alias
			"glLoadMatrixd"
		end
	
	gl_mult_matrix_f (m: POINTER) is
		external
--			"C (const GLfloat *) | <gl.h>" 
--			"C [macro <gl.h>] (const GLfloat *)"
			"C macro use <gl.h>"
		alias
			"glMultMatrixf"
		end
	
	gl_mult_matrix_d (m: POINTER) is
		external
--			"C (const GLdouble *) | <gl.h>" 
--			"C [macro <gl.h>] (const GLdouble *)"
			"C macro use <gl.h>"
		alias
			"glMultMatrixd"
		end	
	
	gl_ortho (left, right, bottom, top, near, far: DOUBLE) is
		external
--			"C (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble) | <gl.h>" 
--			"C [macro <gl.h>] (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble)"
			"C macro use <gl.h>"
		alias
			"glOrtho"
		end

	gl_shade_model (mode: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum)"
			"C macro use <gl.h>"
		alias
			"glShadeModel"
		end
	
	gl_enable (cap: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum)"
			"C macro use <gl.h>"
		alias
			"glEnable"
		end
			
	gl_disable (cap: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum)"
			"C macro use <gl.h>"
		alias
			"glDisable"
		end
	
	gl_enable_client_state (array: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum)"
			"C macro use <gl.h>"
		alias
			"glEnableClientState"
		end
	
	gl_disable_client_state (array: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum)"
			"C macro use <gl.h>"
		alias
			"glDisableClientState"
		end
	
	gl_vertex_pointer (size, type, stride: INTEGER; pointer: POINTER) is
		external
--			"C (GLint, GLenum, GLsizei, GLvoid *) | <gl.h>" 
--			"C [macro <gl.h>] (GLint, GLenum, GLsizei, GLvoid *)"
			"C macro use <gl.h>"
		alias
			"glVertexPointer"
		end
	
	gl_color_pointer (size, type, stride: INTEGER; pointer: POINTER) is
		external
--			"C (GLint, GLenum, GLsizei, GLvoid *) | <gl.h>" 
--			"C [macro <gl.h>] (GLint, GLenum, GLsizei, GLvoid *)"
			"C macro use <gl.h>"
		alias
			"glColorPointer"
		end
	
	gl_material_fv (face, pname: INTEGER; params: POINTER) is
		external
--			"C (GLenum, GLenum, const GLfloat *) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLenum, const GLfloat *)"
			"C macro use <gl.h>"
		alias
			"glMaterialfv"
		end
	
	gl_material_f (face, pname: INTEGER; param: REAL) is
		external
--			"C (GLenum, GLenum, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLenum, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glMaterialf"
		end
	
	gl_light_fv (light, pname: INTEGER; params: POINTER) is
		external
--			"C (GLenum, GLenum, const GLfloat *) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLenum, const GLfloat *)"
			"C macro use <gl.h>"
		alias
			"glLightfv"
		end

	gl_light_model_fv (pname: INTEGER; params: POINTER) is
		external
--			"C (GLenum, const GLfloat *) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, const GLfloat *)"
			"C macro use <gl.h>"
		alias
			"glLightModelfv"
		end
	
	gl_color_material (face, mode: INTEGER) is
		external
--			"C (GLenum, GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLenum)"
			"C macro use <gl.h>"
		alias
			"glColorMaterial"
		end
	
	gl_matrix_mode (mode: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum)"
			"C macro use <gl.h>"
		alias
			"glMatrixMode"
		end
	
	gl_translate_f (x, y, z: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glTranslatef"
		end
	
	gl_translate_d (x, y, z: DOUBLE) is
		external
--			"C (GLdouble, GLdouble, GLdouble) | <gl.h>" 
--			"C [macro <gl.h>] (GLdouble, GLdouble, GLdouble)"
			"C macro use <gl.h>"
		alias
			"glTranslated"
		end	
	
	gl_scale_f (x, y, z: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glScalef"
		end
	
	gl_pixel_store_i (pname, param: INTEGER) is
		external
--			"C (GLenum, GLint) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLint)"
			"C macro use <gl.h>"
		alias
			"glPixelStorei"
		end
	
	gl_tex_parameter_i (target, pname, param: INTEGER) is
		external
--			"C (GLenum, GLenum, GLint) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLenum, GLint)"
			"C macro use <gl.h>"
		alias
			"glTexParameteri"
		end		

	gl_tex_coord_2f (s, t: REAL) is
		external
--			"C (GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glTexCoord2f"
		end		
		
	gl_tex_image_2D (target, level, internal_format, witdh, height, border, format, type: INTEGER; pixels: POINTER) is
		external
--			"C (GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, const GLvoid *) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, const GLvoid *)"
			"C macro use <gl.h>"
		alias
			"glTexImage2D"
		end
	
	gl_bind_texture (target, texture: INTEGER) is
		external
--			"C (GLenum, GLuint) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLuint)"
			"C macro use <gl.h>"
		alias
			"glBindTexture"
		end
		
	gl_gen_textures (n: INTEGER; textures: POINTER) is
		external
--			"C (GLsizei, GLuint *) | <gl.h>" 
--			"C [macro <gl.h>] (GLsizei, GLuint *)"
			"C macro use <gl.h>"
		alias
			"glGenTextures"
		end
			
	gl_raster_pos_2i (x, y: INTEGER) is
		external		
--			"C (GLint, GLint) | <gl.h>" 
--			"C [macro <gl.h>] (GLint, GLint)"
			"C macro use <gl.h>"
		alias		
			"glRasterPos2i"
		end
	
	gl_bitmap (width, height: INTEGER; xbo, ybo, xbi, ybi: REAL; bitmap: POINTER) is
		external
--			"C (GLsizei, GLsizei, GLfloat, GLfloat, GLfloat, GLfloat, const GLubyte *) | <gl.h>" 
--		        "C [macro <gl.h>] (GLsizei, GLsizei, GLfloat, GLfloat, GLfloat, GLfloat, const GLubyte *)"
			"C macro use <gl.h>"
		alias		
			"glBitmap"
		end
			
	gl_blend_func (sfactor, dfactor: INTEGER) is
		external
--			"C (GLenum, GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLenum)"
			"C macro use <gl.h>"
		alias
			"glBlendFunc"
		end

	gl_gen_lists (range: INTEGER): INTEGER is
		external
--			"C (GLsizei) | <gl.h>" 
--			"C [macro <gl.h>] (GLsizei): GLuint"
			"C macro use <gl.h>"
		alias
			"glGenLists"
		end
		
	gl_new_list (list, mode: INTEGER) is
		external
--			"C (GLuint, GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLuint, GLenum)"
			"C macro use <gl.h>"
		alias
			"glNewList"
		end
	
	gl_end_list is
		external
--			"C | <gl.h>" 
--			"C [macro <gl.h>] ()"		
			"C macro use <gl.h>"
		alias
			"glEndList"
--			"glEndList()"
		end
	
	gl_is_list (list: INTEGER): BOOLEAN is
		external
--			"C (GLuint): GLboolean | <gl.h>"
--			"C [macro <gl.h>] (GLuint): GLboolean"
			"C macro use <gl.h>"
		alias
			"glIsList"
		end
	
	gl_call_list (list: INTEGER) is
		external
--			"C (GLuint) | <gl.h>" 
--			"C [macro <gl.h>] (GLuint)"
			"C macro use <gl.h>"
		alias
			"glCallList"
		end
	
	gl_call_lists (n, type: INTEGER; lists: POINTER) is
		external
--			"C (GLsizei, GLenum, const GLvoid *) | <gl.h>" 
--			"C [macro <gl.h>] (GLsizei, GLenum, const GLvoid *)"
			"C macro use <gl.h>"
		alias
			"glCallLists"
		end
	
	gl_list_base (base: INTEGER) is
		external
--			"C (GLuint) | <gl.h>" 
--			"C [macro <gl.h>] (GLuint)"
			"C macro use <gl.h>"
		alias
			"glListBase"
		end
	
	gl_begin (mode: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum)"
			"C macro use <gl.h>"
		alias
			"glBegin"
		end
	
	gl_end is
		external
--			"C | <gl.h>" 
--			"C [macro <gl.h>] ()"		
			"C macro use <gl.h>"
		alias
			"glEnd"
--			"glEnd()"
		end
	
	gl_draw_elements (mode, count, type: INTEGER; pointer: POINTER) is
		external
--			"C (GLenum, GLsizei, GLenum, void *) | <gl.h>" 
--			"C [macro <gl.h>] (GLenum, GLsizei, GLenum, void *)"
			"C macro use <gl.h>"
		alias
			"glDrawElements"
		end
				
	gl_finish is
		external
--			"C | <gl.h>" 
--			"C [macro <gl.h>] ()"		
			"C macro use <gl.h>"
		alias
			"glFinish"
--			"glFinish()"
		end
	
	gl_normal_3f (nx, ny, nz: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glNormal3f"
		end
		
	gl_normal_3d (nx, ny, nz: DOUBLE) is
		external
--			"C (GLdouble, GLdouble, GLdouble) | <gl.h>" 
--			"C [macro <gl.h>] (GLdouble, GLdouble, GLdouble)"
			"C macro use <gl.h>"
		alias
			"glNormal3d"
		end
		
	gl_normal_3fv (p: POINTER) is
		external
--			"C (const GLfloat *) | <gl.h>" 
--			"C [macro <gl.h>] (const GLfloat *)"
			"C macro use <gl.h>"
		alias
			"glNormal3fv"
		end
	
	gl_push_matrix is
		external
--			"C | <gl.h>" 
--			"C [macro <gl.h>] ()"		
			"C macro use <gl.h>"
		alias
			"glPushMatrix"
--			"glPushMatrix()"
		end
	
	gl_pop_matrix is
		external
--			"C | <gl.h>" 
--			"C [macro <gl.h>] ()"		
			"C macro use <gl.h>"
		alias
			"glPopMatrix"
--			"glPopMatrix()"
		end
	
	gl_push_attrib (mask: INTEGER) is
		external
--			"C | <gl.h>" 
--			"C [macro <gl.h>] (GLbitfield)"		
			"C macro use <gl.h>"
		alias
			"glPushAttrib"
		end
		
	gl_pop_attrib is
		external
--			"C | <gl.h>" 
--			"C [macro <gl.h>] ()"		
			"C macro use <gl.h>"
		alias
			"glPopAttrib"
--			"glPopAttrib()"
		end
	
	gl_rotate_f (angle, x, y, z: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h>" 
--			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
			"C macro use <gl.h>"
		alias
			"glRotatef"
		end
		
	gl_get_error: INTEGER is
		external
--			"C : GLenum | <gl.h>"			
--			"C [macro <gl.h>] (): GLenum"		
			"C macro use <gl.h>"
		alias
			"glGetError"
--			"glGetError()"
		end
	
	gl_get_string (name: INTEGER): POINTER is
		external
--			"C (GLenum): GLubyte* | <gl.h>"			
--			"C [macro <gl.h>] (GLenum): GLubyte*"		
			"C macro use <gl.h>"
		alias
			"glGetString"
		end

end -- class GL

--| begin documentation 
--| end documentation


