indexing
	description: "An OpenGL control with a movable red box"
        application: "sphere_and_red_box"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class MOVING_RED_BOX_CONTROL

inherit
	
	GL_CONTROL
		redefine
			on_paint,
			on_timer,
			on_size
		end
	
creation
	make_with_coordinates
	
feature -- Initialization
	
	init is
		do
			red_box_x := 50.0
			red_box_y := 50.0
			red_box_side := 40	
			xstep := 1.0
			ystep := 1.0
			
			start
		end
	
feature -- Access

	red_box_x: REAL
	
	red_box_y: REAL
	
	red_box_side: REAL
	
feature -- Status setting
	
	start is
		-- Start moving the red box.
		do
			-- Set the timer
			set_timer (timer_id, timer_interval)			
		end
	
	stop is
			-- Stop moving the red box.
		do
			kill_timer (timer_id)
		end
	
	set_red_box_x (r: REAL) is
		require
			r_not_negative: r >= 0.0
		do
			red_box_x := r
			display_red_box
		end
	
	set_red_box_y (r: REAL) is
		require
			r_not_negative: r >= 0.0
		do
			red_box_y := r
			display_red_box
		end
	
	set_red_box_side (r: REAL) is
		require
			r_greater_than_zero: r > 0.0
		do
			red_box_side := r
			display_red_box
		end
	
feature {NONE} -- Implementation (Window messages)

	on_paint (paint_dc: WEL_PAINT_DC; invalid_rect: WEL_RECT) is
			-- Do some rendering
		do
			display_red_box
		end
	
	on_timer (tid: INTEGER) is
			-- Wm_timer message.
		do
			check tid = timer_id end
			-- Reverse direction when you reach the left or right
			-- edge
			if (red_box_x > width - red_box_side) or (red_box_x < 0) then
				xstep := 0 - xstep
			end
			
			-- Reverse direction when you reach the left or right
			-- edge
			if (red_box_y > height - red_box_side) or (red_box_y < 0) then
				ystep := 0 - ystep
			end
			
			-- Check bounds. This is in case the window is made
			-- smaller and the rectangle is outside the new
			-- clipping volume
			if (red_box_x > width - red_box_side) then
				red_box_x := width - red_box_side - 5.0
			end
			if (red_box_y > height - red_box_side) then
				red_box_y := height - red_box_side - 5.0
			end	
			
			-- Actually move the square
			red_box_x := red_box_x + xstep
			red_box_y := red_box_y + ystep
			
			-- Redraw the square with new coordinates
--			invalidate
			display_red_box
		end

	on_size (size_type, w, h: INTEGER) is
		do
			set_viewport_and_clipping_volume (w, h)
		end

feature {NONE} -- Implementation (Internals)
	
	xstep, ystep: REAL	
	
	timer_id: INTEGER is 1
	timer_interval: INTEGER is 1
	
feature {NONE} -- Implementation	
	
	set_viewport_and_clipping_volume (a_width, a_height: INTEGER) is
			-- Set viewport and clipping volume according to the
			-- size of the window.
		local
			w, h: INTEGER
			winw, winh: DOUBLE
		do
			rendering_context.make_current (gl_device_context)
			
			-- Prevent a divide by zero
			if a_height = 0 then
				h := 1
			else
    			h := a_height
			end
			w := a_width
			
			-- Set the viewport to be the entire window
			egl_viewport (0, 0, w, h)
			
			-- Reset the coordinate system before modifying
			egl_load_identity
			
			winh := height
			winw := width
			
			-- Set the clipping volume
			egl_ortho (0.0, winw, 0.0, winh, 1.0, -1.0)
		end
	
	display_red_box is
		local
			ret_val: INTEGER
		do
			rendering_context.make_current (gl_device_context)
			
			set_viewport_and_clipping_volume (width, height)
			egl_clear_color (0.0, 0.0, 1.0, 0.0)
			egl_clear (Gl_color_buffer_bit)
			egl_color_3f (1.0, 0.0, 0.0)
			egl_rect_f (red_box_x, red_box_y, 
				    red_box_x + red_box_side, 
				    red_box_y + red_box_side)
			
			gl_device_context.swap_buffers
						
			validate_rect (client_rect)
		end
	
end -- class MOVING_RED_BOX_CONTROL

--| begin documentation
-- 
--| end documentation

