indexing
	description: "An OpenGL GLU library quadrics object"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:13:47 $"
	revision: "$Revision: 1.3 $"

class EGLU_QUADRIC
	
inherit	
	C_STRUCTURE
		redefine
			dispose
		end
	
	EXCEPTIONS
	
creation	
	eglu_new_quadric
	
feature -- Initialization
	
	eglu_new_quadric is
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
	
	structure_size: INTEGER is
		do
			Result := 0
		end
		
feature -- Basic operations
	
	eglu_quadric_draw_style (draw_style: INTEGER) is
			-- Set the rendering style. For valid values of
			-- `draw_style' see QUADRIC_DRAW_STYLE_CONSTANTS.
		require
			exists: exists
--			valid_draw_style: is_valid_draw_style (draw_style)
		do
			glu_api.glu_quadric_draw_style (pointer, draw_style)
		end
	
	eglu_quadric_orientation (orientation: INTEGER) is
			-- Set the orientation. For valid values of
			-- `orientation' see QUADRIC_ORIENTATION_CONSTANTS.
		require
			exists: exists
--			valid_orientation: is_valid_orientation (orientation)
		do
			glu_api.glu_quadric_orientation (pointer, orientation)
		end
	
	eglu_quadric_normals (normals: INTEGER) is
			-- Set wether normals are to be generated. For valid
			-- values of `normals' see QUADRIC_NORMALS_CONSTANTS.
		require
			exists: exists
--			valid_normals: is_valid_normals (normals)
		do
			glu_api.glu_quadric_normals (pointer, normals)
		end
	
feature {NONE} -- Removal
	
	dispose is
		do
			glu_api.glu_delete_quadric (pointer)
			precursor
		end
	
feature {NONE} -- Implementation 	
	
	glu_api: GLU is 
			-- The raw Eiffel encapsulation of the OpenGL glu API.
			-- NOTA BENE! This solution should probably be skipped
			-- in favor of having the needed raw glu wrappers in 
                        -- this class!
		once
			!! Result
		end
	
end -- class EGLU_QUADRIC

-- begin dictionary
-- 
-- end dictionary

