note
    description: "An abstraction of an OpenGL double precision vertex."
    library: "EGL - Eiffel wrapping of OpenGL"
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class EGL_DOUBLE_VERTEX

--inherit
--  ARRAY [DOUBLE]

create
    make_2d, make_3d, make_3d_alpha

feature -- Access

    x: DOUBLE
            -- The X coordinate

    y: DOUBLE
            -- The Y coordinate

    z: DOUBLE
            -- The Z coordinate

    a: DOUBLE
            -- The alpha value

feature -- Status report

    is_2d: BOOLEAN

    is_3d: BOOLEAN

    has_alpha_information: BOOLEAN

feature -- Status setting

    set_x (d: DOUBLE)
            -- Set the X coordinate
        do
            x := d
        ensure
            x = d
        end

    set_y (d: DOUBLE)
            -- Set the Y coordinate
        do
            y := d
        ensure
            y = d
        end

    set_z (d: DOUBLE)
            -- Set the Z coordinate
        do
            z := d
        ensure
            z = d
        end

    set_a (d: DOUBLE)
            -- Set the alpha value
        do
            z := d
        ensure
            z = d
        end

feature -- Conversion

    normalize
            -- Normalize the vertex
        do
        end

invariant

end
