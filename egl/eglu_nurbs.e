note
	description: "Wraps the GLU_NURBS_OBJ handle"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

class EGLU_NURBS

inherit	
	C_STRUCTURE

create
	make_shared

feature -- Access	

	structure_size: INTEGER
		do
			Result := 0
		end

end
