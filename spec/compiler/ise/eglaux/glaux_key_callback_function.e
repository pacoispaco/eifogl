indexing
	description: "An abstraction of a AUX key event callback function."
	library: "EGLAUX - Eiffel wrapping of the OpenGL Auxillary library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have OpenGL AUX implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:40 $"
	revision: "$Revision: 1.1 $"

deferred class GLAUX_KEY_CALLBACK_FUNCTION

feature {NONE} -- Implementation (Callback entry point from C side)
	
	cexec is
			-- This is the feature called from the C side
		do
			execute
		end
	
feature {NONE} -- Implementation (Code to be executed)	
	
	key: INTEGER is
			-- Key for which this callback will be registered
		deferred
		end
	
	execute is
			-- This feature must be defined in subclasses and
			-- should contain the code to be executed on a key
			-- event associated to 'key´.
		deferred
		end

end -- class GLAUX_KEY_CALLBACK_FUNCTION

--| begin documentation
-- 
--| end documentation

