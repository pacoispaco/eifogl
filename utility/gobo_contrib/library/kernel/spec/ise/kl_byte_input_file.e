indexing

	description:

		"Byte input files"

	library: "EiffelOpenGL Gobo Contrib"
	copyright: "Copyright (c) 2002, Paul Cohen"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date: 2003/01/08 17:09:38 $"
	revision: "$Revision: 1.1 $"

class KL_BYTE_INPUT_FILE

inherit

	KI_BYTE_INPUT_FILE
		undefine
			read_to_string,
			read_to_buffer
		end

	KL_INPUT_FILE
		redefine
			string_name,
			last_character,
			last_string
		end

	RAW_FILE
		rename
			make as old_make,
			name as string_name,
			count as old_count,
			exists as old_exists,
			is_readable as old_is_readable,
			is_open_read as old_is_open_read,
			is_open_write as old_is_open_write,
			end_of_file as old_end_of_file,
			is_closed as old_is_closed,
			open_read as old_open_read,
			open_write as old_open_write,
			open_append as old_open_append,
			put_character as old_put_character,
			put_string as old_put_string,
			put_integer as old_put_integer,
			put_boolean as old_put_boolean,
			put_new_line as old_put_new_line,
			read_character as old_read_character,
			read_stream as old_read_stream,
			read_line as old_read_line,
			read_to_string as old_read_to_string,
			change_name as old_change_name,
			flush as old_flush,
			close as old_close,
			delete as old_delete,
			reset as old_reset,
			append as old_append
		export
			{NONE} all
		undefine
			file_readable
		redefine

			string_name,
			last_character,
			last_string
		end

creation
	make
	
feature -- Input
	
	read_byte is
		do
			read_character
		end

	read_bytes (n: INTEGER) is
		do
			read_string (n)
		end
	
feature -- Access
	
	last_byte: INTEGER is
		do
			Result := last_character.code
		end
	
	last_bytes: STRING is
		do
			Result := last_string
		end

	last_character: CHARACTER
			-- Last character read

	last_string: STRING
			-- Last string read
			-- (Note: this query always return the same object.
			-- Therefore a clone should be used if the result
			-- is to be kept beyond the next call to this feature.
			-- However `last_string' is not shared between file objects.)
	
feature {NONE} -- Implementation

	string_name: STRING
			-- Name of file (STRING version)

end -- class KL_BYTE_INPUT_FILE
