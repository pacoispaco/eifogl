indexing
	description: "Main window of the application"
        application: "multi_sphere"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/23 21:16:29 $"
	revision: "$Revision: 1.2 $"


class SUB_WINDOW

inherit
	EGLUT_SUB_WINDOW
		redefine
			make,
			on_display,
			on_reshape,
			on_mouse,
			on_keyboard
		end
	
creation
	make
	
feature -- Initialization
	
	make (parent_id, x, y, width, height: INTEGER) is
			-- Create the main window
		local
			mat_specular: ARRAY [REAL]
			light_position: ARRAY [REAL]
		do
			precursor (parent_id, x, y, width, height)
			subscribe_to_reshape_events
			subscribe_to_mouse_events
			subscribe_to_keyboard_events
			
			diffuse_material := <<0.5, 0.5, 0.5, 1.0>>
			mat_specular := <<1.0, 1.0, 1.0, 1.0>>
			light_position := <<1.0, 1.0, 1.0, 0.0>>
			
			egl_clear_color (0.0, 0.0, 0.0, 0.0)
			egl_shade_model (Gl_smooth)
			egl_enable (Gl_depth_test)
			egl_material_fv (Gl_front, Gl_diffuse, diffuse_material)
			egl_material_fv (Gl_front, Gl_specular, mat_specular)
			egl_material_f (Gl_front, Gl_shininess, 25.0)
			egl_light_fv (Gl_light0, Gl_position, light_position)
			egl_enable (Gl_lighting)
			egl_enable (Gl_light0)
			
			egl_color_material (Gl_front, Gl_diffuse)
			egl_enable (Gl_color_material)
		end	
	
feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
			-- The window has been displayed
		do
			egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
			glut_solid_sphere (1.0, 80, 64)
			egl_flush
		end
	
	on_reshape (width, height: INTEGER) is
			-- The window has been reshaped
		do
			egl_viewport (0, 0, width, height)
			egl_matrix_mode (Gl_projection)
			egl_load_identity
			if width <= height then
				egl_ortho (-1.5, 1.5, -1.5 * height / width, 
					   1.5 * height / width, -10.0, 10.0)
			else
				egl_ortho (-1.5 * width / height, 1.5 * width / height, 
					   -1.5, 1.5, -10.0, 10.0)
			end
			egl_matrix_mode (Gl_modelview)
			egl_load_identity
		end
	
	on_keyboard (char: CHARACTER; modifier, x, y: INTEGER) is
			-- A keboard event has been recieved
		do
			if char.code = 27 then
				print ("I want to exit!")
				quit (0)
			end
		end
	
	on_mouse (button, state, x, y: INTEGER) is
			-- A mouse event has been recieved
		do
			if button = Glut_left_button and then state = Glut_down then
				diffuse_material.put (diffuse_material @ 1 + 0.1, 1)
				if diffuse_material @ 1 > 1.0 then
					diffuse_material.put (0.0, 1)
				end
				egl_color_4fv (diffuse_material)
				glut_post_redisplay
			elseif button = Glut_middle_button and then state = Glut_down then
				diffuse_material.put (diffuse_material @ 2 + 0.1, 2)
				if diffuse_material @ 2 > 1.0 then
					diffuse_material.put (0.0, 2)
				end
				egl_color_4fv (diffuse_material)
				glut_post_redisplay				
			elseif button = Glut_right_button and then state = Glut_down then
				diffuse_material.put (diffuse_material @ 3 + 0.1, 3)
				if diffuse_material @ 3 > 1.0 then
					diffuse_material.put (0.0, 3)
				end
				egl_color_4fv (diffuse_material)
				glut_post_redisplay				
			end
		end
	
feature -- Implementation
	
	diffuse_material: ARRAY [REAL]
			-- Diffuse material

end -- class SUB_WINDOW

