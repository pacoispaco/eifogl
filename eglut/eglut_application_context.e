indexing
	description: "The context of an EGLUT application. Keeps a hash%
                      %table of all EGLUT window objects in the EGLUT%
                      %application hashed by GLUT window id."
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "ISE 5.2, SmallEiffel -0.74"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/23 21:10:13 $"
	revision: "$Revision: 1.4 $"

class EGLUT_APPLICATION_CONTEXT
	
inherit	
	EGLUT
	
	EGLUT_CONSTANTS

feature -- Access	
	
	frozen current_window: EGLUT_WINDOW is
			-- Current EGLUT window
		do
			Result := windows @ glut_get_window
		end		
	
	frozen windows: DS_HASH_TABLE [EGLUT_WINDOW, INTEGER] is
			-- Hash table containing all the applications EGLUT
			-- windows hashed by the unique GLUT window id:s.
		once
			!! Result.make (10)
		end
	
feature {NONE} -- Implementation
	
	glut_get_window: INTEGER is
			-- Unique identifier of the current GLUT window
		do
			Result := glut_api.glut_get_window
		end

end -- class EGLUT_APPLICATION_CONTEXT

-- begin dictionary
-- 
-- end dictionary

