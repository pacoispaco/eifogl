indexing
	description: "A window control for displaying OpenGL graphics"
        application: "sphere_and_red_box"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/29 23:23:03 $"
	revision: "$Revision: 1.2 $"

deferred class GL_CONTROL

inherit
	
	WEL_CONTROL_WINDOW
		redefine
			make_with_coordinates,
			on_query_new_palette,
			on_wm_destroy
		end
	
	PFD_CONSTANTS
		export
			{NONE} all
		end
	
	EGL
		export
			{NONE} all
		end

	EGLU
		export
			{NONE} all
		end
	
feature -- Initialization
	
	make_with_coordinates (a_parent: WEL_WINDOW; a_name: STRING;
			       a_x, a_y, a_width, a_height: INTEGER) is
		local
			pfd: PIXEL_FORMAT_DESCRIPTOR
		do
			precursor (a_parent, a_name, a_x, a_y, a_width, a_height)
	
			-- Get a OpenGL capable device context
			!! gl_device_context.make (Current)
			gl_device_context.get
			
			-- Set the pixel format
			gl_device_context.choose_pixel_format (desired_pixel_format)
			pfd_index := gl_device_context.chosen_pixel_format_index
			gl_device_context.set_pixel_format (pfd_index, desired_pixel_format)
			
			-- Check if a palette is needed!
			pfd := gl_device_context.describe_pixel_format (pfd_index)
			if flag_set (pfd.dw_flags, Pfd_Need_Palette) then
				!! palette.make_evenly_distributed			
				gl_device_context.select_palette (palette)
				gl_device_context.realize_palette
			end
			
			-- Create an OpenGL rendering context
			!! rendering_context.create_new (gl_device_context)
			rendering_context.make_current (gl_device_context)
			
			-- Initialize the control
			init
		end
	
	init is
			-- Initialize the OpenGL library and the OpenGL
			-- specifics of this control.
		deferred
		end
	
feature -- Messages	
	
	on_wm_destroy is
			-- The control is about to be destroyed
		do
			rendering_context.make_current (gl_device_context)
			rendering_context.delete
			gl_device_context.release			
			destroy
		end

	on_query_new_palette is
			-- Inform an application that is about to receive the
			-- keyboard focus, giving the application an opportunity
			-- to realize its logical palette when it receives the
			-- focus. If the window realizes its logical palette,
			-- it must return True; otherwise it must return False.
			-- (False by default)
		do
			if palette /= Void then
				-- Select the palette into the current device
				-- context
				gl_device_context.select_palette (palette)
				-- Map entries from the currently selected
				-- palette to the system palette
				gl_device_context.realize_palette
				-- Repaint, forces remap of palette in the
				-- current window
				invalidate_rect (client_rect, False)
			end
		end
	
feature {NONE} -- Implementation
	
	gl_device_context: EWGL_WEL_CLIENT_DC
			-- Device context for this control
	
	desired_pixel_format: PIXEL_FORMAT_DESCRIPTOR is
			-- A pixel format descriptor that defines the desired
			-- capabilities of this control. May be redefined in
			-- child classes to suit a specific application.
		once
			!! Result.make
			Result.set_dw_flags (Pfd_draw_to_window + 
					     Pfd_support_opengl +
					     Pfd_doublebuffer)
			Result.set_i_pixel_type (Pfd_type_rgba)
			Result.set_c_color_bits (8)
			Result.set_c_depth_bits (16)
		end
	
	pfd_index: INTEGER
			-- Index of the pixel format that is set in the
			-- `gl_device_context'
	
	rendering_context: OPENGL_RENDERING_CONTEXT
			-- OpenGL rendering context of this control
		
	palette: PALETTE_332
			-- An evenly distributed 256 color palette. This is
			-- used when the set pixel format indicates that a
			-- palette is needed, i.e. if we're running on a 256
			-- color machine.

invariant
	desired_pixel_format_supports_opengl: flag_set (desired_pixel_format.dw_flags, Pfd_support_opengl)
	
end -- class GL_CONTROL

--| begin documentation
-- A window control for displaying OpenGL graphics
--| end documentation

