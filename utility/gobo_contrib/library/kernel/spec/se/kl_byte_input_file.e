indexing

	description:

		"Byte input files"

	library: "EiffelOpenGL Gobo Contrib"
	copyright: "Copyright (c) 2002, Paul Cohen"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date: 2003/01/08 17:08:10 $"
	revision: "$Revision: 1.1 $"

class KL_BYTE_INPUT_FILE

inherit

	KI_BYTE_INPUT_FILE
		undefine
			read_to_string,
			read_to_buffer
		end

	KL_INPUT_FILE

	BINARY_FILE_READ
		rename
			make as old_make,
			is_connected as old_is_open_read,
			end_of_input as old_end_of_file,
			disconnect as old_close,
			read_byte as old_read_byte,
			last_byte as old_last_byte
		export
			{NONE} all
		end

creation
	make
	
feature -- Input
	
	read_byte is
		do
			old_read_byte
		end

	read_bytes (n: INTEGER) is
		do
			read_string (n)
		end
	
feature -- Access
	
	last_byte: INTEGER is
		do
			Result := old_last_byte
		end
	
	last_bytes: STRING is
		do
			Result := last_string
		end
	
feature {NONE} -- Implementation

	old_open_read is
			-- Open file in read-only mode.
		do
			if string_name /= Empty_name then
				connect_to (string_name)
			end
		end

	old_read_character is
			-- Read a new character.
			-- Make result available in `old_last_character'.
		do
			read_byte
		end

	old_last_character: CHARACTER is
			-- Last character read with `old_read_character'.
		do
			Result := last_byte.to_character
		end
	
end -- class KL_BYTE_INPUT_FILE












