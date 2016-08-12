indexing
	description: "EGLUT example application based on the alpha3D example in%
	%the OpenGL Programming Guide, 3rd edition."
        application: "alpha3D"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/08 11:28:46 $"
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
			-- The initial display mode. 
		do
			Result := glut_double + glut_rgb + glut_depth
		end	
	
	main_window: MAIN_WINDOW
			-- The EGLUT application's main window
	
end -- class APPLICATION

