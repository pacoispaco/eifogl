indexing
	description: "The OpenGL geometric drawing primitive GL_TRIANGLE_FAN"
	library: "EGL - Eiffel wrapping of OpenGL"
	compiler: "All"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:26:27 $"
	revision: "$Revision: 1.1 $"

class EGL_TRIANGLE_FAN [G->NUMERIC]

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
			Result := Gl_triangle_fan
		end
		
feature -- Miscellaneous (Contracts)
	
	is_valid_number_of_vertices (i: INTEGER): BOOLEAN is
			-- Is `i' a valid number of vertices for this primitive?
		do
			Result := i > 2 
		ensure then
			validated_1: Result implies (i > 2)
			validated_2: not Result implies not (i > 2)
		end

end -- class EGL_TRIANGLE_FAN

--| begin documentation
-- 
--| end documentation
