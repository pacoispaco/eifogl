indexing
	description: "Encapsulation of a set of characters"
	copyright: "copyright (c) 1998, Enea Business Software AB. All rights reserved."
	date: "$Date: 2001/01/14 14:23:41 $"
	revision: "$Revision: 1.1 $"

class CHAR_SET

creation

	make

feature {NONE}

	enum: STRING;		
			-- Enumerated part

	ranges: LINKED_LIST [CHAR_RANGE]
			-- Range part

feature -- Initialization

	make (s: STRING) is
			-- Make a set according to a specification string.
			-- The string may consist of a mixture of enumerated
			-- characters and ranges with a `-' as separator.
			-- A `-' occurring first or last in the string will
			-- be interpreted literally.
			-- For example, "a-zA-Z%T+-" will be taken as the set
			-- of alphabetic characters, the horizontal tab, the
			-- `+' and the `-' characters.
		require
			string_exists: s /= Void
		do
			!! enum.make (10);
			!! ranges.make;
			extend (s)
		end;

feature -- Status report

	empty: BOOLEAN is
			-- Is structure empty?
		do
			Result := enum.empty and ranges.empty
		ensure
			correct_status: Result = enum.empty and ranges.empty
		end;

feature -- Access

	has (c: CHARACTER): BOOLEAN is
			-- Does `c' occur in the set?
		do
			if enum.has (c) then
				Result := true
			else
				from
					ranges.start
				until
					Result or ranges.after
				loop
					Result := ranges.item.has (c);
					ranges.forth
				end
			end
		ensure
			correct_status: 
			  -- Result implies (enum.has (c) or 
			  --	exists r member_of ranges it_holds r.has (c))
		end;

feature -- Element change

	extend (s: STRING) is
			-- Append a set of characters according to a
			-- string similar to the one for `make' above.
		require
			string_exists: s /= Void
		local
			i: INTEGER;
			r: CHAR_RANGE
		do
			from
				i := 1
			until
				i > s.count
			loop
				if i <= s.count -2 and then s.item (i+1) = '-' then
					!! r.make (s.item (i), s.item (i + 2));
					ranges.extend (r);
					i := i + 2
				else
					enum.extend (s.item (i))
				end;
				i := i + 1
			end
		end;

end -- class CHAR_SET


-- begin documentation
-- Encapsulation of a set of characters, stored as a mix of explicit
-- enumeration and character ranges.  The set can be extended after
-- creation, but not pruned, since this would imply extensive
-- reorganization in the general case.  Pruning may be added later.
-- end documentation

