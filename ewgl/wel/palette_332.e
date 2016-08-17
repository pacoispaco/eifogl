indexing
	description: "A Windows 256 color palette with colors evenly% 
                     %distributed in the color cube using 3 red bits,%
                     %3 green bits and 2 blue bits."
	library: "EWGL - Eiffel wrapping of the Win32 OpenGL extensions"
	compilers: "ISE 4.3, ISE4.5. See dependencies."
	platforms: "Win32"
	dependencies: "ISE's WEL, which means it will only work with ISE compilers."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2003/04/27 06:47:24 $"
	revision: "$Revision: 1.2 $"

class PALETTE_332

inherit
	WEL_PALETTE
	
	WEL_BIT_OPERATIONS
		export
			{NONE} all
		end
	
creation
	make_evenly_distributed
	
feature {NONE}-- Initialization
	
	make_evenly_distributed is
		local
			lp: WEL_LOG_PALETTE
			pe: WEL_PALETTE_ENTRY
			i: INTEGER
			b8: BIT 8
			red_range, green_range, blue_range: BIT 8
			red_range_i, green_range_i, blue_range_i: INTEGER
			red_shift, green_shift, blue_shift: INTEGER
			r, g, b: INTEGER
		do
			!! lp.make (logical_palette_version, entries)
				
			red_range := 00000111B
			red_range_i := 7
			green_range := 00000111B
			green_range_i := 7
			blue_range := 00000011B
			blue_range_i := 3
			
			red_shift := 0
			green_shift := 3
			blue_shift := 6
			
			from  
				i := 1
			until
				i = entries
			loop
				b8 := integer_to_bit8 (i)
				b8 := b8 ^ red_shift
				b8 := b8 and red_range
				r := bit8_to_integer (b8)
				r := (r * 255/224).truncated_to_integer
--				print ("r = ")
--				print (r)
				
				b8 := integer_to_bit8 (i)
				b8 := b8 ^ green_shift
				b8 := b8 and green_range
				g := bit8_to_integer (b8)
				g := (g * 255/224).truncated_to_integer
--				print (", g = ")
--				print (g)
				
				b8 := integer_to_bit8 (i)
				b8 := b8 ^ blue_shift
				b8 := b8 and blue_range
				b := bit8_to_integer (b8)
				b := (b * 255/192).truncated_to_integer
--				print (", b = ")
--				print (b)
--				print ("%N")
				
				!! pe.make (r, g, b, 0)
				lp.set_pal_entry (i, pe)
				i := i + 1
			end
			
			make (lp)
		end
	
feature -- Status report
	
	logical_palette_version: INTEGER is 768
			-- Version always 768 for Win32 API
	
	entries: INTEGER is 256
			-- Palette entries
	
feature {NONE}-- Implementation
	
	integer_to_bit8 (int: INTEGER): BIT 8 is
		local
			i, res: INTEGER
		do
			from  
				i := 7
				res := int
			until
				i < 0
			loop
				if res - (2^i).truncated_to_integer >= 0 then
					Result.put (True, i+1)
					res := res - (2^i).truncated_to_integer
				end
				i := i - 1
			end
		end
	
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
					Result := Result + (2^(i-1)).truncated_to_integer
				end
				i := i + 1
			end
		end
	
invariant
	
	has_256_entries: entries = 256
	
	logical_palette_version_is_768: logical_palette_version = 768
	
end -- class PALETTE_332

-- begin dictionary
-- 
-- end dictionary

