indexing
	description: "Main window of the teapot EGLAUX test application.%
	%This application was translated from C as it appeared in the%
	%book OpenGL SuperBible."
        application: "teapot"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class MAIN_WINDOW

inherit
	EGLAUX_WINDOW
		redefine
			eglaux_window_title,
			initial_display_mode,			
			on_reshape
		end
	
creation
	make
	
feature {NONE} -- Initialization
		
	init is
			-- Initialize the window
		do
			-- No application entities to initialize!
		end
	
	init_event_subscriptions is
		do
			subscribe_to_reshape_events
		end
	
feature -- Access (Initial values)
	
	initial_display_mode: INTEGER is
			-- The initial display mode of the EGLAUX application
			-- window
		do
			Result := Aux_double + Aux_rgba
		end
	
	eglaux_window_title: STRING is
			-- The title of the EGLAUX application window
		do
			Result := "3D Wire-Frame Teapot"
		end
	
feature {NONE} -- Implementation (Main loop invoked from EGLAUX)
	
	main_loop is 
		do
			render_scene
		end

feature {NONE} -- Implementation (GLUT callbacks)	
		
	on_reshape (width, height: INTEGER) is
			-- The window has changed size
		local
			w, h: INTEGER
		do
			-- Prevent a divide by zero, when window is too short
			-- (you can't make a window of zero width)
			if height = 0 then
				h := 1
			else
				h := height
			end
			w := width
			
			-- Set the viewport to match window size
			egl_viewport (0, 0, w, h)
			
			-- Reset the coordinate system before modifying
			egl_load_identity
			
			-- Set up the clipping volume
			if w <= h then
				egl_ortho (-100.0, 100.0, -100.0, 100.0 * h/w, -100.0, 100.0)
			else
				egl_ortho (-100.0, 100.0 * w/h, -100.0, 100.0, -100.0, 1.0)
			end
		end
	
feature {NONE} -- Implementation 
	
	render_scene is
			-- Draw the teapot
		do
			-- Set clear color to blue and clear the screen
--			  egl_clear_color (0.0, 0.0, 1.0, 1.0)
			-- Set clear color to dark grey and clear the screen
			egl_clear_color (0.1, 0.1, 0.1, 1.0)			
			egl_clear (Gl_color_buffer_bit)
			
			-- Set drawing color to red, and draw the rectangle at
			-- the current position 
--                        egl_color_3f (1.0, 0.0, 0.0)			
			-- Set drawing color to light yellow, and draw the
			-- rectangle at the current position
			egl_color_3f (0.9, 0.9, 0.0)			
			aux_wire_teapot (50.0)
			
			egl_flush
			
			aux_swap_buffers
		end
	
feature {NONE} -- Implementation
	
end -- class MAIN_WINDOW

-- begin documentation
-- 
-- end documentation
