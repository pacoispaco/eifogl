indexing
	description: "The context of an EGLUT application. Keeps a hash%
                      %table of all EGLUT window objects in the EGLUT%
                      %application hashed by GLUT window id."
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "ISE 4.3, ISE 4.5, ISE 5.2"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/11/14 14:29:42 $"
	revision: "$Revision: 1.2 $"

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
	
feature {NONE} -- Implementation 
	
	frozen windows: DS_HASH_TABLE [EGLUT_WINDOW, INTEGER] is
			-- Hash table containing all the applications EGLUT
			-- windows hashed by the unique GLUT window id:s.
		once
			-- Note! This should not be hardcoded! Maybe a feature
			-- `no_of_windows'!?
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

