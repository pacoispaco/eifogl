indexing
	description: "Application specific window messages."
        application: "sphere_and_red_box"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class APPLICATION_WM_CONSTANTS
	
inherit
	WEL_WM_CONSTANTS
	
feature -- Access
	
	Wm_sle_return_pressed: INTEGER is
			-- Notifies the MAIN_WINDOW that <Return> has
			-- been pressed in a SINGLE_LINE_EDIT
		do
			Result := Wm_user + 1
		end

	Wm_sle_invalid_value: INTEGER is
			-- Notifies the MAIN_WINDOW that an invalid value has
			-- been entered in a SINGLE_LINE_EDIT
		do
			Result := Wm_user + 2
		end

end -- class APPLICATION_WM_CONSTANTS

-- begin documentation
-- 
-- end documentation


