indexing
	description: "Main window"
        application: "aaindex"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2003/01/27 18:30:10 $"
	revision: "$Revision: 1.2 $"

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
	
	BASIC_MATH
	
creation
	make
	
feature {NONE} -- Initialization
	
	init is
			-- Initialize the window
		local 
			i: INTEGER
			shade: REAL
		do
			subscribe_to_visibility_events
			subscribe_to_keyboard_events
			subscribe_to_reshape_events
			subscribe_to_display_events
			
--			print ("GLUT for Win32 supports color index mode ONLY in a paletted display%N%
--			       %mode (i.e., 256 or 16 color mode). If you run this program on a Win32%N%
--			       %machine you must ensure that you are using at most 256 colors on your%N%
--			       %display.")
			rot_angle := 0.0
			
			from 
				i := 0
			until
				i = Rampsize
			loop
				shade := double_to_real (i / Rampsize)
				glut_set_color (Ramp1start + i, 0.0, shade, 0.0)
				glut_set_color (Ramp2start + i, 0.0, 0.0, shade)
				i := i + 1
			end
			
			egl_enable (Gl_line_smooth)
			egl_hint (Gl_line_smooth_hint, Gl_dont_care)
			egl_line_width (1.5)
			
			egl_clear_index (Ramp1start)
		end
	
feature -- Access	
	
	default_window_title: STRING is
		once
			Result := "EGLUT: aaindex"
		end
	
	default_width: INTEGER is 150
	
	default_height: INTEGER is 150	

feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
		do
			egl_clear (Gl_color_buffer_bit)
			
			egl_index_i (Ramp1start)
			egl_push_matrix
			egl_rotate_f (-rot_angle, 0.0, 0.0, 0.1)
			egl_begin (Gl_lines)
			egl_vertex_2f (-0.5, 0.5)
			egl_vertex_2f (0.5, -0.5)
			egl_end
			egl_pop_matrix
			
			egl_index_i (Ramp2start)
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

