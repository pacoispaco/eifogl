indexing
	description: "EGLUT test application"
        application: "multi_sphere"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class
	APPLICATION
	
inherit
	
	EGLUT_APPLICATION
		export
			{NONE} all
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
			!! top_level_window_2.make
		end
	
feature	-- Access
	
	main_window: MAIN_WINDOW
			-- The GLUT application's main window
	
	top_level_window_2: TOP_LEVEL_WINDOW_2
			-- A second top level window!
	
end -- class APPLICATION



