indexing
	description: "Some useful C functions"
	library: "Eiffel C wrapper utilities"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 23:04:46 $"
	revision: "$Revision: 1.1 $"

class C_FUNCTIONS
	
feature	-- Basic operations
	
	c_calloc (i: INTEGER; size: INTEGER): POINTER is
		external
			"C [macro <stdlib.h>] (long, long): void *"
		alias
			"calloc"
		end
	
	c_free (p: POINTER) is
		external
			"C [macro <stdlib.h>] (void *)"
		alias	
			"free"
		end
	
end -- class C_FUNCTIONS


-- begin documentation
--
-- end documentation
