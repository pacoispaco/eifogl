indexing
	description: "Representation of a set of consecutive characters"
	copyright: "copyright (c) 1998, Enea Business Software AB. All rights reserved."
	date: "$Date: 2001/01/14 14:23:41 $"
	revision: "$Revision: 1.1 $"

class CHAR_RANGE

creation

	make

feature -- Initialization

	make (c1, c2: CHARACTER) is
		require
			meaningful_interval: c1 <= c2
		do
			lower := c1;
			upper := c2
		ensure
			boundaries_assigned: lower = c1 and upper = c2
		end

feature -- Measurement

	lower, upper: CHARACTER

feature -- Access

	has (c: CHARACTER): BOOLEAN is
			-- Is `c' within the range?
		do
			Result := (c >= lower and c <= upper)
		ensure
			correct_status: Result =  (c >= lower and c <= upper)
		end

end -- class CHAR_RANGE

-- begin documentation
--
-- end documentation

