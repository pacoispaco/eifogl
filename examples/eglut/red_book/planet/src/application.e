indexing
	description: "EGLUT example application based on Example 3-6 in%
	%the OpenGL Programming Guide, 3rd edition."
        application: "planet"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/08 11:31:16 $"
	revision: "$Revision: 1.2 $"

class
	APPLICATION
	
inherit
	
	EGLUT_APPLICATION
		redefine
			initial_displaymode,
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
	
	initial_displaymode: INTEGER is
			-- The initial display mode. Redefine this in
		do
			Result := glut_double + glut_rgb
		end	
	
	main_window: MAIN_WINDOW
			-- The EGLUT application's main window
	
end -- class APPLICATION

