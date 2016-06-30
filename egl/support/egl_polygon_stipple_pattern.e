note
    description: "An OpenGL 32-bit by 32-bit polygon stipple pattern."
    library: "EGL - Eiffel wrapping of OpenGL"
    compiler: "All"
    platforms: "All platforms that have OpenGL implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

class EGL_POLYGON_STIPPLE_PATTERN

create
    make

feature {NONE} -- Initialization

    make (bits: ARRAY [INTEGER_8])
--    make (bits: ARRAY [BIT 8])
            -- Create a polygon stipple pattern to the bit pattern
            -- `bits' based on 128 8-bit sequences.
        require
            bits_not_void: bits /= Void
--            bits_has_128_items: bits.count = 128
        do
--            pattern := clone (bits)A
              pattern := bits
        end

feature -- Access

--    pattern: ARRAY [BIT 8]
            -- The polygon stipple pattern represented by an array
            -- containing 128 8-bit sequences.

      pattern: INTEGER_8
            -- The polygon stipple pattern represented by an 8 bit integer.
            
feature {EGL} -- Conversion

    glubyte_string: STRING
            -- The polygon stipple pattern represented as a sequence
            -- of 128 GLubyte's. Used internally in EGL for passing
            -- to native OpenGL functions.
        local
            i, glubyte: INTEGER
        do
            from
                i := 1
                create Result.make_filled ('#', 128)
            until
                i > 128
            loop
--                glubyte := bit8_to_integer (pattern @ i)
                glubyte := pattern @ i
                Result.put (glubyte.to_character, i)
                i := i +1
            end
        end

feature {NONE} -- Implementation

--    bit8_to_integer (b: BIT 8): INTEGER
--        do
--                        if b.item (1) then Result := Result + 128 end
--                        if b.item (2) then Result := Result + 64 end
--                        if b.item (3) then Result := Result + 32 end
--                        if b.item (4) then Result := Result + 16 end
--                        if b.item (5) then Result := Result + 8 end
--                        if b.item (6) then Result := Result + 4 end
--                        if b.item (7) then Result := Result + 2 end
--                        if b.item (8) then Result := Result + 1 end
--        end

--    bit8_to_integer_old (b: BIT 8): INTEGER
--        local
--            i: INTEGER
--        do
--            from
--                i := 1
--            until
--                i > 8
--            loop
--                if b.item (i) then
--                    -- '^' operator in INTEGER incompatible
--                    -- between ISE and SmartEiffel :-(
--                    Result := Result + (2^(8-i)).truncated_to_integer
----                  Result := Result + (2^(8-i))
--                end
--                i := i + 1
--            end
--        end

end
