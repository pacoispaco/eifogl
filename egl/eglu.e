indexing
	description: "Eiffelized wrapping of the OpenGL GLU library"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/02/10 21:22:31 $"
	revision: "$Revision: 1.3 $"

class EGLU
	
inherit	
	EGL_CONSTANTS
	GLU_CONSTANTS
	
feature -- Basic operations (Error handling)
	
	eglu_error_string (i: INTEGER): STRING is
			-- Retrieves a string that describes the error code `i'.
		do
			!! Result.make (0)
			Result.from_c (glu_api.glu_error_string(i))
		end
	
feature -- Basic operations (Setting up the viewing volume) 	
	
	eglu_ortho_2d (left, right, bottom, top: DOUBLE) is
			-- Create a matrix for projecting two-dimensional
			-- coordinates onto the screen and multiplies the
			-- current projection matrix by it. The clipping
			-- rectangle is a rectangle with the lower left corner
			-- at (`left', `bottom') and the upper right hand corner
			-- at (`right', `top').
		do
			glu_api.glu_ortho_2d (left, right, bottom, top)
		end
	
feature -- Basic operations (Textures)	
	
	eglu_build_2D_mipmaps (target, internal_format, width, height, format, type: INTEGER; data: POINTER) is
			-- Specify a two-dimensional mipmap.
		require
			valid_target: target = Gl_texture_2D
--			valid_internal_format:
			valid_width: width > 0
			valid_height: height > 0
--			valid_format: 
--			valid_type:
			valid_data: data /= default_pointer
		do
			glu_api.glu_build_2D_mipmaps (target, internal_format, width, height, format, type, data)
		end

feature -- Basic operations (Quadrics: rendering spheres, cylinders and disks)
	
	eglu_cylinder (qobj: EGLU_QUADRIC; base_radius, top_radius, height: DOUBLE; slices, stacks: INTEGER) is
			-- Draw a cylinder oriented along the z-axis, with the
			-- base of the cylinder at z = 0 and the top of the
			-- cylinder at z = `height'. The cylinder is subdivided
			-- around the z-axis into a number of `slices' and
			-- along the z-axis into a number of `stacks'. `base_radius' 
			-- the radius of the cylinder at z = `height'. If `top_radius' 
			-- set to 0, then a cone is generated.
		require
			qobj_not_void: qobj /= Void
			valid_base_radius: base_radius >= 0.0
			valid_top_radius: top_radius >= 0.0
			valid_height: height >= 0.0
			valid_slices: slices >= 0
			valid_stacks: stacks >= 0
		do
			glu_api.glu_cylinder (qobj.pointer, base_radius, top_radius, height, slices, stacks)
		end
		
	eglu_sphere (qobj: EGLU_QUADRIC; radius: DOUBLE; slices, stacks: INTEGER) is
			-- Draw a sphere of the given `radius', centered
			-- aroundthe origin (0, 0, 0). The sphere is
			-- subdivided round the x-axis into a number of slices
			-- (similar to longitude) and along the x-axis into a
			-- number of `stacks' (latitude).
		require
			qobj_not_void: qobj /= Void
			valid_radius: radius >= 0.0
			valid_slices: slices >= 0
			valid_stacks: stacks >= 0
		do
			glu_api.glu_sphere (qobj.pointer, radius, slices, stacks)
		end

feature -- Basic operations (Positioning)
      
	eglu_perspective (fov_y, aspect, z_near, z_far: DOUBLE) is
			-- Defines a viewing perspective Projection
			-- matrix. `fov_y' is the field of view in degrees, in
			-- the y direction, `aspect' is the aspect ratio
			-- (width/height), `z_near' and `z_far' denote the
			-- distance from the viewer to the near and far
			-- clipping plane.
		require
			valid_field_of_view: fov_y >= 0.0 and fov_y <= 180.0
			valid_z_near: z_near >= 0.0
			valid_z_far: z_far >= 0.0
		do
			glu_api.glu_perspective (fov_y, aspect, z_near, z_far)
		end
		
	eglu_look_at (eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz: DOUBLE) is
			-- Defines a viewing matrix and multplies it to the
			-- right of the current matrix. The desired viewpoint
			-- is specified by `eyex', `eyey' and `eyez'. The
			-- `centerx', `centery' and `centerz' arguments specify
			-- any point along the desired line of sight, but
			-- typically they specify some point in the center of
			-- the scene being looked at. The `upx', `upy' and
			-- `upz' arguments indicate which direction is up.
		do
			glu_api.glu_look_at (eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz)
		end
	
feature -- Basic operations (NURBS)
	
	eglu_new_nurbs_renderer: EGLU_NURBS_OBJ is
			-- Create a new NURBS object. Returns void if OpenGL
			-- cannot allocate memory for a new NURBS object.
		do
			!! Result.make_shared (glu_api.glu_new_nurbs_renderer)
		end
	
	eglu_nurbs_property (nurb: EGLU_NURBS_OBJ; property: INTEGER; value: DOUBLE) is
			-- Set the `value' of the give `property' in the given
			-- NURBS object `nurb'.
		require
			nurb_not_void: nurb /= Void
			valid_property: property = Glu_display_mode or
--					property = Glu_nurbs_mode or
					property = Glu_culling or
					property = Glu_sampling_method or
					property = Glu_sampling_tolerance or
					property = Glu_parametric_tolerance or
					property = Glu_u_step or
					property = Glu_v_step or
					property = Glu_auto_load_matrix
		do
			glu_api.glu_nurbs_property (nurb.pointer, property, value)
		end
	
	eglu_begin_surface (nurb: EGLU_NURBS_OBJ) is
			-- Start creating a NURBS surface.
		require
			nurb_not_void: nurb /= Void			
		do
			glu_api.glu_begin_surface (nurb.pointer)
		end
	
	eglu_end_surface (nurb: EGLU_NURBS_OBJ) is
			-- Stop creating a NURBS surface.
		require
			nurb_not_void: nurb /= Void			
		do
			glu_api.glu_end_surface (nurb.pointer)
		end
	
	eglu_nurbs_surface (nurb: EGLU_NURBS_OBJ; 
			    u_knot, v_knot: ARRAY [REAL]; 
			    u_knot_stride, v_knot_stride: INTEGER; 
			    ctl_array: ARRAY [REAL]; 
			    u_order, v_order: INTEGER; 
			    type: INTEGER) is
			-- Describe the vertices (or surface normals or texture
			-- coordinates) of the NURBS surface `nurb'.
		require
			nurb_not_void: nurb /= Void
			u_knot_not_void: u_knot /= Void
			v_knot_not_void: v_knot /= Void
			valid_u_knot_stride: u_knot_stride > 0		
			valid_v_knot_stride: v_knot_stride > 0
			ctl_array_not_void: ctl_array /= Void
			valid_u_order: u_order > 0
			valid_v_order: v_order > 0
			valid_type: type = Gl_map2_vertex_3 or
				    type = Gl_map2_vertex_4 or
				    type = Gl_map2_texture_coord_1 or
				    type = Gl_map2_texture_coord_2 or
				    type = Gl_map2_texture_coord_3 or
				    type = Gl_map2_texture_coord_4 or
				    type = Gl_map2_normal
		local
			u_knot_c_array, v_knot_c_array: EGL_GLFLOAT_C_ARRAY
			ctl_c_array: EGL_GLFLOAT_C_ARRAY
		do
			!! u_knot_c_array.make_from_array (u_knot)
			!! v_knot_c_array.make_from_array (v_knot)
			!! ctl_c_array.make_from_array (ctl_array)
			glu_api.glu_nurbs_surface (nurb.pointer, 
						   u_knot.count, u_knot_c_array.pointer, 
						   v_knot.count, v_knot_c_array.pointer,
						   u_knot_stride, v_knot_stride,
						   ctl_c_array.pointer, 
						   u_order, v_order,
						   type)
		end
	
feature {NONE} -- Implementation 	
	
	glu_api: expanded GLU 
			-- The raw Eiffel encapsulation of the OpenGL glu API

end -- class EGLU

-- begin dictionary
-- 
-- end dictionary
