note
    description: "Two-dimensional array with sequential memory locations.%
    %Elements are arranged in lexicographic order (row major order), ie.%
    %0: [0, 0], 1: [0, 1], ..., n: [0, n], n+1: [1, 0], n+2: [1, 1], ..."
    library: "Eiffel portable structures (EiffelOpenGL utility)"
    compiler: "All"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class
    ARRAY_2 [G -> attached ANY]

inherit

    ARRAY [G]
        rename
            put as array_put,
            item as array_item,
            make as array_make
        export
            {NONE} array_make,
            make_from_array
        redefine
            out
        end

create
    make

feature -- Initialization

    make (j_min, j_max, k_min, k_max: INTEGER)
            -- Allocate array; set index intervals to
            -- `j_min' .. `j_max' and `kmin' .. `kmax'.
            -- Set all values to default.
        require
            valid_bounds: j_min <= j_max and k_min <= k_max
        do
            j_lower := j_min
            j_upper := j_max
            k_lower := k_min
            k_upper := k_max
            array_make (0, j_count * k_count - 1)
        end

feature -- Access

    item (j, k: INTEGER): G
            -- Entry at index `j', `k'
        require
            valid_j_index: j >= j_lower and j <= j_upper
            valid_k_index: k >= k_lower and k <= k_upper
        do
            Result := array_item ((j-j_lower) * k_count + (k - k_lower))
        end

feature -- Measurement

    j_lower: INTEGER
            -- Minimum index j

    j_upper: INTEGER
            -- Maximum index j

    k_lower: INTEGER
            -- Minimum index k

    k_upper: INTEGER
            -- Maximum index k

    j_count: INTEGER
            -- Number of j indices
        once
            Result := j_upper - j_lower + 1
        end

    k_count: INTEGER
            -- Number of k indices
        once
            Result := k_upper - k_lower + 1
        end

feature -- Element change

    put (v: like item; j, k: INTEGER)
            -- Replace `j', `k'-th entry, if in index interval, by `v'.
        require
            valid_j_index: j >= j_lower and j <= j_upper
            valid_k_index: k >= k_lower and k <= k_upper
        do
            array_put (v, (j - j_lower) * k_count + (k - k_lower))
        ensure
            item_entered: v = item (j, k)
        end

feature -- Output

    out: STRING
            -- Printable representation
        local
            j, k: INTEGER
            i: detachable G
        do
            Result := ""
            from
                j := j_lower
                k := k_lower
            until
                    j > j_upper
            loop
                Result.append ("[")
                Result.append (j.out)
                Result.append (", ")
                Result.append (k.out)
                Result.append ("] = ")
                Result.append (item (j, k).out)
                Result.append (" (Storage index = ")
                Result.append (((j - j_lower) * k_count + (k - k_lower)).out)
                Result.append (")")
                Result.append ("%N")
                if k = k_upper then
                    k := k_lower
                    j := j + 1
                else
                    k := k + 1
                end
            end
        end

end
