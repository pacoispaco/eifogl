indexing
	description: "Red book example application: aaindex"
        application: "aacanti"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/09/11 07:30:55 $"
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
			Result := Glut_single + Glut_rgb + Glut_accum + Glut_depth
		end	
	
	main_window: MAIN_WINDOW
			-- The EGLUT application's main window
	
end -- class APPLICATION

