indexing
	description: "Some useful C functions"
	library: "Eiffel C wrapper utilities (EiffelOpenGL)"
	compilers: "ISE 5.2"	
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/23 21:20:23 $"
	revision: "$Revision: 1.2 $"

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
	
	c_memcpy (dest, src: POINTER; len: INTEGER): POINTER is
		external
			"C [macro <string.h>] (void *, const void *, size_t): void *"
		alias	
			"memcpy"
		end
	
end -- class C_FUNCTIONS

-- begin documentation
--
-- end documentation
