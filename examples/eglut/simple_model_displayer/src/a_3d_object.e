indexing
	description: "A 3D object"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/30 23:20:35 $"
	revision: "$Revision: 1.1 $"

class A_3D_OBJECT
	
creation
	make_from_file,
	make_from_specification
	
feature {NONE} -- Initialization
	
	make_from_file (fname: STRING) is
			-- Create the object from the specification found in the
			-- file named `fname'.
		require
			fname_not_void: fname /= Void
		do
		end
	
	make_from_specification (spec: STRING) is
			-- Create the object from the specification `spec'.
		require
			spec_not_void: spec /= Void
		do
		end
	
feature -- Access	
	
	specification: STRING
			-- The textual specification
	
	position: TUPLE [NUMERIC] is
			-- The position in homogeneous coordinates
		do
			Result := position_impl
		ensure
			homogeneous_coordinates: Result.count = 4
		end
	
	origo: TUPLE [NUMERIC] is
			-- The origo
		do
			origo := origo_impl
		ensure
			homogeneous_coordinates: Result.count = 4
		end
	
feature -- Basic operations	
	
	draw is
			-- Draw the object.
		do
		end
	
feature {NONE} -- Implementations	
	
	position_impl: TUPLE [DOUBLE]
	
	origo_impl: TUPLE [DOUBLE]
	
end -- class A_3D_OBJECT

--| begin documentation
-- 
--| end documentation
