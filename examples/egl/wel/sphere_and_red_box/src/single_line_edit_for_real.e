indexing
	description: "An small extension of WEL_SINGLE_LINE_EDIT that%
	%only accepts REAL values."
	library: "WEL extensions"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2003 Paul Cohen, see file forum.txt"
	date: "$Date: 2003/04/26 21:14:18 $"
	revision: "$Revision: 1.1 $"

class SINGLE_LINE_EDIT_FOR_REAL

inherit
	WEL_SINGLE_LINE_EDIT
		export
			{NONE} set_text
		redefine
			default_ex_style,
			on_key_up
		end
	
	WEL_VK_CONSTANTS
		export
			{NONE} all
		end
	
	APPLICATION_WM_CONSTANTS
		export
			{NONE} all
		end
	
creation
	make
		
feature -- Status report
	
	has_valid_value: BOOLEAN is
			-- Does this 
		do
			if text.is_real then
				if value >= min_value and value <= max_value then
					Result := True
				end
			end
		ensure
			consistent: Result implies text.is_real and then
			(value >= min_value and value <= max_value)
		end
	
	value: REAL is
			-- Current value
		require
			has_valid_value: has_valid_value
		do
			Result := text.to_real
		end
	
	min_value: REAL
			-- Minimum value
	
	max_value: REAL
			-- Maximum value
	
feature -- Status setting
	
	set_value (r: REAL) is
		require
			valid_value: r >= min_value and r <= max_value
		do
			set_text (r.out)
		ensure
			value_set: value = r
		end
	
	set_min_valid_value (r: REAL) is
			-- Set the minimum value
		require
			valid_min_value: r <= max_value
		do
			min_value := r
		ensure
			min_value_set: min_value = r
		end
	
	set_max_valid_value (r: REAL) is
			-- Set the minimum value
		require
			valid_max_value: r >= min_value
		do
			max_value := r
		ensure
			max_value_set: max_value = r
		end
	
feature {NONE} -- Implementation
	
	default_ex_style: INTEGER is
			-- Default extented style used to create the window
		do
			Result := Ws_ex_clientedge
		end	
	
feature {NONE} -- Implementation (Window messages)
	
	on_key_up (virtual_key, key_data: INTEGER) is
			-- Wm_keyup message
		local
			r: REAL
		do
			if virtual_key = Vk_return then
				-- Notify the parent (MAIN_WINDOW) that a
				-- <return> has been pressed
				if has_valid_value then
					cwin_post_message (parent.item, Wm_sle_return_pressed, id, 0)
				else
					cwin_post_message (parent.item, Wm_sle_invalid_value, id, 0)
				end
			end
		end
	
end -- class SINGLE_LINE_EDIT_FOR_REAL


