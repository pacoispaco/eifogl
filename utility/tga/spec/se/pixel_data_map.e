indexing
	description: "A pixel data map, ie. a continous memory segment filled with pixel data"
	library: "Eiffel TGA (EiffelOpenGL)"
	compilers: "SmallEiffel -0.74"	
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/23 21:43:35 $"
	revision: "$Revision: 1.1 $"

class
	PIXEL_DATA_MAP
	
inherit
	C_STRUCTURE
	
creation

	make_from_string
	
feature {NONE} -- Initialization	
	
	make_from_string (s: STRING; w, h, d, a: INTEGER) is
			-- Create and copy all data from the string `s'. The
			-- width `w' and height `h' define the span of the pixel
			-- data. `d' defines the number of bit planes per pixel
			-- (bpp). `a' defines the number of alpha  bits per
			-- pixel. Together, `w', `h', `d'  and `a' define the
			-- size of the pixel data. 
		require
			s_not_void: s /= Void
			w_valid: w > 0    
			h_valid: h > 0
			d_valid: d > 0	
			s_has_valid_size: s.count >= w * h * (d + a) // 8
		local
			p: POINTER
		do
			structure_size := s.count
			make
			p := c_memcpy (pointer, s.to_external, structure_size)
			
			width := w
			height := h
			depth := d
			alpha_bits := a
		end
	
feature -- Access
	
	width: INTEGER
			-- Width in pixels
	
	height: INTEGER
			-- Height in pixels
	
	depth: INTEGER
			-- Bits per pixel
	
	alpha_bits: INTEGER
			-- Alpha bits per pixel
	
	structure_size: INTEGER 
			-- Size in bytes
	
end -- class PIXEL_DATA_MAP
