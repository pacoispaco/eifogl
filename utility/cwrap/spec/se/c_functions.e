indexing
	description: "Some useful C functions"
	library: "Eiffel C wrapper utilities"
	compilers: "SmallEiffel -0.74 beta #17 (lcc-win32 3.7)"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/23 21:20:35 $"
	revision: "$Revision: 1.3 $"

class C_FUNCTIONS
	
feature	-- Basic operations
	
	c_calloc (i: INTEGER; size: INTEGER): POINTER is
		external
--			"C [macro <stdlib.h>] (long, long): void *"
			"C use <stdlib.h>"
		alias
			"calloc"
		end
	
	c_free (p: POINTER) is
		external
--			"C [macro <stdlib.h>] (void *)"
			"C use <stdlib.h>"
		alias	
			"free"
		end
	
	c_memcpy (dest, src: POINTER; len: INTEGER): POINTER is
		external
--			"C [macro <string.h>] (void *, const void *, size_t): void *"
			"C use <string.h>]"		
		alias	
			"memcpy"
		end

end -- class C_FUNCTIONS


-- begin documentation
--
-- end documentation
