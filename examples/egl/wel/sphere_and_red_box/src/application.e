indexing
	description: "An EGL test application"
        application: "sphere_and_red_box"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class APPLICATION

inherit 

	WEL_APPLICATION
		redefine
			init_application
		end
	
creation  
	make
	
feature -- Initialization
	
	main_window: MAIN_WINDOW is 
			-- Create the application's main window.
		once
			!! Result.make
		end
	
	init_application is
			-- Load the common controls dll and the rich edit dll.
		do
			!! common_controls_dll.make
		end
	
	common_controls_dll: WEL_COMMON_CONTROLS_DLL

end -- class APPLICATION

--| begin documentation
-- 
--| end documentation

