note
	description: "An OpenGL GLU library quadrics object"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class EGLU_QUADRIC

inherit
	C_STRUCTURE
		redefine
			dispose
		end

	EXCEPTIONS

create
	eglu_new_quadric

feature -- Initialization

	eglu_new_quadric
			-- Create a new quadrics object.
		do
			make_unshared (glu_api.glu_new_quadric)
			if not exists then
				raise ("failed_to_create_new_quadric")
			end
		ensure
			exists: exists
		end

feature -- Access

	structure_size: INTEGER
		do
			Result := 0
		end

feature -- Basic operations

	eglu_quadric_draw_style (draw_style: INTEGER)
			-- Set the rendering style. For valid values of
			-- `draw_style' see QUADRIC_DRAW_STYLE_CONSTANTS.
		require
			exists: exists
--			valid_draw_style: is_valid_draw_style (draw_style)
		do
			glu_api.glu_quadric_draw_style (pointer, draw_style)
		end

	eglu_quadric_orientation (orientation: INTEGER)
			-- Set the orientation. For valid values of
			-- `orientation' see QUADRIC_ORIENTATION_CONSTANTS.
		require
			exists: exists
--			valid_orientation: is_valid_orientation (orientation)
		do
			glu_api.glu_quadric_orientation (pointer, orientation)
		end

	eglu_quadric_normals (normals: INTEGER)
			-- Set wether normals are to be generated. For valid
			-- values of `normals' see QUADRIC_NORMALS_CONSTANTS.
		require
			exists: exists
--			valid_normals: is_valid_normals (normals)
		do
			glu_api.glu_quadric_normals (pointer, normals)
		end

feature {NONE} -- Removal

	dispose
		do
			glu_api.glu_delete_quadric (pointer)
			precursor
		end

feature {NONE} -- Implementation

	glu_api: GLU
			-- The raw Eiffel encapsulation of the OpenGL glu API.
		once
			create Result
		end

end
