indexing
	description: "An OpenGL GLU library quadrics object"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:38 $"
	revision: "$Revision: 1.1 $"

class EGLU_QUADRIC
	
inherit	
	WEL_ANY
		export
			{NONE} set_shared,
			set_unshared
		end
	
	EXCEPTIONS
	
creation	
	eglu_new_quadric
	
feature -- Initialization
	
	eglu_new_quadric is
			-- Create a new quadrics object. 
		do
			make_by_pointer (glu_api.glu_new_quadric)
			if not exists then
				raise ("failed_to_create_new_quadric")
			end
			
			-- Ensure that `destroy_item' is called when this
			-- object is disposed of by the garbage collector!
			set_unshared
		ensure
			exists: exists
		end
	
feature -- Basic operations
	
	eglu_quadric_draw_style (draw_style: INTEGER) is
			-- Set the rendering style. For valid values of
			-- `draw_style' see QUADRIC_DRAW_STYLE_CONSTANTS.
		require
			exists: exists
--			valid_draw_style: is_valid_draw_style (draw_style)
		do
			glu_api.glu_quadric_draw_style (item, draw_style)
		end
	
	eglu_quadric_orientation (orientation: INTEGER) is
			-- Set the orientation. For valid values of
			-- `orientation' see QUADRIC_ORIENTATION_CONSTANTS.
		require
			exists: exists
--			valid_orientation: is_valid_orientation (orientation)
		do
			glu_api.glu_quadric_orientation (item, orientation)
		end
	
	eglu_quadric_normals (normals: INTEGER) is
			-- Set wether normals are to be generated. For valid
			-- values of `normals' see QUADRIC_NORMALS_CONSTANTS.
		require
			exists: exists
--			valid_normals: is_valid_normals (normals)
		do
			glu_api.glu_quadric_normals (item, normals)
		end
	
	eglu_delete_quadric is
			-- Delete the quadrics object and free the memory in
			-- the glu lib. The user does not *have* to call this
			-- function since the garbage collector will take care
			-- of freeing the memory anyway!
		require
			exists: exists
		do
			glu_api.glu_delete_quadric (item)
		ensure
			not_exists: not exists
		end
	
feature {NONE} -- Removal
	
	destroy_item is
			-- Called by the `dispose' routine to destroy `item' by
			-- calling the corresponding glu function and free the
			-- memory.
		do
			if exists then
				eglu_delete_quadric
			end
		end
	
feature {NONE} -- Implementation 	
	
	glu_api: expanded GLU 
			-- The raw Eiffel encapsulation of the OpenGL glu API.
			-- NOTA BENE! This solution should probably be skipped
			-- in favor of having the needed raw glu wrappers in 
                        -- this class!

end -- class EGLU_QUADRIC

-- begin dictionary
-- 
-- end dictionary

