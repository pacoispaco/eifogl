indexing
	description: "Predefined character sets"
	copyright: "copyright (c) 1998, Enea Business Software AB. All rights reserved."
	date: "$Date: 2001/01/14 14:23:41 $"
	revision: "$Revision: 1.1 $"

class STD_CHAR_SETS

feature

	alphabetic: CHAR_SET is
		once
			!! Result.make ("a-zA-Z_")
		end;

	alphanumeric: CHAR_SET is
		once
			!! Result.make ("a-zA-Z_0-9")
		end;

	alpha_lower: CHAR_SET is
		once
			!! Result.make ("a-z")
		end;

	alpha_upper: CHAR_SET is
		once
			!! Result.make ("A-Z")
		end;

	numeric: CHAR_SET is
		once
			!! Result.make ("0-9")
		end;

	white_space: CHAR_SET is
		once
			!! Result.make (" %T")
		end;

	white_space_nl: CHAR_SET is
		once
			!! Result.make (" %T%N")
		end;

end -- class STD_CHAR_SETS


-- begin documentation
--
-- end documentation

