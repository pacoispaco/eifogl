indexing
	description: "The OpenGL geometric drawing primitive GL_POLYGON"
	library: "EGL - Eiffel wrapping of OpenGL"
	compiler: "All"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:26:01 $"
	revision: "$Revision: 1.1 $"

class EGL_POLYGON [G->NUMERIC]

inherit
	EGL_PRIMITIVE [G]
		redefine
			opengl_primitive_type,
			is_valid_vertices
		end
	
creation
	make_2d, make_3d, make_3d_homogeneous
	
feature -- Access
	
	opengl_primitive_type: INTEGER is 
			-- Type of OpenGL geometric primitive
		do
			Result := Gl_polygon
		end
		
feature -- Miscellaneous (Contracts)
	
	is_valid_vertices (v: ARRAY [TUPLE[G]]): BOOLEAN is 
			-- Checks the following:
			-- 1) The vertices do not specify a polygon that
			-- intersects itself.
			-- 2) The vertices specify a convex polygon.
		do
			-- TBD
			Result := True
		end
	
	is_valid_number_of_vertices (i: INTEGER): BOOLEAN is
			-- Is `i' a valid number of vertices for this primitive?
		do
			Result := i > 2
		ensure then
			validated_1: Result implies (i > 2)
			validated_2: not Result implies not (i > 2)
		end

end -- class EGL_POLYGON

--| begin documentation
-- 
--| end documentation
