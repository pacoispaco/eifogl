indexing
	description: "An encapsulation of a char **. This is used to pass argv to glut_init"
	library: "Eiffel C wrapper utilities"
	compilers: "ISE 4.5 and above. TO_SPECIAL and SPECIAL are ISE specific classes"
	platforms: "All platforms"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999, 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/03/23 17:01:31 $"
	revision: "$Revision: 1.2 $"

class CHAR_PP

inherit
	
	TO_SPECIAL [POINTER]
	
creation
	make
	
feature {NONE} -- Initialization
	
	make (argv: ARRAY [STRING]) is
			-- Fill with the string pointers in `argv'.
		local
			i: INTEGER
			argv_area: SPECIAL [STRING]
			s_area: SPECIAL [CHARACTER]
		do
			make_area (argv.count)
			from  
				i := 0
				argv_area := argv.area
			until
				i = argv.count
			loop
				s_area := argv_area.item (i).area
				area.put ($s_area, i)
				i := i + 1
			end
		end
	
end -- class CHAR_PP

-- begin documentation
-- 
-- end documentation

