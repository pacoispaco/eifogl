indexing
	description: "An EGLUT test application: dragnet2k"
        application: "dragnet2k"
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
			main_window,
			initial_displaymode
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
			-- The GLUT application's main window
	
	initial_displaymode: INTEGER is
			-- The initial display mode. Redefine this in
		do
			Result := Glut_double + Glut_rgb + Glut_depth
		end
	
end -- class APPLICATION
