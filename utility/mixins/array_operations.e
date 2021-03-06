note
    description: "Useful array operations"
    library: "EGL - Eiffel wrapping of OpenGL"
    compilers: "All Eiffel compilers"
    platforms: "All platforms that have OpenGL implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

class ARRAY_OPERATIONS

feature -- Basic operations

    flattened_array_of_double (array: ARRAY [ARRAY [DOUBLE]]): ARRAY [DOUBLE]
            -- Returns a flattened array. This operation maintains
            -- the ordering of items in `array'.
        require
            array_not_void: array /= Void
        local
            i, j, size, index: INTEGER
            a: ARRAY [DOUBLE]
        do
            -- Find out the needed size
            from
                i := array.lower
            until
                i > array.upper
            loop
                size := size + (array @ i).count
                i := i + 1
            end

            -- Create the new array
            create Result.make (1, size)

            -- Fill the new array with items
            from
                index := 1
                i := array.lower
            until
                i > array.upper
            loop
                a := array @ i
                from
                    j := a.lower
                until
                    j > a.upper
                loop
                    Result.put (a @ j, index)
                    j := j + 1
                    index := index + 1
                end
                i := i + 1
            end
        ensure
            consistent_emptiness: array.is_empty implies Result.is_empty
        end

    flattened_array_of_real (array: ARRAY [ARRAY [REAL]]): ARRAY [REAL]
            -- Returns a flattened array. This operation maintains
            -- the ordering of items in `array'.
        require
            array_not_void: array /= Void
        local
            i, j, size, index: INTEGER
            a: ARRAY [REAL]
        do
            -- Find out the needed size
            from
                i := array.lower
            until
                i > array.upper
            loop
                size := size + (array @ i).count
                i := i + 1
            end

            -- Create the new array
            create Result.make (1, size)

            -- Fill the new array with items
            from
                index := 1
                i := array.lower
            until
                i > array.upper
            loop
                a := array @ i
                from
                    j := a.lower
                until
                    j > a.upper
                loop
                    Result.put (a @ j, index)
                    j := j + 1
                    index := index + 1
                end
                i := i + 1
            end
        ensure
            consistent_emptiness: array.is_empty implies Result.is_empty
        end

    flattened_array_of_integer (array: ARRAY [ARRAY [INTEGER]]): ARRAY [INTEGER]
            -- Returns a flattened array. This operation maintains
            -- the ordering of items in `array'.
        require
            array_not_void: array /= Void
        local
            i, j, size, index: INTEGER
            a: ARRAY [INTEGER]
        do
            -- Find out the needed size
            from
                i := array.lower
            until
                i > array.upper
            loop
                size := size + (array @ i).count
                i := i + 1
            end

            -- Create the new array
            create Result.make (1, size)

            -- Fill the new array with items
            from
                index := 1
                i := array.lower
            until
                i > array.upper
            loop
                a := array @ i
                from
                    j := a.lower
                until
                    j > a.upper
                loop
                    Result.put (a @ j, index)
                    j := j + 1
                    index := index + 1
                end
                i := i + 1
            end
        ensure
            consistent_emptiness: array.is_empty implies Result.is_empty
        end

end
