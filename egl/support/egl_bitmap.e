note
    description: "An OpenGL bitmap"
    library: "EGL - Eiffel wrapping of OpenGL"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class EGL_BITMAP

create
    make

feature {NONE} -- Initialization

    make (bytes: ARRAY [INTEGER])
            -- Create a bitmap.
        require
            bytes_not_void: bytes /= Void
            bytes_are_valid: -- All bytes [i] <= 255
        do
            pattern := bytes.twin
        end

feature -- Access

    pattern: ARRAY [INTEGER]
            -- The bitmap represented by an array of integers

    pixel_count: INTEGER
            -- Number of pixels
        do
            Result := pattern.count * 8
        end

feature {EGL} -- Conversion

    pointer: POINTER
            -- The bitmap represented as a pointer C array of
            -- GLubyte (GLubyte *). Used internally in EGL for
            -- passing to native OpenGL functions.
        local
            c_array: EGL_GLUBYTE_C_ARRAY
        do
            create c_array.make_from_array (pattern)
            Result := c_array.pointer
        end

end

--| begin documentation
-- This class could be extended with functionality for reading from
-- and writing to various bitmap file formats.
--| end documentation
