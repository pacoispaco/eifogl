indexing
	description: "Raw wrapper class for the OpenGL GL library."
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class GL
		
feature -- OpenGL API
	
	gl_clear_color (r, g, b, a: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h> "
			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
		alias
			"glClearColor"
		end
	
	gl_clear (buffer: INTEGER) is
		external
--			"C (GLint) | <gl.h>"
			"C [macro <gl.h>] (GLint)"
		alias
			"glClear"
		end
	
	gl_color_3f (r, g, b: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat) | <gl.h>"
			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
		alias
			"glColor3f"
		end
	
	gl_color_4fv (v: POINTER) is
		external
--			"C (const GLfloat *) | <gl.h>"
			"C [macro <gl.h>] (const GLfloat *)"
		alias
			"glColor4fv"
		end
		
	gl_flush is
		external
--			"C | <gl.h>"
			"C [macro <gl.h>] ()"		
		alias
--			"glFlush"
			"glFlush()"
		end
	
	gl_vertex_3f (x, y, z: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat) | <gl.h>" 
			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
		alias
			"glVertex3f"
		end
	
	gl_rect_f (x1, y1, x2, y2: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h>" 
			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
		alias
			"glRectf"
	 	end
	
	gl_viewport (x, y, w, h: INTEGER) is
		external
--			"C (GLint, GLint, GLint, GLint) | <gl.h>" 
			"C [macro <gl.h>] (GLint, GLint, GLint, GLint)"
		alias
			"glViewport"
		end
			
	gl_load_identity is
		external
--			"C | <gl.h>" 
			"C [macro <gl.h>] ()"
		alias
--			"glLoadIdentity"
			"glLoadIdentity()"
		end
			
	gl_ortho (left, right, bottom, top, near, far: DOUBLE) is
		external
--			"C (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble) | <gl.h>" 
			"C [macro <gl.h>] (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble)"
		alias
			"glOrtho"
		end

	gl_shade_model (mode: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
			"C [macro <gl.h>] (GLenum)"
		alias
			"glShadeModel"
		end
	
	gl_enable (cap: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
			"C [macro <gl.h>] (GLenum)"
		alias
			"glEnable"
		end
			
	gl_disable (cap: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
			"C [macro <gl.h>] (GLenum)"
		alias
			"glDisable"
		end
	
	gl_material_fv (face, pname: INTEGER; params: POINTER) is
		external
--			"C (GLenum, GLenum, const GLfloat *) | <gl.h>" 
			"C [macro <gl.h>] (GLenum, GLenum, const GLfloat *)"
		alias
			"glMaterialfv"
		end
	
	gl_material_f (face, pname: INTEGER; param: REAL) is
		external
--			"C (GLenum, GLenum, GLfloat) | <gl.h>" 
			"C [macro <gl.h>] (GLenum, GLenum, GLfloat)"
		alias
			"glMaterialf"
		end
	
	gl_light_fv (light, pname: INTEGER; params: POINTER) is
		external
--			"C (GLenum, GLenum, const GLfloat *) | <gl.h>" 
			"C [macro <gl.h>] (GLenum, GLenum, const GLfloat *)"
		alias
			"glLightfv"
		end

	gl_light_model_fv (pname: INTEGER; params: POINTER) is
		external
--			"C (GLenum, const GLfloat *) | <gl.h>" 
			"C [macro <gl.h>] (GLenum, const GLfloat *)"
		alias
			"glLightModelfv"
		end
	
	gl_color_material (face, mode: INTEGER) is
		external
--			"C (GLenum, GLenum) | <gl.h>" 
			"C [macro <gl.h>] (GLenum, GLenum)"
		alias
			"glColorMaterial"
		end
	
	gl_matrix_mode (mode: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
			"C [macro <gl.h>] (GLenum)"
		alias
			"glMatrixMode"
		end
	
	gl_translate_f (x, y, z: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat) | <gl.h>" 
			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
		alias
			"glTranslatef"
		end
	
	gl_gen_lists (range: INTEGER): INTEGER is
		external
--			"C (GLsizei) | <gl.h>" 
			"C [macro <gl.h>] (GLsizei): GLuint"
		alias
			"glGenLists"
		end
		
	gl_new_list (list, mode: INTEGER) is
		external
--			"C (GLuint, GLenum) | <gl.h>" 
			"C [macro <gl.h>] (GLuint, GLenum)"
		alias
			"glNewList"
		end
	
	gl_end_list is
		external
--			"C | <gl.h>" 
			"C [macro <gl.h>] ()"		
		alias
--			"glEndList"
			"glEndList()"
		end
	
	gl_is_list (list: INTEGER): BOOLEAN is
		external
--			"C (GLuint): GLboolean | <gl.h>"
			"C [macro <gl.h>] (GLuint): GLboolean"
		alias
			"glIsList"
		end
	
	gl_call_list (list: INTEGER) is
			-- executes a display list
		external
--			"C (GLuint) | <gl.h>" 
			"C [macro <gl.h>] (GLuint)"
		alias
			"glCallList"
		end
	
	gl_begin (mode: INTEGER) is
		external
--			"C (GLenum) | <gl.h>" 
			"C [macro <gl.h>] (GLenum)"
		alias
			"glBegin"
		end
	
	gl_end is
		external
--			"C | <gl.h>" 
			"C [macro <gl.h>] ()"		
		alias
--			"glEnd"
			"glEnd()"
		end
	
	gl_finish is
		external
--			"C | <gl.h>" 
			"C [macro <gl.h>] ()"		
		alias
--			"glFinish"
			"glFinish()"
		end
	
	gl_normal_3f (nx, ny, nz: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat) | <gl.h>" 
			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
		alias
			"glNormal3f"
		end
		
	gl_normal_3fv (p: POINTER) is
		external
--			"C (const GLfloat *) | <gl.h>" 
			"C [macro <gl.h>] (const GLfloat *)"
		alias
			"glNormal3fv"
		end
	
	gl_push_matrix is
		external
--			"C | <gl.h>" 
			"C [macro <gl.h>] ()"		
		alias
--			"glPushMatrix"
			"glPushMatrix()"
		end
	
	gl_pop_matrix is
		external
--			"C | <gl.h>" 
			"C [macro <gl.h>] ()"		
		alias
--			"glPopMatrix"
			"glPopMatrix()"
		end
	
	gl_rotate_f (angle, x, y, z: REAL) is
		external
--			"C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h>" 
			"C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
		alias
			"glRotatef"
		end
		
	gl_get_error: INTEGER is
		external
--			"C : GLenum | <gl.h>"			
			"C [macro <gl.h>] (): GLenum"		
		alias
--			"glGetError"
			"glGetError()"
		end
	
	gl_get_string (name: INTEGER): POINTER is
		external
--			"C (GLenum): GLubyte* | <gl.h>"			
			"C [macro <gl.h>] (GLenum): GLubyte*"		
		alias
			"glGetString"
		end

end -- class GL

--| begin documentation 
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
--| end documentation


