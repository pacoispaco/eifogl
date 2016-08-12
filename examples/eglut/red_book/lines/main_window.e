indexing
	description: "Main window"
        application: "lines"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/11/12 21:32:31 $"
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
	
creation
	make
	
feature {NONE} -- Initialization
	
	init is
			-- Initialize the window
		do
			subscribe_to_visibility_events
			subscribe_to_keyboard_events
			subscribe_to_reshape_events
			subscribe_to_display_events
			
			egl_clear_color (0.0, 0.0, 0.0, 0.0)
			egl_shade_model (Gl_flat)
		end
	
feature -- Access	

	default_window_title: STRING is
		once
			Result := "EGLUT: lines"
		end
		
	default_width: INTEGER is 390
	
	default_height: INTEGER is 150
	
feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
		local
			i: INTEGER
		do
			egl_clear (Gl_color_buffer_bit)

			-- Select white for all lines 
			egl_color_3f (1.0, 1.0, 1.0)

			-- In 1st row, 3 lines, each with a different stipple
			egl_enable (Gl_line_stipple)
			
			egl_line_stipple (1, 0000000100000001b)  -- dotted 0x0101
			draw_one_line (50.0, 125.0, 150.0, 125.0)
			egl_line_stipple (1, 0000000011111111b)  -- dashed 0x00FF
			draw_one_line (150.0, 125.0, 250.0, 125.0)
			egl_line_stipple (1, 0001110001000111b)  -- dash/dot/dash 0x1C47
			draw_one_line (250.0, 125.0, 350.0, 125.0)

			-- In 2nd row, 3 wide lines, each with different stipple 
			egl_line_width (5.0)
			egl_line_stipple (1, 0000000100000001b)  -- dotted 0x0101
			draw_one_line (50.0, 100.0, 150.0, 100.0)
			egl_line_stipple (1, 0000000011111111b)  -- dashed 0x00FF  
			draw_one_line (150.0, 100.0, 250.0, 100.0)
			egl_line_stipple (1, 0001110001000111b)  -- dash/dot/dash 0x1C47
			draw_one_line (250.0, 100.0, 350.0, 100.0)
			egl_line_width (1.0)

			-- In 3rd row, 6 lines, with dash/dot/dash stipple  
			-- as part of a single connected line strip         
			egl_line_stipple (1, 0001110001000111b)  -- dash/dot/dash 0x1C47
			egl_begin (Gl_line_strip)
			from
				i := 0
			until
				i = 7
			loop
				egl_vertex_2f (50.0 + (i * 50.0), 75.0);
				i := i + 1
			end
			egl_end

			-- In 4th row, 6 independent lines with same stipple  
			from
				i := 0
			until 
				i = 6
			loop
				draw_one_line (50.0 + i * 50.0, 50.0, 50.0 + (i+1) * 50.0, 50.0)
				i := i + 1
			end
			
			-- In 5th row, 1 line, with dash/dot/dash stipple    
			-- and a stipple repeat factor of 5                  
			egl_line_stipple (5, 0001110001000111b)  -- dash/dot/dash 0x1C47
			draw_one_line (50.0, 25.0, 350.0, 25.0)

			egl_disable (Gl_line_stipple)
			egl_flush
		end
	
	on_keyboard (char: CHARACTER; modifier, x, y: INTEGER) is
		do	
			inspect char			
			when '%/27/' then -- Escape character	
				quit (0)
			end
		end
	
	on_reshape (width, height: INTEGER) is
		do
			egl_viewport (0, 0, width, height)
			egl_matrix_mode (Gl_projection)
			egl_load_identity
			eglu_ortho_2D (0.0, width, 0.0, height)
		end
	
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation
	
	draw_one_line (x1, y1, x2, y2: REAL) is
			-- Draw a line from (x1, y1) to (x2, y2).
		do
			egl_begin (Gl_lines)
			egl_vertex_2f (x1, y1) 
			egl_vertex_2f (x2, y2)
			egl_end
		end
	
end -- class MAIN_WINDOW

