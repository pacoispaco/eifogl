indexing
	description: "Eiffelized wrapping of the OpenGL GL library"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/01/27 18:46:59 $"
	revision: "$Revision: 1.3 $"

class EGL
	
inherit	
	EGL_CONSTANTS
	
feature	-- EGL contract predicates
	
	drawing_a_primitive: BOOLEAN
			-- Is a primitive currently being drawn
			-- (specified)? I.e. has a `egl_begin' been called and
			-- no corresponding `egl_end' been called yet?
	
	specifying_a_display_list: BOOLEAN
			-- Is a display list currently being specified?
			-- I.e. has a `egl_new_list' been called and no
			-- corresponding `egl_end_list' been called yet?
	
feature -- EGL attributes	
	
	current_list: INTEGER
			-- The current list being specified
	
feature -- OpenGL states	
	
	egl_edge_flag (flag: BOOLEAN) is
			-- Indicates weather a vertex should be considered as
			-- initializing a boundary edge of a polygon.
		do
			gl_api.gl_edge_flag (flag)
		end
	
	egl_point_size (size: REAL) is
			-- Set the size in pixels for rendered points.
		require
			valid_size: size > 0.0
		do
			gl_api.gl_point_size (size)
		end
		
	egl_line_width (width: REAL) is
			-- Set the width in pixels for rendered lines.
		require
			valid_width: width > 0.0
		do
			gl_api.gl_line_width (width)
		end
	
	egl_line_stipple (factor: INTEGER; pattern: BIT 16) is
			-- Set the current stippling pattern for lines. The
			-- `pattern' can be stretched out by using `factor',
			-- which multiplies each subseries of consecutive 1s and
			-- 0s. 
		require
			valid_factor: factor >= 1 and factor <= 256
		do
			gl_api.gl_line_stipple (factor, bit16_to_integer (pattern))
		end
	
	egl_polygon_mode (face, mode: INTEGER) is
			-- Set the drawing mode for the front and/or back faces
			-- of rendered polygons.
		require
			valid_face: face = Gl_front or
				    face = Gl_front_and_back or
				    face = Gl_back
			valid_mode: mode = Gl_point or
				    mode = Gl_line or
				    mode = Gl_fill
		do
			gl_api.gl_polygon_mode (face, mode)
		end
	
	egl_polygon_stipple (mask: EGL_POLYGON_STIPPLE_PATTERN) is
			-- Set the current stipple pattern for filled polygons
		require
			mask_not_void: mask /= Void
		local
			a: ANY
		do
			a := mask.glubyte_string.to_c
			gl_api.gl_polygon_stipple ($a)
		end
	
	egl_front_face (mode: INTEGER) is
			-- Set how the front of a polygon is determined. By
			-- default `mode' is set to Gl_ccw, which means that the
			-- front of a polygon is determined by the
			-- counterclockwise orientation of the ordered vertices
			-- defining the polygon. 
		require
			valid_mode: is_valid_orientation_mode (mode)
		do
			gl_api.gl_front_face (mode)
		end
	
	egl_cull_face (mode: INTEGER) is
			-- Set which polygons should be discarded (culled)
			-- before they´re coverted to screen coordinates. `mode'
			-- can be one of `Gl_front', `Gl_back' or
			-- `Gl_front_and_back'. 
		require
			valid_mode: is_valid_face (mode)
		do
			gl_api.gl_cull_face (mode)
		end
	
feature -- Drawing geometric objects	
	
	egl_flush is
			-- Forces execution of OpenGL functions in finite time.
		require
			valid_state: not drawing_a_primitive
		do
			gl_api.gl_flush
		end
	
	egl_finish is
			-- Forces execution of OpenGL functions in finite time
			-- and waits for notification from the graphics
			-- hardware or the network before returning.
		require
			valid_state: not drawing_a_primitive			
		do			
			gl_api.gl_finish
		end
	
	egl_vertex_2i (x, y: INTEGER) is
			-- Specifies the 2D coordinates of a vertex in integer
			-- values. 
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_2i (x, y)
		end
			
	egl_vertex_2s (x, y: INTEGER_16) is
			-- Specifies the 2D coordinates of a vertex in short
			-- integer (OpenGL type GLshort) values.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_2s (x, y)
		end
	
	egl_vertex_2f (x, y: REAL) is
			-- Specifies the 2D coordinates of a vertex in floating
			-- point (OpenGL type GLfloat) values.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_2f (x, y)
		end
			
	egl_vertex_2d (x, y: DOUBLE) is
			-- Specifies the 2D coordinates of a vertex in floating
			-- point (OpenGL type GLdouble) values.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_2d (x, y)
		end
			
	egl_vertex_3i (x, y, z: INTEGER) is
			-- Specifies the 3D coordinates of a vertex in integer 
			-- values. 
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_3i (x, y, z)
		end
			
	egl_vertex_3s (x, y, z: INTEGER_16) is
			-- Specifies the 3D coordinates of a vertex in short
			-- integer (OpenGL type GLshort) values.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_3s (x, y, z)
		end
	
	egl_vertex_3f (x, y, z: REAL) is
			-- Specifies the 3D coordinates of a vertex in floating
			-- point (OpenGL type GLfloat) values.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_3f (x, y, z)
		end
	
	egl_vertex_3d (x, y, z: DOUBLE) is
			-- Specifies the 3D coordinates of a vertex in floating
			-- point (OpenGL type GLdouble) values.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_3d (x, y, z)
		end
	
	egl_vertex_4i (x, y, z, w: INTEGER) is
			-- Specifies the homogeneous 3D coordinates of a vertex
			-- in integer values. 
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_4i (x, y, z, w)
		end
			
	egl_vertex_4s (x, y, z, w: INTEGER_16) is
			-- Specifies the homogeneous 3D coordinates of a vertex
			-- in short integer (OpenGL type GLshort) values.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_4s (x, y, z, w)
		end
	
	egl_vertex_4f (x, y, z, w: REAL) is
			-- Specifies the homogeneous 3D coordinates of a vertex
			-- in floating point (OpenGL type GLfloat) values.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_4f (x, y, z, w)
		end
	
	egl_vertex_4d (x, y, z, w: DOUBLE) is
			-- Specifies the homogeneous 3D coordinates of a vertex
			-- in floating point (OpenGL type GLdouble) values.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
		do
			gl_api.gl_vertex_4d (x, y, z, w)
		end
	
	egl_rect_f (x1, y1, x2, y2: REAL) is
			-- Draw a flat rectangle.
			-- `x1' and `y1' specifies the upper-left corner.
			-- `x2' and `y2' specifies the lower-right corner.
		require
			valid_state: not drawing_a_primitive			
		do			
			gl_api.gl_rect_f (x1, y1, x2, y2)
	 	end
	
	egl_normal_3f (nx, ny, nz: REAL) is
			-- Defines a surface normal for the next vertex specified.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive			
		do
			gl_api.gl_normal_3f (nx, ny, nz)
		end
		
	egl_normal_3d (nx, ny, nz: DOUBLE) is
			-- Defines a surface normal for the next vertex specified.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive			
		do
			gl_api.gl_normal_3d (nx, ny, nz)
		end
		
	egl_normal_3fv (fv: ARRAY [REAL]) is
			-- Defines a surface normal for the next set of
			-- vertices specified.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
			fv_not_void: fv /= Void
			fv_has_3_reals: fv.count = 3
		local
			s: SPECIAL [REAL]
		do
			s := fv.area
			gl_api.gl_normal_3fv ($s)
		end
	
	egl_begin (mode: INTEGER) is
			-- Mark the beginning of a vertex-data list that
			-- describes the geometric primitive `mode'.
		require
			valid_state: not drawing_a_primitive  
			valid_geometric_primitive: is_valid_geometric_primitive (mode)
		do		
			drawing_a_primitive := True
			gl_api.gl_begin (mode)
		ensure
			correct_state: drawing_a_primitive
		end
	
	egl_end is
			-- Mark the end of a vertex-data list.
		require
			valid_state: drawing_a_primitive			
		do		
			gl_api.gl_end
			drawing_a_primitive := False
		ensure
			correct_state: not drawing_a_primitive
		end
	
	egl_draw_elements_integer (mode: INTEGER; indices: ARRAY [INTEGER]) is
			-- Draw a sequence of geometric primitives, whose
			-- indices are stored in the array `indices'.
		require
			valid_mode: is_valid_geometric_primitive (mode)
			indices_not_void: indices /= Void
		local
			indices_c_array: EGL_GLUINT_C_ARRAY
		do
			!! indices_c_array.make_from_array (indices)
			gl_api.gl_draw_elements (mode, indices_c_array.count, indices_c_array.gl_type, indices_c_array.pointer)
		end
					  
feature -- Viewing
	
	egl_viewport (x, y, width, height: INTEGER) is
			-- Define a pixel rectangle in the window into which
			-- the final image is mapped. The `x', `y' parameters
			-- specify the lower left corner of the viewport and
			-- `width' and `height' are the size of the viewport
			-- rectangle. By default the initial viewport values are
			-- (0, 0, winWidth, winHeight), where `winWidth' and
			-- `winHeight' specify the size of teh window.
		require
			valid_state: not drawing_a_primitive
		do
			gl_api.gl_viewport (x, y, width, height)
		end
	
	egl_frustum (left, right, bottom, top, near, far: DOUBLE) is
			-- Create a matrix for a perspective-view frustum and
			-- multiplies the current matrix by it. The frustum's
			-- viewing volume is defined by the following
			-- parameters; `left', `bottom' and `near' define the
			-- coordinates of the lower left corner and `right',
			-- `top', `near' define the upper right corner of the
			-- near clipping plane. `near' and `far' are the
			-- distances from the viewpoint to the near and far
			-- clipping planes.
		require
			valid_near_value: near >= 0
			valid_far_value: far >= 0
		do
			gl_api.gl_frustum (left, right, bottom, top, near, far)
		end
	
	egl_load_identity is
			-- Set the current matrix to the 4x4 identity matrix.
		require
			valid_state: not drawing_a_primitive		
		do
			gl_api.gl_load_identity
		end
			
	egl_load_matrix_f (m: ARRAY [REAL]) is
			-- Set the current matrix to `m'.
		require
			valid_state: not drawing_a_primitive		
			m_not_void: m /= Void
			valid_m_size: m.count = 16
		local
			c_array: EGL_GLFLOAT_C_ARRAY
		do
			!! c_array.make_from_array (m)
			gl_api.gl_load_matrix_f (c_array.pointer)
		ensure
			--matrix_is_set: check that current matrix equals `m'
			-- Implementation: e.g. use egl_get_float_v (when
			-- it will be available) to obtain current matrix,
			-- and verify term-by-term that it coincides with m.
		end

	egl_load_matrix_d (m: ARRAY [DOUBLE]) is
			-- Set the current matrix to `m'.
		require
			valid_state: not drawing_a_primitive		
			m_not_void: m /= Void
			valid_m_size: m.count = 16
		local
			c_array: EGL_GLDOUBLE_C_ARRAY
		do
			!! c_array.make_from_array (m)
			gl_api.gl_load_matrix_d (c_array.pointer)
		ensure
			--matrix_is_set: check that current matrix equals `m'
			-- Implementation: e.g. use egl_get_double_v (when
			-- it will be available) to obtain current matrix,
			-- and verify term-by-term that it coincides with m.
		end

--Fc	egl_get_float_v (p: INTEGER) : ARRAY [REAL] is
--Fc			-- Return the value(s) of selected parameter p
--Fc		require
--Fc			--valid_p: is_valid_get_float_parameter (p)
--Fc			-- (to be implemented in egl_constants)
--Fc		local
--Fc			c_array: EGL_GLFLOAT_C_ARRAY
--Fc		do
--Fc			c_array := gl_api.gl_get_float_v (p)
--Fc                    -- transform c_array into an ARRAY [REAL] -> Result
--Fc			-- (but how ?)
--Fc
--Fc		ensure
--Fc			valid_result: Result /= Void and then Result.count >= 1
--Fc		end
--Fc        --Fc
--Fc
--Fc        --Fc
--Fc	egl_get_double_v (p: INTEGER) : ARRAY [DOUBLE] is
--Fc			-- Return the value(s) of selected parameter p
--Fc		require
--Fc			--valid_p: is_valid_get_double_parameter (p)
--Fc			-- (to be implemented in egl_constants)
--Fc		local
--Fc			c_array: EGL_GLDOUBLE_C_ARRAY
--Fc		do
--Fc			c_array := gl_api.gl_get_double_v (p)
--Fc                    -- transform c_array into an ARRAY [DOUBLE] -> Result
--Fc			-- (but how ?)
--Fc
--Fc		ensure
--Fc			valid_result: Result /= Void and then Result.count >= 1
--Fc		end
	--Fc        --Fc	
	
	egl_ortho (left, right, bottom, top, near, far: DOUBLE) is
			-- Create a matrix for an orthographic parallel viewing
			-- volume and multiplies the current matrix by
			-- it. (`left', `bottom' and `near') and (`right', `top'
			-- and `near') are points on the near clipping plane
			-- that are mapped to the lower left and upper right
			-- corners of the viewport window, respectively. `far'
			-- defines th distance to the far clipping plane.
		require
			valid_state: not drawing_a_primitive
			near_not_equal_to_far: near /= far
		do
			gl_api.gl_ortho (left, right, bottom, top, near, far)
		end
	
	egl_matrix_mode (mode: INTEGER) is
		require		
			valid_state: not drawing_a_primitive
			valid_matrix_mode: is_valid_matrix_mode (mode)
		do
			gl_api.gl_matrix_mode (mode)
		end
	
	egl_translate_f (x, y, z: REAL) is
			-- Multiply the current matrix by a translation matrix.
		require
			valid_state: not drawing_a_primitive		
		do
			gl_api.gl_translate_f (x, y, z)
		end
	
	egl_rotate_f (angle, x, y, z: REAL) is
			-- Rotate the current matrix by a Rotation matrix
		require		
			valid_state: not drawing_a_primitive
		do
			gl_api.gl_rotate_f (angle, x, y, z)
		end
	
	egl_scale_f (x, y, z: REAL) is
			-- Multiply the current matrix by a matrix that
			-- stretches, shrinks, or reflects an object along the
			-- axes. 
		do
			gl_api.gl_scale_f (x, y, z)
		end
	
	egl_push_matrix is
			-- Push the current matrix onto the matrix stack.
		require
			valid_state: not drawing_a_primitive
--			not_too_many_matrices_on_the_stack
		do
			gl_api.gl_push_matrix
		end
	
	egl_pop_matrix is
			-- Pop the current matrix from the matrix stack.
		require
			valid_state: not drawing_a_primitive
--			more_than_one_matrix_on_the_stack:
		do
			gl_api.gl_pop_matrix
		end
	
	egl_push_attrib (mask: INTEGER) is
			-- Save all the attributes indicated by `mask' by
			-- pushing them on the attribute stack.
		require
			valid_state: not drawing_a_primitive
			valid_attrib_mask: is_valid_attrib_mask (mask)
		do
			gl_api.gl_push_attrib (mask)
		end
	
	egl_pop_attrib is
			-- Restore all the attributes indicated by `mask' by
			-- popping them from the attribute stack.
		require
			valid_state: not drawing_a_primitive
--			more_than_one_attribute_on_the_stack:
		do
			gl_api.gl_pop_attrib
		end
	
feature -- Color	
	
	egl_clear_color (r, g, b, a: REAL) is
			-- Sets the color and alpha values to use for clearing
			-- the color buffers.
		require
			valid_state: drawing_a_primitive or not drawing_a_primitive
			valid_red_value: r >= 0.0 and r <= 1.0
			valid_green_value: g >= 0.0 and g <= 1.0
			valid_blue_value: b >= 0.0 and b <= 1.0
			valid_alpha_value: a >= 0.0 and a <= 1.0
		do
			gl_api.gl_clear_color (r, g, b, a)
		end
	
	egl_clear (buffer: INTEGER) is
			-- Clears the `buffer' to its current clearing
			-- color. 
		require
			valid_state: not drawing_a_primitive			
			valid_buffer: is_valid_clearing_buffer (buffer)
		do
			gl_api.gl_clear (buffer)
		end
	
	egl_color_3f (r, g, b: REAL) is
			-- Set drawing color.
		require		
			valid_red_value: r >= 0.0 and r <= 1.0
			valid_green_value: g >= 0.0 and g <= 1.0
			valid_blue_value: b >= 0.0 and b <= 1.0
		do			
			gl_api.gl_color_3f (r, g, b)
		end
	
	egl_color_4fv (fv: ARRAY [REAL]) is
			-- Set drawing color.
		require
			fv_not_void: fv /= Void
			fv_has_4_reals: fv.count = 4
			fv_lower_index_equals_1: fv.lower = 1
			fv_upper_index_equals_4: fv.upper = 4
			valid_red_value: fv @ 1 >= 0.0 and fv @ 1 <= 1.0
			valid_green_value: fv @ 2 >= 0.0 and fv @ 2 <= 1.0
			valid_blue_value: fv @ 3 >= 0.0 and fv @ 3 <= 1.0
			valid_alpha_value: fv @ 4 >= 0.0 and fv @ 4 <= 1.0
		local
			s: SPECIAL [REAL]
		do
			s := fv.area
			gl_api.gl_color_4fv ($s)
		end
	
	egl_shade_model (mode: INTEGER) is
			-- Selects flat or smooth shading. `mode' is a symbolic
			-- value representing a shading technique. The default
			-- value is `Gl_smooth'.
		require
			valid_state: not drawing_a_primitive
			valid_shading_mode: is_valid_shading_mode (mode)
		do
			gl_api.gl_shade_model (mode)
		end
	
feature -- Masking buffers
	
	egl_depth_mask (flag: INTEGER) is
			-- Enable or disable the depth buffer for writing.
		require
			valid_state: not drawing_a_primitive
			valid_flag: flag = Gl_true or flag = Gl_false
		do
			gl_api.gl_depth_mask (flag)
		end
	
feature -- State management	
	
	egl_enable (cap: INTEGER) is
			-- Enable OpenGL capabilities. `cap' is a symbolic
			-- constant indicating an OpenGL capability. See
			-- GL_CONSTANTS for possible values.
		require
			valid_state: not drawing_a_primitive
--			valid_capability: is_valid_capability (cap)
		do
			gl_api.gl_enable (cap)
		end
	
	egl_disable (cap: INTEGER) is
			-- Disable OpenGL capabilities. `cap' is a symbolic
			-- constant indicating an OpenGL capability. See
			-- GL_CONSTANTS for possible values.
		require
			valid_state: not drawing_a_primitive
--			valid_capability: is_valid_capability (cap)
		do
			gl_api.gl_disable (cap)
		end
	
	egl_enable_client_state (array: INTEGER) is
			-- Enable a client state vector for the given `array'. 
		require
			is_valid_client_state_array (array)
		do
			gl_api.gl_enable_client_state (array)
		end
	
	egl_disable_client_state (array: INTEGER) is
			-- Disable a client state vector for the given `array'. 
		require
			is_valid_client_state_array (array)
		do
			gl_api.gl_disable_client_state (array)
		end
	
	egl_vertex_pointer_double (size, stride: INTEGER; array: ARRAY [DOUBLE]) is
			-- Specify an `array' where vertex data can be
			-- accessed. `size' is the number of coordinates per
			-- vertex. `stride' is the byte offset between
			-- consectutive vertices.  
		require
			valid_size: size = 2 or size = 3 or size = 4
			valid_stride:  stride >= 0
			array_not_void: array /= Void
		local
			c_array: EGL_GLDOUBLE_C_ARRAY
		do
			!! c_array.make_from_array (array)
			gl_api.gl_vertex_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
	egl_vertex_pointer_integer (size, stride: INTEGER; array: ARRAY [INTEGER]) is
			-- Specify an `array' where vertex data can be
			-- accessed. `size' is the number of coordinates per
			-- vertex. `stride' is the byte offset between
			-- consectutive vertices.  
		require
			valid_size: size = 2 or size = 3 or size = 4
			valid_stride:  stride >= 0
			array_not_void: array /= Void
		local
			c_array: EGL_GLINT_C_ARRAY
		do
			!! c_array.make_from_array (array)
			gl_api.gl_vertex_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
	egl_color_pointer_integer (size, stride: INTEGER; array: ARRAY [INTEGER]) is
			-- Specify an `array' where color data can be
			-- accessed. `size ' is the number of color components
			-- per color. `stride' is the byte offset bewteen
			-- consecutive colors. 
		require
			valid_size: size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
			c_array: EGL_GLINT_C_ARRAY
		do
			!! c_array.make_from_array (array)
			gl_api.gl_color_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
	egl_color_pointer_double (size, stride: INTEGER; array: ARRAY [DOUBLE]) is
			-- Specify an `array' where color data can be
			-- accessed. `size ' is the number of color components
			-- per color. `stride' is the byte offset bewteen
			-- consecutive colors. 
		require
			valid_size: size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
			c_array: EGL_GLDOUBLE_C_ARRAY
		do
			!! c_array.make_from_array (array)
			gl_api.gl_color_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end

feature -- Lighting	
	
	egl_material_fv (face, property: INTEGER; params: ARRAY [REAL]) is
			-- Specify material parameters for the lighting model.
		require
 --			valid_state: drawing_a_primitive or not drawing_a_primitive
			valid_face: is_valid_face (face)
			valid_material_property: is_valid_material_property (property)
		local
			s: SPECIAL [REAL]
		do
			s := params.area
			gl_api.gl_material_fv (face, property, $s)
		end
			
	egl_material_f (face, property: INTEGER; param: REAL) is
			-- Specify material parameters for the lighting model.
		require
--			valid_state: drawing_a_primitive or not drawing_a_primitive
			valid_face: is_valid_face (face)
			valid_material_property: property = Gl_shininess
		do
			gl_api.gl_material_f (face, property, param)
		end
	
	egl_light_fv (light, property: INTEGER; params: ARRAY [REAL]) is
			-- Set the `property' of `light' to `params'.
		require
			valid_state: not drawing_a_primitive
			valid_light: is_valid_light (light)
			valid_property: is_valid_light_property (property)
		local
			s: SPECIAL [REAL]
		do
			s := params.area
			gl_api.gl_light_fv (light, property, $s)
		end
	
	egl_light_model_fv (property: INTEGER; params: ARRAY [REAL]) is
			-- Set a `property' of the lighting model to `params'.
		require
			valid_state: not drawing_a_primitive
			valid_property: is_valid_light_model_property (property)
		local
			s: SPECIAL [REAL]
		do
			s := params.area
			gl_api.gl_light_model_fv (property, $s)
		end
	
	egl_color_material (face, mode: INTEGER) is
		require			
			valid_state: not drawing_a_primitive			
			valid_face: is_valid_face (face)
			valid_color_mode: is_valid_material_color_mode (mode)
		do
			gl_api.gl_color_material (face, mode)
		end
	
feature -- Bitmap and pixel stuff	
	
	egl_pixel_store_i (pname, param: INTEGER) is
			-- Set the pixel storage mode.
		require
			valid_state: not drawing_a_primitive			
			valid_pixel_storage_parameter: is_valid_pixel_storage_parameter (pname)
--			valid_param_1: pname = Gl_unpack_swap_bytes or pname Gl_pack_swap_bytes implies
--				       param = 0 or param = 1
--			valid_param_2: etc ...
		do
			gl_api.gl_pixel_store_i (pname, param)
		end
	
	egl_raster_pos_2i (x, y: INTEGER) is
			-- Set the current raster position to `x', `y'.
		require
			valid_state: not drawing_a_primitive			
		do
			gl_api.gl_raster_pos_2i (x, y)
		ensure
			valid_raster_position: 
		end
	
	egl_bitmap (width, height: INTEGER; xbo, ybo, xbi, ybi: REAL; bitmap: EGL_BITMAP) is
			-- Draws the bitmap specified by `bitmap' The origin of
			-- the bitmap is placed at the current raster
			-- position. After the call the raster position is
			-- incremented by `xbi' and `ybi'. The `width' and
			-- `height' indicate the width and height, in pixels, of
			-- the bitmap. 
		require
			valid_state: not drawing_a_primitive	
			bitmap_not_void: bitmap /= Void
			valid_width_and_height: width * height <= bitmap.pixel_count
--			valid_raster_position: 
--			valid_raster_increment: 
		do
			gl_api.gl_bitmap (width, height, xbo, ybo, xbi, ybi, bitmap.pointer)
		ensure
--			valid_raster_position:
		end
	
feature -- Blending, antialiasing, fog and polygon offset	
	
	egl_blend_func (sfactor, dfactor: INTEGER) is
			-- Control how color values in the fragment being
			-- processed (the source) are combined with those
			-- already stored in the framebuffer (the
			-- destination). The argument `sfactor' indicates how to
			-- compute a source blending factor and `dfactor'
			-- indicates how to compute a destination blending factor.
		require
			valid_source_blending_factor: is_valid_source_blending_factor (sfactor)
			valid_destination_blending_factor: is_valid_destination_blending_factor (dfactor)
		do
			gl_api.gl_blend_func (sfactor, dfactor)
		end
	
feature -- Display lists
	
	egl_gen_lists (range: INTEGER): INTEGER is
			-- Allocates `range' number of contiguous, previously
			-- unallocated display list indices. The integer
			-- returned is the index that marks the beginning of a
			-- continuous block of empty display list indices. if
			-- the requested number of indices isn't available, or
			-- if range = 0, 0 is returned.
		require
			valid_range: range >= 0
		do
			Result := gl_api.gl_gen_lists (range)
		ensure
			result_not_negative: Result >= 0
			zero_range_returns_zero_allocation: range = 0 implies Result = 0
		end
		
	egl_new_list (list, mode: INTEGER) is
			-- Begins the creation or replacement of a display list.
		require
			valid_state: not specifying_a_display_list and 
				     not drawing_a_primitive
			valid_list: list > 0
--			list_is_not_defined: not egl_is_list (list)
--			valid_display_mode: is_valid_display_mode (mode)
		do
			specifying_a_display_list := True
			current_list := list
			gl_api.gl_new_list (list, mode)
		ensure
			correct_state: specifying_a_display_list
			current_list_equals_list: current_list = list
		end
	
	egl_end_list is
			-- Ends the creation or replacement of a display list.
		require
			valid_state: specifying_a_display_list and
				     not drawing_a_primitive
		do
			gl_api.gl_end_list
			specifying_a_display_list := False
		ensure
			correct_state: not specifying_a_display_list
			list_is_defined: egl_is_list (current_list)
		end
	
	egl_is_list (list: INTEGER): BOOLEAN is
			-- Is `list' already used for a display list?
		require
			valid_state: not drawing_a_primitive			
			valid_list: list > 0
		do
			Result := gl_api.gl_is_list (list)
		end
	
	egl_call_list (list: INTEGER) is
			-- Executes a display list.
		require
			valid_state: drawing_a_primitive or not drawing_a_primitive			
			valid_list: list > 0
			list_is_defined: egl_is_list (list)
		do
			gl_api.gl_call_list (list)
		end
	
	egl_call_lists (n: INTEGER; lists: ARRAY [INTEGER]) is
			-- Executes `n' display lists. The indices of the
			-- display lists to be executed are computed by adding
			-- the offset indicated by the current display list base
			-- to the integer values in the array pointed to
			-- by lists.
		require
			valid_state: drawing_a_primitive or not drawing_a_primitive			
			valid_n: n > 0
			lists_not_void: lists /= Void
-- 			lists_are_defined: 
		local
			c_array: EGL_GLINT_C_ARRAY
		do
			!! c_array.make_from_array (lists)
			gl_api.gl_call_lists (n, Gl_int, c_array.pointer)
		end
	
	egl_list_base (base: INTEGER) is
			-- Set the offset that's added to the display list
			-- indices in `egl_call_lists' to obtain final display
			-- list indices. The default value is 0.
		require
			valid_state: not drawing_a_primitive			
		do
			gl_api.gl_list_base (base)
		end
			
feature -- Error handling
	
	egl_get_error: INTEGER is
		require		
			valid_state: not drawing_a_primitive		
		do
			Result := gl_api.gl_get_error
		end

feature -- Implementation information
	
	egl_get_string (name: INTEGER): STRING is
			-- Get information about `name'. See XXX_CONSTANTS for valid
			-- vlaues of `name'.
		do
			!! Result.make (0)			
			Result.from_c (gl_api.gl_get_string (name))
		end

feature {NONE} -- Implementation 	
	
	gl_api: GL is
			-- The raw Eiffel encapsulation of the OpenGL API
		once
			!! Result
		end	
	
feature {NONE} -- Implementation (Uitilities)	
	
	bit16_to_integer (b: BIT 16): INTEGER is
		local
			i: INTEGER
		do
			from  
				i := 1
			until
				i > 16
			loop
				if b.item (i) then
					Result := Result + (2^(16-i)).truncated_to_integer
				end
				i := i + 1
			end
		end
	
end -- class EGL

--| begin documentation
-- 
--| end documentation

