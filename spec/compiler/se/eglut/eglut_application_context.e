indexing
	description: "The context of an EGLUT application. Keeps a hash%
                      %table of all EGLUT window objects in the EGLUT%
                      %application hashed by GLUT window id."
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "SmallEiffel -0.74 beta #17 (lcc-win32 3.7)"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/04/03 20:55:36 $"
	revision: "$Revision: 1.1 $"

class EGLUT_APPLICATION_CONTEXT
	
inherit	
	EGLUT
		export
			{NONE} all
		end
	
	EGLUT_CONSTANTS
		export
			{NONE} all
		end

feature -- Access	
	
	frozen current_window: EGLUT_WINDOW is
			-- Current EGLUT window
		do
			Result := windows @ glut_get_window
		end		
	
feature -- Basic operations
	
	quit (i: INTEGER) is
			-- Quit the application with the exit code �i'.
		do
			eglut_quit (i)
		end
		
feature {NONE} -- Implementation (EGLUT application windows)
	
	frozen windows: DS_HASH_TABLE [EGLUT_WINDOW, INTEGER] is
			-- Hash table containing all the applications EGLUT
			-- windows hashed by the unique GLUT window id:s.
		once
--			!! Result.make (0)
			--d Har hack! Max no of windows is 10!
			!! Result.make (10)
		end
	
feature {NONE} -- Implementation (GLUT externals)	
	
	glut_init_displaymode (mode: INTEGER) is
			-- Set the initial display mode. NOTA BENE! The feature
			-- name is not mispelled. There exists a constant with
			-- the name `glut_init_display_mode'!  See
			-- EGLUT_CONSTANTS for possible values on `mode'.
		external
--			"C [macro <glut.h>] (int)"
			"C macro use <glut.h>"
		alias
			"glutInitDisplayMode"
		end
	
	glut_get_window: INTEGER is
			-- Unique identifier of the current GLUT window
		external
--			"C [macro <glut.h>]: int"
			"C macro use <glut.h>"
		alias
			"glutGetWindow()"
		end

feature {NONE} -- Implementation (EGLUT C interface externals)	
	
	frozen eglut_quit (i: INTEGER) is
			-- Quit the EGLUT application with exit code `i'.
		external
--			"C [macro <eglut.h>] (int)"
			"C macro use <glut.h>"
		alias
			"eglut_quit"
		end
	
end -- class EGLUT_APPLICATION_CONTEXT

-- begin dictionary
-- 
-- end dictionary

