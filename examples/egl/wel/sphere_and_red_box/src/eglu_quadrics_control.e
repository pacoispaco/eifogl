indexing
	description: "An OpenGL control with a glu quadrics object"
        application: "sphere_and_red_box"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/29 23:22:35 $"
	revision: "$Revision: 1.2 $"

class EGLU_QUADRICS_CONTROL

inherit
	
	GL_CONTROL
		redefine
			on_destroy,
			on_mouse_move,
			on_paint,
			on_size
		end
	
	GLU_CONSTANTS
		export
			{NONE} all
		end
	
	WEL_MK_CONSTANTS
		export
			{NONE} all
		end
	
creation
	make_with_coordinates
	
feature -- Initialization
	
	init is
		do
			-- Set up some OpenGL stuff
			egl_enable (Gl_lighting)
			egl_enable (Gl_light0)
			egl_enable (Gl_depth_test)
			egl_shade_model (Gl_smooth)
			
			mat_ambient := <<0.5, 0.5, 0.5, 1.0>>
			mat_specular := <<1.0, 1.0, 1.0, 1.0>>
			mat_shininess := <<50.0>>
			mat_emission := <<0.0, 0.0, 0.0, 0.0>>
			light_position := <<1.0, 1.0, 1.0, 0.0>>
			model_ambient := <<0.5, 0.5, 0.5, 1.0>>
			
			egl_light_model_fv (Gl_light_model_ambient, model_ambient)
			
			-- Create the quadrics object
			!! quadrics_object.eglu_new_quadric
			quadrics_object.eglu_quadric_draw_style (Glu_fill)
			quadrics_object.eglu_quadric_orientation (Glu_outside)
			quadrics_object.eglu_quadric_normals (Glu_smooth)
		end
	
feature -- Status setting
	
	turn_on_light is
			-- Turn on the light.
		do
			egl_enable (Gl_light0)
			display_quadrics_object
		end
	
	turn_off_light is
			-- Turn off the light.
		do
			egl_disable (Gl_light0)
			display_quadrics_object
		end
	
	set_material_ambient_reflectance (a: ARRAY [REAL]) is
			-- Set the material ambient reflectance of the quadrics
			-- object.
		require
			a_not_void: a /= Void
			a_has_4_reals: a.count = 4
			valid_lower_index: a.lower = 1
			valid_upper_index: a.upper = 4
			valid_red_component: a @ 1 >= 0.0 and a @ 1 <= 1.0
			valid_green_component: a @ 2 >= 0.0 and a @ 2 <= 1.0
			valid_blue_component: a @ 3 >= 0.0 and a @ 3 <= 1.0
			valid_alpha_component: a @ 4 >= 0.0 and a @ 4 <= 1.0
		do
			mat_ambient := a
			invalidate
		end
	
	set_material_specular_reflectance (a: ARRAY [REAL]) is
			-- Set the material specular reflectance of the quadrics
			-- object.
		require
			a_not_void: a /= Void
			a_has_4_reals: a.count = 4
			valid_lower_index: a.lower = 1
			valid_upper_index: a.upper = 4
			valid_red_component: a @ 1 >= 0.0 and a @ 1 <= 1.0
			valid_green_component: a @ 2 >= 0.0 and a @ 2 <= 1.0
			valid_blue_component: a @ 3 >= 0.0 and a @ 3 <= 1.0
			valid_alpha_component: a @ 4 >= 0.0 and a @ 4 <= 1.0
		do
			mat_specular := a
			invalidate
		end

	set_material_shininess (a: ARRAY [REAL]) is
			-- Set the material shininess of the quadrics object.
		require
			a_not_void: a /= Void
			a_has_1_real: a.count = 1
			valid_lower_index: a.lower = 1
			valid_upper_index: a.upper = 1
			valid_shininess: a @ 1 >= 0.0 and a @ 1 <= 128.0
		do
			mat_shininess := a
			invalidate
		end

	set_material_emittance (a: ARRAY [REAL]) is
			-- Set the material emittance of the quadrics object.
		require
			a_not_void: a /= Void
			a_has_4_reals: a.count = 4
			valid_lower_index: a.lower = 1
			valid_upper_index: a.upper = 4
			valid_red_component: a @ 1 >= 0.0 and a @ 1 <= 1.0
			valid_green_component: a @ 2 >= 0.0 and a @ 2 <= 1.0
			valid_blue_component: a @ 3 >= 0.0 and a @ 3 <= 1.0
			valid_alpha_component: a @ 4 >= 0.0 and a @ 4 <= 1.0
		do
			mat_emission := a
			invalidate
		end

feature {NONE} -- Implementation (Window messages)
	
	on_destroy is
			-- Delete the quadrics object.
		do
--        	quadrics_object.eglu_delete_quadric
		end
	
	on_mouse_move (keys, x_pos, y_pos: INTEGER) is
			-- Move the light source.
		local
			new_x, new_y: REAL
		do
			if keys = Mk_lbutton then
				-- light_position := <<1.0, 1.0, 1.0, 0.0>>
				new_x := (2*x_pos)/width - 1
				new_y := 1 - (2*y_pos)/height
				light_position.put (new_x, 1)
				light_position.put (new_y, 2)
				display_quadrics_object
			end
		end

	on_paint (paint_dc: WEL_PAINT_DC; invalid_rect: WEL_RECT) is
			-- Do some rendering.
		do
			display_quadrics_object
		end
	
	on_size (size_type, w, h: INTEGER) is
			-- Set the viewport and clipping volume.
		do
			set_viewport_and_clipping_volume (w, h)
		end
	
feature {NONE} -- Implementation (Internals)
		
	quadrics_object: EGLU_QUADRIC
			-- The quadrics object
	
	mat_ambient: ARRAY [REAL]
	mat_specular: ARRAY [REAL]
	mat_shininess: ARRAY [REAL]
	mat_emission: ARRAY [REAL]
	light_position: ARRAY [REAL]
	model_ambient: ARRAY [REAL]
	
feature {NONE} -- Implementation	
	
	set_viewport_and_clipping_volume (a_width, a_height: INTEGER) is
			-- Set viewport and clipping volume according to the
			-- size of the window.
		local
			w, h: INTEGER
			winw, winh: DOUBLE
		do
			rendering_context.make_current (gl_device_context)

			egl_matrix_mode (Gl_projection)
			egl_load_identity
			
			-- Prevent a divide by zero
			if a_height = 0 then
				h := 1
			else
				h := a_height
			end
			w := a_width
						
			-- Set the viewport to be the entire window
			egl_viewport (0, 0, w, h)
			
			if w <= h then
				egl_ortho (-2.5, 2.5, -2.5 * (h/w), 2.5 * (h/w), -10.0, 10.0)
			else
				egl_ortho (-2.5 * (w/h), 2.5 * (w/h), -2.5, 2.5, -10.0, 10.0)
			end
			
			-- Reset the matrix mode
			egl_matrix_mode (Gl_modelview)
			egl_load_identity
		end
	
	display_quadrics_object is
		local
			ret_val: INTEGER
		do
			rendering_context.make_current (gl_device_context)
			
			set_viewport_and_clipping_volume (width, height)
			
			egl_material_fv (Gl_front, Gl_ambient, mat_ambient)
			egl_material_fv (Gl_front, Gl_specular, mat_specular)
			egl_material_fv (Gl_front, Gl_shininess, mat_shininess)
			egl_material_fv (Gl_front, Gl_emission, mat_emission)
			egl_light_fv (Gl_light0, Gl_position, light_position)
			
			egl_clear_color (0.0, 0.0, 0.0, 0.0)
			egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
			egl_color_3f (0.0, 0.0, 1.0)
			
			eglu_sphere (quadrics_object, 1.5, 30, 30)
			
			egl_flush
			
			gl_device_context.swap_buffers
						
			validate_rect (client_rect)
		end
		
end -- class EGLU_QUADRICS_CONTROL

--| begin documentation
-- 
--| end documentation

