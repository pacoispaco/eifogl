indexing
	description: "Main window of the 3D_model_displayer application"
        application: "3D_model_displayer"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/30 23:18:00 $"
	revision: "$Revision: 1.1 $"

class MAIN_WINDOW

inherit
	EGLUT_TOP_LEVEL_WINDOW
		export
			{NONE} all
		redefine
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
		local
			light_position: ARRAY [REAL]
			light_ambient: ARRAY [REAL]
			light_diffuse: ARRAY [REAL]
			light_specular: ARRAY [REAL]
			mat_specular: ARRAY [REAL]
			mat_shininess: ARRAY [REAL]
		do
			subscribe_to_visibility_events
			subscribe_to_display_events
			subscribe_to_reshape_events
			subscribe_to_keyboard_events

			glut_init_displaymode (Glut_single + Glut_rgb)
			
			egl_shade_model (Gl_smooth)
			egl_enable (Gl_depth_test)
			
			light_position := <<0.0, 10.0, 5.0, 1.0>> 
			light_ambient := <<0.5, 0.5, 0.5>>
			light_diffuse := <<0.9, 0.9, 0.9>>
			light_specular := <<1.0, 0.6, 0.6>>
			egl_light_fv (Gl_light0, Gl_position, light_position)
			egl_light_fv (Gl_light0, Gl_ambient, light_ambient)
			egl_light_fv (Gl_light0, Gl_diffuse, light_diffuse)
			egl_light_fv (Gl_light0, Gl_specular, light_specular)
			egl_enable (Gl_lighting)
			egl_enable (Gl_light0)
			
			mat_specular := <<0.8, 0.8, 0.8, 1.0>>
			mat_shininess := <<80.0>>
			egl_material_fv (Gl_front, Gl_specular, mat_specular)
			egl_material_fv (Gl_front, Gl_shininess, mat_shininess)
			
			egl_clear_color (0.0, 0.0, 0.0, 0.0)
			
			camera_x := 0.0
			camera_y := 0.0
			camera_z := 10.0			
			
			camera_d := 10.0
			camera_a := 0
		end
			
feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
			-- The window has been displayed
		local
			material: ARRAY [REAL]
			polygon_d: EGL_POLYGON [DOUBLE]
			line_d: EGL_LINES [DOUBLE]
		do			
			egl_load_identity
 			eglu_look_at (camera_x, camera_y, camera_z, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0)			
--			egl_rotate_f (camera_a, 0.0, 1.0, 0.0)
--			egl_translate_f (0.0, 0.0, camera_d)
--			egl_load_identity
			
			egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
						
			-- Draw ground
			material := <<0.5, 1.0, 0.5, 1.0>>
			egl_material_fv (Gl_front, Gl_ambient_and_diffuse, material)
			egl_polygon_mode (Gl_front, Gl_fill)
			egl_color_3f (0.5, 1.0, 0.5)
--			egl_normal_3d (0.0, 1.0, 0.0)			
			!! polygon_d.make_3d
			polygon_d.set_vertices (<<[10.0,0.0,10.0], [10.0,0.0,-10.0], [-10.0,0.0,-10.0], [-10.0,0.0,10.0]>>)
			polygon_d.draw
			
--			egl_translate_f (0.0, 1.0, 0.0)
--			egl_color_3f (0.8, 0.4, 0.4)
--			glut_wire_cube (2.0)
			
			draw_house
			egl_flush
		end
	
	on_keyboard (char: CHARACTER; modifier, x, y: INTEGER) is
		do
			inspect char
			when 'f' then
				camera_z := camera_z - 0.5
				glut_post_redisplay			
			when 'b' then
				camera_z := camera_z -0.5				
				glut_post_redisplay			
			when 'r' then
				camera_x := camera_x + 0.5
				glut_post_redisplay			
			when 'l' then
				camera_x := camera_x - 0.5
				glut_post_redisplay			
			when 'u' then
				camera_y := camera_y + 0.5
				glut_post_redisplay			
			when 'd' then
				camera_y := camera_y - 0.5
				glut_post_redisplay
			when 'R' then
				camera_a := camera_a + 5 \\ 360
			when 'L' then
				camera_a := camera_a - 5 \\ 360
			when 'F' then
				camera_d := camera_d - 0.5
			when 'B' then
				camera_d := camera_d + 0.5
			else
			end
		end
	
	on_reshape (width, height: INTEGER) is
		do
			egl_viewport (0, 0, width, height)
			egl_matrix_mode (Gl_projection)
			egl_load_identity
			eglu_perspective (80.0, width/height, 1.0, 50.0)
			egl_matrix_mode (Gl_modelview)
			egl_load_identity
 			eglu_look_at (camera_x, camera_y, camera_z, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0)			
		end
	
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation
	
	camera_x: REAL 
	
	camera_y: REAL 
	
	camera_z: REAL
	
	camera_d: REAL
	
	camera_a: INTEGER
	
	vertices: ARRAY [TUPLE [DOUBLE]] is
		once
			!! Result.make (1, 10)
			Result.put ([0.0, 0.0, 0.0], 1)
			Result.put ([2.0, 0.0, 0.0], 2)
			Result.put ([2.0, 2.0, 0.0], 3)
			Result.put ([1.0, 3.0, 0.0], 4)
			Result.put ([0.0, 2.0, 0.0], 5)
			Result.put ([0.0, 0.0, 3.0], 6)
			Result.put ([2.0, 0.0, 3.0], 7)
			Result.put ([2.0, 2.0, 3.0], 8)
			Result.put ([1.0, 3.0, 3.0], 9)
			Result.put ([0.0, 2.0, 3.0], 10)
		end
	
	normals: ARRAY [TUPLE_BASED_VECTOR] is
		local
			n: TUPLE_BASED_VECTOR
		once
			!! Result.make (1, 7)
			
			!! n.init_normalized_crossproduct (vertices @ 1, vertices @ 5, vertices @ 6)
			Result.put (n, 1)
			!! n.init_normalized_crossproduct (vertices @ 4, vertices @ 9, vertices @ 5)
			Result.put (n, 2)
			!! n.init_normalized_crossproduct (vertices @ 4, vertices @ 3, vertices @ 9)
			Result.put (n, 3)
			!! n.init_normalized_crossproduct (vertices @ 2, vertices @ 3, vertices @ 7)
			Result.put (n, 4)
			!! n.init_normalized_crossproduct (vertices @ 1, vertices @ 2, vertices @ 6)
			Result.put (n, 5)
			!! n.init_normalized_crossproduct (vertices @ 6, vertices @ 7, vertices @ 10)
			Result.put (n, 6)
			!! n.init_normalized_crossproduct (vertices @ 1, vertices @ 2, vertices @ 5)
			Result.put (n, 7)
		end
	
	draw_house is
		local
			material: ARRAY [REAL]
			polygon_d: EGL_POLYGON [DOUBLE]			
			mat_shininess: ARRAY [REAL]
		do 
			egl_color_3f (0.6, 0.6, 0.6)
			material := <<0.6, 0.6, 0.6, 1.0>>
			mat_shininess := <<80.0>>
			egl_material_fv (Gl_front, Gl_ambient_and_diffuse, material)
			
			-- Draw left roof
			egl_normal_3d ((normals @ 2).x, (normals @ 2).y, (normals @ 2).z)
			!! polygon_d.make_3d
			polygon_d.set_vertices (<<vertices @ 5, vertices @ 10, vertices @ 9, vertices @ 4>>)
			polygon_d.draw
			
			-- Draw right roof
			egl_normal_3d ((normals @ 3).x, (normals @ 3).y, (normals @ 3).z)
			!! polygon_d.make_3d
			polygon_d.set_vertices (<<vertices @ 3, vertices @ 4, vertices @ 9, vertices @ 8>>)
			polygon_d.draw
			
			egl_color_3f (0.5, 0.1, 0.1)
			material := <<0.5, 0.1, 0.1, 1.0>>
			mat_shininess := <<80.0>>
			egl_material_fv (Gl_front, Gl_ambient_and_diffuse, material)
			
			-- Draw left wall
			egl_normal_3d ((normals @ 1).x, (normals @ 1).y, (normals @ 1).z)
			!! polygon_d.make_3d
			polygon_d.set_vertices (<<vertices @ 1, vertices @ 6, vertices @ 10, vertices @ 5>>)
			polygon_d.draw
			
			-- Draw right wall
			egl_normal_3d ((normals @ 4).x, (normals @ 4).y, (normals @ 4).z)
			!! polygon_d.make_3d
			polygon_d.set_vertices (<<vertices @ 2, vertices @ 3, vertices @ 8, vertices @ 7>>)
			polygon_d.draw
			
			-- Draw bottom
			egl_normal_3d ((normals @ 5).x, (normals @ 5).y, (normals @ 5).z)
			!! polygon_d.make_3d
			polygon_d.set_vertices (<<vertices @ 1, vertices @ 2, vertices @ 7, vertices @ 6>>)
			polygon_d.draw
			
			-- Draw front wall
			egl_normal_3d ((normals @ 6).x, (normals @ 6).y, (normals @ 6).z)
			!! polygon_d.make_3d
			polygon_d.set_vertices (<<vertices @ 6, vertices @ 7, vertices @ 8, vertices @ 9, vertices @ 10>>)
			polygon_d.draw
			
			-- Draw back wall
			egl_normal_3d ((normals @ 7).x, (normals @ 7).y, (normals @ 7).z)
			!! polygon_d.make_3d
			polygon_d.set_vertices (<<vertices @ 1, vertices @ 5, vertices @ 4, vertices @ 3, vertices @ 2>>)
			polygon_d.draw			
		end
	
end -- class MAIN_WINDOW

