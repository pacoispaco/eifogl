indexing
	description: "Main window"
        application: "surface"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2003/04/27 06:40:02 $"
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
	        redefine
			on_nurbs_error
		end
	
creation
	make
	
feature {NONE} -- Initialization
	
	init is
			-- Initialize the window
		local
			mat_diffuse: ARRAY [REAL]
			mat_specular: ARRAY [REAL]
			mat_shininess: ARRAY [REAL]
		do
			subscribe_to_visibility_events
			subscribe_to_keyboard_events
			subscribe_to_reshape_events
			subscribe_to_display_events
			
			mat_diffuse := <<0.7, 0.7, 0.7, 1.0>>
			mat_specular := <<1.0, 1.0, 1.0, 1.0>>
			mat_shininess := <<100.0>>
			
			egl_clear_color (0.0, 0.0, 0.0, 0.0)
			egl_material_fv (Gl_front, Gl_diffuse, mat_diffuse)
			egl_material_fv (Gl_front, Gl_specular, mat_specular)
			egl_material_fv (Gl_front, Gl_shininess, mat_shininess)
			
			egl_enable (Gl_lighting)
			egl_enable (Gl_light0)
			egl_enable (Gl_depth_test)
			egl_enable (Gl_auto_normal)
			egl_enable (Gl_normalize)
			
			init_surface
			
			eglu_init_nurbs_api
			the_nurb := eglu_new_nurbs_renderer
			activate_nurbs_error_callback (the_nurb)
			eglu_nurbs_property (the_nurb, Glu_sampling_tolerance, 25.0)
			eglu_nurbs_property (the_nurb, Glu_display_mode, Glu_fill)
			
			show_points := False
		end
	
feature -- Access	
	
	default_window_title: STRING is
		once
			Result := "EGLUT: surface"
		end
	
	default_width: INTEGER is 150
	
	default_height: INTEGER is 150
	
feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
		local
			knots: ARRAY [REAL]
			i, j: INTEGER
		do
			egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
			
			egl_push_matrix
			egl_rotate_f (330.0, 1.0, 0.0, 0.0)
			egl_scale_f (0.5, 0.5, 0.5)
			
			knots := <<0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0>>
			
			eglu_begin_surface (the_nurb)
			eglu_nurbs_surface (the_nurb, knots, knots, 4*3, 3, ctl_points, 4, 4, Gl_map2_vertex_3)
			eglu_end_surface (the_nurb)
			
			if (show_points) then
				egl_point_size (5.0)
				egl_disable (Gl_lighting)
				egl_color_3f (1.0, 1.0, 0.0)
				egl_begin (Gl_points)
				from
					i := 0
				until
					i = 4
				loop
					from
						j := 0
					until
						j = 4
					loop
						egl_vertex_3f (ctl_points @ (i*12 + j*3 + 1), 
							       ctl_points @ (i*12 + j*3 + 2), 
							       ctl_points @ (i*12 + j*3 + 3))
						j := j + 1
					end
					i := i + 1
				end
				egl_end
				egl_enable (Gl_lighting)
			end
			egl_pop_matrix
			egl_flush
		end
	
	on_keyboard (char: CHARACTER; modifier, x, y: INTEGER) is
		do	
			inspect char			
			when 'C', 'c' then
				show_points := not show_points
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
			eglu_perspective (45.0, width/height, 3.0, 8.0)
			egl_matrix_mode (Gl_modelview)
			egl_load_identity
			egl_translate_f (0.0, 0.0, -5.0)
		end
	
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation (NURBS callbacks)	
	
	on_nurbs_error (error_code: INTEGER) is
			-- A NURBS error notification has been
			-- recieved. `error_code' indicates the type of error. 
		do
			print ("Nurbs error: ")
			print (eglu_error_string (error_code))
			print ("%N")
		end
	
feature {NONE} -- Implementation
	
	ctl_points: ARRAY [REAL] is
			-- [4]*[4]*[3]
		once
			!! Result.make (1, 4*4*3)
		end
	
	show_points: BOOLEAN
	
	the_nurb: EGLU_NURBS

	init_surface is
			-- Initializes the control points of the surface to a small hill.
			-- The control points range from -3 to +3 in x, y, and z
		local
			u, v: INTEGER
		do
			from
				u := 0
			until
				u = 4
			loop
				from
					v := 0
				until
					v = 4
				loop
					ctl_points.put (2.0 * (u - 1.5), u*12 + 3*v + 1)
					ctl_points.put (2.0 * (v - 1.5), u*12 + 3*v + 2)
					if (u = 1 or u = 2) and (v = 1 or v = 2) then
						ctl_points.put (3.0, u*12 + 3*v + 3)
					else
						ctl_points.put (-3.0, u*12 + 3*v + 3)
					end
					v := v + 1
				end
				u := u + 1
			end
		end
	
feature -- Dubug & test	
	
	print_ctl_points is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > 4*4*3
			loop
				print ("ctl_points @ ")
				print (i)
				print (" = ")
				print (ctl_points @ i)
				print ("%N")
				i := i + 1
			end
		end
	
end -- class MAIN_WINDOW

