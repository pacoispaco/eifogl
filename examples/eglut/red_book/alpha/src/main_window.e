indexing
	description: "Main window"
        application: "alpha"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/09/11 07:32:38 $"
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
			
			egl_enable (Gl_blend)
			egl_blend_func (Gl_src_alpha, Gl_one_minus_src_alpha)
			egl_shade_model (Gl_flat)
			egl_clear_color (0.0, 0.0, 0.0, 0.0)
		end
			
feature -- Access	

	default_window_title: STRING is
		once
			Result := "EGLUT: alpha"
		end
		
	default_width: INTEGER is 150
	
	default_height: INTEGER is 150

feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
			-- The window has been displayed
		do
			egl_clear (Gl_color_buffer_bit)
			
			if left_first then
				draw_left_triangle
				draw_right_triangle
			else
				draw_right_triangle
				draw_left_triangle
			end
			egl_flush
		end
	
	on_keyboard (char: CHARACTER; modifier, x, y: INTEGER) is
		do	
			inspect char			
			when 't', 'T' then
				left_first := not left_first
				glut_post_redisplay
			when '%/27/' then -- Escape character	
				quit (0)
			else
			end
		end
	
	on_reshape (width, height: INTEGER) is
		do
			egl_viewport (0, 0, width, height)
			egl_matrix_mode (Gl_projection)
			egl_load_identity
			if (width <= height) then 
				eglu_ortho_2d (0.0, 1.0, 0.0, 1.0 * height/width)
			else 
				eglu_ortho_2d (0.0, 1.0 * width/height, 0.0, 1.0)
			end
		end
	
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation	
	
	Left_first: BOOLEAN
	
	draw_left_triangle is
			-- Draw a yellow triangle on the left hand side of the screen.
		do
			egl_begin (Gl_triangles)
			egl_color_4f (1.0, 1.0, 0.0, 0.75)
			egl_vertex_3f (0.1, 0.9, 0.0) 
			egl_vertex_3f (0.1, 0.1, 0.0) 
			egl_vertex_3f (0.7, 0.5, 0.0) 
			egl_end
		end
	
	draw_right_triangle is
			-- Draw a cyan triangle on teh right hand side of the screen.
		do
			egl_begin (Gl_triangles)			   
			egl_color_4f (0.0, 1.0, 1.0, 0.75)
			egl_vertex_3f (0.9, 0.9, 0.0) 
			egl_vertex_3f (0.3, 0.5, 0.0) 
			egl_vertex_3f (0.9, 0.1, 0.0) 
			egl_end
		end
	
end -- class MAIN_WINDOW

