indexing
	description: "Main window for the test application for EOpenGL"
        application: "sphere_and_red_box"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/09/11 08:26:36 $"
	revision: "$Revision: 1.2 $"

class
	MAIN_WINDOW
	
inherit
	EXCEPTIONS
		rename
			class_name as exc_class_name
		export
			{NONE} all
		end
	
	WEL_FRAME_WINDOW
		redefine
			class_background,
			default_process_message,
			default_style,
			default_x,
			default_y,
			default_height,
			default_width,
			on_control_command,
			on_menu_command,
			on_size,
            on_timer
		end
	
	WEL_WS_CONSTANTS
		export
			{NONE} all
		end	
	
	APPLICATION_RESOURCES
		export
			{NONE} all
		end	
	
	APPLICATION_WM_CONSTANTS
		export
			{NONE} all
		end	
	
	EGL
		export
			{NONE} all
		end
	
creation
	make

feature {NONE} -- Initialization

	make is
			-- Make the main window
		do
			make_top (Title)
			
			set_status_window
			set_toolbar
			set_menu (main_menu)
			
			create_controls
			
			init_quadrics_control

			-- Set a timer to stop the application.
			-- This is only used for profiling runs. 
			set_timer (1, 300000)
		end
	
	set_status_window is
			-- Create and initialize the status window
		do
			!! status_window.make (Current, -1)
			status_window.set_parts (<<100, -1>>)
		end

	set_toolbar is
			-- Create and initialize the toolbar
		do
			!! toolbar.make (Current, -1)
		end

	main_menu: WEL_MENU is
			-- Create the main menu
		local
			s: STRING
			file_m, sphere_m, help_m: WEL_MENU
		do
			!! file_m.make
			!! sphere_m.make
			!! help_m.make
			
			file_m.append_string ("E&xit", Exit_cmd)
			
			sphere_m.append_string ("&Update material properties", Update_cmd)
			sphere_m.append_string ("&Reset material properties", Reset_cmd)
			
			help_m.append_string ("&OpenGL implementation info", Opengl_cmd)
			help_m.append_separator
			!! s.make (0)
			s.append ("&About ")
			s.append (Title)
			help_m.append_string (s, About_cmd)
			
			!! Result.make
			Result.append_popup (file_m, "&File")
			Result.append_popup (sphere_m, "&Sphere")
			Result.append_popup (help_m, "&Help")
		end
	
	create_controls is	
		local
			wgb: WEL_GROUP_BOX
			st: WEL_STATIC
			wsle: SINGLE_LINE_EDIT
		do
			!! wsle_table.make (10)
			!! wgb.make (Current, "Sphere material ambience [0.00, 1.00]", 5, 30, 235, 50, -1)
			wgb.set_font (toolbar.font)
			!! st.make (Current, "Red:", 15, 53, 35, 20, -1)
			st.set_font (toolbar.font)
			!! amb_red_wsle.make (Current, " ", 50, 50, 30, 20, amb_red_wsle_id)
			amb_red_wsle.set_font (toolbar.font)
			amb_red_wsle.set_text_limit (4)
			amb_red_wsle.set_min_valid_value (0.00)
			amb_red_wsle.set_max_valid_value (1.00)
			wsle_table.put (amb_red_wsle, amb_red_wsle_id)
			!! st.make (Current, "Green:", 85, 53, 35, 20, -1)
			st.set_font (toolbar.font)
			!! amb_green_wsle.make (Current, " ", 120, 50, 30, 20, amb_green_wsle_id)
			amb_green_wsle.set_font (toolbar.font)
			amb_green_wsle.set_text_limit (4)
			amb_green_wsle.set_min_valid_value (0.00)
			amb_green_wsle.set_max_valid_value (1.00)
			wsle_table.put (amb_green_wsle, amb_green_wsle_id)
			!! st.make (Current, "Blue:", 155, 53, 35, 20, -1)
			st.set_font (toolbar.font)
			!! amb_blue_wsle.make (Current, " ", 190, 50, 30, 20, amb_blue_wsle_id)
			amb_blue_wsle.set_font (toolbar.font)
			amb_blue_wsle.set_text_limit (4)
			amb_blue_wsle.set_min_valid_value (0.00)
			amb_blue_wsle.set_max_valid_value (1.00)
			wsle_table.put (amb_blue_wsle, amb_blue_wsle_id)
			
			!! wgb.make (Current, "Sphere material specularity [0.00, 1.00]", 5, 90, 235, 50, -1)
			wgb.set_font (toolbar.font)
			!! st.make (Current, "Red:", 15, 113, 35, 20, -1)
			st.set_font (toolbar.font)
			!! spec_red_wsle.make (Current, " ", 50, 110, 30, 20, spec_red_wsle_id)
			spec_red_wsle.set_font (toolbar.font)
			spec_red_wsle.set_text_limit (4)
			spec_red_wsle.set_min_valid_value (0.00)
			spec_red_wsle.set_max_valid_value (1.00)
			wsle_table.put (spec_red_wsle, spec_red_wsle_id)
			!! st.make (Current, "Green:", 85, 113, 35, 20, -1)
			st.set_font (toolbar.font)
			!! spec_green_wsle.make (Current, " ", 120, 110, 30, 20, spec_green_wsle_id)
			spec_green_wsle.set_font (toolbar.font)
			spec_green_wsle.set_text_limit (4)
			spec_green_wsle.set_min_valid_value (0.00)
			spec_green_wsle.set_max_valid_value (1.00)
			wsle_table.put (spec_green_wsle, spec_green_wsle_id)
			!! st.make (Current, "Blue:", 155, 113, 35, 20, -1)
			st.set_font (toolbar.font)
			!! spec_blue_wsle.make (Current, " ", 190, 110, 30, 20, spec_blue_wsle_id)
			spec_blue_wsle.set_font (toolbar.font)
			spec_blue_wsle.set_text_limit (4)
			spec_blue_wsle.set_min_valid_value (0.00)
			spec_blue_wsle.set_max_valid_value (1.00)
			wsle_table.put (spec_blue_wsle, spec_blue_wsle_id)
			
			!! wgb.make (Current, "Sphere material shininess [0.00, 128.00]", 5, 150, 235, 50, -1)
			wgb.set_font (toolbar.font)
			!! st.make (Current, "Highlight brightness:", 15, 173, 100, 20, -1)
			st.set_font (toolbar.font)
			!! shininess_wsle.make (Current, " ", 115, 170, 38, 20, shininess_wsle_id)
			shininess_wsle.set_font (toolbar.font)
			shininess_wsle.set_text_limit (6)
			shininess_wsle.set_min_valid_value (0.00)
			shininess_wsle.set_max_valid_value (128.00)
			wsle_table.put (shininess_wsle, shininess_wsle_id)
			
			!! wgb.make (Current, "Sphere material emission [0.00, 1.00]", 5, 210, 235, 50, -1)
			wgb.set_font (toolbar.font)
			!! st.make (Current, "Red:", 15, 233, 35, 20, -1)
			st.set_font (toolbar.font)
			!! emis_red_wsle.make (Current, " ", 50, 230, 30, 20, emis_red_wsle_id)
			emis_red_wsle.set_font (toolbar.font)
			emis_red_wsle.set_text_limit (4)
			emis_red_wsle.set_min_valid_value (0.00)
			emis_red_wsle.set_max_valid_value (1.00)
			wsle_table.put (emis_red_wsle, emis_red_wsle_id)
			!! st.make (Current, "Green:", 85, 233, 35, 20, -1)
			st.set_font (toolbar.font)
			!! emis_green_wsle.make (Current, " ", 120, 230, 30, 20, emis_green_wsle_id)
			emis_green_wsle.set_font (toolbar.font)
			emis_green_wsle.set_text_limit (4)
			emis_green_wsle.set_min_valid_value (0.00)
			emis_green_wsle.set_max_valid_value (1.00)
			wsle_table.put (emis_green_wsle, emis_green_wsle_id)
			!! st.make (Current, "Blue:", 155, 233, 35, 20, -1)
			st.set_font (toolbar.font)
			!! emis_blue_wsle.make (Current, " ", 190, 230, 30, 20, emis_blue_wsle_id)
			emis_blue_wsle.set_font (toolbar.font)
			emis_blue_wsle.set_text_limit (4)
			emis_blue_wsle.set_min_valid_value (0.00)
			emis_blue_wsle.set_max_valid_value (1.00)
			wsle_table.put (emis_blue_wsle, emis_blue_wsle_id)
						
			!! wgb.make (Current, "Light control", 5, 270, 235, 50, -1)
			wgb.set_font (toolbar.font)
			!! on_rb.make (Current, "On", 15, 290, 50, 25, on_rb_id)
			on_rb.set_font (toolbar.font)
			on_rb.set_checked
			!! off_rb.make (Current, "Off", 75, 290, 50, 25, off_rb_id)
			off_rb.set_font (toolbar.font)
			
			!! eglu_quadrics_control.make_with_coordinates (Current, "eglu_quadrics_control", 260, 50, 260, 260)
			!! wgb.make (Current, "Sphere [Left button controls light position]", 250, 30, 280, 290, -1)
			wgb.set_font (toolbar.font)
			
			!! wgb.make (Current, "Red box control", 5, 330, 105, 155, -1)
			wgb.set_font (toolbar.font)
			!! start_rb.make (Current, "Start", 15, 353, 75, 25, start_rb_id)
			start_rb.set_font (toolbar.font)
			start_rb.set_checked
			!! stop_rb.make (Current, "Stop", 15, 376, 75, 25, start_rb_id)
			stop_rb.set_font (toolbar.font)
			
			!! moving_red_box_control.make_with_coordinates (Current, "moving_red_box_control", 130, 350, 390, 125)
			!! wgb.make (Current, "A moving red box", 120, 330, 410, 155, -1)
			wgb.set_font (toolbar.font)
		end			
	
feature {NONE} -- Implementation (Window messages)		
	
	default_process_message (msg, wparam, lparam: INTEGER) is
		local
			sle: SINGLE_LINE_EDIT
		do
			if msg = Wm_sle_return_pressed then
				-- A <Return> has been pressed in a
				-- SINGLE_LINE_EDIT control.
				update_quadrics_control
		       	elseif msg = Wm_sle_invalid_value then
				check_gui
			end
		end
	
	on_control_command (control: WEL_CONTROL) is
		do
			if control = on_rb then
				if on_rb.checked then
					eglu_quadrics_control.turn_on_light
				end
			elseif control = off_rb then
				if off_rb.checked then
					eglu_quadrics_control.turn_off_light
				end
			elseif control = start_rb then
				if start_rb.checked then
					moving_red_box_control.start
				end
			elseif control = stop_rb then
				if stop_rb.checked then
					moving_red_box_control.stop
				end
			end
		end
	
	on_menu_command (menu_id: INTEGER) is
			-- The `menu_id' has been choosen from the menu.
		local
			wmb: WEL_MSG_BOX
		do
			if menu_id = Exit_cmd then
				destroy
			elseif menu_id = Update_cmd then
				update_quadrics_control
			elseif menu_id = Reset_cmd then
				init_quadrics_control
			elseif menu_id = Opengl_cmd then
				show_opengl_implementation_info
			elseif menu_id = About_cmd then
				!! wmb.make 
				wmb.information_message_box (Current, about_text, "About EGL demo 2")
			end
		end
	
	on_size (size_type: INTEGER; a_width: INTEGER; a_height: INTEGER) is
			-- Reposition the status window and the tool bar when
			-- the window has been resized.
		do
			if status_window /= Void then
				status_window.reposition
			end
			if toolbar /= Void then
				toolbar.reposition
			end
		end

	on_timer (timer_id: INTEGER) is
			-- Wm_timer message.
			-- A Wm_timer has been received from `timer_id'
			-- See also `set_timer', `kill_timer'.
		do
            if timer_id = 1 then
                destroy
            end
		end
	
feature {NONE} -- Implementation (Basic operations)	
	
	show_opengl_implementation_info	is
			-- Show information on the OpenGL implementation that
			-- is currently being used.
		local
			s: STRING
			a_s: ANALYSIS_STRING
			s_list: LIST [STRING]
			wmb: WEL_MSG_BOX
		do
			!! s.make (0)
			s.append ("Vendor:   ")
			s.append (egl_get_string (Gl_vendor))
			s.append ("%N%N")
			s.append ("Renderer: ")
			s.append (egl_get_string (Gl_renderer))
			s.append ("%N%N")
			s.append ("Version:  ")
			s.append (egl_get_string (Gl_version))
			s.append ("%N%N")
			s.append ("Supported extensions:%N")

			!! a_s.init (egl_get_string (Gl_extensions))
			s_list := a_s.fields (" ")
			from  
				s_list.start
			until
				s_list.after
			loop
				s.append ("(")
				s.append (s_list.index.out)
				s.append (") ")
				s.append (s_list.item)
				s.append ("%N")
				s_list.forth
			end
			
			!! wmb.make 
			wmb.information_message_box (Current, s, "OpenGL implementation info")
		end			
	
feature {NONE} -- Implementation (Window class attributes)	
	
	class_background: WEL_BRUSH is
			-- Set background to light gray
		once
			!WEL_LIGHT_GRAY_BRUSH! Result.make
		end
	
feature {NONE} -- Implementation (Window default values)	
	
	default_style: INTEGER is
			-- OpenGl requires Ws_clipchildren and Ws_clipsiblings
		once
			Result := Ws_overlappedwindow -- + Ws_clipchildren +
--				Ws_clipsiblings
		end
	
	default_x: INTEGER is
		once
			Result := 100
		end
	
	default_y: INTEGER is
		once
			Result := 100
		end
	
	default_height: INTEGER is
		once
			Result := 555
		end

	default_width: INTEGER is
		once
			Result := 543
		end
	
feature {NONE} -- Implementation (Quadrics control)
	
	mat_ambient: ARRAY [REAL]
	mat_specular: ARRAY [REAL]
	mat_shininess: ARRAY [REAL]
	mat_emission: ARRAY [REAL]

	init_quadrics_control is
			-- Initialize values for the quadrics control.
		require
			quadrics_control_exists: eglu_quadrics_control /= Void
		do
			mat_ambient := <<0.5, 0.5, 0.5, 1.0>>
			mat_specular := <<1.0, 1.0, 1.0, 1.0>>
			mat_shininess := <<50.0>>
			mat_emission := <<0.0, 0.0, 0.0, 0.0>>
			eglu_quadrics_control.set_material_ambient_reflectance (mat_ambient)
			eglu_quadrics_control.set_material_specular_reflectance (mat_specular)
			eglu_quadrics_control.set_material_shininess (mat_shininess)
			eglu_quadrics_control.set_material_emittance (mat_emission)
			update_gui
		end
	
	update_gui is
			-- Update the GUI with the current material values
		do
			amb_red_wsle.set_value (mat_ambient @ 1)
			amb_green_wsle.set_value (mat_ambient @ 2)
			amb_blue_wsle.set_value (mat_ambient @ 3)
			spec_red_wsle.set_value (mat_specular @ 1)
			spec_green_wsle.set_value (mat_specular @ 2)
			spec_blue_wsle.set_value (mat_specular @ 3)
			shininess_wsle.set_value (mat_shininess @ 1)
			emis_red_wsle.set_value (mat_emission @ 1)
			emis_green_wsle.set_value (mat_emission @ 2)
			emis_blue_wsle.set_value (mat_emission @ 3)
		end
	
	update_quadrics_control is
			-- Update the quadrics control with the new values
			-- fromthe GUI.
		require
			quadrics_control_exists: eglu_quadrics_control /= Void
		do
			check_gui
			if gui_ok then
				
				-- Update the `mat_ambient' array
				mat_ambient.put (amb_red_wsle.text.to_real, 1)
				mat_ambient.put (amb_green_wsle.text.to_real, 2)
				mat_ambient.put (amb_blue_wsle.text.to_real, 3)
				-- Update the `mat_specular' array
				mat_specular.put (spec_red_wsle.text.to_real, 1)
				mat_specular.put (spec_green_wsle.text.to_real, 2)
				mat_specular.put (spec_blue_wsle.text.to_real, 3)
				-- Update the `mat_shininess' array
				mat_shininess.put (shininess_wsle.text.to_real, 1)
				-- Update the `mat_emission' array
				mat_emission.put (emis_red_wsle.text.to_real, 1)
				mat_emission.put (emis_green_wsle.text.to_real, 2)
				mat_emission.put (emis_blue_wsle.text.to_real, 3)
				
				-- Update the quadrics control
				eglu_quadrics_control.set_material_ambient_reflectance (mat_ambient)
				eglu_quadrics_control.set_material_specular_reflectance (mat_specular)
				eglu_quadrics_control.set_material_shininess (mat_shininess)
				eglu_quadrics_control.set_material_emittance (mat_emission)			
			end
		end
	
	gui_ok: BOOLEAN 
			-- Does the GUI contain valid values?
	
	check_gui is
			-- Check the GUI for valid values
		do
			if not amb_red_wsle.has_valid_value then
				show_error_msg ("Invalid value for the ambient red parameter.")
				amb_red_wsle.set_focus
				amb_red_wsle.select_all			
			elseif not amb_green_wsle.has_valid_value then
				show_error_msg ("Invalid value for the ambient green parameter.")
				amb_green_wsle.set_focus
				amb_green_wsle.select_all
			elseif not amb_blue_wsle.has_valid_value then
				show_error_msg ("Invalid value for the ambient blue parameter.")
				amb_blue_wsle.set_focus
				amb_blue_wsle.select_all			
			elseif not spec_red_wsle.has_valid_value then
				show_error_msg ("Invalid value for the specular red parameter.")
				spec_red_wsle.set_focus
				spec_red_wsle.select_all			
			elseif not spec_green_wsle.has_valid_value then
				show_error_msg ("Invalid value for the specular green parameter.")
				spec_green_wsle.set_focus
				spec_green_wsle.select_all			
			elseif not spec_blue_wsle.has_valid_value then
				show_error_msg ("Invalid value for the specular blue parameter.")
				spec_blue_wsle.set_focus
				spec_blue_wsle.select_all			
			elseif not shininess_wsle.has_valid_value then
				show_error_msg ("Invalid value for the shininess parameter.")
				shininess_wsle.set_focus
				shininess_wsle.select_all			
			elseif not emis_red_wsle.has_valid_value then
				show_error_msg ("Invalid value for the emission red parameter.")
				emis_red_wsle.set_focus
				emis_red_wsle.select_all			
			elseif not emis_green_wsle.has_valid_value then
				show_error_msg ("Invalid value for the emission green parameter.")
				emis_green_wsle.set_focus
				emis_green_wsle.select_all			
			elseif not emis_blue_wsle.has_valid_value then
				show_error_msg ("Invalid value for the emission blue parameter.")
				emis_blue_wsle.set_focus
				emis_blue_wsle.select_all			
			else
				gui_ok := True
			end
		end
	
	show_error_msg (s: STRING) is
		require
			s_not_void: s /= Void
		local
			wmb: WEL_MSG_BOX
		do
			!! wmb.make 
			wmb.error_message_box (Current, s, "Error")
		end
	
	about_text: STRING is
			-- The "About ..." message string 
		do
			!! Result.make (0)
			Result.append ("EGL demo 2%N")
			Result.append ("Written by Paul Cohen%N%N")
			Result.append ("This demo application shows the use of EGL%N")
			Result.append ("togheter with WEL. More specifically it shows%N")
			Result.append ("the use of EGL in two separate GL_CONTROLs.%N")
			Result.append ("The class GL_CONTROL inherits from%N")
			Result.append ("WEL_CONTROL_WINDOW (which provides%N")
			Result.append ("the WEL developer with a framework for developing%N")
			Result.append ("custom Windows controls).%N%N")
			Result.append ("A known problem with the application is that%N")
			Result.append ("you have two stop the red box animation in%N")		
			Result.append ("order to be able to turn off (and on) the%N")
			Result.append ("light in the sphere display. This probably has%N")
			Result.append ("to do with the current OpenGL rendering context.")
		end
	
feature {NONE} -- Implementation (Internals)
	
	moving_red_box_control: MOVING_RED_BOX_CONTROL	
	eglu_quadrics_control: EGLU_QUADRICS_CONTROL
	
	toolbar: WEL_TOOL_BAR
	status_window: WEL_STATUS_WINDOW
	
	opengl_info_dialog: OPENGL_INFO_DIALOG
	
	Exit_cmd: INTEGER is 10001
	Update_cmd: INTEGER is 10002
	Reset_cmd: INTEGER is 10003
	Opengl_cmd: INTEGER is 10004
	About_cmd: INTEGER is 10005
	
	Title: STRING is "EGL demo 2"
	
	amb_red_wsle: SINGLE_LINE_EDIT
	amb_red_wsle_id: INTEGER is 20001
	amb_green_wsle: SINGLE_LINE_EDIT
	amb_green_wsle_id: INTEGER is 20002
	amb_blue_wsle: SINGLE_LINE_EDIT
	amb_blue_wsle_id: INTEGER is 20003

	spec_red_wsle: SINGLE_LINE_EDIT
	spec_red_wsle_id: INTEGER is 20004
	spec_green_wsle: SINGLE_LINE_EDIT
	spec_green_wsle_id: INTEGER is 20005
	spec_blue_wsle: SINGLE_LINE_EDIT
	spec_blue_wsle_id: INTEGER is 20006

	shininess_wsle: SINGLE_LINE_EDIT
	shininess_wsle_id: INTEGER is 20007
	
	emis_red_wsle: SINGLE_LINE_EDIT
	emis_red_wsle_id: INTEGER is 20008
	emis_green_wsle: SINGLE_LINE_EDIT
	emis_green_wsle_id: INTEGER is 20009
	emis_blue_wsle: SINGLE_LINE_EDIT
	emis_blue_wsle_id: INTEGER is 20010
	
	wsle_table: HASH_TABLE [SINGLE_LINE_EDIT, INTEGER]
			-- Table containing all edit fields hashed by control id.
	
	on_rb: WEL_RADIO_BUTTON
	on_rb_id: INTEGER is 20011
	off_rb: WEL_RADIO_BUTTON
	off_rb_id: INTEGER is 20012
	
	start_rb: WEL_RADIO_BUTTON
	start_rb_id: INTEGER is 20013
	stop_rb: WEL_RADIO_BUTTON
	stop_rb_id: INTEGER is 20014
	
end -- class MAIN_WINDOW

--| begin documentation
-- 
--| end documentation

