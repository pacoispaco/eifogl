indexing
	description: "An EGL test application"
        application: "gl_test"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class APPLICATION

inherit 

	WEL_APPLICATION
	
creation  
	make
	
feature -- Initialization
	
	main_window: MAIN_WINDOW is 
			-- Create the application's main window.
		once
			!! Result.make
		end

end -- class APPLICATION

--| begin documentation
-- 
--| end documentation

