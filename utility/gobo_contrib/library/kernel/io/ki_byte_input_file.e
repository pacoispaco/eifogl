indexing

	description:

		"Interface for byte input files"

	library: "EiffelOpenGL Gobo Contrib"
	copyright: "Copyright (c) 2002, Paul Cohen"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date: 2003/01/08 17:03:37 $"
	revision: "$Revision: 1.1 $"

deferred class KI_BYTE_INPUT_FILE

inherit

	KI_INPUT_FILE
	
feature -- Input
	
	read_byte is
			-- Read a byte. Result is put in `last_byte'.
		deferred
		end
	
	read_bytes (n: INTEGER) is
			-- Read `n' bytes. Result is put in `last_bytes'.
		deferred
		end
	
feature -- Access
	
	last_byte: INTEGER is
			-- The result of the most recent call to `read_byte'. 
		deferred
		end
	
	last_bytes: STRING is
			-- The result of the most recent call to `read_bytes'. 
		deferred
		end
	
end -- class KI_BYTE_INPUT_FILE

