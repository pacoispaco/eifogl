indexing
	description: "Basic mathematical operations that solve incompatibility%
	%problems between different Eiffel compilers."
	library: "Eiffel portable math (EiffelOpenGL utility)"
	compiler: "SmallEiffel 0.74 (lcc-win32 3.8)"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/25 19:44:36 $"
	revision: "$Revision: 1.1 $"

class
	BASIC_MATH

feature -- Basic operations
	
	double_to_real (d: DOUBLE): REAL is
			-- Truncate the double `d' to real. 
		do
			Result := d.to_real
		end
	
end -- class BASIC_MATH

-- begin documentation
-- 
-- end documentation


