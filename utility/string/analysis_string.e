indexing
	description: "String with a number of analysis facilities attached"
	copyright: "copyright (c) 1998, Enea Business Software AB. All rights reserved."
	date: "$Date: 2001/01/14 14:23:41 $"
	revision: "$Revision: 1.1 $"

class ANALYSIS_STRING

inherit
	
	SEQ_STRING
		rename
			search_after as find_after,
			search_before as find_before,
			out as out_s
		export 
			{NONE}
				search_string_after, search_string_before,
				out_s
		undefine
			copy, consistent, setup
		end;

	STD_CHAR_SETS
		undefine
			is_equal
		select
			out
		end;

creation

	make,

	init

feature -- {NONE}
	
	init (s: STRING) is
			-- Initialize on creation
		do
			make (s.count);
			assign (s)
		end;

	basic_substring (i1, i2: INTEGER): STRING is
		local
			i: INTEGER
		do
			!! Result.make (i2 - i1 + 2);
			from 
				i := i1
			until
				i > i2
			loop
				Result.extend (item (i));
				i := i + 1
			end
		end;

feature -- Initialization

	assign (other: STRING) is
			-- Assign a fresh string for analysis.
		require
			other_exists: other /= Void
		do
			wipe_out;
			append (other)
			if count >0 then
				index := 1
			else
				index := 0
			end
		ensure
			--correct_value: area.is_equal (other.area);
			non_empty_at_first: not empty implies index = 1;
			empty_before: empty implies before
		end;

feature -- Access

	word_after (sep: CHAR_SET): STRING is
			-- Largest word at or immediately after current
			-- cursor position with sequences of `sep' characters
			-- as word separation.
		require
			separator_exists: sep /= Void;
			separator_not_empty: not sep.empty
		local
			i1, i2, old_index: INTEGER
		do
			old_index := index;
			skip_any_after (sep);
			find_any_before (sep);
			forth;
			i1 := index;
			find_any_after (sep);
			i2 := index - 1;
			if i1 <= i2 then
				Result := basic_substring (i1, i2)
			else
				Result := ""
			end;
			index := old_index
		end;

	word_before (sep: CHAR_SET): STRING is
			-- Largest word at or immediately before current
			-- cursor position with sequences of `sep' characters
			-- as word separation.
		require
			separator_exists: sep /= Void;
			separator_not_empty: not sep.empty
		local
			i1, i2, old_index: INTEGER
		do
			old_index := index;
			skip_any_before (sep);
			find_any_after (sep);
			back;
			i2 := index;
			find_any_before (sep);
			i1 := index + 1;
			if i1 <= i2 then
				Result := basic_substring (i1, i2)
			else
				Result := ""
			end;
			index := old_index
		end;

feature -- Status report

	has_any_after (cs: CHAR_SET): BOOLEAN is
			-- Does current string include any of the characters
			-- in `cs' after or at the current position?
		require
			set_exists: cs /= Void;
			set_not_empty: not cs.empty
		local
			i, old_index: INTEGER
		do
			old_index := index;
			find_any_after (cs);
			Result := after;
			index := old_index
		ensure
			correct_status: 
			 -- Result implies (exists i: INTEGER | valid_index (i) 
			 --	and i >= index and cs.has (item (i)))
		end;

	has_any_before (cs: CHAR_SET): BOOLEAN is
			-- Does current string include any of the characters
			-- in `cs' before or at the current position?
		require
			set_exists: cs /= Void;
			set_not_empty: not cs.empty
		local
			i, old_index: INTEGER
		do
			old_index := index;
			find_any_before (cs);
			Result := before;
			index := old_index
		ensure
			correct_status: 
			 -- Result implies (exists i: INTEGER | valid_index (i) 
			 --	and i <= index and cs.has (item (i)))
		end;

	has_any (cs: CHAR_SET): BOOLEAN is
			-- Does current string include any of the characters
			-- in `cs'?
		require
			set_exists: cs /= Void;
			set_not_empty: not cs.empty
		do
			Result := has_any_after (cs) or has_any_before (cs)
		ensure
			correct_status: 
			  -- Result implies (exists i: INTEGER | valid_index (i)
			  --	and cs.has (item (i)))
		end;

feature -- Cursor movement

	find_string_after (other: STRING) is
			-- Move cursor to first occurrence of `other' at or
			-- after current cursor position.
			-- Go after if unsuccessful.
		require
			other_exists: other /= Void;
			other_not_empty: not other.empty
		do
			search_string_after (other, 0);
			if empty and before then
				index := 1
			end
		ensure
			correct_position: after or else other.is_equal
			   (substring (index, index + other.count - 1))
		end;

	find_string_before (other: STRING) is
			-- Move cursor to first occurrence of `other' at or
			-- before current cursor position.
			-- Go after if unsuccessful.
		require
			other_exists: other /= Void;
			other_not_empty: not other.empty
		do
			search_string_before (other, 0);
			if empty and after then
				index := 0
			end
		ensure
			correct_position: before or else other.is_equal
			   (substring (index, index + other.count - 1))
		end;

	find_any_after (cs: CHAR_SET) is
			-- Move cursor to first position
			-- (at or after current cursor position) where
			-- `current_item' occurs in `cs'.
			-- Go after if unsuccessful.
		require
			set_exists: cs /= Void;
			set_not_empty: not cs.empty
		do
			from
			until
				after or else cs.has (current_item)
			loop
				forth
			end
		ensure
			correct_position: 
				after or else cs.has (current_item)
		end;

	find_any_before (cs: CHAR_SET) is
			-- Move cursor to first position
			-- (at or before current cursor position) where
			-- `current_item' occurs in `cs'.
			-- Go before if unsuccessful.
		require
			set_exists: cs /= Void;
			set_not_empty: not cs.empty
		do
			from
			until
				before or else cs.has (current_item)
			loop
				back
			end
		ensure
			correct_position: 
				before or else cs.has (current_item)
		end;


	skip_any_after (cs: CHAR_SET) is
			-- Move cursor to first position
			-- (at or after current cursor position) where
			-- `current_item' does not occur in `cs'.
			-- Go after if unsuccessful.
		require
			set_exists: cs /= Void;
			set_not_empty: not cs.empty
		do
			from
			until
				after or else not cs.has (current_item)
			loop
				forth
			end
		ensure
			correct_position: 
				after or else not cs.has (current_item)
		end;

	skip_any_before (cs: CHAR_SET) is
			-- Move cursor to first position
			-- (at or before current cursor position) where
			-- `current_item' does not occur in `cs'.
			-- Go before if unsuccessful.
		require
			set_exists: cs /= Void;
			set_not_empty: not cs.empty
		do
			from
			until
				before or else not cs.has (current_item)
			loop
				back
			end
		ensure
			correct_position: 
				before or else not cs.has (current_item)
		end;

	go_i_th (i: INTEGER) is
			-- Move cursor to `i'th position
		require
			valid_index: valid_index (i)
		do
			index := i
		end;

feature -- Removal

	trim is
			-- Remove any leading and trailing white space.
		do
			prune_all_leading (' ');
			prune_all_leading ('%T');
			prune_all_trailing (' ');
			prune_all_trailing ('%T')
		ensure
			trimmed: empty or else
			   (not white_space.has (item (1)) and
			    not white_space.has (item (count)))
		end;

	prune_enclosing_character (c: CHARACTER) is
			-- Remove a possible leading and trailing `c'
		do
			if item (1) = c then
				remove (1)
			end
			if item (count) = c then
				remove (count)
			end
		end
	
feature -- Conversion

	trimmed: STRING is
			-- Copy of current string with leading and trailing
			-- white space removed.
		local
			lower, old_index: INTEGER
		do
			old_index := index;
			start;
			skip_any_after (white_space);
			lower := index;
			finish;
			skip_any_before (white_space);
			if lower <= index then
				Result := basic_substring (lower, index)
			else
				Result := ""
			end;
			index := old_index
		ensure
			result_trimmed: Result.empty or else 
			    (not white_space.has (Result.item (1)) and 
			     not white_space.has (Result.item (count)))
		end;

	fields (sep: STRING): LINKED_LIST [STRING] is
			-- Copy of current string split on `sep' into a list
			-- of words (AWK style).  If `sep' is void, the split
			-- is on white space sequences with leading and trailing
			-- white space removed from each word.
			-- If `sep' is non-void, the split is on each occurrence
			-- of the separator string.  Thus a split called on the
			-- string "   foo   bar  " with void separator will
			-- yield the two words "foo" and "bar" while a split on
			-- ";10;;charles" with ";" as separator will yield
			-- the four words "", "10", "", "charles".
			-- As with AWK, the resulting list is always non-empty;
			-- if no split occurred, a one-element list containing
			-- the original string is returned.
		local
			i, i1, old_index: INTEGER
		do
			!! Result.make;
			old_index := index;
			start;
			i := 1;
			if sep = Void then
				from
					skip_any_after (white_space)
				until
					after
				loop
					i1 := index;
					find_any_after (white_space);
					Result.extend (basic_substring (i1, index - 1));
					skip_any_after (white_space);
					i := i + 1
				end
			else
				from
				until
					off
				loop
					i1 := index;
					if sep.count > 0 then
						find_string_after (sep)
					else
						forth
					end;
					if index > i1 then
						Result.extend (basic_substring (i1, index - 1))
					else
						Result.extend ("")
					end;
					index := index + sep.count;
					i := i + 1
				end
			end -- if
			if Result.count = 0 then
				Result.extend (basic_substring (1, count))
			end
			index := old_index
		ensure
			Result.count > 0
			-- separator_string_removed: 
			--   (sep /= Void and then not sep.empty) implies
			--  	for_all word member_of Result it_holds
			--  	  not (exists i: INTEGER | sep.is_equal
			--  	     (word.substring (i, i + sep.count - 1)));
			-- white_space_removed: 
			--   (sep = Void) implies
			--  	for_all word member_of Result it_holds
			--  	  not word.has (' ') and not word.has ('%T');
			-- empty_separator_not_removed:
			--   (sep /= Void and then sep.empty) implies
			--	Result.count = count
		end

end -- class ANALYSIS_STRING

-- begin documentation
--
-- end documentation
