indexing
	description: "Raw wrapper class for GLUT"
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "SmallEiffel -0.74 (lcc-win32 3.8)"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/11/25 16:02:20 $"
	revision: "$Revision: 1.1 $"

class GLUT
	
inherit
	GENERAL
		export
			{NONE} all
		end
	
feature -- Raw GLUT API
	
	glut_init (argcp, argv: POINTER) is
		external
--			"C [macro <glut.h>] (int *, char **)"
			"C macro use <glut.h>"
		alias
			"glutInit"
		end

	glut_full_screen is
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"glutFullScreen()"
		end
	
	glut_init_display_mode (mode: INTEGER) is
		external
--			"C [macro <glut.h>] (int)"
			"C macro use <glut.h>"
		alias
			"glutInitDisplayMode"
		end
	
	glut_init_window_size (width, height: INTEGER) is
		external
--			"C [macro <glut.h>] (int, int)"
			"C macro use <glut.h>"
		alias
			"glutInitWindowSize"
		end
	
	glut_init_window_position (x, y: INTEGER) is
		external
--			"C [macro <glut.h>] (int, int)"
			"C macro use <glut.h>"
		alias
			"glutInitWindowPosition"
		end
	
	glut_create_window (title: POINTER): INTEGER is
		external
--			"C [macro <glut.h>] (const char *): int"
			"C macro use <glut.h>"
		alias
			"glutCreateWindow"
		end
	
	glut_create_sub_window (win, x, y, width, height: INTEGER): INTEGER is
		external
--			"C [macro <glut.h>] (int, int, int, int, int): int"
			"C macro use <glut.h>"
		alias
			"glutCreateSubWindow"
		end
	
	glut_get_window: INTEGER is
		external
--			"C [macro <glut.h>]: int"
			"C macro use <glut.h>"
		alias
			"glutGetWindow()"
		end
	
	glut_set_window (i: INTEGER) is
		external
--			"C [macro <glut.h>] (int)"
			"C macro use <glut.h>"
		alias
			"glutSetWindow"
		end
	
	glut_position_window (x, y: INTEGER) is
		external
--			"C [macro <glut.h>] (int, int)"			
			"C macro use <glut.h>"
		alias
			"glutPositionWindow"
		end
		
	glut_reshape_window (width, height: INTEGER) is
		external
--			"C [macro <glut.h>] (int, int)"			
			"C macro use <glut.h>"
		alias
			"glutReshapeWindow"
		end

	glut_post_redisplay is
		external
--			"C [macro <glut.h>] ()"			
			"C macro use <glut.h>"
		alias
			"glutPostRedisplay()"
		end
	
	glut_get_modifiers: INTEGER is
		external
--			"C [macro <glut.h>] (): int"
			"C macro use <glut.h>"
		alias
--			"glutGetModifiers ()"
			"glutGetModifiers()"
		end
	
	glut_report_errors is
		external
--			"C [macro <glut.h>] ()"
			"C macro use <glut.h>"
		alias
			"glutReportErrors()"
		end
	
	glut_main_loop is
		external
--			"C [macro <glut.h>] ()"			
			"C macro use <glut.h>"
		alias
			"glutMainLoop()"
		end
	
	glut_solid_sphere (radius: DOUBLE; slices, stacks: INTEGER) is
		external
--			"C [macro <glut.h>] (GLdouble, GLint, GLint)"
			"C macro use <glut.h>"
		alias
			"glutSolidSphere"
		end
	
	glut_wire_sphere (radius: DOUBLE; slices, stacks: INTEGER) is
		external
--			"C [macro <glut.h>] (GLdouble, GLint, GLint)"
			"C macro use <glut.h>"
		alias
			"glutWireSphere"
		end
	
	glut_solid_cube (size: DOUBLE) is
		external
--			"C [macro <glut.h>] (GLdouble)"
			"C macro use <glut.h>"
		alias
			"glutSolidCube"
		end
		
	glut_wire_cube (size: DOUBLE) is
		external
--			"C [macro <glut.h>] (GLdouble)"
			"C macro use <glut.h>"
		alias
			"glutWireCube"
		end
		
	glut_solid_torus (inner_radius, outer_radius: DOUBLE; nsides, rings: INTEGER) is
		external
--			"C [macro <glut.h>] (GLdouble, GLdouble, GLint, GLint)"
			"C macro use <glut.h>"
		alias
			"glutSolidTorus"
		end
	
	glut_solid_octahedron is
		external
--			"C [macro <glut.h>] ()"
			"C macro use <glut.h>"
		alias
			"glutSolidOctahedron()"
		end
	
	glut_solid_teapot (size: DOUBLE) is
		external
--			"C [macro <glut.h>] (GLdouble)"
			"C macro use <glut.h>"
		alias
			"glutSolidTeapot"
		end
	
	glut_swap_buffers is
		external
--			"C [macro <glut.h>] ()"
			"C macro use <glut.h>"
		alias
			"glutSwapBuffers()"
		end
	
	glut_set_color (index: INTEGER; red, green, blue: REAL) is
		external
--			"C [macro <glut.h>] (GLint, GLfloat, GLfloat, GLfloat)"
			"C macro use <glut.h>"
		alias
			"glutSetColor"
		end
	
feature	-- EGLUT C interface 
	
	eglut_quit (i: INTEGER) is
		external
--			"C [macro <eglut.h>] (int)"
			"C macro use <glut.h>"
		alias
			"eglut_quit"
		end
	
feature	{EGLUT_APPLICATION} -- EGLUT C interface 
	
	eglut_init (app: EGLUT_APPLICATION) is
			-- Initialize the GLUT library. The Eiffel object `app'
			-- is needed to pass over the C interface so that it
			-- can make qualified calls back to Eiffel.
			-- Note that GLUT library extracts any command line
			-- options intended for the GLUT library, and will
			-- modify both `argcp' and `argv'. Nice isn't it!? X
			-- Window specific command line options are:
			-- -display DISPLAY
			-- -geometry WxH+X+Y
			-- -iconic
			-- -indirect
			-- -direct
			-- -gldebug
			-- -sync
		require
			app_not_void: app /= Void
		do
			eglut_init_i := argument_count + 1
			glut_init ($eglut_init_i, command_arguments.to_external)
			eglut_set_application_object (app)
		end
	
	eglut_init_i: INTEGER
	
	frozen eglut_set_application_object (p: EGLUT_APPLICATION) is
			-- Set the application object in the EGLUT C interface
		external
--			"C [macro <eglut.h>] (EIF_OBJ)"
			"C macro use <eglut.h>"
		end
	
feature {EGLUT_TOP_LEVEL_WINDOW} -- EGLUT C interface
	
	eglut_create_window (title: STRING): INTEGER is
			-- Create a top level window with the given `title'.
		require
			title_not_void: title /= Void
		do
			Result := glut_create_window (title.to_external)
		end
	
feature	{EGLUT_WINDOW} -- EGLUT C interface 
	
	eglut_set_display_func is
			-- Set the the display callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		alias
			"eglut_set_display_func"
		end
	
	eglut_set_reshape_func is
			-- Set the the reshape callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_keyboard_func is
			-- Set the the keyboard callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_motion_func is
			-- Set the the motion callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_passive_motion_func is
			-- Set the the passive_motion callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_mouse_func is
			-- Set the the mouse callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_visibility_func is
			-- Set the the visibility callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_entry_func is
			-- Set the the entry callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_special_func is
			-- Set the the special callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_idle_func is
			-- Set the the idle callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_reshape_func_to_null is
			-- Set the the reshape callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_keyboard_func_to_null is
			-- Set the the keyboard callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_motion_func_to_null is
			-- Set the the motion callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_passive_motion_func_to_null is
			-- Set the the passive_motion callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_mouse_func_to_null is
			-- Set the the mouse callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_visibility_func_to_null is
			-- Set the the visibility callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_entry_func_to_null is
			-- Set the the entry callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_special_func_to_null is
			-- Set the the special callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
	eglut_set_idle_func_to_null is
			-- Set the the idle callback function
		external
--			"C [macro <eglut.h>]"
			"C macro use <eglut.h>"
		end
	
end -- class EGLUT

-- begin documentation
--
-- end documentation

