indexing
	description: "Main window"
        application: "aapoly"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/11/12 21:35:26 $"
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
			
			egl_cull_face (Gl_back)
			egl_enable (Gl_cull_face)
			egl_blend_func (Gl_src_alpha_saturate, Gl_one)
			egl_clear_color (0.0, 0.0, 0.0, 0.0)
			
			poly_smooth := True
		end
	
feature -- Access	
	
	default_window_title: STRING is
		once
			Result := "EGLUT: aapoly"
		end
	
	default_width: INTEGER is 150
	
	default_height: INTEGER is 150	

feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
		do
			if poly_smooth then
				egl_clear (Gl_color_buffer_bit)
				egl_enable (Gl_blend)
				egl_enable (Gl_polygon_smooth)
				egl_disable (Gl_depth_test)
			else	
				egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
				egl_disable (Gl_blend)
				egl_disable (Gl_polygon_smooth)
				egl_enable (Gl_depth_test)				
			end
			
			egl_push_matrix
			egl_translate_f (0.0, 0.0, -8.0)
			egl_rotate_f (30.0, 1.0, 0.0, 0.0)
			egl_rotate_f (60.0, 0.0, 1.0, 0.0)
			draw_cube (-0.5, 0.5, -0.5, 0.5, -0.5, 0.5)
			egl_pop_matrix
			
			egl_flush
		end
	
	on_keyboard (char: CHARACTER; modifier, x, y: INTEGER) is
		do	
			inspect char			
			when 't', 'T' then
				poly_smooth := not poly_smooth
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
			eglu_perspective (30.0, width/height, 1.0, 20.0)
			egl_matrix_mode (Gl_modelview)
			egl_load_identity
		end
	
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation
	
	poly_smooth: BOOLEAN
	
	vertices: ARRAY [DOUBLE]
	
	colors: ARRAY [DOUBLE] is
		local
			a: ARRAY [ARRAY [DOUBLE]]
		once
			!! a.make (1, 8)
			a.put (<<0.0, 0.0, 0.0, 1.0>>, 1) 
			a.put (<<1.0, 0.0, 0.0, 1.0>>, 2)
			a.put (<<0.0, 1.0, 0.0, 1.0>>, 3) 
			a.put (<<1.0, 1.0, 0.0, 1.0>>, 4)
			a.put (<<0.0, 0.0, 1.0, 1.0>>, 5) 
			a.put (<<1.0, 0.0, 1.0, 1.0>>, 6)
			a.put (<<0.0, 1.0, 1.0, 1.0>>, 7)  
			a.put (<<1.0, 1.0, 1.0, 1.0>>, 8)
			Result := flattened_array_of_double (a)
		end
	
	indices: ARRAY [INTEGER] is
			-- The indices of the front, top, left, bottom, right,
			-- back and faces
		local
			a: ARRAY [ARRAY [INTEGER]]
		once
			!! a.make (1, 6)
			a.put (<<4, 5, 6, 7>>, 1) 
			a.put (<<2, 3, 7, 6>>, 2) 
			a.put (<<0, 4, 7, 3>>, 3)
			a.put (<<0, 1, 5, 4>>, 4) 
			a.put (<<1, 5, 6, 2>>, 5) 
			a.put (<<0, 3, 2, 1>>, 6)		
			Result := flattened_array_of_integer (a)
		end
	
	draw_cube (x0, x1, y0, y1, z0, z1: DOUBLE) is
		local
			vs: ARRAY [ARRAY [DOUBLE]] 
			a: ARRAY [DOUBLE]			
		do
			!! vs.make (1, 8)
			
			-- Array 0
			!! a.make (1, 3)
			a.put (x0, 1)
			a.put (y0, 2)
			a.put (z0, 3)
			vs.put (a, 1)
			-- Array 1
			!! a.make (1, 3)
			a.put (x1, 1)
			a.put (y0, 2)
			a.put (z0, 3)
			vs.put (a, 2)
			-- Array 2
			!! a.make (1, 3)
			a.put (x1, 1)
			a.put (y1, 2)
			a.put (z0, 3)
			vs.put (a, 3)
			-- Array 3
			!! a.make (1, 3)
			a.put (x0, 1)
			a.put (y1, 2)
			a.put (z0, 3)
			vs.put (a, 4)
			-- Array 4
			!! a.make (1, 3)
			a.put (x0, 1)
			a.put (y0, 2)
			a.put (z1, 3)
			vs.put (a, 5)
			-- Array 5
			!! a.make (1, 3)
			a.put (x1, 1)
			a.put (y0, 2)
			a.put (z1, 3)
			vs.put (a, 6)
			-- Array 6
			!! a.make (1, 3)
			a.put (x1, 1)
			a.put (y1, 2)
			a.put (z1, 3)
			vs.put (a, 7)
			-- Array 7
			!! a.make (1, 3)
			a.put (x0, 1)
			a.put (y1, 2)
			a.put (z1, 3)
			vs.put (a, 8)
			
			vertices := flattened_array_of_double (vs)
			
			egl_enable_client_state (Gl_vertex_array)
			egl_enable_client_state (Gl_color_array)
			egl_vertex_pointer_double (3, 0, vertices)
			egl_color_pointer_double (4, 0, colors)
			egl_draw_elements_integer (Gl_quads, indices)
			egl_disable_client_state (Gl_vertex_array)
			egl_disable_client_state (Gl_color_array)
		end
	
end -- class MAIN_WINDOW

