indexing
	description: "An OpenGL 32-bit by 32-bit polygon stipple pattern."
	library: "EGL - Eiffel wrapping of OpenGL"
	compiler: "All"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:16:30 $"
	revision: "$Revision: 1.1 $"

class EGL_POLYGON_STIPPLE_PATTERN
		
creation	
	make
	
feature {NONE} -- Initialization
	
	make (bits: ARRAY [BIT 8]) is
			-- Create a polygon stipple pattern to the bit pattern
			-- `bits' based on 128 8-bit sequences. 
		require
			bits_not_void: bits /= Void
			bits_has_128_items: bits.count = 128
		do
			pattern := clone (bits)
		end
	
feature -- Access	
	
	pattern: ARRAY [BIT 8]
			-- The polygon stipple pattern represented by an array
			-- containing 128 8-bit sequences.
	
feature {EGL} -- Conversion	
	
	glubyte_string: STRING is
			-- The polygon stipple pattern represented as a sequence
			-- of 128 GLubyte's. Used internally in EGL for passing
			-- to native OpenGL functions. 
		local
			i, glubyte: INTEGER
		do
			from
				i := 1
				!! Result.make (128)
				Result.fill_character ('#')
			until
				i > 128
			loop
				glubyte := bit8_to_integer (pattern @ i)
				Result.put (glubyte.ascii_char, i)
				i := i +1
			end
		end
	
feature {NONE} -- Implementation	
	
	bit8_to_integer (b: BIT 8): INTEGER is
		local
			i: INTEGER
		do
			from  
				i := 1
			until
				i > 8
			loop
				if b.item (i) then
					Result := Result + (2^(8-i)).truncated_to_integer
				end
				i := i + 1
			end
		end
	
end -- class EGL_POLYGON_STIPPLE_PATTERN

--| begin documentation
-- 
--| end documentation
