indexing
	description: "EGLUT example application showing use of egl_primitives"
        application: "egl_primitives"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/23 21:15:03 $"
	revision: "$Revision: 1.2 $"

class
	APPLICATION
	
inherit
	
	EGLUT_APPLICATION
		redefine
			main_window
		end
	
creation

	make
		
feature -- Initialization
	
	init_gl is
		do
		end
	
	init_application is
		do
		end
	
feature	-- Access
	
	main_window: MAIN_WINDOW
			-- The EGLUT application's main window
	
end -- class APPLICATION

