indexing
	description: "Main window"
        application: "teapots"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/30 23:40:14 $"
	revision: "$Revision: 1.1 $"

class MAIN_WINDOW

inherit
	EGLUT_TOP_LEVEL_WINDOW
		export
			{NONE} all
		redefine
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
		local
			ambient: ARRAY [REAL]
			diffuse: ARRAY [REAL]
			specular: ARRAY [REAL]
			position: ARRAY [REAL]
			lmodel_ambient: ARRAY [REAL]
			local_view: ARRAY [REAL]
		do
			subscribe_to_visibility_events
			subscribe_to_keyboard_events
			subscribe_to_reshape_events
			subscribe_to_display_events
			
			ambient := <<0.0, 0.0, 0.0, 1.0>>
			diffuse := <<1.0, 1.0, 1.0, 1.0>>
			specular := <<1.0, 1.0, 1.0, 1.0>>
			position := <<0.0, 3.0, 3.0, 0.0>>
			
			lmodel_ambient := <<0.2, 0.2, 0.2, 1.0>>
			local_view := <<0.0>>

			egl_light_fv (Gl_light0, Gl_ambient, ambient)
			egl_light_fv (Gl_light0, Gl_diffuse, diffuse)
			egl_light_fv (Gl_light0, Gl_position, position)
			egl_light_model_fv (Gl_light_model_ambient, lmodel_ambient)
			egl_light_model_fv (Gl_light_model_local_viewer, local_view)

			egl_front_face (Gl_cw)
			egl_enable (Gl_lighting)
			egl_enable (Gl_light0)
			egl_enable (Gl_auto_normal)
			egl_enable (Gl_normalize)
			egl_enable (Gl_depth_test) 
			
			-- Be efficient, make teapot display list
			teapot_list := egl_gen_lists (1)
			egl_new_list (teapot_list, Gl_compile)
			glut_solid_teapot (1.0)
			egl_end_list			
		end
	
feature -- Access	
	
	default_width: INTEGER is 500
	
	default_height: INTEGER is 600
	
feature {NONE} -- Implementation (GLUT callbacks)	
	
	on_display is
			-- First column:  emerald, jade, obsidian, pearl, ruby, turquoise
			-- 2nd column:  brass, bronze, chrome, copper, gold, silver
			-- 3rd column:  black, cyan, green, red, white, yellow plastic
			-- 4th column:  black, cyan, green, red, white, yellow rubber
		do
			egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
			render_teapot (2.0, 17.0, 0.0215, 0.1745, 0.0215,
				       0.07568, 0.61424, 0.07568, 0.633, 0.727811, 0.633, 0.6);
			render_teapot (2.0, 14.0, 0.135, 0.2225, 0.1575,
				       0.54, 0.89, 0.63, 0.316228, 0.316228, 0.316228, 0.1);
			render_teapot (2.0, 11.0, 0.05375, 0.05, 0.06625,
				       0.18275, 0.17, 0.22525, 0.332741, 0.328634, 0.346435, 0.3);
			render_teapot (2.0, 8.0, 0.25, 0.20725, 0.20725,
				       1, 0.829, 0.829, 0.296648, 0.296648, 0.296648, 0.088);
			render_teapot (2.0, 5.0, 0.1745, 0.01175, 0.01175,
				       0.61424, 0.04136, 0.04136, 0.727811, 0.626959, 0.626959, 0.6);
			render_teapot (2.0, 2.0, 0.1, 0.18725, 0.1745,
				       0.396, 0.74151, 0.69102, 0.297254, 0.30829, 0.306678, 0.1);
			render_teapot (6.0, 17.0, 0.329412, 0.223529, 0.027451,
				       0.780392, 0.568627, 0.113725, 0.992157, 0.941176, 0.807843,
				       0.21794872);
			render_teapot (6.0, 14.0, 0.2125, 0.1275, 0.054,
				       0.714, 0.4284, 0.18144, 0.393548, 0.271906, 0.166721, 0.2);
			render_teapot (6.0, 11.0, 0.25, 0.25, 0.25,
				       0.4, 0.4, 0.4, 0.774597, 0.774597, 0.774597, 0.6);
			render_teapot (6.0, 8.0, 0.19125, 0.0735, 0.0225,
				       0.7038, 0.27048, 0.0828, 0.256777, 0.137622, 0.086014, 0.1);
			render_teapot (6.0, 5.0, 0.24725, 0.1995, 0.0745,
				       0.75164, 0.60648, 0.22648, 0.628281, 0.555802, 0.366065, 0.4);
			render_teapot (6.0, 2.0, 0.19225, 0.19225, 0.19225,
				       0.50754, 0.50754, 0.50754, 0.508273, 0.508273, 0.508273, 0.4);
			render_teapot (10.0, 17.0, 0.0, 0.0, 0.0, 0.01, 0.01, 0.01,
				       0.50, 0.50, 0.50, .25);
			render_teapot (10.0, 14.0, 0.0, 0.1, 0.06, 0.0, 0.50980392, 0.50980392,
				       0.50196078, 0.50196078, 0.50196078, .25);
			render_teapot (10.0, 11.0, 0.0, 0.0, 0.0,
				       0.1, 0.35, 0.1, 0.45, 0.55, 0.45, .25);
			render_teapot (10.0, 8.0, 0.0, 0.0, 0.0, 0.5, 0.0, 0.0,
				       0.7, 0.6, 0.6, .25);
			render_teapot (10.0, 5.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55,
				       0.70, 0.70, 0.70, .25);
			render_teapot (10.0, 2.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.0,
				       0.60, 0.60, 0.50, .25);
			render_teapot (14.0, 17.0, 0.02, 0.02, 0.02, 0.01, 0.01, 0.01,
				       0.4, 0.4, 0.4, .078125);
			render_teapot (14.0, 14.0, 0.0, 0.05, 0.05, 0.4, 0.5, 0.5,
				       0.04, 0.7, 0.7, .078125);
			render_teapot (14.0, 11.0, 0.0, 0.05, 0.0, 0.4, 0.5, 0.4,
				       0.04, 0.7, 0.04, .078125);
			render_teapot (14.0, 8.0, 0.05, 0.0, 0.0, 0.5, 0.4, 0.4,
				       0.7, 0.04, 0.04, .078125);
			render_teapot (14.0, 5.0, 0.05, 0.05, 0.05, 0.5, 0.5, 0.5,
				       0.7, 0.7, 0.7, .078125);
			render_teapot (14.0, 2.0, 0.05, 0.05, 0.0, 0.5, 0.5, 0.4,
				       0.7, 0.7, 0.04, .078125);
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
			if (width <= height) then
				egl_ortho (0.0, 16.0, 0.0, 16.0 * height/width, -10.0, 10.0)
			else
				egl_ortho (0.0, 16.0 * width/height, 0.0, 16.0, -10.0, 10.0)
			end
			egl_matrix_mode (Gl_modelview)
		end
	
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation
	
	teapot_list: INTEGER
			-- Id of display list for drawing teapot
	
	render_teapot (x, y, ambr, ambg, ambb, difr, difg, difb, specr, specg, specb, shine: DOUBLE) is
			-- Move object into position. Use 3rd through 12th
			-- parameters to specify the material property. Draw a
			-- teapot. 
		local
			mat: ARRAY [REAL]
		do
			!! mat.make (1, 4)
			egl_push_matrix
			egl_translate_f (x, y, 0.0)
			mat.put (ambr, 1)
			mat.put (ambg, 2)
			mat.put (ambb, 3) 
			mat.put (1.0, 4)
			egl_material_fv (Gl_front, Gl_ambient, mat)
			mat.put (difr, 1)
			mat.put (difg, 2)
			mat.put (difb, 3)
			egl_material_fv (Gl_front, Gl_diffuse, mat)
			mat.put (specr, 1)
			mat.put (specg, 2)
			mat.put (specb, 3)
			egl_material_fv (Gl_front, Gl_specular, mat)
			egl_material_f (Gl_front, Gl_shininess, shine * 128.0)
			egl_call_list (teapot_list)
			egl_pop_matrix
		end
	
end -- class MAIN_WINDOW

