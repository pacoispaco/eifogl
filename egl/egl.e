indexing
	description: "Eiffelized wrapping of the OpenGL GL library"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:38 $"
	revision: "$Revision: 1.1 $"

class EGL
	
inherit	
	GL_CONSTANTS
	
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
	
feature -- Drawing geometric objects	
	
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
			-- color. See GL_BUFFER_CONSTANTS for valid values of
			-- `buffer'.
		require
			valid_state: not drawing_a_primitive			
--			valid_buffer: is_valid_buffer (buffer)
		do
			gl_api.gl_clear (buffer)
		end
	
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

	egl_vertex_3f (x, y, z: REAL) is
			-- Specifies the 3D coordinates of a vertex.
		require
			valid_state: drawing_a_primitive or not drawing_a_primitive
				     specifying_a_display_list
		do
			gl_api.gl_vertex_3f (x, y, z)
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
			valid_state: drawing_a_primitive or not drawing_a_primitive			
		do
			gl_api.gl_normal_3f (nx, ny, nz)
		end
		
	egl_normal_3fv (fv: ARRAY [REAL]) is
			-- Defines a surface normal for the next set of
			-- vertices specified.
		require
			valid_state: drawing_a_primitive or not drawing_a_primitive
			fv_not_void: fv /= Void
			fv_has_3_reals: fv.count = 3
		local
			s: SPECIAL [REAL]
		do
			s := fv.area
			gl_api.gl_normal_3fv ($s)
		end
	
	egl_begin (mode: INTEGER) is
		require
			valid_state: not drawing_a_primitive  
--			valid_geometric_primitive: is_valid_geometric_primitive (mode)
		do		
			drawing_a_primitive := True
			gl_api.gl_begin (mode)
		ensure
			correct_state: drawing_a_primitive
		end
	
	egl_end is
		require
			valid_state: drawing_a_primitive			
		do		
			gl_api.gl_end
			drawing_a_primitive := False
		ensure
			correct_state: not drawing_a_primitive
		end
	
feature -- Viewing
	
	egl_viewport (x, y, w, h: INTEGER) is
			-- Sets the potion of the window that can be drawn in
			-- by OpenGL.
		require
			valid_state: not drawing_a_primitive
		do
			gl_api.gl_viewport (x, y, w, h)
		end
			
	egl_load_identity is
			-- Set the current matrix to identity.
		require
			valid_state: not drawing_a_primitive		
		do
			gl_api.gl_load_identity
		end
			
	egl_ortho (left, right, bottom, top, near, far: DOUBLE) is
			-- Sets or modifies the clipping volume extents.
		require
			valid_state: not drawing_a_primitive
		do
--			debug ("egl")
--				print ("left = ")
--				print (left)
--				print ("%Nright = ")
--				print (right)
--				print ("%Nbottom = ")
--				print (bottom)
--				print ("%Ntop = ")
--				print (top)
--				print ("%Nnear = ")
--				print (near)
--				print ("%Nfar = ")
--				print (far)
--				print ("%N")
--			end
			gl_api.gl_ortho (left, right, bottom, top, near, far)
		end
	
	egl_matrix_mode (mode: INTEGER) is
		require		
			valid_state: not drawing_a_primitive
--			valid_matrix_mode: is_valid_matrix_mode (mode)
		do
			gl_api.gl_matrix_mode (mode)
		end
	
	egl_translate_f (x, y, z: REAL) is
			-- Multiplies the current matrix by a translation matrix.
		require
			valid_state: not drawing_a_primitive		
		do
			gl_api.gl_translate_f (x, y, z)
		end
	
	egl_rotate_f (angle, x, y, z: REAL) is
			-- Rotates the current matrix by a Rotation matrix
		require		
			valid_state: not drawing_a_primitive
		do
			gl_api.gl_rotate_f (angle, x, y, z)
		end
	
	egl_push_matrix is
			-- Pushes the current matrix onto the matrix stack
		require
			valid_state: not drawing_a_primitive
--			not_too_many_matrices_on_the_stack
		do
			gl_api.gl_push_matrix
		end
	
	egl_pop_matrix is
			-- Pops the current matrix from the matrix stack
		require
			valid_state: not drawing_a_primitive
--			more_than_one_matrix_on_the_stack:
		do
			gl_api.gl_pop_matrix
		end
	
feature -- Color	
	
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
			-- value representing a shading technique. Accepted
			-- values are GL_FLAT and GL_SMOOTH. The default is
			-- GL_SMOOTH.
		require
			valid_state: not drawing_a_primitive
--			valid_shading_mode: is_valid_shading_mode (mode)
		do
			gl_api.gl_shade_model (mode)
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

feature -- Lighting	
	
	egl_material_fv (face, property: INTEGER; params: ARRAY [REAL]) is
			-- Specify material parameters for the lighting model.
		require
 			valid_state: drawing_a_primitive or not drawing_a_primitive
--			valid_face: is_valid_face (face)
--			valid_material_property: is_valid_material_property (property)
		local
			s: SPECIAL [REAL]
		do
			s := params.area
			gl_api.gl_material_fv (face, property, $s)
		end
			
	egl_material_f (face, property: INTEGER; param: REAL) is
			-- Specify material parameters for the lighting model.
		require
			valid_state: drawing_a_primitive or not drawing_a_primitive
--			valid_face: is_valid_face (face)
--			valid_material_property: property = Gl_shininess
		do
			gl_api.gl_material_f (face, property, param)
		end
	
	egl_light_fv (light, pname: INTEGER; params: ARRAY [REAL]) is
			-- Set light source parameters.
		require
			valid_state: not drawing_a_primitive		
		local
			s: SPECIAL [REAL]
		do
			s := params.area
			gl_api.gl_light_fv (light, pname, $s)
		end
	
	egl_light_model_fv (pname: INTEGER; params: ARRAY [REAL]) is
			-- Set light source parameters.
		require
			valid_state: not drawing_a_primitive
--			valid_pname: is_valid_pname (pname)
		local
			s: SPECIAL [REAL]
		do
			s := params.area
			gl_api.gl_light_model_fv (pname, $s)
		end
	
	egl_color_material (face, mode: INTEGER) is
		require			
			valid_state: not drawing_a_primitive			
--			valid_face: is_valid_face (face)
--			valid_color_mode: is_valid_color_mode (mode)
		do
			gl_api.gl_color_material (face, mode)
		end
	
feature -- Display lists
	
	egl_gen_lists (range: INTEGER): INTEGER is
			-- Allocates `range' number of contiguous, previously
			-- unallocated display list indices. The integer
			-- returned is the index taht marks the beginning of a
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

end -- class EGL

--| begin documentation
-- 
--| end documentation

