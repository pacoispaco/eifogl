indexing
	description: "Main window"
        application: "planet"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/30 23:37:18 $"
	revision: "$Revision: 1.1 $"

class MAIN_WINDOW

inherit
	EGLUT_TOP_LEVEL_WINDOW
		export
			{NONE} all
		redefine
			default_window_title,
			default_width,
			default_height,
			init,
			on_display,
			on_keyboard,
			on_reshape,
			on_visibility
		end
	
	EGLU
	
creation
	make
	
feature {NONE} -- Initialization
	
	init is
			-- Initialize the window
		do
			subscribe_to_visibility_events
			subscribe_to_reshape_events
			subscribe_to_display_events
			subscribe_to_keyboard_events

			egl_clear_color (0.0, 0.0, 0.0, 0.0)
			egl_shade_model (Gl_flat)
			
			day := 0
			hour := 0
			moon_day := 0
		end
	
feature -- Access	
	
	default_window_title: STRING is
		once
			Result := "EGLUT planet"
		end
		
	default_width: INTEGER is 200
	
	default_height: INTEGER is 200
	

feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
			-- The window has been displayed
		do
			egl_clear (Gl_color_buffer_bit)
			egl_color_3f (1.0, 1.0, 1.0)
			
			egl_push_matrix
			-- Draw sun
			glut_wire_sphere (1.0, 20, 16)
			egl_rotate_f (day, 0.0, 1.0, 0.0)
			egl_translate_f (2.0, 0.0, 0.0)
			egl_push_matrix
			-- Make the planet tilt 22 degrees!
			egl_rotate_f (22.0, 1.0, 0.0, 0.0)
			egl_rotate_f (hour, 0.0, 1.0, 0.0)
			-- Draw smaller planet
			glut_wire_sphere (0.2, 10, 8)
			egl_pop_matrix
			egl_rotate_f (moon_day, 0.0, 1.0, 0.0)
			egl_translate_f (0.4, 0.0, 0.0)
			-- Draw moon for smaller planet
			glut_wire_sphere (0.05, 8, 4)
			egl_pop_matrix
			glut_swap_buffers
		end
	
	on_keyboard (char: CHARACTER; modifier, x, y: INTEGER) is
			-- A keboard event has been recieved
		do	
			inspect char			
			when 'h' then
				hour := (hour + 10) \\ 360
				glut_post_redisplay
			when 'H' then
				hour := (hour - 10) \\ 360
				glut_post_redisplay
			when 'd' then
				day := (day + 5) \\ 360
				glut_post_redisplay
			when 'D' then
				day := (day - 5) \\ 360
				glut_post_redisplay
			when 'm' then
				moon_day := (moon_day + 5) \\ 360
				glut_post_redisplay
			when 'M' then
				moon_day := (moon_day - 5) \\ 360
				glut_post_redisplay
			else
			end
		end
	
	on_reshape (width, height: INTEGER) is
		do
			egl_viewport (0, 0, width, height)
			egl_matrix_mode (Gl_projection)
			egl_load_identity
			eglu_perspective (60.0, width/height, 1.0, 20.0)
			egl_matrix_mode (Gl_modelview)
			egl_load_identity
			eglu_look_at (0.0, 0.0, 5.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0)
		end
	
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation
	
	day: INTEGER
	
	hour: INTEGER
	
	moon_day: INTEGER
	
end -- class MAIN_WINDOW

