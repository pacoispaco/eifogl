indexing
	description: "A GLU_NURBS_OBJ"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:11:41 $"
	revision: "$Revision: 1.1 $"

class EGLU_NURBS_OBJ
	
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
	
	
