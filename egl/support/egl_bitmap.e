indexing
	description: "An OpenGL bitmap"
	library: "EGL - Eiffel wrapping of OpenGL"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/01/27 18:23:34 $"
	revision: "$Revision: 1.1 $"

class EGL_BITMAP 

creation	
	make
	
feature {NONE} -- Initialization
	
	make (bytes: ARRAY [INTEGER]) is
			-- Create a bitmap.
		require
			bytes_not_void: bytes /= Void
			bytes_are_valid: -- All bytes [i] <= 255
		do
			pattern := clone (bytes)
		end
	
feature -- Access	
	
	pattern: ARRAY [INTEGER]
			-- The bitmap represented by an array of integers
	
	pixel_count: INTEGER is
			-- Number of pixels
		do
			Result := pattern.count * 8
		end
	
feature {EGL} -- Conversion	
	
	pointer: POINTER is
			-- The bitmap represented as a pointer C array of
			-- GLubyte (GLubyte *). Used internally in EGL for
			-- passing to native OpenGL functions.    
		local
			c_array: EGL_GLUBYTE_C_ARRAY 
		do
			!! c_array.make_from_array (pattern)
			Result := c_array.pointer
		end
	
end -- class EGL_BITMAP

--| begin documentation
-- This class could be extended with functionality for reading from 
-- and writing to various bitmap file formats.
--| end documentation
