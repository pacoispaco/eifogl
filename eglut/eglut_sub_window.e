indexing
	description: "An EGLUT sub window."
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "ISE 4.3, ISE 4.5, ISE 5.2"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999, 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/11/13 16:57:22 $"
	revision: "$Revision: 1.1 $"

class EGLUT_SUB_WINDOW

inherit
	EGLUT_WINDOW
		export
			{NONE} all
		end
	
creation	
	make
	
feature {NONE} -- Initialization
	
	make (parent_id, x, y, width, height: INTEGER) is
			-- Create a GLUT sub window
		require
			parent_id_exists: windows.has (parent_id)
			position_valid: x >= 0 and y >= 0
			size_valid: width > 0 and height > 0
		do
			id := glut_create_sub_window (parent_id, x, y, width, height)
			windows.put (Current, id)
			subscribe_to_display_events
		end
	
feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
			-- The window has been displayed
		do
			debug ("callback")
				print ("on_display_procedure")
				print ("%N")
			end
		end 
	
feature -- Implementation (GLUT externals)
		
	glut_create_sub_window (win, x, y, width, height: INTEGER): INTEGER is
		do
			Result := glut_api.glut_create_sub_window (win, x, y, width, height)
		end

end -- class EGLUT_SUB_WINDOW

-- begin documentation
-- 
-- end documentation

