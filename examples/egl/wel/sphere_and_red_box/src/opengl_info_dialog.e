indexing
	description: "Dialog for presenting OpenGL implementation information."
        application: "sphere_and_red_box"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class OPENGL_INFO_DIALOG

inherit
	WEL_MODELESS_DIALOG
		redefine
			on_control_command,
			setup_dialog
		end
	
	APPLICATION_RESOURCES
		export
			{NONE} all
		end	
	
	EGL
		export
			{NONE} all
		end

creation
	make
	
feature -- Initialization
	
	make (a_parent: WEL_WINDOW; a_font: WEL_FONT) is
			-- Create the dialog
		do
			make_by_id (a_parent, Opengl_info_dialog_id)
			control_font := a_font
		end
	
	setup_dialog is
		do
			set_width (220)
			set_height (260)
			set_text (Title)
			
			!! text_field.make (Current, "", 10, 10, 200, 240, -1)
			text_field.set_font (control_font)
			!! ok_button.make (Current, "OK", 70, 200, 70, 25, Ok_button_id)
			ok_button.set_font (control_font)
			get_opengl_info
		end
	
feature -- Access
	
	control_font: WEL_FONT
			-- The font used by all controls in this dialog
	
feature {NONE} -- Messages
	
	on_control_command (control: WEL_CONTROL) is
		do
			if control = Ok_button then
				destroy
			end
		end

feature {NONE} -- Implementation	
	
	get_opengl_info is
		local
			s: STRING
		do
			!! s.make (0)
			s.append ("Vendor: ")
			s.append (egl_get_string (Gl_vendor))
			s.append ("%N")
			s.append ("Renderer: ")
			s.append (egl_get_string (Gl_renderer))
			s.append ("%N")
			s.append ("Version: ")
			s.append (egl_get_string (Gl_version))
			s.append ("%N")
			s.append ("Supported extensions: ")
			s.append (egl_get_string (Gl_extensions))
			text_field.set_text (s)
		end
	
feature {NONE} -- Implementation (WEL controls)
	
	Title: STRING is "OpenGL implementation info"
	
	text_field: WEL_STATIC
	
	ok_button: WEL_PUSH_BUTTON
	Ok_button_id: INTEGER is 1001
	
end -- class OPENGL_INFO_DIALOG

-- begin documentation
-- 
-- end documentation


