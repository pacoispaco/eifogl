indexing
	description: "Red book example application: aapoly"
        application: "aapoly"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/30 23:32:50 $"
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
			Result := Glut_single + Glut_rgb + Glut_alpha + Glut_depth
		end	
	
	main_window: MAIN_WINDOW
			-- The EGLUT application's main window
	
end -- class APPLICATION
