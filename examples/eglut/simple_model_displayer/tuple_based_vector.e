note
    description: "A 3D vector"
    application: "3D_model_displayer"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

class TUPLE_BASED_VECTOR

inherit
    TUPLE [DOUBLE]
        redefine
            out
        end

    DOUBLE_MATH
        export
            {NONE} all
        undefine
            copy,
            is_equal,
            out
        end

creation
    init, init_from_points, init_normalized_crossproduct

feature -- Initialization

    init (a: TUPLE [DOUBLE])
            -- Create from the values in the array `a'.
        require
            a_not_void: a /= Void
            a_is_three_dimensional: a.count = 3
        do
            make
            resize (1, 3)
            put (a.double_item (1), 1)
            put (a.double_item (2), 2)
            put (a.double_item (3), 3)
        end

    init_from_points (p1, p2: TUPLE [DOUBLE])
            -- Create as the vector from point `p1' to point `p2'.
        require
            p1_not_void: p1 /= Void
            p2_not_void: p2 /= Void
            p1_is_three_dimensional: p1.count = 3
            p2_is_three_dimensional: p2.count = 3
        do
            make
            resize (1, 3)
            put (p2.double_item (1) - p1.double_item (1), 1)
            put (p2.double_item (2) - p1.double_item (2), 2)
            put (p2.double_item (3) - p1.double_item (3), 3)
        end

    init_normalized_crossproduct (p1, p2, p3: TUPLE [DOUBLE])
            -- Create as the normalized crossproduct of the vector
            -- from point `p1' to point `p2' and the vector from
            -- `p1' to `p2'.
        require
            p1_not_void: p1 /= Void
            p2_not_void: p2 /= Void
            p3_not_void: p3 /= Void
            p1_is_three_dimensional: p1.count = 3
            p2_is_three_dimensional: p2.count = 3
            p3_is_three_dimensional: p3.count = 3
        local
            v1, v2, n: like Current
        do
            create v1.init_from_points (p1, p2)
            create v2.init_from_points (p1, p3)
            n := v1 # v2
            n.normalize
            make
            resize (1, 3)
            put (n.x, 1)
            put (n.y, 2)
            put (n.z, 3)
        end

feature -- Access

    tuple: TUPLE [DOUBLE]
            -- Tuple representation.
        local
            d: DOUBLE_REF
        do
            create Result.make
            d ?= Current @ 1
            Result.put (d, 1)
            d ?= Current @ 2
            Result.put (d, 2)
            d ?= Current @ 3
            Result.put (d, 3)
        end

    length, size, magnitude: DOUBLE
            -- Length
        local
            i: INTEGER
            sum: DOUBLE
            d: DOUBLE_REF
        do
            from
                sum := 0.0
                i := 1
            until
                i > dimension
            loop
                d ?= Current @ i
                sum := sum + d.item * d.item
                i := i + 1
            end
            if sum > 0.0 then
                Result := sqrt (sum)
            else
                Result := 0.0
            end
        end

    x: DOUBLE
        local
            d: DOUBLE_REF
        do
            d ?= Current @ 1
            Result := d.item
        end

    y: DOUBLE
        local
            d: DOUBLE_REF
        do
            d ?= Current @ 2
            Result := d.item
        end

    z: DOUBLE
        local
            d: DOUBLE_REF
        do
            d ?= Current @ 3
            Result := d.item
        end

feature -- Element change

    normalize
            -- Normalize the vector.
        local
            i: INTEGER
            d: DOUBLE_REF
        do
            from
                i := 1
                d := length
            until
                i > dimension
            loop
                d ?= Current @ i
                put (d.item / length, i)
                i := i + 1
            end
        end

feature -- Basic operations

    infix "+" (other: like Current): like current
            -- Vector addition
        require
            other_not_void: other /= Void
        local
            i: INTEGER
            cd, od: DOUBLE_REF
        do
            from
                i := 1
                create Result.init ([0.0,0.0,0.0])
            until
                i > dimension
            loop
                cd ?= Current @ i
                od ?= other @ i
                Result.put (cd + od, i)
                i := i + 1
            end
        end

    infix "#", cross_product, vector_product (other: like Current): like Current
            -- Cross product or vector product
        require
            other_not_void: other /= Void
        local
            d: DOUBLE
            cd1, cd2, cd3, od1, od2, od3: DOUBLE_REF
        do
            create Result.init ([0.0,0.0,0.0])
            cd1 ?= Current @ 1
            cd2 ?= Current @ 2
            cd3 ?= Current @ 3
            od1 ?= other @ 1
            od2 ?= other @ 2
            od3 ?= other @ 3
            Result.put (cd2.item * od3.item - cd3.item * od2.item, 1)
            Result.put (cd3.item * od1.item - cd1.item * od3.item, 2)
            Result.put (cd1.item * od2.item - cd2.item * od1.item, 3)
        end

feature -- Presentation

    out: STRING
        local
            i: INTEGER
        do
            create Result.make (0)
            Result.append ("[")
            from
                i := 1
            until
                i > dimension
            loop
                Result.append ((Current @ i).out)
                i := i + 1
                if i <= dimension then
                    Result.append (",")
                end
            end
            Result.append ("]")
        end

feature {NONE} -- Implementation

    dimension: INTEGER = 3

feature -- Test & debug

    test1
        local
            corner, v, v1, v2, n: TUPLE_BASED_VECTOR
        do
            create corner.init ([3.0,0.0,2.0])
            print ("corner = ")
            print (corner.out)
            print ("%N")

            create v.init ([4.0,1.0,8.0])
            print ("v = ")
            print (v.out)
            print ("%N")

            corner := corner + v
            print ("corner = ")
            print (corner.out)
            print ("%N")

            create v1.init_from_points ([0.0,0.0,0.0], [2.0,0.0,0.0])
            print ("v1 = ")
            print (v1.out)
            print ("%N")

            create v2.init_from_points ([0.0,0.0,0.0], [0.0,2.0,0.0])
            print ("v2 = ")
            print (v2.out)
            print ("%N")

            n := v1 # v2
            n.normalize
            print ("n = ")
            print (n.out)
            print ("%N")
        end

end
