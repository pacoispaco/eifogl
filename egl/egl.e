indexing
	description: "OpenGL version 1.2"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/02/07 12:58:52 $"
	revision: "$Revision: 1.5 $"

class EGL
	
inherit	
	EGL_CONSTANTS
	
feature	-- Primitives (Contract predicates)
	
	drawing_a_primitive: BOOLEAN
			-- Is a primitive currently being drawn
			-- (specified)? I.e. has a `egl_begin' been called and
			-- no corresponding `egl_end' been called yet?
	
feature -- Primitives (Specify vertices or rectangles)	
	
	egl_begin (mode: INTEGER) is
			-- Mark the beginning of a vertex-data list that
			-- describes the geometric primitive `mode'.
		require
			valid_state: not drawing_a_primitive  
			valid_mode: is_valid_geometric_primitive (mode)
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
	
	egl_vertex_2i (x, y: INTEGER) is
			-- Specify the x and y coordinates of a vertex. z is set
			-- to its default value 0 and w is set to its default
			-- value 1.
		require
			valid_state: drawing_a_primitive 
		do
			gl_api.gl_vertex_2i (x, y)
		end
			
	egl_vertex_2iv (v: ARRAY [INTEGER]) is
			-- Specify the x and y coordinates of a vertex. z is set
			-- to its default value 0 and w is set to its default
			-- value 1.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 2
		do
			-- TBD!
		end
	
	egl_vertex_2s (x, y: INTEGER_16) is
			-- Specify the x and y coordinates of a vertex. z is set
			-- to its default value 0 and w is set to its default
			-- value 1.
		require
			valid_state: drawing_a_primitive 
		do
			gl_api.gl_vertex_2s (x, y)
		end
	
	egl_vertex_2sv (v: ARRAY [INTEGER_16]) is
			-- Specify the x and y coordinates of a vertex. z is set
			-- to its default value 0 and w is set to its default
			-- value 1.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 2
		do
			-- TBD!
		end
	
	egl_vertex_2f (x, y: REAL) is
			-- Specify the x and y coordinates of a vertex. z is set
			-- to its default value 0 and w is set to its default
			-- value 1.
		require
			valid_state: drawing_a_primitive 
		do
			gl_api.gl_vertex_2f (x, y)
		end
	
	egl_vertex_2fv (v: ARRAY [REAL]) is
			-- Specify the x and y coordinates of a vertex. z is set
			-- to its default value 0 and w is set to its default
			-- value 1.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 2
		do
			-- TBD!
		end
	
	egl_vertex_2d (x, y: DOUBLE) is
			-- Specify the x and y coordinates of a vertex. z is set
			-- to its default value 0 and w is set to its default
			-- value 1.
		require
			valid_state: drawing_a_primitive 
		do
			gl_api.gl_vertex_2d (x, y)
		end
	
	egl_vertex_2dv (v: ARRAY [DOUBLE]) is
			-- Specify the x and y coordinates of a vertex. z is set
			-- to its default value 0 and w is set to its default
			-- value 1.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 2
		do
			-- TBD!
		end
	
	egl_vertex_3i (x, y, z: INTEGER) is
			-- Specify the x, y and z coordinates of a vertex. w is
			-- set to its default value 1.
		require
			valid_state: drawing_a_primitive
		do
			gl_api.gl_vertex_3i (x, y, z)
		end
			
	egl_vertex_3iv (v: ARRAY [INTEGER]) is
			-- Specify the x, y and z coordinates of a vertex. w is
			-- set to its default value 1.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 3
		do
			-- TBD!
		end
	
	egl_vertex_3s (x, y, z: INTEGER_16) is
			-- Specify the x, y and z coordinates of a vertex. w is
			-- set to its default value 1.
		require
			valid_state: drawing_a_primitive
		do
			gl_api.gl_vertex_3s (x, y, z)
		end
	
	egl_vertex_3sv (v: ARRAY [INTEGER_16]) is
			-- Specify the x, y and z coordinates of a vertex. w is
			-- set to its default value 1.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 3
		do
			-- TBD!
		end
	
	egl_vertex_3f (x, y, z: REAL) is
			-- Specify the x, y and z coordinates of a vertex. w is
			-- set to its default value 1.
		require
			valid_state: drawing_a_primitive
		do
			gl_api.gl_vertex_3f (x, y, z)
		end
	
	egl_vertex_3fv (v: ARRAY [REAL]) is
			-- Specify the x, y and z coordinates of a vertex. w is
			-- set to its default value 1.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 3
		do
			-- TBD!
		end
	
	egl_vertex_3d (x, y, z: DOUBLE) is
			-- Specify the x, y and z coordinates of a vertex. w is
			-- set to its default value 1.
		require
			valid_state: drawing_a_primitive
		do
			gl_api.gl_vertex_3d (x, y, z)
		end
	
	egl_vertex_3dv (v: ARRAY [REAL]) is
			-- Specify the x, y and z coordinates of a vertex. w is
			-- set to its default value 1.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 3
		do
			-- TBD!
		end
	
	egl_vertex_4i (x, y, z, w: INTEGER) is
			-- Specify the x, y, z and w coordinates of a vertex.
		require
			valid_state: drawing_a_primitive
		do
			gl_api.gl_vertex_4i (x, y, z, w)
		end
	
	egl_vertex_4iv (v: ARRAY [INTEGER]) is
			-- Specify the x, y, z and w coordinates of a vertex.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 4
		do	
			-- TBD!
		end
	
	egl_vertex_4s (x, y, z, w: INTEGER_16) is
			-- Specify the x, y, z and w coordinates of a vertex.
		require
			valid_state: drawing_a_primitive
		do
			gl_api.gl_vertex_4s (x, y, z, w)
		end
	
	egl_vertex_4sv (v: ARRAY [INTEGER_16]) is
			-- Specify the x, y, z and w coordinates of a vertex.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 4
		do
			-- TBD!
		end
	
	egl_vertex_4f (x, y, z, w: REAL) is
			-- Specify the x, y, z and w coordinates of a vertex.
		require
			valid_state: drawing_a_primitive
		do
			gl_api.gl_vertex_4f (x, y, z, w)
		end
	
	egl_vertex_4fv (v: ARRAY [REAL]) is
			-- Specify the x, y, z and w coordinates of a vertex.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 4
		do
			-- TBD!
		end
	
	egl_vertex_4d (x, y, z, w: DOUBLE) is
			-- Specify the x, y, z and w coordinates of a vertex.
		require
			valid_state: drawing_a_primitive
		do
			gl_api.gl_vertex_4d (x, y, z, w)
		end
	
	egl_vertex_4dv (v: ARRAY [DOUBLE]) is
			-- Specify the x, y, z and w coordinates of a vertex.
		require
			valid_state: drawing_a_primitive
			v_not_void: v /= Void
			two_coordinates: v.count = 4
		do
			-- TBD!
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
	
--	egl_rect_{sifd} TBD!
--	egl_rect_{sifd}v TBD!
	
feature -- Primitives (Specify polygon edge treatment)	
	
	egl_edge_flag (flag: BOOLEAN) is
			-- Specify the current edge flag value. If the current
			-- edge flag is `True' when a vertex is specified,
			-- the vertex is marked as the start of a boundary
			-- edge. Otherwise the vertex is marked as a nonboundary
			-- edge. 		
		require
			valid_state: drawing_a_primitive			
		do
			gl_api.gl_edge_flag (flag)
		end

	egl_edge_flagv (flag: ARRAY [BOOLEAN]) is
			-- Indicates weather a vertex should be considered as
			-- initializing a boundary edge of a polygon.
		require
			valid_state: drawing_a_primitive
			flag_not_void: flag /= Void
			one_value: flag.count = 1
		do
			-- TBD!
		end

feature -- Primitives (Specify polygon offset)	
	
--	egl_polygon_offset TBD!
	
feature -- Vertex Arrays (Specify vertex arrays)	
	
	egl_vertex_pointer_integer (size, stride: INTEGER; array: ARRAY [INTEGER]) is
			-- Specify an `array' of vertex data. `size' is the
			-- number of coordinates per vertex. `stride' is the
			-- byte offset between consectutive vertices.
		require
			valid_state: not drawing_a_primitive
			valid_size: size = 2 or size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
			c_array: EGL_GLINT_C_ARRAY
		do
			!! c_array.make_from_array (array)
			gl_api.gl_vertex_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
	egl_vertex_pointer_short (size, stride: INTEGER; array: ARRAY [INTEGER_16]) is
			-- Specify an `array' of vertex data. `size' is the
			-- number of coordinates per vertex. `stride' is the
			-- byte offset between consectutive vertices.
		require
			valid_state: not drawing_a_primitive
			valid_size: size = 2 or size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
--			c_array: EGL_GLSHORT_C_ARRAY
		do
--			!! c_array.make_from_array (array)
--			gl_api.gl_vertex_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
	egl_vertex_pointer_float (size, stride: INTEGER; array: ARRAY [REAL]) is
			-- Specify an `array' of vertex data. `size' is the
			-- number of coordinates per vertex. `stride' is the
			-- byte offset between consectutive vertices.
		require
			valid_state: not drawing_a_primitive
			valid_size: size = 2 or size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
--			c_array: EGL_GLREAL_C_ARRAY
		do
--			!! c_array.make_from_array (array)
--			gl_api.gl_vertex_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
	egl_vertex_pointer_double (size, stride: INTEGER; array: ARRAY [DOUBLE]) is
			-- Specify an `array' of vertex data. `size' is the
			-- number of coordinates per vertex. `stride' is the
			-- byte offset between consectutive vertices.
		require
			valid_state: not drawing_a_primitive
			valid_size: size = 2 or size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
			c_array: EGL_GLDOUBLE_C_ARRAY
		do
			!! c_array.make_from_array (array)
			gl_api.gl_vertex_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
--	egl_edge_flag_pointer TBD!
--	egl_index_pointer_integer TBD!
--	egl_index_pointer_short TBD!
--	egl_index_pointer_float TBD!
--	egl_index_pointer_double TBD!
	
	egl_color_pointer_integer (size, stride: INTEGER; array: ARRAY [INTEGER]) is
			-- Specify an `array' of color data. `size ' is the
			-- number of color components per color. `stride' is the
			-- byte offset bewteen consecutive colors. 
		require
			valid_state: not drawing_a_primitive
			valid_size: size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
			c_array: EGL_GLINT_C_ARRAY
		do
			!! c_array.make_from_array (array)
			gl_api.gl_color_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
	egl_color_pointer_short (size, stride: INTEGER; array: ARRAY [INTEGER_16]) is
			-- Specify an `array' of color data. `size ' is the
			-- number of color components per color. `stride' is the
			-- byte offset bewteen consecutive colors. 
		require
			valid_state: not drawing_a_primitive
			valid_size: size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
--			c_array: EGL_GLSHORT_C_ARRAY
		do
--			!! c_array.make_from_array (array)
--			gl_api.gl_color_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
	egl_color_pointer_float (size, stride: INTEGER; array: ARRAY [REAL]) is
			-- Specify an `array' of color data. `size ' is the
			-- number of color components per color. `stride' is the
			-- byte offset bewteen consecutive colors. 
		require
			valid_state: not drawing_a_primitive
			valid_size: size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
--			c_array: EGL_GLFLOAT_C_ARRAY
		do
--			!! c_array.make_from_array (array)
--			gl_api.gl_color_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
	egl_color_pointer_double (size, stride: INTEGER; array: ARRAY [DOUBLE]) is
			-- Specify an `array' of color data. `size ' is the
			-- number of color components per color. `stride' is the
			-- byte offset bewteen consecutive colors. 
		require
			valid_state: not drawing_a_primitive
			valid_size: size = 3 or size = 4
			valid_stride: stride >= 0
			array_not_void: array /= Void
		local
			c_array: EGL_GLDOUBLE_C_ARRAY
		do
			!! c_array.make_from_array (array)
			gl_api.gl_color_pointer (size, c_array.gl_type, stride, c_array.pointer)
		end
	
--	egl_normal_pointer_integer TBD!
--	egl_normal_pointer_short TBD!
--	egl_normal_pointer_float TBD!
--	egl_normal_pointer_double TBD!
--	egl_tex_coord_pointer_integer TBD!
--	egl_tex_coord_pointer_short TBD!
--	egl_tex_coord_pointer_float TBD!
--	egl_tex_coord_pointer_double TBD!	
	
feature -- Vertex Arrays (Control drawing of arrays and their components)	
	
--	egl_interleaved_arrays TBD!
--	egl_array_element TBD!
	
	egl_disable_client_state (array: INTEGER) is
			-- Disable a client state vector capability of type `array'. 
		require
			valid_state: not drawing_a_primitive
			is_valid_client_state_array (array)
		do
			gl_api.gl_disable_client_state (array)
		end
	
	egl_enable_client_state (array: INTEGER) is
			-- Enable a client state vector capability of type `array'. 
		require
			valid_state: not drawing_a_primitive
			is_valid_client_state_array (array)
		do
			gl_api.gl_enable_client_state (array)
		end
	
	egl_draw_elements_integer (mode: INTEGER; indices: ARRAY [INTEGER]) is
			-- Draw a sequence of geometric primitives, whose
			-- indices are stored in the array `indices'.
		require
			valid_state: not drawing_a_primitive
			valid_mode: is_valid_geometric_primitive (mode)
			indices_not_void: indices /= Void
		local
			indices_c_array: EGL_GLUINT_C_ARRAY
		do
			!! indices_c_array.make_from_array (indices)
			gl_api.gl_draw_elements (mode, indices_c_array.count, indices_c_array.gl_type, indices_c_array.pointer)
		end
	
--	egl_draw_elements_xxx TBD!
	
--	egl_draw_range_elements_xxx TBD!
--	egl_draw_arrays TBD!
	
feature -- Vertex Arrays (Save and restore vertex array values)	
	
--	egl_push_client_attrib TBD!
--	egl_pop_client_attrib TBD!
	
feature -- Vertex Arrays (Obtain the address of a specified vertex array)
	
--	egl_get_pointer_v TBD!
	
feature -- Coordinate transformation (Transform the current matrix)	
	
	egl_rotate_f (angle, x, y, z: REAL) is
			-- Multiply the current matrix by a rotation matrix
		require		
			valid_state: not drawing_a_primitive
		do
			gl_api.gl_rotate_f (angle, x, y, z)
		end
	
	egl_rotate_d (angle, x, y, z: DOUBLE) is
			-- Multiply the current matrix by a rotation matrix
		require		
			valid_state: not drawing_a_primitive
		do
			-- TBD!
		end
	
	egl_translate_f (x, y, z: REAL) is
			-- Multiply the current matrix by a translation matrix.
		require
			valid_state: not drawing_a_primitive		
		do
			gl_api.gl_translate_f (x, y, z)
		end
	
	egl_translate_d (x, y, z: DOUBLE) is
			-- Multiply the current matrix by a translation matrix.
		require
			valid_state: not drawing_a_primitive		
		do
			-- TBD!
		end
	
	egl_scale_f (x, y, z: REAL) is
			-- Multiply the current matrix by a matrix that
			-- stretches, shrinks, or reflects an object along the
			-- axes. 
		require
			valid_state: not drawing_a_primitive		
		do
			gl_api.gl_scale_f (x, y, z)
		end	
	
	egl_scale_d (x, y, z: DOUBLE) is
			-- Multiply the current matrix by a matrix that
			-- stretches, shrinks, or reflects an object along the
			-- axes. 
		require
			valid_state: not drawing_a_primitive		
		do
			-- TBD!
		end	
	
--	egl_mult_matrix{fd} TBD!
	
	egl_frustum (left, right, bottom, top, near, far: DOUBLE) is
			-- Multiply the current matrix by a perspective matrix.
			-- The frustum's viewing volume is defined by the
			-- following parameters; `left', `bottom' and `near'
			-- define the coordinates of the lower left corner and
			-- `right', `top', `near' define the upper right corner
			-- of the near clipping plane. `near' and `far' are the 
			-- distances from the viewpoint to the near and far
			-- clipping planes.
		require
			valid_state: not drawing_a_primitive
			valid_left_and_right_values: left /= right
			valid_top_and_bottom_values: top /= bottom
			valid_near_value: near >= 0
			valid_far_value: far >= 0
		do
			gl_api.gl_frustum (left, right, bottom, top, near, far)
		end
		
	egl_ortho (left, right, bottom, top, near, far: DOUBLE) is
			-- Multiply the current matix with an orthographic
			-- matrix (which produces a parallel
			-- projection). (`left', `bottom' and `near') and
			-- (`right', `top' and `near') are points on the near
			-- clipping plane that are mapped to the lower left and
			-- upper right corners of the viewport window,
			-- respectively. `far' defines the distance to the far  
			-- clipping plane. 
		require
			valid_state: not drawing_a_primitive
			valid_left_and_right_values: right /= left
			valid_top_and_bottom_values: top /= bottom
			valid_near_and_far_values: near /= far
		do
			gl_api.gl_ortho (left, right, bottom, top, near, far)
		end
	
feature -- Coordinate Transformation (Replace the current matrix)	
	
	egl_load_identity is
			-- Replace the current matrix with the 4x4 identity
			-- matrix. 
		require
			valid_state: not drawing_a_primitive		
		do
			gl_api.gl_load_identity
		end
			
	egl_load_matrix_f (m: ARRAY [REAL]) is
			-- Replace the current matrix with `m'.
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
			-- Replace the current matrix with `m'.
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
	
feature -- Coordinate Transformation (Manipulate the current matrix)	
	
	egl_matrix_mode (mode: INTEGER) is
			-- Specify which matrix is the current matrix where
			-- `mode' denotes the matrix.
		require		
			valid_state: not drawing_a_primitive
			valid_mode: is_valid_matrix_mode (mode)
		do
			gl_api.gl_matrix_mode (mode)
		ensure
--			current_matrix_set: gl_get (Gl_matrix_mode) = mode
		end
	
	egl_push_matrix is
			-- Push the current matrix onto the matrix stack.
		require
			valid_state: not drawing_a_primitive
--			stack_not_full: gl_get (Gl_matrix_mode) = Gl_modelview_matrix implies 
--					gl_get (Gl_modelview_stack_depth) < gl_get (Gl_max_modelview_stack_depth) and
--					gl_get (Gl_matrix_mode) = Gl_projection_matrix implies	
--				        gl_get (Gl_projection_stack_depth) < gl_get (Gl_max_projection_stack_depth) and
--					gl_get (Gl_matrix_mode) = Gl_texture_matrix implies	
--				        gl_get (Gl_texture_stack_depth) < gl_get (Gl_max_texture_stack_depth)
		do
			gl_api.gl_push_matrix
		ensure
			-- Stack count incremented for the appropriate stack
		end
	
	egl_pop_matrix is
			-- Pop the current matrix from the matrix stack.
		require
			valid_state: not drawing_a_primitive
			-- At least one matrix on the appropriate stack
		do
			gl_api.gl_pop_matrix
		ensure
			-- Stack count decremented for the appropriate stack
		end
	
feature -- Coordinate Transformation (Specify the viewport)
	
--	egl_depth_range TBD!
	
	egl_viewport (x, y, width, height: INTEGER) is
			-- Set the viewport. Defines a pixel rectangle in the
			-- window into which the final image is mapped. The `x',
			-- `y' parameters specify the lower left corner of the
			-- viewport and `width' and `height' are the size of the
			-- viewport rectangle. By default the initial viewport
			-- values are (0, 0, winWidth, winHeight), where
			-- `winWidth' and `winHeight' specify the size of the
			-- window. 
		require
			valid_state: not drawing_a_primitive
			valid_width: width >= 0
			valid_height: height >= 0
		do
			gl_api.gl_viewport (x, y, width, height)
		ensure
			-- Viewport is set
		end
	
feature -- Coloring and Lighting (Set the current color, color index, or normal vector)	
	
	-- LOTS OF egl_color_xxx functions TBD!
	
	egl_color_3f (r, g, b: REAL) is
			-- Set drawing color. Alpha is set to 1.0.
		require		
			valid_state: not drawing_a_primitive
			valid_red_value: r >= 0.0 and r <= 1.0
			valid_green_value: g >= 0.0 and g <= 1.0
			valid_blue_value: b >= 0.0 and b <= 1.0
		do			
			gl_api.gl_color_3f (r, g, b)
		ensure
			-- Color is set
		end
	
	egl_color_4fv (fv: ARRAY [REAL]) is
			-- Set drawing color.
		require
			valid_state: not drawing_a_primitive
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
		ensure
			-- Color is set
		end
	
--	egl_index_xxx TBD!	
	
--	egl_normal_xxx TBD!	
	
	egl_normal_3f (nx, ny, nz: REAL) is
			-- Specify the `x', `y' and `z' coordinates of the new
			-- current normal.
		require
			valid_state: True
		do
			gl_api.gl_normal_3f (nx, ny, nz)
		end
		
	egl_normal_3d (nx, ny, nz: DOUBLE) is
			-- Specify the `x', `y' and `z' coordinates of the new
			-- current normal.
		require
			valid_state: True
		do
			gl_api.gl_normal_3d (nx, ny, nz)
		end
		
	egl_normal_3fv (fv: ARRAY [REAL]) is
			-- Specify the `x', `y' and `z' coordinates of the new
			-- current normal.
		require
			valid_state: True
			fv_not_void: fv /= Void
			fv_has_3_reals: fv.count = 3
		local
			s: SPECIAL [REAL]
		do
			s := fv.area
			gl_api.gl_normal_3fv ($s)
		end
	
feature -- Coloring and Lighting (specify light source, material, or lighting model parameter values)	
	
--	egl_light_xxx TBD!	
	
	egl_light_fv (light, pname: INTEGER; params: ARRAY [REAL]) is
			-- Set the parameter `pname' of `light' to `params'.
		require
			valid_state: not drawing_a_primitive
			valid_light: is_valid_light (light)
			valid_property: is_valid_light_property (pname)
			params_not_void: params /= Void
			-- valid_spot_exponent_value: 0 <= value <= 180
			-- valid_spot_cutoff_value: 0 <= value <= 90 or value = 180
			-- valid_attenuation_value: value >= 0
		local
			s: SPECIAL [REAL]
		do
			s := params.area
			gl_api.gl_light_fv (light, pname, $s)
		ensure
			-- Light parameter is set
		end
	
--	egl_material_xxx TBD!	
	
	egl_material_fv (face, pname: INTEGER; params: ARRAY [REAL]) is
			-- Specify material parameters for the lighting model.
		require
			valid_state: True
			valid_face: is_valid_face (face)
			valid_material_property: is_valid_material_property (pname)
			params_not_void: params /= Void
			-- valid_shininess_value: 0 <= value <= 128 			 
		local
			s: SPECIAL [REAL]
		do
			s := params.area
			gl_api.gl_material_fv (face, pname, $s)
		ensure
			-- Material parameter is set
		end
			
	egl_material_f (face, pname: INTEGER; param: REAL) is
			-- Specify material parameters for the lighting model.
		require
			valid_state: True
			valid_face: is_valid_face (face)
			valid_material_property: pname = Gl_shininess
			-- valid_shininess_value: 0 <= value <= 128 			 
		do
			gl_api.gl_material_f (face, pname, param)
		ensure
			-- Material parameter is set
		end
	
--	egl_light_model_xx TBD!	
	
	egl_light_model_fv (pname: INTEGER; params: ARRAY [REAL]) is
			-- Set the parameter `pname' of the lighting model to `params'.
		require
			valid_state: not drawing_a_primitive
			valid_property: is_valid_light_model_property (pname)
			params_not_void: params /= Void
--			valid_value: pname = Gl_light_model_color_control implies 
--				     params @ 1 = Gl_single_color or params @ 1 = Gl_separate_specular_color
		local
			s: SPECIAL [REAL]
		do
			s := params.area
			gl_api.gl_light_model_fv (pname, $s)
		ensure
			-- Light model parameter is set
		end
	
feature -- Coloring and Lighting (Choose a shading model)	
	
	egl_shade_model (mode: INTEGER) is
			-- Selects flat or smooth shading. `mode' is a symbolic
			-- value representing a shading technique. The default
			-- value is `Gl_smooth'.
		require
			valid_state: not drawing_a_primitive
			valid_mode: is_valid_shading_mode (mode)
		do
			gl_api.gl_shade_model (mode)
		ensure
			-- Shading is set
		end
	
feature -- Coloring and Lighting (Specify which polygon orientation is front-facing)
	
	egl_front_face (mode: INTEGER) is
			-- Set how the front of a polygon is determined. By
			-- default `mode' is set to Gl_ccw, which means that the
			-- front of a polygon is determined by the
			-- counterclockwise orientation of the ordered vertices
			-- defining the polygon. 
		require
			valid_state: not drawing_a_primitive
			valid_mode: is_valid_orientation_mode (mode)
		do
			gl_api.gl_front_face (mode)
		end
	
feature -- Coloring and Lighting (Specify a material color to track the current color)
	
	egl_color_material (face, mode: INTEGER) is
			-- Specify which material parameters track the current color.
		require			
			valid_state: not drawing_a_primitive			
			-- is_enabled: gl_is_enabled (Gl_color_material)
			valid_face: is_valid_face (face)
			valid_mode: is_valid_material_color_mode (mode)
		do
			gl_api.gl_color_material (face, mode)
		ensure
			-- Material parameters track the current color
		end
		
feature -- Coloring and Lighting (Obtain light source or material parameter values)
	
--	egl_get_light_xxx TBD!	
--	egl_get_material_xxx TBD!
	
feature -- Clipping (Specify a clipping plane)	
	
--	egl_clip_plane TBD!	
	
feature -- Clipping (Return clipping plane coefficients)	
	
--	egl_get_clip_plane TBD!
	
feature -- Rasterization (Set the current raster position)	
	
--      egl_raster_pos_xxx TBD!	
	
	egl_raster_pos_2i (x, y: INTEGER) is
			-- Set the current raster position to `x', `y'.
		require
			valid_state: not drawing_a_primitive			
		do
			gl_api.gl_raster_pos_2i (x, y)
		ensure
			-- valid_raster_position: 
		end	
	
feature -- Rasterization (Specify a bitmap)	
	
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
			valid_width: width >= 0
			valid_height: height >= 0
			width_and_height_consistent_with_bitmap: width * height <= bitmap.pixel_count
--			valid_raster_position: 
--			valid_raster_increment: 
		do
			gl_api.gl_bitmap (width, height, xbo, ybo, xbi, ybi, bitmap.pointer)
		ensure
--			valid_raster_position:
		end
	
feature -- Rasterization (Specify the dimensions of points or lines)
	
	egl_point_size (size: REAL) is
			-- Set the size in pixels for rendered points.
		require
			valid_state: not drawing_a_primitive
			valid_size: size > 0.0
		do
			gl_api.gl_point_size (size)
		ensure
			-- Point size is set
		end
		
	egl_line_width (width: REAL) is
			-- Set the width in pixels for rendered lines.
		require
			valid_state: not drawing_a_primitive
			valid_width: width > 0.0
		do
			gl_api.gl_line_width (width)
		ensure
			-- Line width is set
		end
	
feature -- Rasterization (Specify or return a stipple pattern for lines or polygons)
	
	egl_line_stipple (factor: INTEGER; pattern: BIT 16) is
			-- Set the current stippling pattern for lines. The
			-- `pattern' can be stretched out by using `factor',
			-- which multiplies each subseries of consecutive 1s and
			-- 0s. 
		require
			valid_state: not drawing_a_primitive
			valid_factor: factor >= 1 and factor <= 256
		do
			gl_api.gl_line_stipple (factor, bit16_to_integer (pattern))
		ensure
			-- Line stipple pattern is set
		end
	
	egl_polygon_stipple (mask: EGL_POLYGON_STIPPLE_PATTERN) is
			-- Set the current stipple pattern for filled polygons
		require
			valid_state: not drawing_a_primitive			
			mask_not_void: mask /= Void
		local
			a: ANY
		do
			a := mask.glubyte_string.to_c
			gl_api.gl_polygon_stipple ($a)
		ensure
			-- Polygon stipple pattern is set
		end
	
--	egl_get_polygon_stipple TBD!
	
feature -- Rasterization (Choose how polygons are rasterized)
	
	egl_cull_face (mode: INTEGER) is
			-- Set which polygons should be discarded (culled)
			-- before they´re coverted to screen coordinates. `mode'
			-- can be one of `Gl_front', `Gl_back' or
			-- `Gl_front_and_back'. 
		require
			valid_state: not drawing_a_primitive
			valid_mode: is_valid_face (mode)
		do
			gl_api.gl_cull_face (mode)
		ensure
			-- Cull face is set
		end
	
	egl_polygon_mode (face, mode: INTEGER) is
			-- Set the drawing mode for the front and/or back faces
			-- of rendered polygons.
		require
			valid_state: not drawing_a_primitive
			valid_face: face = Gl_front or
				    face = Gl_front_and_back or
				    face = Gl_back
			valid_mode: mode = Gl_point or
				    mode = Gl_line or
				    mode = Gl_fill
		do
			gl_api.gl_polygon_mode (face, mode)
		end
	
feature -- Pixel Operations (Select the source for pixel read or copy operations)	
	
--	egl_read_buffer TBD!	
	
feature -- Pixel Operations (Read, write, and copy pixels)
	
--	egl_read_pixels TBD!	
--	egl_draw_pixels TBD!
--	egl_copy_pixels TBD!
	
feature -- Pixel Operations (Specify or query how pixels are encoded or processed)
	
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
	
--	egl_pixel_store_f TBD!
	
--	egl_pixel_transfer{if} TBD!
--	egl_pixel_map_xxx TBD!
--	egl_get_pixel_map_xxx TBD!
	
feature -- Pixel Operations (Control pixel rasterization)
	
--	egl_pixel_zoom TBD!
	
feature -- Textures (Control how a texture is applied to a fragment)	
	
--	egl_tex_parameter_xxx TBD!
--	egl_tex_env_xxx TBD!
	
feature -- Textures (Set the current texture coordinates)
	
--	egl_tex_coord1_xxx TBD!
--	egl_tex_coord2_xxx TBD!
--	egl_tex_coord3_xxx TBD!
--	egl_tex_coord4_xxx TBD!
	
feature -- Textures (Control the generation of texture coordinates)
	
--	egl_tex_gen_xxx TBD!
	
feature -- Textures (Specify a one-, two- or threedimensional texture image or subimage)
	
--	egl_tex_image1D TBD!
--	egl_tex_image2D TBD!
--	egl_tex_image3D TBD!
--	egl_tex_sub_image1D TBD!
--	egl_tex_sub_image2D TBD!
--	egl_tex_sub_image3D TBD!
	
feature -- Textures (Test whether a name corresponds to a texture and obtain texture-related parameter values)
	
--	egl_is_texture TBD!
--	egl_get_tex_env_xxx TBD!
--	egl_get_tex_gen_xxx TBD!
--	egl_get_tex_image TBD!
--	egl_get_tex_level_parameter_xxx TBD!
--	egl_get_tex_parameter_xxx TBD!
		
feature -- Textures (Copy a texture or part of it)
	
--	egl_copy_tex_image1D TBD!
--	egl_copy_tex_image2D TBD!
--	egl_copy_tex_sub_image1D TBD!
--	egl_copy_tex_sub_image2D TBD!
--	egl_copy_tex_sub_image3D TBD!
	
feature -- Textures (Create a named texture and prioritize texture memory residence)
	
--	egl_bind_texture TBD!
--	egl_delete_textures TBD!
--	egl_are_textures_resident TBD!
--	egl_gen_textures TBD!
--	egl_prioritize_textures TBD!
	
feature -- Fog (Set fog parameters)	
	
--	egl_fog_xxx TBD!
	
feature -- Frame Buffer Operations (Control per-fragment testing)
	
--	egl_scissor TBD!
--	egl_alpha_func TBD!
--	egl_stencil_func TBD!
--	egl_stncil_op TBD!
--	egl_dpeth_func TBD!
	
feature -- Frame Buffer Operations (Combine fragment and frame buffer values)
	
	egl_blend_func (sfactor, dfactor: INTEGER) is
			-- Control how color values in the fragment being
			-- processed (the source) are combined with those
			-- already stored in the framebuffer (the
			-- destination). The argument `sfactor' indicates how to
			-- compute a source blending factor and `dfactor'
			-- indicates how to compute a destination blending factor.
		require
			valid_state: not drawing_a_primitive
			valid_source_blending_factor: is_valid_source_blending_factor (sfactor)
			valid_destination_blending_factor: is_valid_destination_blending_factor (dfactor)
		do
			gl_api.gl_blend_func (sfactor, dfactor)
		end
	
--	egl_logic_op TBD!
	
feature -- Frame Buffer Operations (Clear some or all buffers)
	
	egl_clear (buffer: INTEGER) is
			-- Clears the `buffer' to its current clearing
			-- color. 
		require
			valid_state: not drawing_a_primitive			
			valid_buffer: is_valid_clearing_buffer (buffer)
		do
			gl_api.gl_clear (buffer)
		end
	
feature -- Frame Buffer Operations (Specify color, depth, and stencil values for clear operations)
	
--	egl_clear_accum TBD!
	
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
	
--	egl_clear_depth TBD!
--	egl_clear_index TBD!
--	egl_clear_stencil TBD!
	
feature -- Frame Buffer Operations (Control buffers for writing)
	
--	egl_draw_buffer TBD!
--	egl_index_mask TBD!
--	egl_color_mask TBD!
	
	egl_depth_mask (flag: INTEGER) is
			-- Enable or disable the depth buffer for writing.
		require
			valid_state: not drawing_a_primitive
			valid_flag: flag = Gl_true or flag = Gl_false
		do
			gl_api.gl_depth_mask (flag)
		end
	
--	egl_stencil_mask TBD!	
	
feature -- Frame Buffer Operations (Operate on the accumulation buffer)
	
--	egl_accum TBD!
	
feature -- Evaluators (Define a one- or two-dimensional evaluator)	
	
--	egl_map_1_xxx TBD!
--	egl_map_2_xxx TBD!
	
feature -- Evaluators (Generate and evaluate a series of map domain values)
	
--	egl_map_grid_1_xxx TBD!
--	egl_map_grid_2_xxx TBD!
--	egl_eval_mesh_1_xxx TBD!
--	egl_eval_mesh_2_xxx TBD!
--	egl_eval_point_1_xxx TBD!
--	egl_eval_point_2_xxx TBD!
	
feature -- Evaluators (Evaluate one- and two-dimensional maps at a specified domain coordinate)
	
--	egl_eval_coord_1_xxx TBD!
--	egl_eval_coord_2_xxx TBD!
	
feature -- Evaluators (Obtain evaluator parameter values)
	
--	egl_get_map_xxx TBD!
	
feature -- Selection and Feedback (Control the mode and corresponding buffer)
	
--	egl_render_mode TBD!
--	egl_select_buffer TBD!
--	egl_feedback_buffer TBD!
	
feature -- Selection and Feedback (Supply a token for feedback mode)
	
--	egl_pass_through TBD!
	
feature -- Selection and Feedback (Control the name stack for selection)
	
--	egl_init_names TBD!
--	egl_load_name TBD!
--	egl_push_name TBD!
--	egl_pop_name TBD!
	
feature -- Display Lists (Contract predicates)
	
	specifying_a_display_list: BOOLEAN
			-- Is a display list currently being specified?
			-- I.e. has a `egl_new_list' been called and no
			-- corresponding `egl_end_list' been called yet?
	
feature -- Display Listst (EGL attributes)
	
	current_list: INTEGER
			-- The current list being specified
			
feature -- Display Lists (Create or delete display lists)
	
	egl_new_list (list, mode: INTEGER) is
			-- Begins the creation or replacement of a display list.
		require
			valid_state: not drawing_a_primitive and 
				     not specifying_a_display_list
			valid_list: list > 0
			valid_mode: mode = Gl_compile or mode = Gl_compile_and_execute
--			list_is_not_defined: not egl_is_list (list)
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
			valid_state: not drawing_a_primitive and
				     specifying_a_display_list
		do
			gl_api.gl_end_list
			specifying_a_display_list := False
		ensure
			correct_state: not specifying_a_display_list
			list_is_defined: egl_is_list (current_list)
		end
	
--	egl_delete_lists TBD!
	
feature -- Display Lists (Execute a display list or set of lists)
	
	egl_call_list (list: INTEGER) is
			-- Executes a display list.
		require
			valid_state: True
			valid_list: list > 0
			list_is_defined: egl_is_list (list)
			-- Max number of list nestings not reached
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
			valid_state: True
			valid_n: n > 0
			lists_not_void: lists /= Void
-- 			lists_are_defined: 
		local
			c_array: EGL_GLINT_C_ARRAY
		do
			!! c_array.make_from_array (lists)
			gl_api.gl_call_lists (n, Gl_int, c_array.pointer)
		end
		
feature -- Display Lists (Manage display-list indices)
	
	egl_gen_lists (range: INTEGER): INTEGER is
			-- Allocates `range' number of contiguous, previously
			-- unallocated display list indices. The integer
			-- returned is the index that marks the beginning of a
			-- continuous block of empty display list indices. if
			-- the requested number of indices isn't available, or
			-- if range = 0, 0 is returned.
		require
			valid_state: not drawing_a_primitive
			valid_range: range >= 0
		do
			Result := gl_api.gl_gen_lists (range)
		ensure
			result_not_negative: Result >= 0
			zero_range_returns_zero_allocation: range = 0 implies Result = 0
		end
		
	egl_is_list (list: INTEGER): BOOLEAN is
			-- Is `list' already used for a display list?
		require
			valid_state: not drawing_a_primitive			
			valid_list: list > 0
		do
			Result := gl_api.gl_is_list (list)
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
	
feature -- Modes and Execution (Enable, disable, and query mode)	
	
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
	
--	egl_is_disabled TBD!
	
feature -- Modes and Execution (Wait until all OpenGL commands have been executed completely)	
	
	egl_finish is
			-- Forces execution of OpenGL functions in finite time
			-- and waits for notification from the graphics
			-- hardware or the network before returning.
		require
			valid_state: not drawing_a_primitive			
		do			
			gl_api.gl_finish
		end
	
feature -- Modes and Execution (Force all issued OpenGL commands to be executed)
	
	egl_flush is
			-- Forces execution of OpenGL functions in finite time.
		require
			valid_state: not drawing_a_primitive
		do
			gl_api.gl_flush
		end
	
feature -- Modes and Execution (Spcify hints for OpenGL operation)
	
--	egl_hint TBD!
	
feature -- State Queries (Obtain information about an error or the current OpenGL connection)
	
	egl_get_error: INTEGER is
		require		
			valid_state: not drawing_a_primitive		
		do
			Result := gl_api.gl_get_error
		end

	egl_get_string (name: INTEGER): STRING is
			-- Get information about `name'. See XXX_CONSTANTS for valid
			-- vlaues of `name'.
		require
			valid_state: not drawing_a_primitive
			valid_name: name = Gl_vendor or name = Gl_renderer or
				    name = Gl_version or name = Gl_extensions
		do
			!! Result.make (0)			
			Result.from_c (gl_api.gl_get_string (name))
		ensure
			valid_result: Result /= Void
		end
	
feature -- State Queries (Obtain information about an error or the current OpenGL connection)
	
--	egl_get_boolean_v TBD!
	
	egl_get_double_v (pname: INTEGER): ARRAY [DOUBLE] is
			-- Return the value(s) of selected parameter `pname'.
		require
			valid_state: not drawing_a_primitive
			-- valid_pname: is_valid_get_double_parameter (pname)
			-- (to be implemented in egl_constants)
		local
			c_array: EGL_GLDOUBLE_C_ARRAY
		do
			!! c_array.make_empty (16)
			gl_api.gl_get_double_v (pname, c_array.pointer)
			Result := c_array.contents
		ensure
			valid_result: Result /= Void and then Result.count >= 1
		end
	
	egl_get_float_v (pname: INTEGER): ARRAY [REAL] is
			-- Return the value(s) of selected parameter `pname'. 
		require
			valid_state: not drawing_a_primitive
			-- valid_pname: is_valid_get_float_parameter (pname)
			-- (to be implemented in egl_constants)
		local
			c_array: EGL_GLFLOAT_C_ARRAY
		do
			!! c_array.make_empty (16)
			gl_api.gl_get_float_v (pname, c_array.pointer)
			Result := c_array.contents
		ensure
			valid_result: Result /= Void and then Result.count >= 1
		end
        
--	egl_get_integer_v TBD!
	
feature -- State Queries (Save and restore sets of state variables)
	
	egl_push_attrib (mask: INTEGER) is
			-- Save all the attributes indicated by `mask' by
			-- pushing them on the attribute stack.
		require
			valid_state: not drawing_a_primitive
			valid_attrib_mask: is_valid_attrib_mask (mask)
			-- Attrib stack not full
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
	
feature -- ARB Extensions - Multitexture (Set the current texture coordinates)	
	
--	egl_multi_tex_coord_1_xxx_ARB TBD!
--	egl_multi_tex_coord_2_xxx_ARB TBD!
--	egl_multi_tex_coord_3_xxx_ARB TBD!
--	egl_multi_tex_coord_4_xxx_ARB TBD!

feature -- ARB Extensions - Multitexture (Select the active texture unit)	
	
--	egl_active_texture_ARB TBD!	
	
feature -- ARB Extensions - Multitexture (Select the active vertex array)	
	
--	egl_client_active_texture_ARB TBD!	
	
feature -- ARB Extensions - Imaging Subset (Specify a color lookup table or subtable)
	
--	egl_color_table TBD!
--	egl_color_sub_table TBD!
	
feature -- ARB Extensions - Imaging Subset (Copy a color lookup table or subtable)
	
--	egl_copy_color_table TBD!
--	egl_copy_color_sub_table TBD!
	
feature -- ARB Extensions - Imaging Subset (Obtain color table related values)
	
--	egl_get_color_table TBD!
--	egl_get_color_sub_table TBD!
		
feature -- ARB Extensions - Convolution (Control how a convolution filter is applied to an input image)
	
--	egl_convolution_parameter_xxx TBD!
	
feature -- ARB Extensions - Convolution (Specify one- or two-dimensional convolution filters)
	
--	egl_convolution_filter_1D_xxx TBD!
--	egl_convolution_filter_2D_xxx TBD!
	
feature -- ARB Extensions - Convolution (Specify two-dimensional separable convolution filters)
	
--	egl_separable_filter_2D_xxx TBD!
	
feature -- ARB Extensions - Convolution (Obtain convolution-related parameter values)
	
--	egl_get_convolution_filter_xxx TBD!
--	egl_get_convolution_parameter_xxx TBD!
--	egl_get_separable_filter_xxx TBD!
	
feature -- ARB Extensions - Convolution (Copy a convolution filter or part of it)
	
--	egl_copy_convolution_filter_1D_xxx TBD!
--	egl_copy_convolution_filter_2D_xxx TBD!
	
feature -- ARB Extensions - Histogram (Specify histogram forma)
	
--	egl_histogram TBD!
	
feature -- ARB Extensions - Histogram (Obtain histogram values and parameters)
	
--	egl_get_histogram_xxx TBD!
--	egl_get_histogram_parameter_xxx TBD!
	
feature -- ARB Extensions - Histogram (Reset internal histogram tables)
	
--	egl_reset_histogram TBD!
	
feature -- ARB Extensions - Minmax (Specify minmax format)
	
--	egl_minmax TBD!
	
feature -- ARB Extensions - Minmax (Obtain minmax values and parameters)
	
--	egl_get_minmax_xxx TBD!
--	egl_get_minmax_parameter_xxx TBD!
	
feature -- ARB Extensions - Minmax (Reset internal minmax table)
	
--	egl_reset_minmax TBD!
	
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

