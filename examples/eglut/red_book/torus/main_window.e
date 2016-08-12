indexing
	description: "Main window of the torus program"
        application: "torus"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2000 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/08 11:40:47 $"
	revision: "$Revision: 1.4 $"

class MAIN_WINDOW

inherit
	EGLUT_TOP_LEVEL_WINDOW
		redefine
			default_window_title,
			default_width,
			default_height,
			init,
			on_display,
			on_reshape,
			on_keyboard,
			on_visibility
		end
	
	EGLU
		export
			{NONE} all
		end
	
	DOUBLE_MATH

creation
	make
	
feature {NONE} -- Initialization
	
	init is
			-- Initialize the window
		do
			glut_init_displaymode (Glut_single + Glut_rgb)
			
			subscribe_to_reshape_events
			subscribe_to_keyboard_events
			subscribe_to_visibility_events

			the_torus := egl_gen_lists (1)
			egl_new_list (the_torus, Gl_compile)
			draw_torus_display_list (8, 25)
			egl_end_list
			
			egl_clear_color (0.0, 0.0, 0.0, 0.0)
			egl_shade_model (Gl_smooth)
		end
			
feature -- Access	

	default_window_title: STRING is
		once
			Result := "EGLUT: torus"
		end
		
	default_width: INTEGER is 150
	
	default_height: INTEGER is 150

feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
			-- The window has been displayed
		do
			egl_clear (Gl_color_buffer_bit)
			egl_color_3f (0.5, 0.8, 0.8)
			egl_call_list (the_torus)
			egl_flush
		end
	
	on_reshape (width, height: INTEGER) is
			-- The window has been reshaped
		do
			egl_viewport (0, 0, width, height)
			egl_matrix_mode (Gl_projection)
			egl_load_identity
			eglu_perspective (30, width/height, 1.0, 100.0)
			egl_matrix_mode (Gl_modelview)
			egl_load_identity
			eglu_look_at (0, 0, 10, 0, 0, 0, 0, 1, 0)
		end
	
	on_keyboard (char: CHARACTER; modifier, x, y: INTEGER) is
			-- A keboard event has been recieved.
			-- Rotate about x-axis when 'x' typed.
			-- Rotate about y-axis when 'y' typed.
			-- Return torus to original view when 'i' typed.
		do
			inspect char
			when 'x', 'X' then
				egl_rotate_f (30.0, 1.0, 0.0, 0.0)
				glut_post_redisplay
			when 'y', 'Y' then
				egl_rotate_f (30.0, 0.0, 1.0, 0.0)
				glut_post_redisplay
			when 'i', 'I' then
				egl_load_identity
				eglu_look_at (0, 0, 10, 0, 0, 0, 0, 1, 0)
				glut_post_redisplay
			else
				if char.code = 27 then
					quit (0)
				end
			end
		end
	
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation
	
	the_torus: INTEGER
			-- Display list index of the torus
	
	draw_torus_display_list (numc, numt: INTEGER) is
			-- Draw a torus
		local
			i, j, k: INTEGER
			s, t, x, y, z, twopi: DOUBLE
		do
			twopi := 2 * pi
			from
				i := 0
			until
				i = numc
			loop
				egl_begin (Gl_quad_strip)
				from  
					j := 0 
				until
					j = numt
				loop
					from  
						k := 1
					until
						k < 0
					loop
						s := (i + k) \\ numc + 0.5
						t := j \\ numt
						x := (1 + 0.1 * cosine (s * twopi/numc)) * cosine (t * twopi/numt)
						y := (1 + 0.1 * cosine (s * twopi/numc)) * sine (t * twopi/numt)
						z := 0.1 * sine (s * twopi/numc)
						egl_vertex_3d (x, y, z)
						k := k - 1
					end
					j := j + 1
				end
				egl_end
				i := i + 1
			end
		end

end -- class MAIN_WINDOW

