indexing
	description: "To simulate eif_adopt and eif_wean from ETL. Adopted from an example included in the SmallEiffel distribution"
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "SmallEiffel -0.74 beta #17 (lcc-win32 3.7)"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/04/03 20:56:21 $"
	revision: "$Revision: 1.1 $"

expanded class EIF_STUFF

feature

	adopted: FIXED_ARRAY [ANY] is
		once
			!! Result.with_capacity (16)
		end

	ceif_adopt (object: ANY) is
			-- A reference to object is stored in `adopted' to avoid
			-- it's collection at GC time.
		do
			if not adopted.fast_has (object) then
				adopted.add_last (object)
			end
		end
	
	ceif_wean (object: ANY) is
			-- Remove the reference to `object' in adopted.
		local
			i: INTEGER
		do
			i := adopted.fast_index_of (object)
			if adopted.valid_index (i) then
				adopted.put (Void, i)
				adopted.put (adopted.last, i)
				adopted.remove_last
			end
		end
	
end

