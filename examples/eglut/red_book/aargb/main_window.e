indexing
	description: "Main window"
        application: "aargb"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/09/11 07:28:41 $"
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
	
	ARRAY_OPERATIONS
	
creation
	make
	
feature {NONE} -- Initialization
	
	init is
			-- Initialize the window
		local 
			values: ARRAY [REAL] --   GLfloat values[2];
		do
			subscribe_to_visibility_events
			subscribe_to_keyboard_events
			subscribe_to_reshape_events
			subscribe_to_display_events
			
			values := egl_get_float_v (Gl_line_width_granularity)
			print ("Gl_line_width_granularity = ")
			print (values @ 1)
			print ("%N")
			
			values := egl_get_float_v (Gl_line_width_range)
			print ("Gl_line_width_range = ")
			print (values @ 1)
			print (" ")
			print (values @ 2)
			print ("%N")
			
			egl_enable (Gl_line_smooth)
			egl_enable (Gl_blend)
			egl_blend_func (Gl_src_alpha, Gl_one_minus_src_alpha)
			egl_hint (Gl_line_smooth_hint, Gl_dont_care)
			egl_line_width (1.5)
			
			egl_clear_color(0.0, 0.0, 0.0, 0.0)
		end
	
feature -- Access	
	
	default_window_title: STRING is
		once
			Result := "EGLUT: aargb"
		end
	
	default_width: INTEGER is 150
	
	default_height: INTEGER is 150	

feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
		do
			egl_clear (Gl_color_buffer_bit)
			
			egl_color_3f (0.0, 1.0, 0.0)
			egl_push_matrix
			egl_rotate_f (-rot_angle, 0.0, 0.0, 0.1)
			egl_begin (Gl_lines)
			egl_vertex_2f (-0.5, 0.5)
			egl_vertex_2f (0.5, -0.5)
			egl_end
			egl_pop_matrix
			
			egl_color_3f (0.0, 0.0, 1.0)
			egl_push_matrix
			egl_rotate_f (rot_angle, 0.0, 0.0, 0.1)
			egl_begin (Gl_lines)
			egl_vertex_2f (0.5, 0.5)
			egl_vertex_2f (-0.5, -0.5)
			egl_end
			egl_pop_matrix

			egl_flush
		end
	
	on_keyboard (char: CHARACTER; modifier, x, y: INTEGER) is
		do	
			inspect char			
			when 'r', 'R' then
				rot_angle := rot_angle + 20.0
				if rot_angle >= 360 then 
					rot_angle := 0
				end
				glut_post_redisplay
			when '%/27/' then -- Escape character	
				quit (0)
			end
		end
	
	on_reshape (width, height: INTEGER) is
		do
			egl_viewport (0, 0, width, height)
			egl_matrix_mode (Gl_projection)
			egl_load_identity
			if (width <= height) then
				eglu_ortho_2D (-1.0, 1.0, -1.0*height/width, 1.0*height/width)
			else 
				eglu_ortho_2D (-1.0*width/height, 1.0*width/height, -1.0, 1.0)
			end
			egl_matrix_mode (Gl_modelview)
			egl_load_identity
		end
	
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation
	
	Rampsize: INTEGER is 16
	
	Ramp1start: INTEGER is 32
	
	Ramp2start: INTEGER is 48
	
	rot_angle: REAL
	
end -- class MAIN_WINDOW

