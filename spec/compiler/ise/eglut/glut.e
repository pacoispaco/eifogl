indexing
	description: "Raw wrapper class for GLUT"
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "ISE 5.0, ISE 5.2"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/11/13 17:02:12 $"
	revision: "$Revision: 1.1 $"

class GLUT

feature -- Raw GLUT API
	
	glut_init (argcp, argv: POINTER) is
		external
			"C [macro <glut.h>] (int *, char **)"
		alias
			"glutInit"
		end

	glut_full_screen is
		external
			"C [macro <glut.h>]"
		alias
			"glutFullScreen()"
		end
	
	glut_init_display_mode (mode: INTEGER) is
		external
			"C [macro <glut.h>] (int)"
		alias
			"glutInitDisplayMode"
		end
	
	glut_init_window_size (width, height: INTEGER) is
		external
			"C [macro <glut.h>] (int, int)"
		alias
			"glutInitWindowSize"
		end
	
	glut_init_window_position (x, y: INTEGER) is
		external
			"C [macro <glut.h>] (int, int)"
		alias
			"glutInitWindowPosition"
		end
	
	glut_create_window (title: POINTER): INTEGER is
		external
			"C [macro <glut.h>] (const char *): int"
		alias
			"glutCreateWindow"
		end
	
	glut_create_sub_window (win, x, y, width, height: INTEGER): INTEGER is
		external
			"C [macro <glut.h>] (int, int, int, int, int): int"
		alias
			"glutCreateSubWindow"
		end
	
	glut_get_window: INTEGER is
		external
			"C [macro <glut.h>]: int"
		alias
			"glutGetWindow()"
		end
	
	glut_set_window (i: INTEGER) is
		external
			"C [macro <glut.h>] (int)"
		alias
			"glutSetWindow"
		end
	
	glut_position_window (x, y: INTEGER) is
		external
			"C [macro <glut.h>] (int, int)"			
		alias
			"glutPositionWindow"
		end
		
	glut_reshape_window (width, height: INTEGER) is
		external
			"C [macro <glut.h>] (int, int)"			
		alias
			"glutReshapeWindow"
		end

	glut_post_redisplay is
		external
			"C [macro <glut.h>] ()"			
		alias
			"glutPostRedisplay()"
		end
	
	glut_get_modifiers: INTEGER is
		external
			"C [macro <glut.h>] (): int"
		alias
			"glutGetModifiers ()"
		end
	
	glut_report_errors is
		external
			"C [macro <glut.h>] ()"
		alias
			"glutReportErrors()"
		end
	
	glut_main_loop is
		external
			"C [macro <glut.h>] ()"			
		alias
			"glutMainLoop()"
		end
	
	glut_solid_sphere (radius: DOUBLE; slices, stacks: INTEGER) is
		external
			"C [macro <glut.h>] (GLdouble, GLint, GLint)"
		alias
			"glutSolidSphere"
		end
	
	glut_wire_sphere (radius: DOUBLE; slices, stacks: INTEGER) is
		external
			"C [macro <glut.h>] (GLdouble, GLint, GLint)"
		alias
			"glutWireSphere"
		end
	
	glut_solid_cube (size: DOUBLE) is
		external
			"C [macro <glut.h>] (GLdouble)"
		alias
			"glutSolidCube"
		end
		
	glut_wire_cube (size: DOUBLE) is
		external
			"C [macro <glut.h>] (GLdouble)"
		alias
			"glutWireCube"
		end
		
	glut_solid_torus (inner_radius, outer_radius: DOUBLE; nsides, rings: INTEGER) is
		external
			"C [macro <glut.h>] (GLdouble, GLdouble, GLint, GLint)"
		alias
			"glutSolidTorus"
		end
	
	glut_solid_octahedron is
		external
			"C [macro <glut.h>] ()"
		alias
			"glutSolidOctahedron()"
		end
	
	glut_solid_teapot (size: DOUBLE) is
		external
			"C [macro <glut.h>] (GLdouble)"
		alias
			"glutSolidTeapot"
		end
	
	glut_swap_buffers is
		external
			"C [macro <glut.h>] ()"
		alias
			"glutSwapBuffers()"
		end
	
	glut_set_color (index: INTEGER; red, green, blue: REAL) is
		external
			"C [macro <glut.h>] (GLint, GLfloat, GLfloat, GLfloat)"
		alias
			"glutSetColor"
		end
	
feature	-- EGLUT C interface 
	
	eglut_quit (i: INTEGER) is
		external
			"C [macro <eglut.h>] (int)"
		alias
			"eglut_quit"
		end
	
feature	{EGLUT_APPLICATION} -- EGLUT C interface 
	
	eglut_initialize_c_interface (app: EGLUT_APPLICATION) is
			-- Initialize the C interface
		do
			eglut_set_application_object (ceif_adopt (app))
		end
	
	frozen eglut_set_application_object (p: POINTER) is
			-- Set the application object in the EGLUT C interface
		external
			"C [macro <eglut.h>] (EIF_OBJ)"
		end
	
feature	{EGLUT_WINDOW} -- EGLUT C interface 
	
	eglut_set_display_func is
			-- Set the the display callback function
		external
			"C [macro  <eglut.h>]"
		alias
			"eglut_set_display_func"
		end
	
	eglut_set_reshape_func is
			-- Set the the reshape callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_keyboard_func is
			-- Set the the keyboard callback function
		external
			"C [macro <eglut.h>]"
		end
	
	 eglut_set_motion_func is
			-- Set the the motion callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_passive_motion_func is
			-- Set the the passive_motion callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_mouse_func is
			-- Set the the mouse callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_visibility_func is
			-- Set the the visibility callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_entry_func is
			-- Set the the entry callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_special_func is
			-- Set the the special callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_idle_func is
			-- Set the the idle callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_reshape_func_to_null is
			-- Set the the reshape callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_keyboard_func_to_null is
			-- Set the the keyboard callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_motion_func_to_null is
			-- Set the the motion callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_passive_motion_func_to_null is
			-- Set the the passive_motion callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_mouse_func_to_null is
			-- Set the the mouse callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_visibility_func_to_null is
			-- Set the the visibility callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_entry_func_to_null is
			-- Set the the entry callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_special_func_to_null is
			-- Set the the special callback function
		external
			"C [macro <eglut.h>]"
		end
	
	eglut_set_idle_func_to_null is
			-- Set the the idle callback function
		external
			"C [macro <eglut.h>]"
		end
	
feature {NONE} -- Implementation (CECIL stuff)	
	
	ceif_adopt (object: ANY): POINTER is
		external
			"C [macro <eif_eiffel.h>] (EIF_OBJ):EIF_POINTER"
		alias
			"eif_adopt"
		end
	
end -- class EGLUT

-- begin documentation
--
-- end documentation

