indexing
	description: "EGLUT example application based on the bezcurve example in%
	%the OpenGL Programming Guide, 3rd edition."
        application: "bezcurve"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/09/11 07:34:45 $"
	revision: "$Revision: 1.1 $"

class
	APPLICATION
	
inherit
	
	EGLUT_APPLICATION
		export
			{NONE} all
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
			Result := glut_single + glut_rgb 
		end	
	
	main_window: MAIN_WINDOW
			-- The EGLUT application's main window
	
end -- class APPLICATION

