indexing
	description: "The OpenGL geometric drawing primitive GL_POINTS"
	library: "EGL - Eiffel wrapping of OpenGL"
	compiler: "All"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:26:01 $"
	revision: "$Revision: 1.1 $"

class EGL_POINTS [G->NUMERIC]

inherit
	EGL_PRIMITIVE [G]
		redefine
			opengl_primitive_type
		end
	
creation
	make_2d, make_3d, make_3d_homogeneous
	
feature -- Access
	
	opengl_primitive_type: INTEGER is 
			-- Type of OpenGL geometric primitive
		do
			Result := Gl_points
		end
		
feature -- Miscellaneous (Contracts)
	
	is_valid_number_of_vertices (i: INTEGER): BOOLEAN is
			-- Is `i' a valid number of vertices for this primitive?
		do
			Result := True
		ensure then
			always_valid: Result
		end

end -- class EGL_POINTS

--| begin documentation
-- 
--| end documentation



