indexing
	description: "An EGLUT top level window. All EGLUT applications%
                     %must have one class that inherits from this class%
                     %and that class must be the `main_window' of the%
                     %applications EGLUT_APPLICATION class."
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "ISE 4.3, ISE 4.5, ISE 5.2"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999, 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/11/13 16:57:22 $"
	revision: "$Revision: 1.1 $"

class EGLUT_TOP_LEVEL_WINDOW

inherit
	EGLUT_WINDOW
		export
			{NONE} all
		end
	
creation	
	make
	
feature {NONE} -- Initialization
	
	make is
			-- Create a GLUT top level window
		do
			id := eglut_create_window (default_window_title)
			glut_position_window (default_x, default_y)
			glut_reshape_window (default_width, default_height)
			windows.put (Current, id)
			subscribe_to_display_events
			init
		end
	
	init is
			-- Initialize the window
		do
		end
       
feature -- Access
	
	default_window_title: STRING is
			-- Default window title
		once
			Result := "EGLUT top level window"
		end

feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
			-- The window has been displayed
		do
			debug ("callback")
				print ("on_display not redefined!")
				print ("%N")
			end
		end 
	
feature {NONE} -- Implementation (GLUT externals)	
	
	eglut_create_window (title: STRING):INTEGER is
			-- Create a top level window with the given `title'.
		require
			title_not_void: title /= Void
		local
			a: ANY
		do
			a := title.to_c
			Result := glut_api.glut_create_window ($a)
		end
	
	glut_full_screen is
		do
			glut_api.glut_full_screen
		end
	
end -- class EGLUT_TOP_LEVEL_WINDOW
	
-- begin documentation
-- 
-- end documentation
