indexing
	description: "Wraps the GLU_NURBS_OBJ handle"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2003/03/25 15:49:38 $"
	revision: "$Revision: 1.3 $"

class EGLU_NURBS
	
inherit	
	C_STRUCTURE

creation
	make_shared
	
feature -- Access	
	
	structure_size: INTEGER is
		do
			Result := 0
		end
				
end -- class EGLU_NURBS
	
	
