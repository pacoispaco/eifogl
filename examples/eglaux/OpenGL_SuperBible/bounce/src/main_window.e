indexing
	description: "Main window of the Bounce OpenGL AUX application.%
	%This application was translated from C as it appeared in the%
	%book OpenGL SuperBible."
        application: "bounce"
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
			on_idle,
			on_reshape
		end
	
creation
	make
	
feature {NONE} -- Initialization
	
	init is
			-- Initialize the EGLAUX application
		do
			x1 := 100.0
			y1 := 150.0
			rsize := 50
			
			xstep := 1.0
			ystep := 1.0
		end
	
	init_event_subscriptions is
			-- Specify which events to subscribe to.
		do
			subscribe_to_idle_events
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
			Result := "Simple 2D animation"
		end

feature {NONE} -- Implementation (Main loop invoked from EGLAUX)
	
	main_loop is 
		do
			render_scene
		end

feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_idle is
		do
			-- Reverse direction when you reach the left or right
			-- edge
			if (x1 > window_width - rsize) or (x1 < 0) then
				xstep := 0 - xstep
			end
			
			-- Reverse direction when you reach the left or right
			-- edge
			if (y1 > window_height - rsize) or (y1 < 0) then
				ystep := 0 - ystep
			end
			
			-- Check bounds. This is in case the window is made
			-- smaller and the rectangle is outside the new
			-- clipping volume
			if (x1 > window_width - rsize) then
				x1 := window_width - rsize - 1.0
			end
			if (y1 > window_height - rsize) then
				y1 := window_height - rsize - 1.0
			end	
			
			-- Actually move the square
			x1 := x1 + xstep
			y1 := y1 + ystep
			
			-- Redraw the square with new coordinates
			render_scene
		end
	
	on_reshape (width, height: INTEGER) is
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
			
			-- Set the viewport to be the entire window
			egl_viewport (0, 0, w, h)
			
			-- Reset the coordinate system before modifying
			egl_load_identity
			
			-- Keep the square square, this time, save calculated
			-- width and height for later use
			if width <= height then
				window_height := 250.0 * h/w
				window_width := 250.0
			else	
				window_height := 250.0
				window_width := 250.0 * w/h
			end
			
			-- Set the clipping volume
			egl_ortho (0.0, window_width, 0.0, window_height, 1.0, -1.0)
		end
	
feature {NONE} -- Implementation 
	
	render_scene is
		do
			-- Set background color to blue
			egl_clear_color (0.0, 0.0, 1.0, 1.0)
			
			-- Clear the window with the current clearing color
			egl_clear (Gl_color_buffer_bit)
			
			-- Set drawing color to red, and draw th rectangle at
			-- the current position
			egl_color_3f (1.0, 0.0, 0.0)
			egl_rect_f (x1, y1, x1 + rsize, y1 + rsize)
			
			egl_flush
			
			aux_swap_buffers
		end
	
feature {NONE} -- Implementation
	
	x1: REAL
	y1: REAL
	rsize: INTEGER
	
	xstep: REAL
	ystep: REAL
	
	window_width: REAL
	window_height: REAL
	
end -- class MAIN_WINDOW

-- begin documentation
-- 
-- end documentation
