indexing
	description: "Main window for the test application for EOpenGL"
        application: "gl_test"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/03/23 13:42:32 $"
	revision: "$Revision: 1.4 $"

class
	MAIN_WINDOW
	
inherit
	WEL_FRAME_WINDOW
		redefine
			class_background,
			class_icon,
			default_style,
			default_x,
			default_y,
			default_height,
			default_width,
			on_paint,
			on_show,
			on_size,
			on_destroy
		end
	
	WEL_BIT_OPERATIONS
		export
			{NONE} all
		end
	
	WEL_MAIN_ARGUMENTS
		export
			{NONE} all
		end
	
	PFD_CONSTANTS
		export
			{NONE} all
		end
	
	EGL
		export
			{NONE} all
		end

	GLU
		export
			{NONE} all
		end
		
creation
	make

feature {NONE} -- Initialization

	make is
			-- Make the main window
		do
			make_top ("Eiffel WEL & EGL test program")
			
			x1 := 100.0
			y1 := 150.0
			rsize := 50	
			xstep := 1.0
			ystep := 1.0
			
			check_command_line
		end
	
	check_command_line is
		local
			s: STRING
		do
			s := command_line
		end
	
feature {NONE} -- Implementation (Window messages)
	
	on_show is
			-- Create and get a OpenGL DC the first time the window is
			-- shown.
		do
			if gl_device_context = Void then
				-- Get a device context
				!! gl_device_context.make (Current)
				gl_device_context.get
				
				-- Set the pixel format
				gl_device_context.choose_pixel_format (pixel_format)
				gl_device_context.set_pixel_format (gl_device_context.chosen_pixel_format_index, pixel_format)
				
				-- Create an OpenGL rendering context
				!! rendering_context.create_new (gl_device_context)
				rendering_context.make_current (gl_device_context)
				
				-- Create a palette if needed, i.e. if we're
				-- running on 256 colors
				get_opengl_palette (gl_device_context)
			end
		end
	
	on_destroy is
			-- The window is about to be destroyed
		do
			rendering_context.delete
			gl_device_context.release
		end
	
	on_paint (paint_dc: WEL_PAINT_DC; invalid_rect: WEL_RECT) is
			-- Do some rendering
		do
			egl_clear_color (0.0, 0.0, 1.0, 0.0)
			egl_clear (Gl_color_buffer_bit)
			egl_color_3f (1.0, 0.0, 0.0)
			egl_rect_f (x1, y1, x1 + rsize, y1 + rsize)
			
			gl_device_context.swap_buffers	
			
			validate_rect (client_rect)
		end
	
	on_size (size_type, w, h: INTEGER) is
		local
			hnz: INTEGER
			left, winw, bottom, winh, near, far: DOUBLE
		do
			-- Prevent a divide by zero
			if h = 0 then
				hnz := 1
			else
				hnz := h
			end
			
			-- Set the viewport to be the entire window
			egl_viewport (0, 0, w, hnz)
			
			-- Reset the coordinate system before modifying
			egl_load_identity
			
			if w <= hnz then
				winh := 250.0 * hnz/w
				winw := 250.0
			else
				winh := 250.0 * w/hnz
				winw := 250.0
			end
			
			-- Set the clipping volume
			left := 0.0
			bottom := 0.0
			near := 1.0
			far := -1.0
			egl_ortho (left, winw, bottom, winh, near, far)
			
			test_gl_get_functions
		end

feature {NONE} -- Implementation (Window class attributes)	
	
	class_background: WEL_WHITE_BRUSH is
			-- White background
		once
			!! Result.make
		end

	class_icon: WEL_ICON is
			-- The window's icon
		once
			!! Result.make_by_name ("EIFFEL_OPENGL_ICON")
		end
	
feature {NONE} -- Implementation (Window default values)	
	
	default_style: INTEGER is
			-- OpenGl requires Ws_clipchildren and Ws_clipsiblings
		once
			Result := Ws_overlappedwindow + Ws_clipchildren +
				Ws_clipsiblings
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
			Result := 250
		end

	default_width: INTEGER is
		once
			Result := 250
		end

feature {NONE} -- Implementation (Internals)
	
	gl_device_context: EWGL_WEL_CLIENT_DC
			-- Device context
	
	rendering_context: OPENGL_RENDERING_CONTEXT
			-- OpenGL rendering context
		
	pfd_index: INTEGER
			-- Index of the used pixel format
	
	x1, y1, rsize: REAL
	
	xstep, ystep: REAL	
	
feature {NONE} -- Implementation	
	
	pixel_format: PIXEL_FORMAT_DESCRIPTOR is
		do
			!! Result.make
			Result.set_dw_flags (Pfd_draw_to_window + 
					     Pfd_support_opengl +
					     Pfd_doublebuffer)
			Result.set_i_pixel_type (Pfd_type_rgba)
			Result.set_c_color_bits (8)
			Result.set_c_depth_bits (16)
		end
	
	get_opengl_palette (dc: WEL_DC) is
			-- If necessary, creates a 3-3-2 palette for the device
			-- context listed.
		local
			pfd: PIXEL_FORMAT_DESCRIPTOR
			wp_332: PALETTE_332
		do
			-- Get detailed info on our dc's pixel format
			!! pfd.make
			if flag_set (pfd.dw_flags, Pfd_Need_Palette) then
				!! wp_332.make_evenly_distributed		
				gl_device_context.select_palette (wp_332)
				gl_device_context.realize_palette
			end
		end	
	
feature -- Test & Debug	
	
	calls: INTEGER
	
	test_gl_get_functions is
		local
			a: ARRAY [REAL]
			a2: ARRAY [DOUBLE]
			i: INTEGER
		do
			calls := calls + 1
			print ("Call no ")
			print (calls)
			print (":%N")
			print ("egl_get_float_v (Gl_projection_matrix) = ")
			a := egl_get_float_v (Gl_projection_matrix)
			print ("[")
			from 
				i := 1
			until 
				i > a.count
			loop
				print (a @ i)
				i := i + 1
				if i <= a.count then
					print (", ")
				end
			end
			print ("]%N")
			print ("egl_get_double_v (Gl_projection_matrix) = ")
			a2 := egl_get_double_v (Gl_projection_matrix)
			print ("[")
			from 
				i := 1
			until 
				i > a2.count
			loop
				print (a2 @ i)
				i := i + 1
				if i <= a.count then
					print (", ")
				end
			end
			print ("]%N")
 		end
	
end -- class MAIN_WINDOW

--| begin documentation
-- 
--| end documentation


